package day5

import "core:slice"
import "core:strconv"
import "core:strings"

Rules :: [][2]int
Pages :: []int

parse_and_sum :: proc(src: string) -> int {
	sep := strings.index(src, "\n\n")
	rs := parse_rules(src[:sep])
	defer delete(rs)

	pss := parse_pages(src[sep:])
	defer delete(pss)

	sum := 0
	for ps in pss {
		defer delete(ps)
		if check_order(rs, ps) {
			sum += ps[len(ps) / 2]
		}
	}

	return sum
}

check_order :: proc(rules: Rules, pages: Pages) -> bool {
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

parse_rules :: proc(src: string) -> Rules {
	ls := strings.split_lines(strings.trim_space(src))
	defer delete(ls)

	r := make(Rules, len(ls))
	for l, i in ls {
		ab := strings.split(l, "|")
		defer delete(ab)

		a, b := ab[0], ab[1]
		r[i] = {strconv.atoi(a), strconv.atoi(b)}
	}

	return r
}


parse_pages :: proc(src: string) -> []Pages {
	ls := strings.split_lines(strings.trim_space(src))
	defer delete(ls)

	r := make([]Pages, len(ls))
	for l, i in ls {
		ps := strings.split(l, ",")
		defer delete(ps)

		r[i] = make(Pages, len(ps))

		for p, j in ps {
			r[i][j] = strconv.atoi(p)

		}
	}

	return r
}
