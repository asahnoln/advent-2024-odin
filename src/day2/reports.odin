package day2

import "core:strconv"
import "core:strings"

MIN_LEVEL_DIFF :: 1
MAX_LEVEL_DIFF :: 3

parse_and_count_safe_reports :: proc(s: string, check_func := is_safe) -> uint {
	ls := strings.split_lines(s)
	defer delete(ls)

	sum: uint = 0
	for l in ls {
		lt := strings.trim_space(l)
		if lt == "" {
			continue
		}

		r := parse_line(lt)
		defer delete(r)

		sum += cast(uint)check_func(r)
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

count_safe_reports :: proc(rs: [][]int, check_func := is_safe) -> uint {
	sum: uint = 0
	for r in rs {
		sum += cast(uint)check_func(r)
	}
	return sum
}

is_safe :: proc(r: []int) -> bool {
	if len(r) <= 1 {
		return true
	}

	for i := 0; i < len(r) - 1; i += 1 {
		switch {
		case i + 2 < len(r) && direction_changes(r[i], r[i + 1], r[i + 2]):
			fallthrough
		case !diff_is_in_limits(r[i], r[i + 1]):
			return false
		}
	}

	return true
}

diff_is_in_limits :: proc(a, b: int) -> bool {
	diff := abs(a - b)
	return diff >= MIN_LEVEL_DIFF && diff <= MAX_LEVEL_DIFF
}

direction_changes :: proc(a, b, c: int) -> bool {
	return (a < b && b > c) || (a > b && b < c)
}
