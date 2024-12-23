package day4

import "core:strings"

XMAS :: [?]string{"XMAS", "SAMX"}

parse :: proc(src: string) -> int {
	r := 0

	ls := strings.split_lines(strings.trim_space(src))
	defer delete(ls)

	for l, i in ls {
		for _, j in l {
			for xmas in XMAS {
				if len(l) >= j + 4 {
					r += horizontal_count(xmas, l, j)
				}

				if len(ls) >= i + 4 {
					r += vertical_count(xmas, ls, i, j)

					// Diagonal \
					if len(l) >= j + 4 {
						r += vertical_count(xmas, ls, i, j, 1)
					}

					// Diagonal /
					if 0 <= j - 3 {
						r += vertical_count(xmas, ls, i, j, -1)
					}
				}
			}
		}
	}

	return r
}

horizontal_count :: proc(what: string, l: string, j: int) -> int {
	return cast(int)(l[j:][:4] == what)
}

vertical_count :: proc(what: string, ls: []string, i, j: int, step := 0) -> int {
	return(
		cast(int)(ls[i][j] == what[0] &&
			ls[i + 1][j + step] == what[1] &&
			ls[i + 2][j + 2 * step] == what[2] &&
			ls[i + 3][j + 3 * step] == what[3]) \
	)
}
