include ctime_reg_macro.asm

REGISTER_CTIME_VOID__INT_INT_INT register_ctime_set_low_high, "set_value"
REGISTER_CTIME_VOID__@INT_@INT_@INT_@INT_@INT_@INT_@INT register_ctime_get_low_high, "get_value"

ctime_fix PROC
; делаем то, что вырезали
	call    register__CTime__setHMS
; добавляем своё
PERFORM_EXPORT_CTIME_VOID__INT_INT_INT register_ctime_set_low_high, CTime__set_value
PERFORM_EXPORT_CTIME_VOID__@INT_@INT_@INT_@INT_@INT_@INT_@INT register_ctime_get_low_high, CTime__get_value
; идём обратно
	jmp back_from_ctime_fix

ctime_fix ENDP



CTime__set_value   proc
arg_0           = dword ptr  8
arg_4           = dword ptr  0Ch
arg_8           = dword ptr  10h

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	mov     eax, [ebp+arg_0]
	mov     dword ptr [ecx], eax
	mov     eax, [ebp+arg_4]
	mov     dword ptr [ecx+4], eax
	
	mov     esp, ebp
	pop     ebp
	retn    0Ch
CTime__set_value   endp


CTime__get_value      proc near

arg_0           = dword ptr  8
arg_4           = dword ptr  0Ch
arg_8           = dword ptr  10h
arg_C           = dword ptr  14h
arg_10          = dword ptr  18h
arg_14          = dword ptr  1Ch
arg_18          = dword ptr  20h

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    edx
	xor     edx, edx
	mov     eax, [ebp+arg_18]
	mov     dword ptr [eax], edx
	mov     eax, [ebp+arg_14]
	mov     dword ptr [eax], edx
	mov     eax, [ebp+arg_10]
	mov     dword ptr [eax], edx
	mov     eax, [ebp+arg_C]
	mov     dword ptr [eax], edx
	mov     eax, [ebp+arg_8]
	mov     dword ptr [eax], edx
	
	mov     eax, [ebp+arg_4]
	mov     edx, dword ptr [ecx+4]
	mov     dword ptr [eax], edx
	mov     eax, [ebp+arg_0]
	mov     edx, dword ptr [ecx]
	mov     dword ptr [eax], edx
	
	pop     edx
	mov     esp, ebp
	pop     ebp
	retn    1Ch
CTime__get_value      endp
