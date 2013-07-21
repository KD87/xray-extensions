no_weapons_fix:
	mov     edx, [esp+8+4]
	push    edx
	push    0FFh
	push    esi
	jmp back_from_no_weapons_fix