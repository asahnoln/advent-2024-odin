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
	testing.expect(t, day4.parse("") == 18)
}
