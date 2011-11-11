PERFORM_EXPORT_CUIWND__VOID__VOID MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	;PRINT fun_name_str
	mov     ecx, eax
	
	xor     eax, eax
	push    eax                                        ; 0
	mov     eax, offset fun_to_export
	push    eax                                        ; sub
	push    offset fun_name
	push    ecx                                        ; sub name
	call    register_CUIWindow__SetPPMode
ENDM
