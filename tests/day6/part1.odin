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
.
v
.
.`[1:], 3},
		{`
.
^
.`[1:], 2},
		{`
.>.`[1:], 2},
		{`
.<.`[1:], 2},
		{`
.<.
...`[1:], 2},
		{`
....
....
.^..`[1:], 3},
		{`
.v
..
..`[1:], 3},
		{`
...
.<.
...`[1:], 2},
		{`
.>.
...`[1:], 2},
	}

	for tt in tests {
		got := day6.count_positions(tt.m)
		testing.expectf(t, got == tt.want, "For `%s` want %v, got %v", tt.m, tt.want, got)
	}
}
