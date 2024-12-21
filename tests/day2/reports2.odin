package day2_test

import "core:testing"
import "src:day2"

@(test)
safe_report_2 :: proc(t: ^testing.T) {
	tt := [][]int {
		{},
		{1},
		{1, 2},
		// If removed second level
		{1, 2, 2},
		{1, 3, 2, 4},
		// If removed third level
		{1, 2, 3, 3},
		// If removed first level
		{1, 2, 1},
		{1, 2, 3, 4, 5, 4},
	}

	for test in tt {
		s := day2.is_safe_2(test)

		testing.expectf(t, s, "Expected %v to be safe", test)
	}
}

@(test)
unsafe_report_2 :: proc(t: ^testing.T) {
	tt := [][]int {
		// Minimum unsafe level
		{1, 1, 1},
		// Maximum unsafe level
		{1, 5, 10},
		{10, 5, 1},
		// Direction change
		{2, 1, 2, 1},
	}

	for test in tt {
		s := day2.is_safe_2(test)

		testing.expectf(t, !s, "Expected %v to be unsafe", test)
	}
}

@(test)
count_safe_reports_2 :: proc(t: ^testing.T) {
	rs := [][]int {
		{7, 6, 4, 2, 1},
		{1, 2, 7, 8, 9},
		{9, 7, 6, 2, 1},
		{1, 3, 2, 4, 5},
		{8, 6, 4, 4, 1},
		{1, 3, 6, 7, 9},
	}

	c := day2.count_safe_reports_2(rs)

	testing.expect_value(t, c, 4)
}

@(test)
parse_string_2 :: proc(t: ^testing.T) {
	s := `7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
`


	c := day2.parse_and_count_safe_reports_2(s)
	testing.expect_value(t, c, 4)
}
