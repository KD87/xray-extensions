shader_defines:

REGISTER_DEFINE_FLAG ps_r2_ls_flags, 40000h, "USE_SOFT_WATER"
REGISTER_DEFINE_FLAG ps_r2_ls_flags, 400000h, "USE_F32"
REGISTER_DEFINE_INT sunshafts_quality, "SS_QUALITY"
REGISTER_DEFINE_INT ssao_quality, "SSAO_QUALITY"
REGISTER_DEFINE_INT ssao_mode, "SSAO_MODE"
REGISTER_DEFINE_INT soft_shadows, "SOFT_SHADOWS_QUALITY"
REGISTER_DEFINE_INT steep_parallax, "STEEP_PARALLAX_QUALITY"
REGISTER_DEFINE_INT dynamic_dof, "DDOF_QUALITY"

	; делаем вырезанное
	mov     ebx, [ebp+pFunctionName]
	mov     [esp+esi*8+680h+defines], ecx
	jmp back_to_shader_defines
