;.text:10001762                 fstp    [esp+30h+var_2C]
;.text:10001766                 mov     ecx, offset xCCC_Float_42
;.text:1000176B                 fld     ds:__real@3e4ccccd
det_density:
	fstp [esp+30h+var_2C]
	mov ecx, offset xCCC_Float_42
	fld ds:[det_dens_max_offset]
	jmp back_to_det_density

det_dens_max_offset REAL4 0.02
var_2C = dword ptr -2Ch
