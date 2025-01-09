package day5

import "core:slice"

parse_fix_and_sum :: proc(src: string) -> int {
	return parse_and_sum_base(src, proc(rs: Rules, ps: Pages) -> (n: int) {
		if !check_order(rs, ps) {
			fix_order(rs, ps)
			n = ps[len(ps) / 2]
		}

		return
	})
}

fix_order :: proc(rs: Rules, ps: Pages) {
	@(static) rules: Rules
	rules = rs
	slice.sort_by(ps, proc(i, j: int) -> bool {
		for r in rules {
			if r[0] == i && r[1] == j {
				return true
			}
		}

		return false
	})
}
