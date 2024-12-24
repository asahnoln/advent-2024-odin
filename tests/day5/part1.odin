package day5_test

import "core:testing"
import "src:day5"

@(test)
check_order :: proc(t: ^testing.T) {
	r := day5.check_order(
	[][2]int {
		// Format
		{1, 2},
	},
	[]int{1, 2, 3},
	)

	testing.expect(t, r)
}

// @(test)
// parse_from_example :: proc(t: ^testing.T) {
// 	s := day5.parse(
// 		`
// 47|53
// 97|13
// 97|61
// 97|47
// 75|29
// 61|13
// 75|53
// 29|13
// 97|29
// 53|29
// 61|53
// 97|53
// 61|29
// 47|13
// 75|47
// 97|75
// 47|61
// 75|61
// 47|29
// 75|13
// 53|13
//
// 75,47,61,53,29
// 97,61,53,29,13
// 75,29,13
// 75,97,47,61,53
// 61,13,29
// 97,13,75,29,47`,
// 	)
//
// 	testing.expect_value(t, s, 143)
// }
