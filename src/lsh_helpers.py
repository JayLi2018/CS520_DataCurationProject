import psycopg2
import pandas
from datasketch import MinHashLSHEnsemble, MinHash, LeanMinHash
import pickle
from collections import defaultdict
import re

gigabytes = re.compile(r'([0-9]+) GB')
megabytes = re.compile(r'([0-9]+) MB')
bs = re.compile(r'([0-9]+) bytes')


def create_and_serialize_index(conn, table_name, num_perm=128, thresh=0.8, smaller=True):
    # get list of tables available in conn
    
    cursor=conn.cursor()
    
    drop_if_exist_q = f"""
    DROP TABLE IF EXISTS hashes.{table_name};"""
    cursor.execute(drop_if_exist_q)
    
    create_table_q = f"""
    CREATE TABLE IF NOT EXISTS hashes.{table_name}(thresh float, tname text, cname text, dsize int, hashval bytea);
    """
    cursor.execute(create_table_q)
    
    if(smaller):
        # exclude very big tables and very small tables
        get_t_q_w_size = f"""
        SELECT                                                            
        relname,
        pg_size_pretty(table_size) AS size,
        table_size
        FROM (
        SELECT pg_catalog.pg_namespace.nspname AS schema_name,
        relname,
        pg_relation_size(pg_catalog.pg_class.oid) AS table_size
        FROM pg_catalog.pg_class
        JOIN pg_catalog.pg_namespace ON relnamespace = pg_catalog.pg_namespace.oid
        ) t
        WHERE schema_name ='public' and relname!='{table_name}'
        ORDER BY table_size DESC;
        """
        cursor.execute(get_t_q_w_size)
        raw=cursor.fetchall()
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
        cursor.execute(get_t_q)
        res=cursor.fetchall()

    # Create an LSH Ensemble index with threshold and number of partition
    # settings.
    lshensemble = MinHashLSHEnsemble(threshold=thresh, num_perm=num_perm,
    num_part=32)
    # create lshensemble 
    table_hash_input_tuples = []
    
    i = 0
    for t in res:
        print(f"table : {t[0]}")
        t_hashes = {}
        cols_q = f"SELECT column_name FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '{t[0]}'";
        cursor.execute(cols_q)
        cols = cursor.fetchall()
        for c in cols:
#             print(f'column: {c}')
            distincts_q = f'select distinct "{c[0]}" FROM {t[0]} where "{c[0]}" is not null'
            cursor.execute(distincts_q)
            set_vals = [v[0] for v in cursor.fetchall()]
#             print(set_vals)
            mh = MinHash(num_perm=num_perm)
            for v in set_vals:
                mh.update(v.encode('utf8'))
            lmh = LeanMinHash(seed=mh.seed,hashvalues=mh.hashvalues)
            pickled_lmh = pickle.dumps(lmh)
            insert_one_hash_q = f"""
            INSERT INTO hashes.{table_name} VALUES ({thresh}, '{t[0]}', '{c[0]}', {len(set_vals)}, \
            {psycopg2.Binary(pickled_lmh)})
            """
#             print(insert_one_hash_q)
            cursor.execute(insert_one_hash_q)
            table_hash_input_tuples.append((f"{t[0]}->{c[0]}", mh, len(set_vals)))
        i+=1
    lshensemble.index(table_hash_input_tuples)
    
    return lshensemble



def load_index(conn, index_table, threshold=0.8, num_perm=128):
    
    retrieve_q = f"SELECT tname, cname, dsize, hashval FROM hashes.{index_table}"
    cur = conn.cursor()
    
    index_dict = defaultdict(dict)
    
    cur.execute(retrieve_q)
    raw = cur.fetchall()
    
    # create lshensemble 
    table_hash_input_tuples = []
    
    for r in raw:
        tname, cname, dsize, mhash = r[0], r[1], r[2], pickle.loads(r[3])
        index_dict[f'{r[0]}->{r[1]}'] = {'table':tname, 
                                           'col': cname, 
                                           'mhash': mhash,
                                           'dsize':dsize}
        
        table_hash_input_tuples.append((f"{tname}->{cname}", mhash, dsize))
    
    # Create an LSH Ensemble index with threshold and number of partition
    # settings.
    lshensemble = MinHashLSHEnsemble(threshold=threshold, num_perm=num_perm,
    num_part=32)
    lshensemble.index(table_hash_input_tuples)
    
    return lshensemble, index_dict
    

def search_index(lshensemble, index_dict, tname, cname):
    
    mhash = index_dict[f'{tname}->{cname}']['mhash']
    dsize = index_dict[f'{tname}->{cname}']['dsize']
    
    return [k for k in lshensemble.query(mhash, dsize)]

     
if __name__ == '__main__':
    conn = psycopg2.connect("dbname=curation_data_lake user=postgres")
    
#     conn = psycopg2.connect("dbname=test_hash_db user=postgres")
    conn.autocommit=True
    create_and_serialize_index(conn, 'april16hashes')

