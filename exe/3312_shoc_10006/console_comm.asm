con_comm:

	mov     dword ptr [eax], offset xCCC_Integer
	
REGISTER_CC_FLOAT sunshafts_exposure, "r2_sun_shafts_intensity", 0.0, 1.0
REGISTER_CC_FLOAT sunshafts_density, "r2_sun_shafts_density", 0.0, 1.0

	; делаем вырезанное	
	pop		edi
	pop		esi
	pop		ebp
	pop		ebx
	pop		ecx
	retn

sunshafts_exposure dd 0.05
sunshafts_density dd 1.0