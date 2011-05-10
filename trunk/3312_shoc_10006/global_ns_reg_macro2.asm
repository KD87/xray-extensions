GLOBAL_NS_SCOPE_ADD MACRO
	mov     ecx, eax
	call    esi 
ENDM

GLOBAL_NS_PERFORM_EXPORT__VOID__FLOAT_FLOAT MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	mov     eax, esp
	push    offset fun_to_export
	push    offset fun_name
	push    eax
	call    register__gs_sell_condition__fl_fl
	pop     ecx
	pop     ecx
ENDM

	