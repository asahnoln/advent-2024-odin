package main

import "core:fmt"
import "core:os"
import "src:day3"

main :: proc() {
	path := os.args[1]
	s, err := os.read_entire_file_or_err(path)
	if err != nil {
		fmt.panicf("Could not read entire file from %s: %v\n", path, err)
	}

	sum, err2 := day3.parse2(cast(string)s)
	if err2 != nil {
		fmt.panicf("Error parsing contents: %v\n", err)
	}
	fmt.printfln("Sum: %v", sum)
}
