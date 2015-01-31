sun_near_fix_label:
	; old stuff
	sub     esp, 8
	fstp    dword ptr [esp+30h-2Ch]
	fld		new_limit
	fstp    dword ptr [esp+30h-2Ch]
	jmp	back_from_sun_near_fix_label
	
new_limit dd 150.0


r2_sun_near_border_MIN dd 0.5
r2_sun_near_border_MAX dd 1.5

r2_sun_near_border_EXT_CHUNK proc
var_2C		= dword ptr  -2ch
var_30		= dword ptr  -30h

	fld     ds:r2_sun_near_border_MAX
	sub     esp, 8
	fstp    [esp+30h+var_2C]
	fld     ds:r2_sun_near_border_MIN
	mov     ecx, offset unk_10089888
	fstp    [esp+30h+var_30]
	
	jmp		r2_sun_near_border_EXT_CHUNK_OUT
r2_sun_near_border_EXT_CHUNK endp
