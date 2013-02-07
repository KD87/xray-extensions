con_comm:

	mov     dword ptr [eax], offset xCCC_Integer
	
REGISTER_CC_FLOAT sunshafts_exposure, "r2_script_sun_shafts", 0.0, 1.0	
REGISTER_CC_FLOAT rain_drops_switch, "r2_script_rain_drops", 0.0, 1.0	
REGISTER_CC_FLOAT color_grading_density, "r2_color_grading_density", 0.0, 1.0
REGISTER_CC_VECTOR3 color_grading_color, "r2_color_grading_params", 0.0, 0.0, 0.0, 1.0, 1.0, 1.0

	; делаем вырезанное	
	pop		edi
	pop		esi
	pop		ebp
	pop		ebx
	pop		ecx
	retn

rain_drops_switch dd 0.0
sunshafts_exposure dd 1.0
color_grading_density dd 1.0
color_grading_color dd 3 dup(0.0)