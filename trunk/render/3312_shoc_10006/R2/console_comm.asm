con_comm:

REGISTER_CC_INT det_rad_value, "r__detail_radius", 5, 4B0h
REGISTER_CC_FLAG ps_r2_ls_flags, 04000h, "r2_exp_donttest_uns"
REGISTER_CC_FLAG ps_r2_ls_flags, 10000h, "r2_bloodmarks"

	; делаем вырезанное
	pop		edi
	pop		esi
	pop		ebp
	pop		ebx
	add		esp, 18h
	retn

det_rad_value dd 31h