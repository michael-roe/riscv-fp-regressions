

#
# Compute nmsub(+0, +0, +0); should be +0
#
# This was a bug in Flute found using TestRig
#

.global _test
_test:
	fnmsub.s ft0, ft0, ft0, ft0, rne
	fmv.x.w	a0, ft0
	ret
