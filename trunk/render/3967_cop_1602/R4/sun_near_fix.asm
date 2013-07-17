sun_near_fix_label:
	; old stuff
	sub     esp, 8
	fstp    dword ptr [esp+30h-2Ch]
	fld		new_limit
	fstp    dword ptr [esp+30h-2Ch]
	jmp	back_from_sun_near_fix_label
	
new_limit dd 150.0