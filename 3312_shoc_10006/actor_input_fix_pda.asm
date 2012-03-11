
ALIGN_8
call_pda_contact_callback proc

	push ebp
	mov ebp, esp
	;and     esp, 0FFFFFFF8h
; добавляем своё
	push eax
	push ebx
	push ecx
	push edx
	push edi
	push esi
	
	; вызываем колбек для актора
	push    eax ; заглушка
	push    eax
	; получаем актора
	;call Actor ; eax = client actor
	; получаем объект колбека
	push    180 ; type = ???
	mov     ecx, g_Actor
	call    CGameObject__callback ; eax = callback
	push    eax ; callback
	; вызываем
	call    script_callback_int_int
	
	;-------------
	pop esi
	pop edi
	pop edx
	pop ecx
	pop ebx
	pop eax
	
	;mov     esp, ebp
	pop ebp
	; Делаем что вырезали
	call ch_info_get_from_id
; идём обратно
	jmp back_from_pda_contact
call_pda_contact_callback endp


call_pda_contact_callback_msg db "call_pda_contact_callback_problem", 0