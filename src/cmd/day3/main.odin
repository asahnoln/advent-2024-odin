package day3_run

import "core:fmt"
import "core:os"
import "src:day3"

run :: proc(s: string) {
	sum, err := day3.parse2(s)
	if err != nil {
		fmt.panicf("Error parsing contents: %v\n", err)
	}
	fmt.printfln("Sum: %v", sum)
}
