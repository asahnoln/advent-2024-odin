package day4

import "core:strings"

X_MAS :: [?]string{"MAS", "SAM"}
X_MAS_LENGTH :: 3

parse2 :: proc(src: string) -> int {
	r := 0

	ls := strings.split_lines(strings.trim_space(src))
	defer delete(ls)

	// TODO: TDD again
	for l, i in ls {
		for _, j in l {
			if len(ls) >= i + X_MAS_LENGTH {
				if len(l) >= j + X_MAS_LENGTH {
				}

				if 0 <= j - (X_MAS_LENGTH - 1) {
				}
			}
		}
	}

	return r
}
