package day4

import "core:strings"

X_MAS :: [?]string{"MAS", "SAM"}
X_MAS_LENGTH :: 3

parse_x_mas :: proc(src: string) -> int {
	r := 0

	ls := strings.split_lines(strings.trim_space(src))
	defer delete(ls)

	for l, i in ls {
		if len(ls) < i + X_MAS_LENGTH {
			break
		}

		for _, j in l {
			if len(l) < j + X_MAS_LENGTH {
				break
			}

			for x_mas in X_MAS {
				for x_mas_2 in X_MAS {
					r +=
					cast(int)(vertical_check_3(x_mas, ls, i, j, 1) &&
						vertical_check_3(x_mas_2, ls, i, j + 2, -1))
				}
			}
		}
	}

	return r
}

vertical_check_3 :: proc(what: string, ls: []string, i, j: int, step := 0) -> bool {
	return(
		ls[i][j] == what[0] &&
		ls[i + 1][j + step] == what[1] &&
		ls[i + 2][j + 2 * step] == what[2] \
	)
}
