Vector3         struc
x               dd ?
y               dd ?
z               dd ?
Vector3         ends

Matrix4x4       struc
i               Vector3 <>
_14_            dd ?
j               Vector3 <>
_24_            dd ?
k               Vector3 <>
_34_            dd ?
c_              Vector3 <>
_44_            dd ?
Matrix4x4       ends

g_value_aux dd ?

PUT_FLOAT MACRO val:REQ
	lea     eax, val
	;PRINT_UINT "%x", eax
	mov     eax, val
	mov     [g_value_aux], eax
	sub     esp, 8
	fld     [g_value_aux]
	fstp    QWORD ptr [esp]
ENDM

PRINT_MATRIX_ MACRO title_:REQ, val:REQ
LOCAL lab1_
LOCAL a_msg1
LOCAL a_msg2
LOCAL a_msgi
LOCAL a_msgj
LOCAL a_msgk
LOCAL a_msgc
LOCAL a_msg_14
LOCAL a_msg_24
LOCAL a_msg_34
LOCAL a_msg_44
	jmp     lab1_
a_msg1 db title_, 0
a_msg2 db "%7.2f %7.2f %7.2f %7.2f", 0
a_msgi db "i",0
a_msgj db "j",0
a_msgk db "k",0
a_msgc db "c",0
a_msg_14 db "14",0
a_msg_24 db "24",0
a_msg_34 db "34",0
a_msg_44 db "44",0
lab1_:
	pusha
	mov     edi, val
	;PRINT_UINT "edi=%x", edi
	push    offset a_msg1
	call    Msg
	add     esp, 04h
	;PRINT "test0"

	ASSUME  edi:PTR Matrix4x4
	lea ecx, [edi].i
	push ecx
	push offset a_msgi
	call Log_vector3
	add     esp, 08h
	
	push [edi]._14_
	push offset a_msg_14
	call Log_float
	add     esp, 08h
	
	lea ecx, [edi].j
	push ecx
	push offset a_msgj
	call Log_vector3
	add     esp, 08h
	
	push [edi]._24_
	push offset a_msg_24
	call Log_float
	add     esp, 08h
	
	lea ecx, [edi].k
	push ecx
	push offset a_msgk
	call Log_vector3
	add     esp, 08h
	
	push [edi]._34_
	push offset a_msg_34
	call Log_float
	add     esp, 08h
	
	lea ecx, [edi].c_
	push ecx
	push offset a_msgc
	call Log_vector3
	add     esp, 08h
	
	push [edi]._44_
	push offset a_msg_44
	call Log_float
	add     esp, 08h
	ASSUME  edi:nothing
	popa
ENDM
test_vector dd 1.0, 2.0, 3.0

PRINT_MATRIX MACRO title_:REQ, val:REQ
LOCAL lab1_
LOCAL a_msg1
LOCAL a_msg2
	jmp     lab1_
a_msg1 db title_, 0
a_msg2 db "%7.2f %7.2f %7.2f %7.2f", 0
lab1_:
	pusha
	mov     edi, val
	push    offset a_msg1
	call    Msg
	add     esp, 04h

	ASSUME  edi:PTR Matrix4x4
	PUT_FLOAT [edi]._14_
	PUT_FLOAT [edi].i.z
	PUT_FLOAT [edi].i.y
	PUT_FLOAT [edi].i.x
	push offset a_msg2
	call Msg
	add     esp, 24h
	
	PUT_FLOAT [edi]._24_
	PUT_FLOAT [edi].j.z
	PUT_FLOAT [edi].j.y
	PUT_FLOAT [edi].j.x
	push offset a_msg2
	call Msg
	add     esp, 24h
	PUT_FLOAT [edi]._34_
	PUT_FLOAT [edi].k.z
	PUT_FLOAT [edi].k.y
	PUT_FLOAT [edi].k.x
	push offset a_msg2
	call Msg
	add     esp, 24h
	PUT_FLOAT [edi]._44_
	PUT_FLOAT [edi].c_.z
	PUT_FLOAT [edi].c_.y
	PUT_FLOAT [edi].c_.x
	push offset a_msg2
	call Msg
	add     esp, 24h
	ASSUME  edi:nothing
	popa
ENDM

PRINT_VECTOR MACRO title_:REQ, val:REQ
LOCAL lab1_
LOCAL a_msg1
	jmp     lab1_
a_msg1 db title_, 0
lab1_:
	pusha
	push val
	push offset a_msg1
	call Log_vector3
	add esp, 8
	popa
ENDM
