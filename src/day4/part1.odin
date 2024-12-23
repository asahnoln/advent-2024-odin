package day4

import "core:strings"

parse :: proc(src: string) -> int {
	r := 0
	r += strings.count(src, "XMAS")
	r += strings.count(src, "SAMX")

	ls := strings.split_lines(src)
	defer delete(ls)

	for l, i in ls {
		if len(ls) >= i + 4 {
			for _, j in l {
				// Vertical 
				if ls[i][j] == 'X' &&
				   ls[i + 1][j] == 'M' &&
				   ls[i + 2][j] == 'A' &&
				   ls[i + 3][j] == 'S' {
					r += 1
				}

				// Vertical backwards
				if ls[i][j] == 'S' &&
				   ls[i + 1][j] == 'A' &&
				   ls[i + 2][j] == 'M' &&
				   ls[i + 3][j] == 'X' {
					r += 1
				}

				// Diagonal \
				if len(l) >= j + 4 {
					if ls[i][j] == 'X' &&
					   ls[i + 1][j + 1] == 'M' &&
					   ls[i + 2][j + 2] == 'A' &&
					   ls[i + 3][j + 3] == 'S' {
						r += 1
					}

					if ls[i][j] == 'S' &&
					   ls[i + 1][j + 1] == 'A' &&
					   ls[i + 2][j + 2] == 'M' &&
					   ls[i + 3][j + 3] == 'X' {
						r += 1
					}
				}

				// Diagonal /
				if 0 <= j - 3 { 	// FIXME: Test case for columns count in a line
					if ls[i][j] == 'X' &&
					   ls[i + 1][j - 1] == 'M' &&
					   ls[i + 2][j - 2] == 'A' &&
					   ls[i + 3][j - 3] == 'S' {
						r += 1
					}

					if ls[i][j] == 'S' &&
					   ls[i + 1][j - 1] == 'A' &&
					   ls[i + 2][j - 2] == 'M' &&
					   ls[i + 3][j - 3] == 'X' {
						r += 1
					}
				}
			}
		}
	}

	return r
}
