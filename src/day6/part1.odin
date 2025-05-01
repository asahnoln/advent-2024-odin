package day6

import "core:strings"

count_positions :: proc(m: string) -> int {
	coords := make(map[[2]int]struct {})
	defer delete(coords)

	ls := strings.split_lines(m)
	defer delete(ls)

	for l, y in ls {
		for r, x in l {
			switch r {
			case '>':
				return start_count(ls, x, y, .Right, &coords)
			case '^':
				return start_count(ls, x, y, .Up, &coords)
			case 'v':
				return start_count(ls, x, y, .Down, &coords)
			case '<':
				return start_count(ls, x, y, .Left, &coords)
			}
		}
	}

	return 0
}

start_count :: proc(ls: []string, x, y: int, d: Dir, coords: ^map[[2]int]struct {}) -> (cnt: int) {
	coords[{x, y}] = struct {}{}
	next_x := x
	next_y := y

	switch d {
	case .Right:
		next_x = x + 1
	case .Down:
		next_y = y + 1
	case .Left:
		next_x = x - 1
	case .Up:
		next_y = y - 1
	}

	return count_dir(ls, next_x, next_y, 1, d, coords)
}

Dir :: enum {
	Right,
	Down,
	Left,
	Up,
}
dir_next := [Dir]Dir {
	.Right = .Down,
	.Down  = .Left,
	.Left  = .Up,
	.Up    = .Right,
}

count_dir :: proc(
	ls: []string,
	x, y, c: int,
	d: Dir,
	coords: ^map[[2]int]struct {},
) -> (
	cnt: int,
) {
	cnt = c
	step := 1
	max := 0
	min := 0

	switch d {
	case .Right:
		min = x
		max = len(ls[y])
	case .Down:
		min = y
		max = len(ls)
	case .Left:
		min = x
		max = -1
		step = -1
	case .Up:
		min = y
		max = -1
		step = -1
	}

	for j := min * step; j < max * step; j += 1 {
		i := j * step
		r: u8
		cs: [2]int
		next_x := x
		next_y := y
		switch d {
		case .Right:
			r = ls[y][i]
			cs = {i, y}
			next_x = i - 1
			next_y = y + 1
		case .Down:
			r = ls[i][x]
			cs = {x, i}
			next_x = x - 1
			next_y = i - 1
		case .Left:
			r = ls[y][i]
			cs = {i, y}
			next_x = i + 1
			next_y = y - 1
		case .Up:
			r = ls[i][x]
			cs = {x, i}
			next_x = x + 1
			next_y = i + 1
		}

		if r == '#' {
			return count_dir(ls, next_x, next_y, cnt, dir_next[d], coords)
		}

		if cs in coords {
			continue
		}

		coords[cs] = struct {}{}
		cnt += 1
	}

	return
}
