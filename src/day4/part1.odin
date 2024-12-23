package day4

import "core:strings"

parse :: proc(src: string) -> int {
	r := 0
	r += strings.count(src, "XMAS")
	r += strings.count(src, "SAMX")

	ls := strings.split_lines(src)
	defer delete(ls)

	for l, i in ls {
		if len(ls) > i + 3 {
			for _, j in l {
				if ls[i][j] == 'X' &&
				   ls[i + 1][j] == 'M' &&
				   ls[i + 2][j] == 'A' &&
				   ls[i + 3][j] == 'S' {
					r += 1
				}

				if ls[i][j] == 'S' &&
				   ls[i + 1][j] == 'A' &&
				   ls[i + 2][j] == 'M' &&
				   ls[i + 3][j] == 'X' {
					r += 1
				}
			}
		}
	}

	return r
}
