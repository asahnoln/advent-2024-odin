package main

import "core:fmt"
import "core:os"
import "src:day2"

main :: proc() {
	path := os.args[1]
	s, err := os.read_entire_file_or_err(path)
	if err != nil {
		fmt.panicf("Could not read entire file from %s: %v\n", path, err)
	}

	c := day2.parse_and_count_safe_reports_2(cast(string)s)
	fmt.printfln("Safe reports: %v", c)
}
