package day5_test

import "core:testing"
import "src:day5"

@(test)
check_order :: proc(t: ^testing.T) {
	tt := []struct {
		rules: [][2]int,
		pages: []int,
		want:  bool,
	} {
		{{{1, 2}}, {}, false},
		{{}, {1}, true},
		{{{1, 2}}, {9}, true},
		{{{1, 2}}, {1, 2}, true},
		{{{1, 2}}, {2, 1}, false},
		{{{1, 2}}, {1, 0, 2}, true},
		{{{2, 1}}, {2, 1}, true},
		{{{2, 0}, {1, 2}}, {1, 0, 2}, false}, // proper shoud be 1, 2, 0
		{{{1, 2}}, {3, 1}, true},
	}

	for test in tt {
		got := day5.check_order(test.rules, test.pages)
		testing.expectf(
			t,
			got == test.want,
			"For rules `%v` and pages `%v` want %v, got %v",
			test.rules,
			test.pages,
			test.want,
			got,
		)
	}
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
