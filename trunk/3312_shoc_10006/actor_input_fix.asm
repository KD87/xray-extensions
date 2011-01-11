; ----------------------- колбек на нажатие ----------------------------
ALIGN_8
call_key_press_callback proc
	cmp     g_bDisableAllInput, 0
	jnz     input_disabled_exit

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
	; проверяем глобальную блокировку колбеков
	mov eax, [extensions_flags]
	and eax, 1h
	jz lab_exit1
	; игнорируем клавиши alt и f4
	;mov eax, [ebp+8]
	;cmp eax, 56 ; Левый Alt
	;jz lab_exit1
	;cmp eax, 184; Правый Alt
	;jz lab_exit1
	;cmp eax, 62 ; F4
	;jz lab_exit1
	
	
	; вызываем колбек для актора
	xor     eax, eax
	push    eax ; заглушка
	push    [ebp+8] ; код клавиши
	; получаем актора
	;call Actor ; eax = client actor
	; получаем объект колбека
	push    123 ; type = ???
	mov     ecx, g_Actor
	call    CGameObject__callback ; eax = callback
	push    eax ; callback
	; вызываем
	call    script_callback_int_int
	
lab_exit1:
	;-------------
	pop esi
	pop edi
	pop edx
	pop ecx
	pop ebx
	pop eax
	
	;mov     esp, ebp
	pop ebp
input_disabled_exit:
; делаем то, что вырезали
	sub     esp, 414h
; идём обратно
	jmp back_from_key_press_callback
call_key_press_callback endp

call_key_press_callback_msg db "call_key_press_callback_problem", 0
; ----------------- колбек на отпускание --------------------
ALIGN_8
call_key_release_callback proc
	cmp     g_bDisableAllInput, 0
	jnz     input_disabled_exit

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
	; проверяем глобальную блокировку колбеков
	mov eax, [extensions_flags]
	and eax, 2h
	jz lab_exit2
	; игнорируем клавиши alt и f4
	mov eax, [ebp+8]
	cmp eax, 56 ; Левый Alt
	jz lab_exit2
	cmp eax, 184; Правый Alt
	jz lab_exit2
	cmp eax, 62 ; F4
	jz lab_exit2
	
	; вызываем колбек для актора
	xor     eax, eax
	push    eax ; заглушка
	push    [ebp+8] ; код клавиши
	; получаем актора
	;call Actor ; eax = client actor
	; получаем объект колбека
	push    124 ; type = ???
	mov     ecx, g_Actor
	call    CGameObject__callback ; eax = callback
	push    eax ; callback
	; вызываем
	call    script_callback_int_int
lab_exit2:
	;-------------
	pop esi
	pop edi
	pop edx
	pop ecx
	pop ebx
	pop eax
	
	;mov     esp, ebp
	pop ebp
input_disabled_exit:
; делаем то, что вырезали
	push    ecx
	push    ebx
	push    ebp
	mov     ebp, ecx
; идём обратно
	jmp back_from_key_release_callback
call_key_release_callback endp

call_key_release_callback_msg db "call_key_release_callback_problem", 0
; ----------------- колбек на удержание --------------------
ALIGN_8
call_key_hold_callback proc
	cmp     g_bDisableAllInput, 0
	jnz     input_disabled_exit

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
	; проверяем глобальную блокировку колбеков
	mov eax, [extensions_flags]
	and eax, 4h
	jz lab_exit3
	; игнорируем клавиши alt и f4
	mov eax, [ebp+0Ch]
	cmp eax, 56 ; Левый Alt
	jz lab_exit3
	cmp eax, 184; Правый Alt
	jz lab_exit3
	cmp eax, 62 ; F4
	jz lab_exit3
	
	; вызываем колбек для актора
	xor     eax, eax
	push    eax ; заглушка
	push    [ebp+0Ch] ; код клавиши
	; получаем актора
	;call Actor ; eax = client actor
	; получаем объект колбека
	push    125 ; type = ???
	mov     ecx, g_Actor
	call    CGameObject__callback ; eax = callback
	push    eax ; callback
	; вызываем
	call    script_callback_int_int
lab_exit3:
	;-------------
	pop esi
	pop edi
	pop edx
	pop ecx
	pop ebx
	pop eax
	
	;mov     esp, ebp
	pop ebp
input_disabled_exit:
; делаем то, что вырезали
	cmp     dword ptr [edi+138h], 0
; идём обратно
	jmp back_from_key_hold_callback
call_key_hold_callback endp

call_key_hold_callback_msg db "call_key_hold_callback_problem", 0
; ----------------- колбек на кручение колеса --------------------
ALIGN_8
call_mouse_wheel_callback proc
	cmp     g_bDisableAllInput, 0
	jnz     input_disabled_exit

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
	; проверяем глобальную блокировку колбеков
	mov eax, [extensions_flags]
	and eax, 8h
	jz exit
	; вызываем колбек для актора
	xor     eax, eax
	push    eax ; заглушка
	push    [ebp+0Ch] ; код клавиши
	pop eax
	add eax, 100000
	push eax
	; получаем актора
	;call Actor ; eax = client actor
	; получаем объект колбека
	push    126 ; type = ???
	mov     ecx, g_Actor
	call    CGameObject__callback ; eax = callback
	push    eax ; callback
	; вызываем
	call    script_callback_int_int
exit:
	;-------------
	pop esi
	pop edi
	pop edx
	pop ecx
	pop ebx
	pop eax
	
	;mov     esp, ebp
	pop ebp
input_disabled_exit:
; делаем то, что вырезали
	mov     ecx, [eax]
	mov     ecx, [ecx+148h]	
; идём обратно
	jmp back_from_mouse_wheel_callback
call_mouse_wheel_callback endp
	
call_mouse_wheel_callback_msg db "call_mouse_wheel_callback_problem", 0
; ----------------- колбек на движение мыши --------------------
ALIGN_8
call_mouse_move_callback proc
	cmp     g_bDisableAllInput, 0
	jnz     input_disabled_exit

	
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
	; проверяем глобальную блокировку колбеков
	mov eax, [extensions_flags]
	and eax, 10h
	jz exit
	
	;jmp exit
	
	; вызываем колбек для актора
	mov eax, [ebp+08h] ; dx 
	add eax, 100000
	push eax
	mov eax, [ebp+0Ch] ; dy
	add eax, 100000
	push eax
	; получаем актора
	;call Actor ; eax = client actor
	; получаем объект колбека
	push    127 ; type = ???
	mov     ecx, g_Actor ; там и так теперь актор
	call    CGameObject__callback ; eax = callback
	push    eax ; callback
	; вызываем
	call    script_callback_int_int
lab_exit5:
	;-------------
exit:
	pop esi
	pop edi
	pop edx
	pop ecx
	pop ebx
	pop eax
	
	;mov     esp, ebp
	pop ebp
input_disabled_exit:
; делаем то, что вырезали
	push    ecx
	push    esi
	mov     esi, ecx
	mov     eax, [esi-194h]
; идём обратно
	jmp back_from_mouse_move_callback
call_mouse_move_callback endp
	
call_mouse_move_callback_msg db "call_mouse_move_callback_problem", 0
	
