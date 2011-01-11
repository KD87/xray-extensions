; колбек на шевеление крысы
call_mouse_move_callback proc
	; проверка на отключённый ввод
	cmp     g_bDisableAllInput, 0
	jnz     input_disabled_exit
	;
	push ebp
	mov  ebp, esp
	and     esp, 0FFFFFFF8h
; добавляем своё
	push eax
	; проверяем глобальную блокировку колбеков
	mov eax, [extensions_flags]
	and eax, 1h
	jz lab_blocked
;
	push ebx
	push ecx
	push edx
	push edi
	push esi
	
	; вызываем колбек для актора
	push    [ebp + 10h] ; код клавиши
	pop     eax
	add     eax, 100000
	push    eax
	push    [ebp + 0Ch] ; код клавиши
	pop     eax
	add     eax, 100000
	push    eax
	; получаем актора
	call Actor ; eax = client actor
	push    127 ; type = ???
	mov     ecx, eax ; ecx = this
	; получаем объект колбека
	call    CGameObject__callback ; eax = hit_callback
	push    eax ; callback
	; вызываем
	call    script_callback_int_int
	
	;-------------
	pop esi
	pop edi
	pop edx
	pop ecx
	pop ebx
lab_blocked:
	pop eax
	
	mov     esp, ebp

	pop ebp
input_disabled_exit:
; делаем то, что вырезали
	mov     ecx, [ebp+400F4h]
	mov     eax, [ecx]
; идём обратно
	jmp back_from_mouse_move_callback
call_mouse_move_callback endp

; колбек на кручение крысиного колеса
call_mouse_wheel_callback proc
	; проверка на отключённый ввод
	cmp     g_bDisableAllInput, 0
	jnz     input_disabled_exit
	;
	push ebp
	mov  ebp, esp
; добавляем своё
	push eax
	; проверяем глобальную блокировку колбеков
	mov eax, [extensions_flags]
	and eax, 1h
	jz lab_blocked
;
	push ebx
	push ecx
	push edx
	push edi
	push esi
	
	; вызываем колбек для актора
	xor     eax, eax
	push    eax ; заглушка
	push    [ebp + 0Ch] ; код клавиши
	pop     eax
	add     eax, 100000
	push    eax
	; получаем актора
	call Actor ; eax = client actor
	push    126 ; type = ???
	mov     ecx, eax ; ecx = this
	; получаем объект колбека
	call    CGameObject__callback ; eax = hit_callback
	push    eax ; callback
	; вызываем
	call    script_callback_int_int
	
	;-------------
	pop esi
	pop edi
	pop edx
	pop ecx
	pop ebx
lab_blocked:
	pop eax
	
	pop ebp
input_disabled_exit:
; делаем то, что вырезали
	mov     ecx, [eax]
	mov     ecx, [ecx+40104h]
; идём обратно
	jmp back_from_mouse_wheel_callback
call_mouse_wheel_callback endp


; колбек на удержание клавиши
call_key_hold_callback proc
	; проверка на отключённый ввод
	cmp     g_bDisableAllInput, 0
	jnz     input_disabled_exit
	;
	push ebp
	mov  ebp, esp
; добавляем своё
	push eax
	; проверяем глобальную блокировку колбеков
	mov eax, [extensions_flags]
	and eax, 1h
	jz lab_blocked
;
	push ebx
	push ecx
	push edx
	push edi
	push esi
	; игнорируем клавиши alt и f4
	mov eax, [ebp+0Ch]
	cmp eax, 56 ; Левый Alt
	jz lab_exit1
	cmp eax, 184; Правый Alt
	jz lab_exit1
	cmp eax, 62 ; F4
	jz lab_exit1
	
	; вызываем колбек для актора
	xor     eax, eax
	push    eax ; заглушка
	push    [ebp + 0Ch] ; код клавиши
	; получаем актора
	call Actor ; eax = client actor
	push    125 ; type = ???
	mov     ecx, eax ; ecx = this
	; получаем объект колбека
	call    CGameObject__callback ; eax = hit_callback
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
lab_blocked:
	pop eax
	
	pop ebp
input_disabled_exit:
; делаем то, что вырезали
	cmp     dword ptr [edi+400F4h], 0
; идём обратно
	jmp back_from_key_hold_callback
call_key_hold_callback endp


; колбек на отпускание клавиши
call_key_release_callback proc
	; проверка на отключённый ввод
	cmp     g_bDisableAllInput, 0
	jnz     input_disabled_exit
	;
	push ebp
	mov  ebp, esp
; добавляем своё
	push eax
	; проверяем глобальную блокировку колбеков
	mov eax, [extensions_flags]
	and eax, 1h
	jz lab_blocked
;
	push ebx
	push ecx
	push edx
	push edi
	push esi
	; игнорируем клавиши alt и f4
	mov eax, [ebp+08h]
	cmp eax, 56 ; Левый Alt
	jz lab_exit2
	cmp eax, 184; Правый Alt
	jz lab_exit2
	cmp eax, 62 ; F4
	jz lab_exit2
	
	; вызываем колбек для актора
	xor     eax, eax
	push    eax ; заглушка
	push    [ebp + 8] ; код клавиши
	; получаем актора
	call Actor ; eax = client actor
	push    124 ; type = ???
	mov     ecx, eax ; ecx = this
	; получаем объект колбека
	call    CGameObject__callback ; eax = hit_callback
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
lab_blocked:
	pop eax
	
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



; -- колбек на нажатие клавиши
call_key_press_callback proc
; делаем то, что вырезали
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	; проверка на отключённый ввод
	cmp     g_bDisableAllInput, 0
	jnz     input_disabled_exit
	;
; добавляем своё
	push eax
	; проверяем глобальную блокировку колбеков
	mov eax, [extensions_flags]
	and eax, 1h
	jz lab_blocked
;
	push ebx
	push ecx
	push edx
	push edi
	push esi
	
jmp skeep_lbl1
	
	push    [ebp+8] ; push dic
	push    offset dic_output_format_str
	call    [Msg] 
	add     esp, 08h
	call call_script_function1
skeep_lbl1:	
	; игнорируем клавиши alt и f4
	mov eax, [ebp+08h]
	cmp eax, 56 ; Левый Alt
	jz lab_exit3
	cmp eax, 184; Правый Alt
	jz lab_exit3
	cmp eax, 62 ; F4
	jz lab_exit3
	
	; вызываем колбек для актора
	xor     eax, eax
	push    eax ; заглушка
	push    [ebp+8] ; код клавиши
	; получаем актора
	call Actor ; eax = client actor
	push    123 ; type = ???
	mov     ecx, eax ; ecx = this
	; получаем объект колбека
	call    CGameObject__callback ; eax = hit_callback
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
lab_blocked:
	pop eax
input_disabled_exit:
; идём обратно
	jmp back_from_key_press_callback
call_key_press_callback endp
;=============================================================================================================
dic_output_format_str db "dic = %d", 0

user_actions_fun1_name db "user_actions.action_1", 0
var1 dword ?
var2 dword ?
;var3 dword ?

byte_flag db 0
call_script_function:
local_shift = dword ptr -200h
pusha
xor eax, eax
;cmp     byte_flag, al
mov     [esp+local_shift+1Ch], eax                              ; var_41C = 0
mov     [esp+local_shift+20h], eax                              ; var_418 = 0
mov     eax, 0FFFFFFFEh
mov     [esp+local_shift+24h], eax                       ; var_414 = -2
;jnz     short lab11
call    luabind__functor_void_                               ;
;------------------------------------------------------------------------------------------------
mov     eax, [eax+1Ch]                                       ; eax = *(faddr + 1ch)
push    offset user_actions_fun1_name ; "user_actions.action_1"
push    eax                                                  ; push eax
lea     ecx, [esp+local_shift+8+1Ch]                              ; ecx = &var_41C
call    ai___script_engine___functor                         ; fff("fun_name", functor)
lab11:
lea     edx, [esp+local_shift+1Ch]                              ; edx = &var_41C
lea     eax, [esp+local_shift+10h] ;                            ; eax = &var_428
mov     [esp+local_shift+10h], edx                              ; var_428 = edx ; адрес переменной, храняшей адрес функтора
mov     ecx, 0
mov     [esp+local_shift+15h], ecx                                ; var_423 = 0
;call    functor__operator_call                               ; functor__operator_call(eax)
lea     esi, [esp+local_shift+1Ch]                              ;
call    unref                                         ;
popa
retn


DETAIL__LUA_REFERENCE STRUCT
	L     DWORD  ?
	m_ref DWORD  ?
DETAIL__LUA_REFERENCE ENDS

FUNCTOR_VOID_ STRUCT
	L_   DWORD  ?
	ref_ DETAIL__LUA_REFERENCE  <>
FUNCTOR_VOID_ ENDS

LUABIND__DETAIL__PROXY_FUNCTOR_VOID_CALLER struc ; (sizeof=0x8, standard type)
	m_func          dd ?                    ; offset
	m_args          db ?
	m_called        db ?
	_padding        db 2 dup(?)
LUABIND__DETAIL__PROXY_FUNCTOR_VOID_CALLER ends

key_pressed_functor FUNCTOR_VOID_ <>
proxy_void_caller LUABIND__DETAIL__PROXY_FUNCTOR_VOID_CALLER <>

call_script_function1:
	pusha
	xor eax, eax
    mov key_pressed_functor.L_, eax
    mov key_pressed_functor.ref_.L, eax
    mov key_pressed_functor.ref_.m_ref, -2

	call    luabind__functor_void_                               ;
	;------------------------------------------------------------------------------------------------
	;mov     eax, [eax+1Ch]                                       ; eax = *(faddr + 1ch)
	push    offset user_actions_fun1_name ; "user_actions.action_1"
	push    [eax+1Ch];eax                                                  ; push eax
	lea     ecx, offset key_pressed_functor.L_                              ; ecx = &var_41C
	call    ai___script_engine___functor                         ; fff("fun_name", functor)
	;lab11:
	mov     edx, offset key_pressed_functor                              ; edx = &var_41C
	mov     eax, offset proxy_void_caller ;                            ; eax = &var_428
	mov     [eax], edx                              ; var_428 = edx ; адрес переменной, храняшей адрес функтора
	mov     proxy_void_caller.m_called, 0                                ; var_423 = 0
	call    functor__operator_call                               ; functor__operator_call(eax)
	mov     esi, offset key_pressed_functor                              ;
	call    unref                                         ;
	popa
retn
