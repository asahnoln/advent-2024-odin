package day3

import "core:log"
import "core:strings"

// Parse with dos and donts
parse2 :: proc(s: string) -> (r: int, err: Error) {
	return parse_base(s, apply_donts_and_dos)
}

apply_donts_and_dos :: proc(sub: string, mul_index: ^int) -> (ok: bool) {
	dont_index := strings.index(sub, "don't()")
	do_index := strings.index(sub, "do()")

	if dont_index != -1 {
		// If dont until the end withoud do - just stop it
		if dont_index < mul_index^ && do_index == -1 {
			mul_index^ = len(sub) - 1
			return
		}

		// If mul between dont on left and do on right - skip to do on right
		if dont_index < mul_index^ && mul_index^ < do_index {
			mul_index^ = do_index
			return
		}

		// If do and dont together before mul - skip to dont
		if do_index < dont_index && dont_index < mul_index^ {
			return
		}
	}

	ok = true
	return
}
