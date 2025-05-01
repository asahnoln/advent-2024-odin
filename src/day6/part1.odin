package day6

import "core:strings"

coords: map[[2]int]struct {}

count_positions :: proc(m: string) -> int {
	coords = make(map[[2]int]struct {})
	defer delete(coords)
	cnt := 0

	ls := strings.split_lines(m)
	defer delete(ls)

	loop: for l, y in ls {
		for r, x in l {
			if r == '>' {
				coords[{x, y}] = struct {}{}
				cnt = count_right(ls, x + 1, y, 1)
				break loop
			}
		}
	}

	return cnt
}


count_right :: proc(ls: []string, x, y, c: int) -> (cnt: int) {
	cnt = c
	for i := x; i < len(ls[y]); i += 1 {
		switch ls[y][i] {
		case '#':
			return count_down(ls, i - 1, y + 1, cnt)
		}

		if ok := {i, y} in coords; ok {
			continue
		}
		coords[{i, y}] = struct {}{}
		cnt += 1
	}

	return
}

count_down :: proc(ls: []string, x, y, c: int) -> (cnt: int) {
	cnt = c
	for i := y; i < len(ls); i += 1 {
		switch ls[i][x] {
		case '#':
			return count_left(ls, x - 1, i - 1, cnt)
		}

		if ok := {x, i} in coords; ok {
			continue
		}
		coords[{x, i}] = struct {}{}
		cnt += 1
	}

	return
}

count_left :: proc(ls: []string, x, y, c: int) -> (cnt: int) {
	cnt = c
	for i := x; i > -1; i -= 1 {
		switch ls[y][i] {
		case '#':
			return count_up(ls, i + 1, y - 1, cnt)
		}

		if ok := {i, y} in coords; ok {
			continue
		}
		coords[{i, y}] = struct {}{}
		cnt += 1
	}

	return
}

count_up :: proc(ls: []string, x, y, c: int) -> (cnt: int) {
	cnt = c
	for i := y; i > -1; i -= 1 {
		switch ls[i][x] {
		case '#':
			return count_right(ls, x + 1, i + 1, cnt)
		}

		if ok := {x, i} in coords; ok {
			continue
		}
		coords[{x, i}] = struct {}{}
		cnt += 1
	}

	return
}
