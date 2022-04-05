package main

import (
  "fmt"
  "sort"
  "database/sql"
  "strings"
  _ "github.com/lib/pq"
  "github.com/ekzhu/lshensemble"
)

func grab_domain(relation, domain string, db *sql.DB) map[string]bool {
  k := make(map[string]bool)

  rows, err := db.Query(fmt.Sprintf(`SELECT "%s" FROM %s`, domain, relation))
  if err != nil {
    panic(err)
  }

  defer rows.Close()

  for rows.Next() {
    var v string
    err = rows.Scan(&v)
    k[strings.TrimSpace(v)] = true
  }
  
  return k
}

func main() {
  /* Grab our domains from the database */

  db, err := sql.Open("postgres", "host=/var/run/postgresql user=postgres database=curation_data_lake sslmode=disable")
  if err != nil {
    panic(err)
  }

  defer db.Close()

  ground := map[string]bool{"E1": true, "E101": true, "E102": true, "E103": true, "E104": true, "E106": true, "E107": true, "E108": true, "E109": true, "E110": true}
  fs := grab_domain("fire_stations", "NAME", db)
  building := grab_domain("building_violations", "ADDRESS", db)
  food := grab_domain("food_inspections", "Address", db)


  keys := []string{"ground_fire_stations.name", "fire_stations.name", "building_violations.address", "food_inspections.address"}
  domains := []map[string]bool{ground, fs, building, food}

  /* See LSH ensemble docs */
  domainRecords := make([]*lshensemble.DomainRecord, len(domains))
  var seed int64 = 64 
  numHash := 1024 

  for i := range domains {
    mh := lshensemble.NewMinhash(seed, numHash) 
    for v := range domains[i] {
      mh.Push([]byte(v))
    }

    fmt.Println(keys[i], "has size", len(domains[i]))

    domainRecords[i] = &lshensemble.DomainRecord {
      Key: keys[i],
      Size: len(domains[i]),
      Signature: mh.Signature(),
    }
  }

  sort.Sort(lshensemble.BySize(domainRecords))

  index, err := lshensemble.BootstrapLshEnsembleEquiDepth(1024, numHash, 512, len(domainRecords), lshensemble.Recs2Chan(domainRecords))
  if err != nil {
    panic(err)
  }

  done := make(chan struct{})
  defer close(done)

  toCheck := 1 

  results := index.Query(domainRecords[toCheck].Signature, domainRecords[toCheck].Size, 0.8, done)

  for key := range results {
    fmt.Println("candidate for ", domainRecords[toCheck].Key, " is ", key)
  }

}
