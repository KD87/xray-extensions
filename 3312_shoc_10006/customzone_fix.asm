customzonefix proc
;	xorps   xmm1, xmm1
;	movss   dword ptr [ecx+2FCh], xmm1		;m_fLightTimeLeft = 0.f;
;	mov		esi, ecx
;	jmp		back_from_customzonefix

	push	ecx
	mov     esi, [esi+1D4h]
	call    sub_1019EF50
	pop		ecx
	; выключаем свет выброса
	xorps   xmm1, xmm1
	movss   dword ptr [ecx+2FCh], xmm1		;m_fLightTimeLeft = 0.f;
	; проверка, есть ли постоянный свет
	mov     esi, [ecx+2BCh]
	mov		eax, esi
	neg     eax
	sbb     eax, eax
	test    ds:resptr_base_IRender_Light____get, eax ; resptr_base<IRender_Light>::_get(void)
	jz      short exit
	; проверка, включен ли постоянный свет
	mov     edx, [esi]
	mov     eax, [edx+8]
	call    eax
	test    al, al
	jz      short exit
	; вылючаем постоянный свет, если включен
	mov     eax, [edx+4]
	push    0
	call    eax								;m_pLight->set_active(false);

exit:
;	mov		esi, ecx
;	jmp		back_from_customzonefix
	pop		edi
	pop		esi
	retn 4
customzonefix endp
