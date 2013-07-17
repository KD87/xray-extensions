con_comm:

REGISTER_CC_INT det_rad_value, "r__detail_radius", 31h, 1F5h

	; делаем вырезанное
	pop		edi
	pop		esi
	pop		ebp
	add		esp, 18h
	retn

; дефолтные значения параметров (int)
det_rad_value dd 31h