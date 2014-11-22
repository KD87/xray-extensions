customzonefix proc
	xorps   xmm1, xmm1
	movss   dword ptr [ecx+2FCh], xmm1		;m_fLightTimeLeft = 0.f;
	jmp		back_from_customzonefix

	; проверка, есть ли свет
;	mov     esi, [ecx+2E0h]
;	mov     eax, esi
;	neg     eax
;	sbb     eax, eax
;	test    ds:resptr_base_IRender_Light____get, eax ; resptr_base<IRender_Light>::_get(void)
;	jz      short exit
	; проверка, включен ли свет
;	mov     edx, [esi]
;	mov     eax, [edx+8]
;	call    eax
;	test    al, al
;	jz      short exit
	; вылючаем свет, если включен
;	mov     esi, [ecx+2E0h]
;	xorps   xmm1, xmm1
;	movss   dword ptr [ecx+2FCh], xmm1		;m_fLightTimeLeft = 0.f;
;	mov     eax, [esi]
;	mov     edx, [eax+4]
;	push    0
;	call    edx								;m_pLight->set_active(false);

;exit:
;	pop		edi
;	pop		esi
;	retn 4
customzonefix endp
