PERFORM_EXPORT_LEVEL__VOID__FLOAT MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset fun_to_export
	push    offset fun_name
	push    eax
	call    register__ns__set_snd_volume
ENDM

PERFORM_EXPORT_LEVEL__INT__INT MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset fun_to_export
	push    offset fun_name
	push    eax
	call    register__ns__int__int
ENDM
	
PERFORM_EXPORT_LEVEL__FLOAT__VOID MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset fun_to_export
	push    offset fun_name
	push    eax
	call    get_snd_volume_register
ENDM

PERFORM_EXPORT_LEVEL__FLOAT__STR_INT_BOOL_STR MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset fun_to_export
	push    offset fun_name
	push    eax
	call    register_level__float__str_int_bool_str
ENDM

PERFORM_EXPORT_LEVEL__INT__INT MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset fun_to_export
	push    offset fun_name
	push    eax
	call    register__ns__int__int
ENDM
