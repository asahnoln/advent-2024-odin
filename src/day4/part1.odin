package day4

import "core:strings"

XMAS :: [?]string{"XMAS", "SAMX"}
XMAS_LENGTH :: 4

parse_xmas :: proc(src: string) -> int {
	r := 0

	ls := strings.split_lines(strings.trim_space(src))
	defer delete(ls)

	for l, i in ls {
		for _, j in l {
			for xmas in XMAS {
				if len(l) >= j + XMAS_LENGTH {
					r += horizontal_count(xmas, l, j)
				}

				if len(ls) < i + XMAS_LENGTH {
					continue
				}

				r += vertical_count_4(xmas, ls, i, j)

				// Diagonal \
				if len(l) >= j + XMAS_LENGTH {
					r += vertical_count_4(xmas, ls, i, j, 1)
				}

				// Diagonal /
				if 0 <= j - (XMAS_LENGTH - 1) {
					r += vertical_count_4(xmas, ls, i, j, -1)
				}
			}
		}
	}

	return r
}

horizontal_count :: proc(what: string, l: string, j: int) -> int {
	return cast(int)(l[j:][:4] == what)
}

vertical_count_4 :: proc(what: string, ls: []string, i, j: int, step := 0) -> int {
	return cast(int)(vertical_check_3(what, ls, i, j, step) && ls[i + 3][j + 3 * step] == what[3])
}
