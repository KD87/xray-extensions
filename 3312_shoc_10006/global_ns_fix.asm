include global_ns_reg_macro.asm
;===============| расширение регистрации глобального пространства имЄн |=======
ALIGN_8
global_space_ext: ; вставка, дополн€юща€ функцию экспорта глобальных функций
	; здесь делаем то, что вырезали
	call    error_log_register
	; добавл€ем свой код
	; регистраци€ функции вывода в лог, вместо нерабочей "log"
	add     esp, 0Ch
    push    offset my_log_fun
    push    offset alog1 ; "log1"
	push    [ebp+8h]
    call    error_log_register
	; регистраци€ функции "bind_to_dik"
	push    offset bind_to_dik
	push    offset aBind_to_dik  ; "bind_to_dik"
	push    [ebp+8h]
	call    bit_and_register
	add     esp, 0Ch
	; регистраци€ функции "set_extensions_flags"
	push    offset set_extensions_flags
	push    offset aSet_extensions_flags  ; "set_extensions_flags"
	push    [ebp+8h]
	call    bit_and_register
	add     esp, 0Ch
	; регистраци€ функции "get_extensions_flags"
	push    offset get_extensions_flags
	push    offset aGet_extensions_flags  ; "get_extensions_flags"
	push    [ebp+8h]
	call    bit_and_register
	add     esp, 0Ch
	GLOBAL_NS_PERFORM_EXPORT__INT__INT_INT SetIntArg0, "set_int_arg0"
	;GLOBAL_NS_PERFORM_EXPORT__BOOL__VOID IsPdaMenuShown, "is_pda_shown"
	; ; регистраци€ функции "flush1", вместо нерабочей "flush"
     ; lea     eax, [ebp-1]
     ; push    eax
     ; push    offset my_flush
     ; push    offset aFlush1   ; "flush1"
     ; push    esi
     ; call    flush_register
	; ; регистраци€ тестовой функции "log2"
     ; lea     eax, [ebp-1]
     ; push    eax
     ; push    offset my_log2
     ; push    offset alog2   ; "log2"
     ; push    esi
     ; call    flush_register
	; идЄм обратно
	jmp back_from_global_space_ext

ALIGN_8
alog1   db "log1", 0
ALIGN_8
alog2   db "log2", 0
ALIGN_8
aFlush1 db "flush1", 0
ALIGN_8
aBind_to_dik db "bind_to_dik", 0
ALIGN_8
aSet_extensions_flags  db "set_extensions_flags", 0
ALIGN_8
aGet_extensions_flags  db "get_extensions_flags", 0

ALIGN_8
my_flush proc near
	call    ds:[FlushLog]
	retn
my_flush endp

ALIGN_8
my_log2 proc near
	sub   esp, 8
	fld     cs:[value1]
	fstp   QWORD  ptr [esp]
	push    offset format_str
	call ds:[Msg] 
	add     esp, 0Ch
	retn
my_log2 endp

ALIGN_8
format_str db "qwerty %e", 0
ALIGN_8
value1 REAL4  1.23456e12
ALIGN_8
value2   dd 12345678h

ALIGN_8
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

ALIGN_8
aF_4 db "%f", 0
ALIGN_8
aS_4 db "%s", 0


ALIGN_8
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

ALIGN_8
extensions_flags dd 0

ALIGN_8
set_extensions_flags proc near
_flags      = dword ptr  4
	mov     eax, [esp+_flags]
	mov     extensions_flags, eax
	retn
set_extensions_flags endp

ALIGN_8
get_extensions_flags proc near
_flags      = dword ptr  4
	mov     eax, [extensions_flags]
	retn
get_extensions_flags endp

SetIntArg0 proc
int_arg = dword ptr  4
	mov     eax, [esp+int_arg]
	mov     g_shift_argument, eax
	retn
SetIntArg0 endp


IsPdaMenuShown proc
	mov eax, 1
	retn
IsPdaMenuShown endp
