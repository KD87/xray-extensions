GLOBAL_NS_PERFORM_EXPORT__INT__INT_INT MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	push    offset fun_to_export
	push    offset fun_name
	push    [ebp+8h]
	call    bit_and_register
	add     esp, 0Ch
ENDM

