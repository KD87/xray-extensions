cer__Render:
	push	ecx
	mov		ecx, ds:Render
	mov		eax, [ecx]
	mov		edx, [eax]
	call	edx			; get_generation()
	pop		ecx
	cmp		eax, 5Ah	
	jnz		cer__Render_exit
	jmp		g_CEffect_Rain__Render
	
cer__Render_exit:
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	jmp		back_to_cer__Render