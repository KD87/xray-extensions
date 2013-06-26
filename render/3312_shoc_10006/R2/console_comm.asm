con_comm:

REGISTER_CC_INT det_rad_value, "r__detail_radius", 31h, 0F0h
REGISTER_CC_TOKEN sunshafts_quality_token, "r2_sun_shafts", sunshafts_quality
REGISTER_CC_FLAG ps_r2_ls_flags, 10000h, "r__bloodmarks"
REGISTER_CC_FLAG ps_r2_ls_flags, 40000h, "r2_soft_water"
REGISTER_CC_FLAG ps_r2_ls_flags, 80000h, "r2_soft_particles"

	; делаем вырезанное
	pop		edi
	pop		esi
	pop		ebp
	pop		ebx
	add		esp, 18h
	retn

; дефолтные значения параметров (int)
det_rad_value dd 31h
sunshafts_quality dd 0
posteffect_flags dd 0

; общий токен
aOff db "off", 0
aLow db "low", 0
aMid db "medium", 0
aHigh db "high", 0
quality_token STRUCT
	dd offset aOff
	dd 0
	dd offset aLow
	dd 1
	dd offset aMid
	dd 2
	dd offset aHigh
	dd 3
	db 8 dup (0)
quality_token ENDS

sunshafts_quality_token quality_token <>