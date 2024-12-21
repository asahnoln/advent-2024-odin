package day2

import "core:strings"

parse_and_count_safe_reports_2 :: proc(s: string) -> uint {
	return parse_and_count_safe_reports(s, is_safe_2)
}

is_safe_2 :: proc(r: []int) -> bool {
	if len(r) <= 1 {
		return true
	}

	for i := 0; i < len(r) - 1; i += 1 {
		switch {
		case i + 2 < len(r) && direction_changes(r[i], r[i + 1], r[i + 2]):
			fallthrough
		case !diff_is_in_limits(r[i], r[i + 1]):
			return(
				is_safe_with_removed_level(r, i) ||
				is_safe_with_removed_level(r, i + 1) ||
				is_safe_with_removed_level(r, i + 2) \
			)
		}
	}

	return true
}

count_safe_reports_2 :: proc(rs: [][]int) -> uint {
	return count_safe_reports(rs, is_safe_2)
}

remove_level_from_report :: proc(r: []int, i: int) -> []int {
	d := make([]int, len(r) - 1)

	k := 0
	for l, j in r {
		if j == i {
			continue
		}

		d[k] = l
		k += 1
	}

	return d
}

is_safe_with_removed_level :: proc(r: []int, i: int) -> bool {
	r := remove_level_from_report(r, i)
	defer delete(r)

	return is_safe(r)
}
