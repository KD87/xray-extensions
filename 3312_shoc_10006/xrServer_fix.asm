xrServer__Process_event_reject_fix proc
	; делаем свою проверку
	test edi, edi
	jnz entity_exist
	; выбрасываемый объект отсутствует, просто выходим
;	pop     edi
;	pop     esi
;	pop     ebp
;	mov     al, 1
;	pop     ebx
;	add     esp, 38h
;	retn    18h

	push	eax
	movzx	eax, word ptr[esp+5Ch]
	PRINT_UINT "SV REJECT: FAILED! NO ENTITY! PARENT_ID = %d", eax
	movzx	eax, word ptr[esp+60h]
	PRINT_UINT "SV REJECT: FAILED! NO ENTITY! ID = %d", eax
	mov		eax, [esp+4Ch]
	PRINT_UINT "SV REJECT: FAILED! NO ENTITY! RETURN ADDRESS = %x", eax
	pop		eax
	
	; уходим
	pop     edi
	pop     esi
	pop     ebp
	mov     al, 1
	pop     ebx
	add     esp, 38h
	retn    18h
	
entity_exist:
	; делаем вырезанное
	push    ebx
	lea     eax, [esp+4Ch+var_1C]
	; идём обратно
	jmp back_from_xrServer__Process_event_reject_fix
xrServer__Process_event_reject_fix endp
