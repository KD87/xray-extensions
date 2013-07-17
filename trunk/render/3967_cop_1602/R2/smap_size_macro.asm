REGISTER_SMAP_SIZE MACRO key_str:REQ, value:REQ
LOCAL smap_key
LOCAL flag
LOCAL lab1
LOCAL exit
	jmp lab1
flag dd 0FFFE0001h
smap_key db key_str, 0
lab1:
	mov     eax, ds:Core
	add     eax, 4D0h
	push    offset smap_key ; "-smapXXXX"
	push    eax
	call    esi ; __imp__strstr
	add     esp, 8
	test    eax, eax
	jz      short exit
	mov		edx, flag
	or		edx, value
	mov		flag, edx
	mov     edx, [edi+2D4h]
	and     edx, flag
	or      edx, value
	mov     [edi+2D4h], edx
exit:
ENDM
