package day2

import "core:fmt"
import "core:log"
import "core:strconv"
import "core:strings"

MAX_LEVEL_DIFF :: 3

parse_and_count_safe_reports :: proc(s: string) -> uint {
	ls := strings.split_lines(s)
	defer delete(ls)

	sum: uint = 0
	for l, i in ls {
		l := strings.trim_space(l)
		if l == "" {
			continue
		}

		r := parse_line(l)
		defer delete(r)

		sum += cast(uint)is_safe(r)
	}

	return sum
}

parse_line :: proc(l: string) -> []int {
	ns := strings.split(l, " ")
	defer delete(ns)

	r := make([]int, len(ns))
	for n, i in ns {
		r[i] = strconv.atoi(n)
	}

	return r
}

count_safe_reports :: proc(rs: [][]int) -> uint {
	sum: uint = 0
	for r in rs {
		sum += cast(uint)is_safe(r)
	}
	return sum
}

is_safe :: proc(r: []int) -> bool {
	if len(r) <= 1 {
		return true
	}

	for i := 0; i < len(r) - 1; i += 1 {
		if i + 2 < len(r) {
			if direction_changes(r[i], r[i + 1], r[i + 2]) {
				return false
			}
		}

		if !diff_is_in_limits(r[i], r[i + 1]) {
			return false
		}
	}

	return true
}

diff_is_in_limits :: proc(a, b: int) -> bool {
	diff := abs(a - b)
	return diff >= 1 && diff <= MAX_LEVEL_DIFF
}

direction_changes :: proc(a, b, c: int) -> bool {
	return (a < b && b > c) || (a > b && b < c)
}
