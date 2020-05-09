package main

import (
	"net/http"
)

func hello(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Hello world!"))
}

func main() {
	http.HandleFunc("/", hello)
	http.ListenAndServe("0.0.0.0:80", nil)
}
