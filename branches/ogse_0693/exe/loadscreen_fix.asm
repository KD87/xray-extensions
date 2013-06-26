to_logo:
	mov     ecx, [edx+148h]
	call    ecx
	jmp	logo_rendering
	
to_text:
	mov     eax, [ecx+148h]
	call    eax
	jmp	text_rendering
	
to_end:
	mov     edx, [edx]
	mov     eax, [edx]
	call    eax
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn