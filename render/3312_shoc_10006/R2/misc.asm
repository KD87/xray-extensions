
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
PRINT_FLOAT MACRO fmt_txt:REQ, val:REQ
LOCAL lab1_
LOCAL a_msg
LOCAL value1
LOCAL st0_storage
	jmp     lab1_
a_msg db fmt_txt, 0
value1 dd ?
st0_storage dd ?
lab1_:
	pusha
	fstp [st0_storage]
	mov     [value1], val
	sub     esp, 8
	fld     [value1]
	fstp    QWORD ptr [esp]
	push    offset a_msg
	call    Msg
	add     esp, 0Ch
	
	fld [st0_storage]
	popa
ENDM

aSs_S_S_S_png db "ss_%s_%s_(%s).png", 0
