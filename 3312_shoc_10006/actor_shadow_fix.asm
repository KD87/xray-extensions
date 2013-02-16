CActor__Update_fix proc
	push	eax
	mov		ecx, ds:Render
	mov		ecx, [ecx]
	mov		eax, [ecx]
	mov		edx, [eax]
	call	edx			; get_generation()
	cmp		eax, 5Ah
	jnz		exit
	mov		eax, [edi+530h]
	test	eax, eax
	jnz		exit
	pop		eax
	push	1
	jmp	back_from_CActor__Update_fix
exit:
	pop		eax
	sbb		eax, eax
	add		eax, 1
	push	eax
	jmp	back_from_CActor__Update_fix
CActor__Update_fix endp

CActor__Update_two_fix proc
	mov		ecx, ds:Render
	mov		ecx, [ecx]
	mov		eax, [ecx]
	mov		edx, [eax]
	call	edx			; get_generation()
	cmp		eax, 5Ah
	jnz		exit
	mov		eax, [edi+530h]
	test	eax, eax
	jnz		exit
	mov		eax, 1
	jmp	back_from_CActor__Update_two_fix
	
exit:
	push    esi
	mov     esi, eax
	call    sub_101DEE40
	jmp	back_from_CActor__Update_two_fix
CActor__Update_two_fix endp