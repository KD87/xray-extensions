dllmain_hack:
	mov		eax, psDeviceFlags
	mov		eax, [eax]
	test	eax, 80000h
	jnz		r2
	mov		eax, 1
	retn	0Ch
r2:
	call    sub_10016390
	jmp	back_to_dllmain_hack