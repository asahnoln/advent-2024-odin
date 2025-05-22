package day6

import "core:strings"

count_positions :: proc(m: string) -> int {
	coords := make(map[[2]int]struct {})
	defer delete(coords)

	ls := strings.split_lines(m)
	defer delete(ls)

	for l, y in ls {
		for r, x in l {
			if dir, ok := rune_to_dir(r); ok {
				return start_count(ls, x, y, dir, &coords)
			}
		}
	}

	return 0
}

@(private)
rune_to_dir :: proc(r: rune) -> (d: Dir, ok: bool) {
	ok = true
	switch r {
	case '>':
		d = .Right
	case '^':
		d = .Up
	case 'v':
		d = .Down
	case '<':
		d = .Left
	case:
		ok = false
	}

	return
}

@(private)
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

@(private)
count_dir :: proc(
	ls: []string,
	x, y, c: int,
	d: Dir,
	coords: ^map[[2]int]struct {},
) -> (
	cnt: int,
) {
	cnt = c
	min, max, minus := init_loop_vars(ls, x, y, d)

	for j := min * minus; j < max * minus; j += 1 {
		i := j * minus
		r := current_byte(ls, x, y, i, d)
		cs := current_coord(d, x, y, i)


		if r == '#' {
			next_x, next_y := find_next_xy(d, x, y, i)
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

@(private)
init_loop_vars :: proc(ls: []string, x, y: int, d: Dir) -> (min, max, minus: int) {
	minus = 1
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
		minus = -1
	case .Up:
		min = y
		max = -1
		minus = -1
	}

	return min, max, minus
}

@(private)
current_byte :: proc(ls: []string, x, y, i: int, d: Dir) -> (r: u8) {
	switch d {
	case .Right, .Left:
		r = ls[y][i]
	case .Down, .Up:
		r = ls[i][x]
	}
	return
}

@(private)
current_coord :: proc(d: Dir, x, y, i: int) -> (cs: [2]int) {
	switch d {
	case .Right, .Left:
		cs = {i, y}
	case .Down, .Up:
		cs = {x, i}
	}

	return
}

@(private)
find_next_xy :: proc(d: Dir, x, y, i: int) -> (next_x, next_y: int) {
	switch d {
	case .Right:
		next_x = i - 1
		next_y = y + 1
	case .Down:
		next_x = x - 1
		next_y = i - 1
	case .Left:
		next_x = i + 1
		next_y = y - 1
	case .Up:
		next_x = x + 1
		next_y = i + 1
	}
	return
}
