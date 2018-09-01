package main

// report system uptime

import (
	"fmt"
	"runtime"
)

func main() {
	var uptimeValue float64

	switch os := runtime.GOOS; os {
	case "Linux":
		uptimeValue = collectSystemUptimeLinux()
	case "Darwin":
		uptimeValue = collectSystemUptimeDarwin()
	case "FreeBsd":
		uptimeValue = collectSystemUptimeFreebsd()
	case "Windows":
		uptimeValue = collectSystemUptimeWindows()
	default:
		uptimeValue = collectSystemUptimeLinux()
	}

	reportUptimeValue(uptimeValue)

}

func collectSystemUptimeDarwin() {
	// for mac it'll be somthing to do with sysctl -n kern.boottime
}

func collectSystemUptimeLinux() {
	// for linux check /proc/uptime number space [0]
	

}
func collectSystemUptimeWindows() {
	// for windows ?

}
func collectSystemUptimeFreebsd() {
	// for freeNas /proc/uptime
}

func reportUptimeValue(uptime float64) error {

}
