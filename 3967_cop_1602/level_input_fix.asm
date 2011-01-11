level_input_fix:
	push ebp
	mov ebp, esp
; добавляем своё
	push eax
	push ebx
	push ecx
	push edx
	push edi
	push esi
	; вызываем колбек для актора
	xor     eax, eax
	push    eax ; заглушка
	push    [ebp+8] ; код клавиши
	push    123             ; type
	; получаем актора
	mov     ecx, g_Actor
	; получаем объект колбека
	call    CGameObject__callback ; eax = callback
	mov     ecx, eax ; callback
	; вызываем
	call    script_callback_int_int
	;-------------
	pop esi
	pop edi
	pop edx
	pop ecx
	pop ebx
	pop eax
	
	pop ebp
; делаем то, что вырезали
	sub     esp, 410h
; идём обратно
	jmp back_from_level_input_fix


