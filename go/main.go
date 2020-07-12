package main

import (
  "encoding/json"
  "net/http"
)

type Health struct {
  Status    string
}

func main() {
  http.HandleFunc("/health", health)
  http.ListenAndServe(":8080", nil)
}

func health(w http.ResponseWriter, r *http.Request) {
  health := Health{"healthy"}

  js, err := json.Marshal(health)
  if err != nil {
    http.Error(w, err.Error(), http.StatusInternalServerError)
    return
  }

  w.Header().Set("Content-Type", "application/json")
  w.Write(js)
}
