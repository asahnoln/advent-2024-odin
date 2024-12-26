package day6

import "core:strings"

count_positions :: proc(m: string) -> int {
	cnt := 0

	m := m
	i := -1
	down := -1
	right := -1
	line_loop: for l in strings.split_lines_iterator(&m) {
		i += 1
		for r, j in l {
			if right == -1 && down == -1 || j == down || i == right {
				cnt += 1
			}
			if down != -1 && down != j {
				continue
			}
			if right != -1 && i != right {
				break line_loop
			}

			switch r {
			case '<':
				cnt -= i * len(l)
				break line_loop
			case '^':
				cnt -= j + i * (len(l) - 1)
				break line_loop
			case '>':
				cnt = 1
				right = i
			case 'v':
				cnt = 1
				down = j
			}
		}
	}

	return cnt
}
