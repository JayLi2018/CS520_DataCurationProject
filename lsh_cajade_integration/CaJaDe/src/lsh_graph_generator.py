import re
from datasketch import MinHashLSHEnsemble, MinHash, LeanMinHash
import pickle
import psycopg2
from collections import defaultdict
import networkx as nx

class LSH_Graph_Generator:
    
    def __init__(self, conn):
            self.conn = conn
            self.cur = self.conn.cursor()


    def create_and_serialize_index(self, table_name, num_perm=128, thresh=0.8, smaller=True):
        
        gigabytes = re.compile(r'([0-9]+) GB')
        megabytes = re.compile(r'([0-9]+) MB')
        bs = re.compile(r'([0-9]+) bytes')
        
        drop_query = f"DROP TABLE IF EXISTS hashes.{table_name};"
        self.cur.execute(drop_query)
        
        create_tbl_query = f"CREATE TABLE IF NOT EXISTS hashes.{table_name}(thresh float, tname text, cname text, dsize int, hashval bytea);"
        self.cur.execute(create_tbl_query)
        
        if(smaller):
            # exclude very big tables and very small tables
            get_t_q_w_size = f"""
            SELECT relname, pg_size_pretty(table_size) AS size, table_size
            FROM (
                SELECT pg_catalog.pg_namespace.nspname AS schema_name, relname,
                        pg_relation_size(pg_catalog.pg_class.oid) AS table_size
                FROM pg_catalog.pg_class
                JOIN pg_catalog.pg_namespace
                ON relnamespace = pg_catalog.pg_namespace.oid
                ) t
            WHERE schema_name ='public'
            AND relname!='{table_name}'
            ORDER BY table_size DESC;
            """
            self.cur.execute(get_t_q_w_size)
            raw = self.cur.fetchall()
            res = []
            for r in raw:
                if(gigabytes.search(r[1]) or bs.search(r[1])):
                    continue
                else:
                    if(megabytes.search(r[1])):
                        if(int(megabytes.search(r[1]).group(1))>100):
                            continue
                    res.append(r)
            print("number of tables we consider: %s", str(len(res)))
        else:
            get_t_q = f"""
            SELECT table_name
            FROM information_schema.tables
            WHERE table_schema='public'
            AND table_type='BASE TABLE'
            AND table_name != '{table_name}'
            """
            self.cur.execute(get_t_q)
            res = self.cur.fetchall()

        # Create an LSH Ensemble index with threshold and number of partition settings.
        lshensemble = MinHashLSHEnsemble(threshold=thresh, num_perm=num_perm, num_part=32)
        

        table_hash_input_tuples = []
        
        for t in res:
            if t[0] in ('pt_full','pt'):
                # Skipping Cajade internal tables
                continue
            cols_q = f"SELECT column_name FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '{t[0]}'";
            self.cur.execute(cols_q)
            cols = self.cur.fetchall()
            for c in cols:
                if c[0] in ['thresh', 'tname', 'cname', 'dsize', 'hashval']:
                    # Skipping LSH Index Config columns
                    continue
                distincts_q = f'select distinct "{c[0]}" FROM {t[0]} where "{c[0]}" is not null'
                self.cur.execute(distincts_q)
                set_vals = [v[0] for v in self.cur.fetchall()]
                mh = MinHash(num_perm=num_perm)
                for v in set_vals:
                    mh.update(repr(v).encode('utf8'))
                lmh = LeanMinHash(seed=mh.seed,hashvalues=mh.hashvalues)
                pickled_lmh = pickle.dumps(lmh)
                insert_one_hash_q = f"""INSERT INTO hashes.{table_name}
                                        VALUES ({thresh}, '{t[0]}', '{c[0]}', {len(set_vals)}, {psycopg2.Binary(pickled_lmh)})"""
                self.cur.execute(insert_one_hash_q)
                table_hash_input_tuples.append((f"{t[0]}->{c[0]}", mh, len(set_vals)))
        lshensemble.index(table_hash_input_tuples)
        
        return lshensemble


    def load_index(self, index_table, threshold=0.8, num_perm=128):
        
        index_dict = defaultdict(dict)

        retrieve_q = f"SELECT tname, cname, dsize, hashval FROM hashes.{index_table}"
        
        self.cur.execute(retrieve_q)
        raw = self.cur.fetchall()
        
        # create lshensemble 
        table_hash_input_tuples = []
        
        for r in raw:
            tname, cname, dsize, mhash = r[0], r[1], r[2], pickle.loads(r[3])
            index_dict[f'{r[0]}->{r[1]}'] = {'table':tname, 
                                            'col': cname, 
                                            'mhash': mhash,
                                            'dsize':dsize}
            
            table_hash_input_tuples.append((f"{tname}->{cname}", mhash, dsize))
        
        # Create an LSH Ensemble index with threshold and number of partition settings.
        lshensemble = MinHashLSHEnsemble(threshold=threshold, num_perm=num_perm, num_part=32)
        lshensemble.index(table_hash_input_tuples)
        
        return lshensemble, index_dict


    def search_index(self, lshensemble, index_dict, tname, cname):
        
        mhash = index_dict[f'{tname}->{cname}']['mhash']
        dsize = index_dict[f'{tname}->{cname}']['dsize']
        
        return [k for k in lshensemble.query(mhash, dsize)]


    def build_schema(self, lshensemble, index_dict):
        sgraph = nx.DiGraph()
        edge_labels={}
        """loop through index dict and search for containment relationships, if found, 
        add an edge between those 2 tables with edge label as the "join" condition"""
        for k,v in index_dict.items():
            try:
                candidates = self.search_index(lshensemble, index_dict, v['table'], v['col'])
            except ZeroDivisionError:
                continue
            if(candidates):
                for c in candidates:
                    ctable, ccol = c.split('->')
                    sgraph.add_edge(v['table'], ctable)
                    edge_labels[(v['table'], ctable)] = \
                    (f"{v['col']}---{ccol}", 'red')
        
        return sgraph, edge_labels
    
    def generate_graph(self, table_name):
        print("Starting LSH on given DB and tables")

        self.create_and_serialize_index(table_name, smaller=False)

        lshensemble, index_dict = self.load_index(table_name)

        graph_obj, graph_edges = self.build_schema(lshensemble, index_dict)

        return graph_obj, graph_edges