

#
# Test the basic functionality of fmadd.s, fmsub.s, fnmadd.s, fnsubn.s
# by computing +/-(2*2) +/- 1
#
# Each result is converted to integer and shifted into a byte of a0
#

.global _test

_test:
	li t0, 2
	fcvt.s.w f0, t0
	li t0, 1
	fcvt.s.w f1, t0

	li a0, 0

	fnmadd.s f2, f0, f0, f1
	fcvt.w.s t0, f2
	andi t0, t0, 0xff
	or a0, a0, t0

	fnmsub.s f2, f0, f0, f1
	fcvt.w.s t0, f2
        andi t0, t0, 0xff
	sll a0, a0, 8
        or a0, a0, t0

	fmadd.s f2, f0, f0, f1
        fcvt.w.s t0, f2
        andi t0, t0, 0xff
        sll a0, a0, 8
        or a0, a0, t0

	fmsub.s f2, f0, f0, f1
        fcvt.w.s t0, f2
        andi t0, t0, 0xff
        sll a0, a0, 8
        or a0, a0, t0

	ret
