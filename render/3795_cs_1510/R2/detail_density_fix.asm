;.text:10001752                 fstp    [esp+30h+var_2C]
;.text:10001756                 mov     ecx, offset xCCC_Float_42
;.text:1000175B                 fld     ds:__real@3e4ccccd
det_density:
	fstp [esp+2Ch+var_28]
	mov ecx, offset xCCC_Float_42
	fld ds:[det_dens_max_offset]
	jmp back_to_det_density

det_dens_max_offset REAL4 0.02
var_28 = dword ptr -28h
