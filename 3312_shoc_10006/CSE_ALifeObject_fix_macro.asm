CSE_PERFORM_EXPORT__VOID__BOOL MACRO fun_to_export:REQ, fun_name:REQ
LOCAL script_function_name
	jmp     lab1
script_function_name db fun_name, 0
lab1:
	xor     ecx, ecx
	push    ecx
	mov     ecx, offset fun_to_export
	push    ecx
	mov     ecx, offset script_function_name
	push    ecx
	push    eax
	call    register_CSE__VOID__BOOL
ENDM

create_CSE_ALifeObject_sflags_writer MACRO fun_name:REQ, flag_mask:REQ
fun_name proc
bool_arg = byte ptr  4
	cmp     [esp+bool_arg], 0
	jz      short lab1
	or      dword ptr [ecx+0B4h], flag_mask
	retn    4
lab1:
	and     dword ptr [ecx+0B4h], 0ffffffffh XOR flag_mask
	retn    4
fun_name endp
ENDM
