PRINT MACRO msg_txt:REQ
LOCAL lab1_
LOCAL a_msg
	jmp     lab1_
a_msg db msg_txt, 0
lab1_:
	pusha
	push    offset a_msg
	call    Msg
	add     esp, 04h
	popa
ENDM

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
	jmp     lab1_
a_msg db fmt_txt, 0
value1 dd ?
lab1_:
	pusha
	mov     [value1], val
	sub     esp, 8
	fld     [value1]
	fstp    QWORD ptr [esp]
	push    offset a_msg
	call    Msg
	add     esp, 0Ch
	
	popa
ENDM

msg_and_fail proc near
	push    ebp
	mov     ebp, esp
	
	mov     eax, [ebp+8]
	push    eax
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
