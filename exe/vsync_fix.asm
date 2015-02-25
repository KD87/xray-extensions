vsync_fix_1 proc
	push	eax
	push	ecx
	push	edx
	mov		ecx, edi
	call	CHW__selectPresentInterval
	mov		dword ptr [edi+0A4h], eax
	pop		edx
	pop		ecx
	pop		eax
	test	ebx, ebx
	jmp	back_from_vsync_fix_1
vsync_fix_1 endp

vsync_fix_2 proc
	push	eax
	push	ecx
	push	edx
	mov		ecx, ebx
	call	CHW__selectPresentInterval
	mov		dword ptr [esi+34h], eax
	pop		edx
	pop		ecx
	pop		eax
	cmp		eax, ecx
	jmp	back_from_vsync_fix_2
vsync_fix_2 endp