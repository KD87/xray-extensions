shader_defines:

REGISTER_DEFINE_FLAG ps_r2_ls_flags, 40000h, "USE_SOFT_WATER"
REGISTER_DEFINE_FLAG ps_r2_ls_flags, 80000h, "USE_SOFT_PARTICLES"
REGISTER_DEFINE_INT sunshafts_quality, "SS_QUALITY"

	; делаем вырезанное
	mov     ebx, [ebp+pFunctionName]
	mov     [esp+esi*8+680h+defines], ecx
	jmp back_to_shader_defines
