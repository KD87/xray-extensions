include global_ns_reg_macro.asm
;===============| расширение регистрации глобального пространства имён |=======
global_space_ext: ; вставка, дополняющая функцию экспорта глобальных функций
	; здесь делаем то, что вырезали
	call    error_log_register
	; добавляем свой код
	; регистрация функции вывода в лог, вместо нерабочей "log"
	add     esp, 0Ch
    push    offset my_log_fun
    push    offset alog1 ; "log1"
	push    [ebp+8h]
    call    error_log_register
	; регистрация функции крэша игры с выводом причины в лог
	add     esp, 0Ch
    push    offset msg_and_fail
    push    offset aFail ; "fail"
	push    [ebp+8h]
    call    error_log_register
	; регистрация функции "bind_to_dik"
	push    offset bind_to_dik
	push    offset aBind_to_dik  ; "bind_to_dik"
	push    [ebp+8h]
	call    bit_and_register
	add     esp, 0Ch
	; регистрация функции "set_extensions_flags"
	push    offset set_extensions_flags
	push    offset aSet_extensions_flags  ; "set_extensions_flags"
	push    [ebp+8h]
	call    bit_and_register
	add     esp, 0Ch
	; функция установки глобальных флагов актора
	push    offset set_actor_flags
	push    offset aSet_actor_flags  ; "set_actor_flags"
	push    [ebp+8h]
	call    bit_and_register
	add     esp, 0Ch
	; функция получения глобальных флагов актора
	push    offset get_actor_flags
	push    offset aGet_actor_flags  ; "get_actor_flags"
	push    [ebp+8h]
	call    bit_and_register
	add     esp, 0Ch
	; регистрация функции "get_extensions_flags"
	push    offset get_extensions_flags
	push    offset aGet_extensions_flags  ; "get_extensions_flags"
	push    [ebp+8h]
	call    bit_and_register
	add     esp, 0Ch
	GLOBAL_NS_PERFORM_EXPORT__INT__INT_INT SetIntArg0, "set_int_arg0"
	;GLOBAL_NS_PERFORM_EXPORT__BOOL__VOID IsPdaMenuShown, "is_pda_shown"
	; ; регистрация функции "flush1", вместо нерабочей "flush"
     ; lea     eax, [ebp-1]
     ; push    eax
     ; push    offset my_flush
     ; push    offset aFlush1   ; "flush1"
     ; push    esi
     ; call    flush_register
	; ; регистрация тестовой функции "log2"
     ; lea     eax, [ebp-1]
     ; push    eax
     ; push    offset my_log2
     ; push    offset alog2   ; "log2"
     ; push    esi
     ; call    flush_register
	; идём обратно
	jmp back_from_global_space_ext

aFail   db "fail", 0
alog1   db "log1", 0
alog2   db "log2", 0
aFlush1 db "flush1", 0
aBind_to_dik db "bind_to_dik", 0
aSet_extensions_flags  db "set_extensions_flags", 0
aGet_extensions_flags  db "get_extensions_flags", 0
aSet_actor_flags  db "set_actor_flags",0
aGet_actor_flags  db "get_actor_flags",0

my_flush proc near
	call    ds:[FlushLog]
	retn
my_flush endp

my_log2 proc near
	sub   esp, 8
	fld     cs:[value1]
	fstp   QWORD  ptr [esp]
	push    offset format_str
	call ds:[Msg] 
	add     esp, 0Ch
	retn
my_log2 endp

format_str db "qwerty %e", 0
value1 REAL4  1.23456e12
value2   dd 12345678h

my_log_fun      proc near
	push    ebp
	mov     ebp, esp
	mov     eax, [ebp+8]
	push    eax
	push    offset aS_4     ; "%s"
	call    ds:[Msg] 
	add     esp, 8
	pop     ebp
	retn
my_log_fun      endp

aF_4 db "%f", 0
aS_4 db "%s", 0


bind_to_dik proc near

_action_id      = dword ptr  4
;stub = dword ptr 4

	mov     eax, [esp+_action_id]         ; 
	cmp     eax, 76
	jg      arg_out_of_range
	cmp     eax, 0
	jl      arg_out_of_range
; аргумент в пределах допустимого диапазона
	imul    eax, 0Ch                      ; 
	add     eax, offset g_key_bindings    ; g_key_bindings[cmd]
	mov     ecx, [eax+4]                  ; ecx = g_key_bindings[cmd].m_keyboard[0]
	test    ecx, ecx                      ; if (ecx != 0)
	jz      short lab1
	mov     eax, [ecx+4]
	retn
lab1:
	mov     eax, [eax+8]
	test    eax, eax
	jz      short not_binded
	mov     eax, [eax+4]
	retn
not_binded:
	xor     eax, eax
	retn
arg_out_of_range: ; аргумент вне допустимого диапазона
	mov     eax, 100000
	retn
bind_to_dik endp

extensions_flags dd 0

set_extensions_flags proc near
_flags      = dword ptr  4
	mov     eax, [esp+_flags]
	mov     extensions_flags, eax
	retn
set_extensions_flags endp

get_extensions_flags proc near
_flags      = dword ptr  4
	mov     eax, [extensions_flags]
	retn
get_extensions_flags endp

g_int_argument_0 dword 0

SetIntArg0 proc
int_arg = dword ptr  4
	mov     eax, [esp+int_arg]
	mov     g_int_argument_0, eax
	retn
SetIntArg0 endp


IsPdaMenuShown proc
	mov eax, 1
	retn
IsPdaMenuShown endp

msg_and_fail proc near
	push    ebp
	mov     ebp, esp
	
	mov     eax, [ebp+8]
	push    eax
	;push    offset aS_4     ; "%s"
	;call    ds:[Msg] 
	;add     esp, 8
	mov     ecx, ds:Debug ; this
	push    offset ignore_always
	push    offset aEmpty ; "xrServer::Process_event_ownership"
	push    0h             ; line
	push    offset aEmpty ; "E:\\stalker\\sources\\trunk\\xr_3da\\xrGame\\"...
	push    eax ; "e_parent"
	call    ds:xrDebug__fail

	pop     ebp
	retn
msg_and_fail endp
ignore_always db 1
aEmpty db 0

set_actor_flags proc near
_flags      = dword ptr  4
	mov     eax, [esp+_flags]
	mov     psActorFlags, eax
	retn
set_actor_flags endp

get_actor_flags proc near
_flags      = dword ptr  4
	mov     eax, [psActorFlags]
	retn
get_actor_flags endp
