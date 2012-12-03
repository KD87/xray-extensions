con_comm:

REGISTER_CC_INT det_rad_value, "r__detail_radius", 5, 4B0h
REGISTER_CC_INT sunshafts_quality, "r2_sun_shafts", 0, 3	
REGISTER_CC_INT ssao_quality, "r2_ssao", 0, 3
REGISTER_CC_INT ssao_mode, "r2_ssao_mode", 0, 2
REGISTER_CC_INT soft_shadows, "r2_soft_shadows", 0, 3
REGISTER_CC_INT steep_parallax, "r2_steep_parallax", 0, 3
REGISTER_CC_INT dynamic_dof, "r2_dof", 0, 3
REGISTER_CC_FLAG ps_r2_ls_flags, 04000h, "r2_exp_donttest_uns"
REGISTER_CC_FLAG ps_r2_ls_flags, 10000h, "r2_bloodmarks"
REGISTER_CC_FLAG ps_r2_ls_flags, 40000h, "r2_soft_water"
REGISTER_CC_FLAG ps_r2_ls_flags, 800000h, "r2_float32"

	; делаем вырезанное
	pop		edi
	pop		esi
	pop		ebp
	pop		ebx
	add		esp, 18h
	retn

; дефолтные значения параметров
det_rad_value dd 31h
sunshafts_quality dd 0
ssao_quality dd 0
ssao_mode dd 0
soft_shadows dd 0
steep_parallax dd 0
dynamic_dof dd 0