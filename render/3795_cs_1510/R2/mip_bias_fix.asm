;.text:100021BF                 fstp    [esp+2Ch+var_28]
;.text:100021C3                 mov     ecx, offset dword_100D5C34
;.text:100021C8                 fld     flt_100C33C8
mip_bias:
	fstp	[esp+2Ch+var_28]	; как извлечь из стека FPU значение, никуда его не сохраняя? :)
	fld		ds:[mip_bias_max]
	fstp	[esp+2Ch+var_28]
	mov		ecx, offset dword_100D5C34
	fld		ds:[mip_bias_min]
	jmp		back_to_mip_bias

mip_bias_max dd 3.0
mip_bias_min dd -3.0
var_28 = dword ptr -28h
