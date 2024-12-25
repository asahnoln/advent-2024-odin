package day4_run

import "core:fmt"
import "core:os"
import "src:day6"

run :: proc(s: string) {
	s := day6.?(s)
	fmt.printfln("Sum: %v", s)
}
