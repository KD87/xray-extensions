;===============| расширение регистрации глобального пространства имЄн |=======
global_space_ext: ; вставка, дополн€юща€ функцию экспорта глобальных функций
	; здесь делаем то, что вырезали
	call    error_log_register
	; добавл€ем свой код
	; регистраци€ функции вывода в лог, вместо нерабочей "log"
    push    offset my_log_fun
    push    offset alog1 ; "log1"
    push    esi
    call    error_log_register
	add     esp, 0Ch
	; регистраци€ функции "flush1", вместо нерабочей "flush"
    lea     eax, [ebp-1]
    push    eax
    push    offset my_flush
    push    offset aFlush1   ; "flush1"
    push    esi
    call    flush_register
	add     esp, 10h
	; регистраци€ тестовой функции "log2"
     ;lea     eax, [ebp-1]
     ;push    eax
     ;push    offset my_log2
     ;push    offset alog2   ; "log2"
     ;push    esi
     ;call    flush_register
	; идЄм обратно
	jmp back_to_global_space_ext

alog1   db "log1", 0
alog2   db "log2", 0
aFlush1 db "flush1", 0

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
