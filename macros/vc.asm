MACRO vc_hook
	if DEF(_GOLD_VC) || DEF(_SILVER_VC)
	.VC_\1::
	endc
ENDM

MACRO vc_patch
	if DEF(_GOLD_VC) || DEF(_SILVER_VC)
		assert !DEF(CURRENT_VC_PATCH), "Already started a vc_patch"
		DEF CURRENT_VC_PATCH EQUS "\1"
	.VC_{CURRENT_VC_PATCH}::
	endc
ENDM

MACRO vc_patch_end
	if DEF(_GOLD_VC) || DEF(_SILVER_VC)
		assert DEF(CURRENT_VC_PATCH), "No vc_patch started"
	.VC_{CURRENT_VC_PATCH}_End::
		PURGE CURRENT_VC_PATCH
	endc
ENDM

MACRO vc_assert
	if DEF(_GOLD_VC) || DEF(_SILVER_VC)
		assert \#
	endc
ENDM
