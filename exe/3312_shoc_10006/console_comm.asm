con_comm:

	mov     dword ptr [eax], offset xCCC_Integer
	
REGISTER_CC_FLOAT sunshafts_exposure, "r2_script_sun_shafts", 0.0, 1.0	
REGISTER_CC_FLOAT wm_lifetime, "r__bloodmarks_lifetime", 0.001, 1.0	

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