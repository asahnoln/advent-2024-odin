package day4_run

import "core:fmt"
import "src:day6"

run :: proc(s: string) {
	p := day6.count_positions(s)
	fmt.printfln("Positions: %v", p)
}
