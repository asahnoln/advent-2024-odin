package day4_run

import "core:fmt"
import "core:os"
import "src:day4"

run1 :: proc(s: string) {
	c := day4.parse_xmas(s)
	fmt.printfln("Sum: %v", c)
}

run :: proc(s: string) {
	c := day4.parse_x_mas(s)
	fmt.printfln("Sum: %v", c)
}
