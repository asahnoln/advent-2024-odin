package main

import "core:fmt"
import "core:os"

import "day5"

run :: proc(p: proc(s: string), s: string) {
	p(s)
}

main :: proc() {
	path := os.args[1]
	s, err := os.read_entire_file_or_err(path)
	if err != nil {
		fmt.panicf("Could not read entire file from %s: %v\n", path, err)
	}

	run(day5.run, cast(string)s)
}
