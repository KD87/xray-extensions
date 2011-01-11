;===============| расширение регистрации глобального пространства имЄн |=======
global_space_ext: ; вставка, дополн€юща€ функцию экспорта глобальных функций
	; здесь делаем то, что вырезали
	call    error_log_register
	; добавл€ем свой код
	
	; регистраци€ функции вывода в лог, вместо нерабочей "log"
	push    offset alog1 ; "log1"
	push    esi
	mov     eax, offset my_log_fun
	call    error_log_register
	add     esp, 08h
	; регистраци€ функции "flush1", вместо нерабочей "flush"
	push    offset aFlush1   ; "flush1"
	push    esi
	mov     eax, offset my_flush
	call    flush_register
	add     esp, 08h
	; регистраци€ функции "bind_to_dik"
	push    offset bind_to_dik
	push    offset aBind_to_dik  ; "bit_or"
	push    esi
	call    bit_and_register
	add     esp, 0Ch
	; регистраци€ функции "set_extensions_flags"
	push    offset set_extensions_flags
	push    offset aSet_extensions_flags  ; "set_extensions_flags"
	push    esi
	call    bit_and_register
	add     esp, 0Ch
	; регистраци€ функции "get_extensions_flags"
	push    offset get_extensions_flags
	push    offset aGet_extensions_flags  ; "get_extensions_flags"
	push    esi
	call    bit_and_register
	add     esp, 0Ch
	; идЄм обратно
	jmp back_to_global_space_ext
		
	
	
	; регистраци€ тестовой функции "log2"
     lea     eax, [ebp-1]
     push    eax
     push    offset my_log2
     push    offset alog2   ; "log2"
     push    esi
     call    flush_register
	; идЄм обратно
	jmp back_to_global_space_ext

alog1   db "log1", 0
alog2   db "log2", 0
aFlush1 db "flush1", 0
aBind_to_dik db "bind_to_dik", 0
aSet_extensions_flags  db "set_extensions_flags", 0
aGet_extensions_flags  db "get_extensions_flags", 0
ALIGN 4
extensions_flags dd 0

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
	cmp     eax, 79
	jnz     lab3
	mov     eax, 100000
	retn
lab3:
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
	jz      short lab2
	mov     eax, [eax+4]
	retn
lab2:
	xor     eax, eax
	retn
bind_to_dik endp

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

