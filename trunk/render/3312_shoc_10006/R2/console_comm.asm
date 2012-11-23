con_comm:
	mov		eax, 10h
	test    console_desc, eax
	jnz     short mark
	or      console_desc, eax
	push    4B0h									; максимум
	push    1										; минимум
	push	offset value							; значение
	push	offset aDetail_radius					; "r__detail_radius"
	mov		ecx, offset ccc_int_obj
	call	ds:[CCC_Integer__CCC_Integer]			;CCC_Integer::CCC_Integer
	push	offset destructor
	call	_atexit									 ;_atexit
	add		esp, 4	
mark:
	mov		ecx, ds:[Console]			;CConsole::AddCommand
	mov		ecx, [ecx]
	push	offset ccc_int_obj
	call	ds:CConsole__AddCommand
	;
REGISTER_CC_FLAG ps_r2_ls_flags, 04000h, "r2_exp_donttest_uns"
	;
	; делаем вырезанное
	pop		edi
	pop		esi
	pop		ebp
	pop		ebx
	add		esp, 18h
	retn
	;обратно можно не возвращаться
	;jmp		back_to_con_comm

destructor proc near
	mov		ecx, offset ccc_int_obj
	jmp     ds:[CCC_Integer___CCC_Integer]	; CCC_Integer::~CCC_Integer(void)
destructor endp	
	
value dd 31h	
aDetail_radius db "r__detail_radius", 0		;название параметра

