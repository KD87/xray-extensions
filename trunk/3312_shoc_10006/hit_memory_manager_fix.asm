CHitMemoryManager__add3_fix proc
	pusha
	push    offset add_hit_msg
	call    [Msg] 
	add     esp, 4
	popa
	
	; делаем, что вырезали
	sub     esp, 0Ch
	xorps   xmm0, xmm0
	fldz
	; идём обратно
	jmp back_to_CHitMemoryManager__add3
CHitMemoryManager__add3_fix endp

add_hit_msg db "add_hit_msg", 0