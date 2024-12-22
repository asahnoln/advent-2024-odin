package day3_test

import "core:testing"
import "src:day3"

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
parse_from_example :: proc(t: ^testing.T) {
	r, err := day3.parse(`xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))`)

	testing.expect_value(t, err, nil)
	testing.expect_value(t, r, 161)
}

@(test)
parse_with_other_problems :: proc(t: ^testing.T) {
	r, err := day3.parse(`mul(2,2)mul(mul(1,mul(1421,1)mul(1,2233)mul(3,3)`)

	testing.expect_value(t, err, nil)
	testing.expect_value(t, r, 13)
}
