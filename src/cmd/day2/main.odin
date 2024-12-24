package day2_run

import "core:fmt"
import "core:os"
import "src:day2"

run :: proc(s: string) {
	c := day2.parse_and_count_safe_reports_2(s)
	fmt.printfln("Safe reports: %v", c)
}
