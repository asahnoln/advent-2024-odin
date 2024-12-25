package day4_run

import "core:fmt"
import "core:os"
import "src:day5"

run1 :: proc(s: string) {
	s := day5.parse_and_sum(s)
	fmt.printfln("Sum: %v", s)
}
run :: proc(s: string) {
	s := day5.parse_fix_and_sum(s)
	fmt.printfln("Sum: %v", s)
}
