package main

import "core:fmt"
import "core:os"
import "src:day4"

main :: proc() {
	path := os.args[1]
	s, err := os.read_entire_file_or_err(path)
	if err != nil {
		fmt.panicf("Could not read entire file from %s: %v\n", path, err)
	}

	c := day4.parse(cast(string)s)
	fmt.printfln("Sum: %v", c)
}
