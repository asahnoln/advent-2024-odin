package day5_test

import "core:slice"
import "core:testing"
import "src:day5"

@(test)
check_order :: proc(t: ^testing.T) {
	tt := []struct {
		rules: day5.Rules,
		pages: []int,
		want:  bool,
	} {
		{{{1, 2}}, {}, false},
		{{}, {1}, true},
		{{{1, 2}}, {9}, true},
		{{{1, 2}}, {1, 2}, true},
		{{{1, 2}}, {2, 1}, false},
		{{{1, 2}}, {1, 0, 2}, true},
		{{{2, 1}}, {2, 1}, true},
		{{{2, 0}, {1, 2}}, {1, 0, 2}, false}, // proper shoud be 1, 2, 0
		{{{1, 2}}, {3, 1}, true},
	}

	for test in tt {
		got := day5.check_order(test.rules, test.pages)
		testing.expectf(
			t,
			got == test.want,
			"For rules `%v` and pages `%v` want %v, got %v",
			test.rules,
			test.pages,
			test.want,
			got,
		)
	}
}

@(test)
parse_rules :: proc(t: ^testing.T) {
	tests := []struct {
		src:  string,
		want: day5.Rules,
	} {
		// Format
		{"1|2", {{1, 2}}},
		{"2|3\n4|3", {{2, 3}, {4, 3}}},
		{"1|2\n", {{1, 2}}},
	}

	for tt in tests {
		got := day5.parse_rules(tt.src)
		defer delete(got)

		testing.expectf(
			t,
			slice.equal(got, tt.want),
			"For `%s` want %v, got %v",
			tt.src,
			tt.want,
			got,
		)
	}
}

@(test)
parse_pages :: proc(t: ^testing.T) {
	tests := []struct {
		src:  string,
		want: []day5.Pages,
	} {
		// Format
		{"1,2", {{1, 2}}},
		{"1,2,3", {{1, 2, 3}}},
		{"4,5\n6,7,8", {{4, 5}, {6, 7, 8}}},
		{"1,2\n", {{1, 2}}},
	}

	for tt in tests {
		got := day5.parse_pages(tt.src)
		defer delete(got)
		defer delete(got[0])

		testing.expectf(
			t,
			slice.equal(got[0], tt.want[0]),
			"For `%s` want %v, got %v",
			tt.src,
			tt.want,
			got,
		)

		// Can't compare [][]int, thus a hack
		if len(tt.want) > 1 {
			defer delete(got[1])
			testing.expect(t, slice.equal(got[1], tt.want[1]))
		}
	}
}

// @(test)
// err_parse_rules :: proc(t: ^testing.T) {
// 	tests := []struct {
// 		src:  string,
// 		want: day5.Error,
// 	} {
// 		// Format
// 		{"2|x", day5.Parse_Rule_Error{"x", 1}},
// 	}
//
// 	for tt in tests {
// 		rs, err := day5.parse_rules(tt.src)
// 		defer delete(rs)
//
// 		testing.expectf(t, rs == tt.want, "For `%s` want err %v, got %v", tt.src, tt.want, err)
// 	}
// }

// @(test)
// parse_from_example :: proc(t: ^testing.T) {
// 	s := day5.parse(
// 		`
// 47|53
// 97|13
// 97|61
// 97|47
// 75|29
// 61|13
// 75|53
// 29|13
// 97|29
// 53|29
// 61|53
// 97|53
// 61|29
// 47|13
// 75|47
// 97|75
// 47|61
// 75|61
// 47|29
// 75|13
// 53|13
//
// 75,47,61,53,29
// 97,61,53,29,13
// 75,29,13
// 75,97,47,61,53
// 61,13,29
// 97,13,75,29,47`,
// 	)
//
// 	testing.expect_value(t, s, 143)
// }
