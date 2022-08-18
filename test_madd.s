

#
# Compute madd(+0, +0, -0); should be +0
#

.global _test
_test:
	fmv.w.x ft0, x0
	fmv.w.x ft1, x0
	fsgnjn.s ft1, ft1, ft1
	fmadd.s ft0, ft0, ft0, ft1, rne
	fmv.x.w	a0, ft0
	ret
