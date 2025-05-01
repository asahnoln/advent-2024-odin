package day6_test

import "core:testing"
import "src:day6"

// Example:
//
// ....#.....
// .........#
// ..........
// ..#.......
// .......#..
// ..........
// .#..^.....
// ........#.
// #.........
// ......#...
//
// 41 distinct positions

@(test)
count_positions :: proc(t: ^testing.T) {
	tests := []struct {
		m:    string,
		want: int,
	} {
		// Format
		{`
>`, 1},
		{`
>..`, 3},
		{`
.>.`, 2},
		{`
>#`, 1},
		{`
#>`, 1},
		{`
>#
..`, 2},
		{`
>#
#.`, 1},
		{`
#>#
.#.`, 1},
		{`
.#.
...
#>#
.#.`, 3},
		{`
.#...
.....
..>.#
#....
...#.`, 10},
		{`
.#...
.....
.>..#
#....
...#.`, 10},
		{`
#...
...#
^...
#...
..#.`, 9},
		{`
..v..
.#...
....#
#....
..#..`, 9},
		{`
.#...
....#
#...<
.....
...#.`, 11},
	}

	for tt in tests {
		got := day6.count_positions(tt.m[1:])
		testing.expectf(t, got == tt.want, "For `%s` want %v, got %v", tt.m[1:], tt.want, got)
	}
}

@(test)
example :: proc(t: ^testing.T) {
	got := day6.count_positions(
		`
....#.....
.........#
..........
..#.......
.......#..
..........
.#..^.....
........#.
#.........
......#...`[1:],
	)
	testing.expect_value(t, got, 41)
}
