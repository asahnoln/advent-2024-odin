package day5

import "core:slice"

check_order :: proc(rules: [][2]int, pages: []int) -> bool {
	if len(rules) == 0 {
		return true
	}

	if len(pages) == 0 {
		return false
	}

	if len(pages) == 1 {
		return true
	}

	for r in rules {
		x := r[0]
		y := r[1]

		xi, _ := slice.linear_search(pages, x)
		yi, oky := slice.linear_search(pages, y)
		if oky && xi > yi {
			return false
		}
	}

	return true
}
