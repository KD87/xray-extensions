MMM_PERFORM_EXPORT__BOOL__VOID MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
LOCAL var1
	jmp     lab1
fun_name db fun_name_str, 0
var1 dd 0
lab1:
	mov     ecx, eax
	xor     eax, eax
	lea     edi, [ebp-10h]
	stosb
	push    [ebp-10h]
	lea     edi, [ebp-0Ch]
	stosb
	push    [ebp-0Ch]
	lea     eax, [ebp-8h]
	push    offset fun_name
	push    ecx
	mov     [ebp+var_8], offset fun_to_export
	call    register__MMM_bool__void
ENDM



