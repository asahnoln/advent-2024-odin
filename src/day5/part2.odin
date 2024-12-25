package day5

import "core:slice"

fix_order :: proc(rs: Rules, ps: Pages) {
	// Won't work! Bacause closure procs don't capture vars
	// slice.sort_by(ps, proc(i, j: int) -> bool {
	// 	for r in rs {
	// 		if r[0] == i && r[1] == j {
	// 			return true
	// 		}
	// 	}
	//
	// 	return false
	// })

	// So that abomination!
	// Please tell me another way to use rs in a closure proc :(
	for r in rs {
		xi, _ := slice.linear_search(ps, r[0])
		yi, oky := slice.linear_search(ps, r[1])

		if oky && xi > yi {
			ps[xi] = r[1]
			ps[yi] = r[0]
		}
	}
}
