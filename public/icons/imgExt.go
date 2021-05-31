package main

import (
    "fmt"
    _ "github.com/go-sql-driver/mysql"
    "github.com/jmoiron/sqlx"
    "io/ioutil"
    "log"
)

func main() {
    dsn := "isucon:isucon@tcp(localhost:3306)/isubata"
    db, err := sqlx.Connect("mysql", dsn)
    if err != nil {
        log.Fatal("Failed to connect to DB: %s", err.Error())
    }
    defer db.Close()

    rows, err := db.Query("SELECT name, data FROM image")
    if err != nil {
        log.Fatal(err.Error())
    }
    defer rows.Close()

    var name string
    var data []byte
    for rows.Next() {
        err2 := rows.Scan(&name, &data)
        if err2 != nil {
            log.Fatal(err2.Error())
        }
        fmt.Println(name)
        err3 := ioutil.WriteFile(name, data, 0666)
        if err3 != nil {
            log.Fatal(err3.Error())
        }
    }
}
