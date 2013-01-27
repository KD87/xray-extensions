;.text:100024C0                 fstp    [esp+30h+var_2C]
;.text:100024C4                 mov     ecx, offset dword_100E0508
;.text:100024C9                 fld     flt_100CD570
mip_bias:
	fstp	[esp+30h+var_2C]	; как извлечь из стека FPU значение, никуда его не сохраняя? :)
	fld		ds:[mip_bias_max]
	fstp	[esp+30h+var_2C]
	mov		ecx, offset dword_100E0508
	fld		ds:[mip_bias_min]
	jmp		back_to_mip_bias

mip_bias_max dd 3.0
mip_bias_min dd -3.0
var_2C = dword ptr -2Ch
