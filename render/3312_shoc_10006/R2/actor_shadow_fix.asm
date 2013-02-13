actor_shadow_fix:
	mov		eax, ds:g_pGameLevel
	mov		eax, [eax]
	push	eax
	mov     eax, [eax+148h]
	mov     edx, [eax]
	mov     ecx, eax
	mov     eax, [edx+0Ch]
	call    eax
	pop		eax
	; делаем вырезанное
	mov     eax, [eax+148h]
	mov     edx, [eax]
	mov     ecx, eax
	mov     eax, [edx+10h]
	call    eax
	add     [edi+320h], ebx

	jmp back_to_actor_shadow_fix