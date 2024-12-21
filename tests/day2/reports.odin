package day2_test

import "core:testing"
import "src:day2"

@(test)
safe_report :: proc(t: ^testing.T) {
	tt := [][]int{{}, {1}, {1, 2}}

	for test in tt {
		s := day2.is_safe(test)

		testing.expectf(t, s, "Expected %v to be safe", test)
	}
}

@(test)
unsafe_report :: proc(t: ^testing.T) {
	tt := [][]int {
		// Minimum unsafe level
		{1, 1},
		{1, 2, 2},
		// Maximum unsafe level
		{1, 5},
		{5, 1},
		// Direction change
		{1, 2, 1},
		{2, 1, 2},
	}

	for test in tt {
		s := day2.is_safe(test)

		testing.expectf(t, !s, "Expected %v to be unsafe", test)
	}
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
