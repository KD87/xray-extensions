con_comm:

REGISTER_CC_INT det_rad_value, "r__detail_radius", 5, 4B0h
REGISTER_CC_FLOAT sunshafts_exposure, "r2_sun_shafts_exposure", 0.0, 1.0
REGISTER_CC_FLAG ps_r2_ls_flags, 04000h, "r2_exp_donttest_uns"
REGISTER_CC_FLAG ps_r2_ls_flags, 10000h, "r2_bloodmarks"
REGISTER_CC_FLAG ps_r2_ls_flags, 40000h, "r2_soft_water"
REGISTER_CC_FLAG ps_r2_ls_flags, 80000h, "r2_sun_shafts"
REGISTER_CC_FLAG ps_r2_ls_flags, 100000h, "r2_pom"
REGISTER_CC_FLAG ps_r2_ls_flags, 200000h, "r2_soft_shadows"
REGISTER_CC_FLAG ps_r2_ls_flags, 400000h, "r2_ddof"
REGISTER_CC_FLAG ps_r2_ls_flags, 800000h, "r2_float32"
REGISTER_CC_FLAG ps_r2_ls_flags, 1000000h, "r2_ssdo"
REGISTER_CC_FLAG ps_r2_ls_flags, 2000000h, "r2_hbao"

	; делаем вырезанное
	pop		edi
	pop		esi
	pop		ebp
	pop		ebx
	add		esp, 18h
	retn

det_rad_value dd 31h
sunshafts_exposure dd 1.0