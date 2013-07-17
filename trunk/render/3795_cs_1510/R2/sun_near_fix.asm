sun_near_fix_label:
	; old stuff
	sub     esp, 8
	fstp    dword ptr [esp+2Ch-28h]
	fld		new_limit
	fstp    dword ptr [esp+2Ch-28h]
	jmp	back_from_sun_near_fix_label
	
new_limit dd 150.0