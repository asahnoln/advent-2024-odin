package day4_test

import "core:testing"
import "src:day4"

@(test)
xmas :: proc(t: ^testing.T) {
	tt := []struct {
		src:  string,
		want: int,
	} {
		// Horizontal
		{"XMAS", 1},
		{"", 0},
		{"SAMX", 1},
		{"XMASAMX", 2},

		// Vertical
		{`
X
M
A
S`[1:], 1},
		{`
S
A
M
X`[1:], 1},
		{`
X
M
A
S
A
M
X`[1:], 2},
		{`
X
M
A
S
X
M
A
S`[1:], 2},
		{`
X
MX
AM
SA
.S`[1:], 2},
		{`
X
M
A`[1:], 0},
		{`
X
M
A
`[1:], 0},

		// Diagonal
		{`
X...
.M..
..A.
...S`[1:], 1},
		{`
S...
.A..
..M.
...X`[1:], 1},
		{`
...X
..M.
.A..
S...`[1:], 1},
		{`
...S
..A.
.M..
X...`[1:], 1},
		{`
S..
.A.
..M
...`[1:], 0},
		{`
..S
.A.
M..
...`[1:], 0},
	}

	for test in tt {
		// log.infof("Test for `%s`", test.src)
		r := day4.parse(test.src)
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
xmas_example :: proc(t: ^testing.T) {
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
