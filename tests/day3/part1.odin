package day3_test

import "core:os"
import "core:testing"
import "src:day3"

@(test)
mul :: proc(t: ^testing.T) {
	testing.expect_value(t, day3.mul(2, 3), 6)
}

@(test)
mul_string :: proc(t: ^testing.T) {
	r, _ := day3.mul_string("123", "1")
	testing.expect_value(t, r, 123)
}

@(test)
mul_string_wrong :: proc(t: ^testing.T) {
	tt := []struct {
		ab:      []string,
		err_pos: int,
	} {
		// Comment for formatting purposes
		{{"no", "10"}, 0},
		{{"20", "hello"}, 1},
		{{"1542", "2"}, 0},
		{{"-12", "3"}, 0},
	}

	for test in tt {
		_, err := day3.mul_string(test.ab[0], test.ab[1])
		testing.expect_value(
			t,
			err,
			day3.Argument_Error{val = test.ab[test.err_pos], pos = test.err_pos},
		)
	}
}

@(test)
parse :: proc(t: ^testing.T) {
}
