CActor__Update_fix proc
	sbb     eax, eax
	add     eax, 1
	push	1
	jmp	back_from_CActor__Update_fix
CActor__Update_fix endp

CActor__Update_two_fix proc
	test    eax, eax
	pop     esi
	jmp	back_from_CActor__Update_two_fix
CActor__Update_two_fix endp