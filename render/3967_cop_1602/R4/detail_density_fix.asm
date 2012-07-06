;.text:10001EF5                 fstp    [esp+30h+var_2C]
;.text:10001EF9                 mov     ecx, offset unk_10108C98
;.text:10001EFE                 fld     flt_100F4D00
det_density:
	fstp [esp+30h+var_2C]
	mov ecx, offset xCCC_Float_42
	fld ds:[det_dens_max_offset]
	jmp back_to_det_density

det_dens_max_offset REAL4 0.02
var_2C = dword ptr -2Ch
