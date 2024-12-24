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
		{`
S.M
.A.
S.M`[1:], 1},
		{`
S.S
.A.
M.M`[1:], 1},
		{`
M.S
.A.
M.S`[1:], 1},
		// 		{`
		// MSMSM
		// .AAA.
		// SMSMS`[1:], 3},
	}

	for test in tt {
		r := day4.parse_x_mas(test.src)
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

@(test)
x_mas_example :: proc(t: ^testing.T) {
	r := day4.parse_x_mas(
		`
.M.S......
..A..MSMS.
.M.S.MAA..
..A.ASMSM.
.M.S.M....
..........
S.S.S.S.S.
.A.A.A.A..
M.M.M.M.M.
..........`[1:],
	)
	testing.expect_value(t, r, 9)
}
