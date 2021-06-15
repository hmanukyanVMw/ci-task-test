package main

import (
	"fmt"
	"os"
	"time"
)

func main() {
	emitInterval := os.Getenv("EMIT_INTERVAL")

	d, err := time.ParseDuration(emitInterval)
	if err != nil {
		d = 6 * time.Millisecond
	}

	ticker := time.NewTicker(d)
	for range ticker.C {
		fmt.Println("app instance exceeded log rate limit (100 log-lines/sec) set by platform operator")
	}
}
