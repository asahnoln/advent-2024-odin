package day3

import "core:strconv"

Argument_Error :: struct {
	val: string,
	pos: int,
}

Error :: union {
	Argument_Error,
}

mul :: proc(a, b: int) -> int {
	return a * b
}

mul_string :: proc(a, b: string) -> (res: int, err: Error) {
	x := parse_arg(a, 0) or_return
	y := parse_arg(b, 1) or_return

	return mul(x, y), nil
}

parse_arg :: proc(v: string, pos: int) -> (res: int, err: Error) {
	err = Argument_Error{v, pos}

	if v[0] == '-' || len(v) > 3 {
		return
	}

	x, ok := strconv.parse_int(v)
	if !ok {
		return
	}

	return x, nil
}
