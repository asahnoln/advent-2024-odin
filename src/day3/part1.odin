package day3

import "core:log"
import "core:strconv"
import "core:strings"
import "core:unicode"

MAX_NUMBER_LENGTH :: 3

Argument_Error :: struct {
	val: string,
	pos: int,
}

Error :: union {
	Argument_Error,
}

mul_string :: proc(a, b: string) -> (res: int, err: Error) {
	x := parse_arg(a, 0) or_return
	y := parse_arg(b, 1) or_return

	return x * y, nil
}

parse_arg :: proc(v: string, pos: int) -> (res: int, err: Error) {
	err = Argument_Error{v, pos}

	if v[0] == '-' || len(v) > MAX_NUMBER_LENGTH {
		return
	}

	x, ok := strconv.parse_int(v)
	if !ok {
		return
	}

	return x, nil
}

parse :: proc(s: string) -> (r: int, err: Error) {
	return parse_base(s, proc(_: string, _: ^int) -> bool {return true})
}

parse_base :: proc(
	s: string,
	apply_validation: proc(sub: string, mul_index: ^int) -> bool,
) -> (
	r: int,
	err: Error,
) {
	i := -1
	sub := s

	for {
		sub = sub[i + 1:]
		i = strings.index(sub, "mul(")
		if i == -1 {
			break
		}

		apply_validation(sub, &i) or_continue

		x_index := i + 4
		xl := find_num_length(sub[x_index:], ',') or_continue

		y_index := x_index + xl + 1
		yl := find_num_length(sub[y_index:], ')') or_continue

		x := sub[x_index:][:xl]
		y := sub[y_index:][:yl]
		a := mul_string(x, y) or_return
		r += a
	}

	return
}

find_num_length :: proc(sub: string, break_on_rune: rune) -> (l: int, ok: bool) {
	for r in sub {
		if r == break_on_rune {
			break
		}
		if !unicode.is_digit(r) {
			return
		}

		l += 1

		if l > MAX_NUMBER_LENGTH {
			return
		}
	}

	ok = true
	return
}
