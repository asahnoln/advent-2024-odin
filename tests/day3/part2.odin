package day3_test

import "core:os"
import "core:testing"
import "src:day3"

@(test)
parse2_from_example :: proc(t: ^testing.T) {
	r, err := day3.parse2(
		`xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))`,
	)

	testing.expect_value(t, err, nil)
	testing.expect_value(t, r, 48)
}

@(test)
parse2_with_other_problems :: proc(t: ^testing.T) {
	tt := []struct {
		src:  string,
		want: int,
	} {
		// Format
		{`do()mul(1,1)`, 1},
		{`don't()mul(1,1)`, 0},
		{`mul(2,1)do()`, 2},
		{`do()don't()mul(3,1)`, 0},
	}

	for test in tt {

		r, err := day3.parse2(test.src)
		testing.expectf(t, err == nil, "For `%v` want no error, got %v", test.src, err)
		testing.expectf(t, r == test.want, "For `%v` want %v, got %v", test.src, test.want, r)
	}
}
