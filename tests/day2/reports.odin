package day2_test

import "core:testing"
import "src:day2"

@(test)
safe_report :: proc(t: ^testing.T) {
	r := []int{1, 2}
	s := day2.is_safe(r)

	testing.expectf(t, s, "Expected %v to be safe", r)
}

@(test)
unsafe_report :: proc(t: ^testing.T) {
	tt := [][]int{{1, 1}, {1, 2, 2}, {1, 5}, {5, 1}, {1, 2, 1}, {2, 1, 2}}

	for test in tt {
		s := day2.is_safe(test)

		testing.expectf(t, !s, "Expected %v to be unsafe", test)
	}
}

@(test)
single_number_is_a_safe_report :: proc(t: ^testing.T) {
	r := []int{1}
	s := day2.is_safe(r)

	testing.expectf(t, s, "Expected %v to be safe", r)
}

@(test)
zero_numbers_is_a_safe_report :: proc(t: ^testing.T) {
	r := []int{}
	s := day2.is_safe(r)

	testing.expectf(t, s, "Expected %v to be safe", r)
}

@(test)
count_safe_reports :: proc(t: ^testing.T) {
	rs := [][]int {
		{7, 6, 4, 2, 1},
		{1, 2, 7, 8, 9},
		{9, 7, 6, 2, 1},
		{1, 3, 2, 4, 5},
		{8, 6, 4, 4, 1},
		{1, 3, 6, 7, 9},
	}

	c := day2.count_safe_reports(rs)

	testing.expect_value(t, c, 2)
}

@(test)
parse_string :: proc(t: ^testing.T) {
	s := `7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
`


	c := day2.parse_and_count_safe_reports(s)
	testing.expect_value(t, c, 2)
}
