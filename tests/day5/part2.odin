package day5_test

import "core:slice"
import "core:testing"
import "src:day5"


@(test)
fix_order :: proc(t: ^testing.T) {
	got := day5.Pages{2, 1, 0, 3}
	day5.fix_order(
		{
			// Rules
			{1, 0},
			{0, 2},
			{1, 2},
			{3, 4},
		},
		got,
	)

	want := day5.Pages{1, 0, 2, 3}
	testing.expectf(t, slice.equal(got, want), "Want %v, got %v", want, got)
}

@(test)
parse_fixed_from_example :: proc(t: ^testing.T) {
	s := day5.parse_fix_and_sum(
		`
47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13

75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47`[1:],
	)

	testing.expect_value(t, s, 123)
}
