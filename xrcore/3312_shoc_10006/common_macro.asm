PRINT_UINT MACRO fmt_txt:REQ, val:REQ
LOCAL lab1_
LOCAL a_msg
	jmp     lab1_
a_msg db fmt_txt, 0
lab1_:
	pusha
	push    val
	push    offset a_msg
	call    Msg
	add     esp, 08h
	popa
ENDM