package day4_test

import "core:testing"
import "src:day4"

@(test)
x_mas :: proc(t: ^testing.T) {
	tt := []struct {
		src:  string,
		want: int,
	} {
		// Format
		{`
M.M
.A.
S.S`[1:], 1},
	}

	for test in tt {
		r := day4.parse2(test.src)
		testing.expectf(
			t,
			r == test.want,
			"For source `%s` want %d, got %d",
			test.src,
			test.want,
			r,
		)
	}
}

// @(test)
x_mas_example :: proc(t: ^testing.T) {
	r := day4.parse(
		`
MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX`[1:],
	)
	testing.expect_value(t, r, 18)
}
