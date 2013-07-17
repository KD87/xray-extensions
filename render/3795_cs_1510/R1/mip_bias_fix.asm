;.text:100024C0                 fstp    [esp+30h+var_2C]
;.text:100024C4                 mov     ecx, offset dword_100E0508
;.text:100024C9                 fld     flt_100CD570
mip_bias:
	fstp	[esp+2Ch+var_28]	; как извлечь из стека FPU значение, никуда его не сохраняя? :)
	fld		ds:[mip_bias_max]
	fstp	[esp+2Ch+var_28]
	mov		ecx, offset mipbias_obj
	fld		ds:[mip_bias_min]
	jmp		back_to_mip_bias

mip_bias_max dd 3.0
mip_bias_min dd -3.0
var_28 = dword ptr -28h
