package day4_test

import "core:testing"
import "src:day4"

// 
// MMMSXXMASM
// MSAMXMSMSA
// AMXSXMAAMM
// MSAMASMSMX
// XMASAMXAMM
// XXAMMXXAMA
// SMSMSASXSS
// SAXAMASAAA
// MAMMMXMMMM
// MXMXAXMASX
//
// 18 times!
//

@(test)
xmas :: proc(t: ^testing.T) {
	tt := []struct {
		src:  string,
		want: int,
	} {
		// Format
		{"XMAS", 1},
		{"", 0},
		{"SAMX", 1},
		{"XMASAMX", 2},
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
	}

	for test in tt {
		r := day4.parse(test.src)
		testing.expect_value(t, r, test.want)
	}
}
