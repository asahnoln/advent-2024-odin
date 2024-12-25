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
  got := day6.count_positions(`
^`[1:])

  testing.expect_value(t, got, 1)
}
