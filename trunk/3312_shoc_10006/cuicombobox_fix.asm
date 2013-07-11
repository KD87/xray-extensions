PERFORM_EXPORT_CUI__VOID__STRING MACRO fun_to_export:REQ, fun_name_str:REQ
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
	call    register_CUI_void__string
ENDM

PERFORM_EXPORT_CUI__STRING__VOID MACRO fun_to_export:REQ, fun_name_str:REQ
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
	call    register__UI__string__void
ENDM

CUIComboBox_fix proc
	call    sub_1040F216
	;
	PERFORM_EXPORT_CUI__VOID__STRING CUIComboBox__AddItem, "AddItem"
	PERFORM_EXPORT_CUI__STRING__VOID CUIComboBox__GetText, "GetText"
	;
	jmp back_from_CUIComboBox_fix
CUIComboBox_fix endp

CUIComboBox__AddItem proc
text = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi

	mov     esi, ecx
	push    012345678h
	mov     eax, [ebp+text]
	push    eax
	call    CUIComboBox__AddItem_

	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    4
	;
CUIComboBox__AddItem endp

CUIComboBox__GetText proc
	mov     eax, [ecx+420h]
	lea     ecx, [ecx+420h]
	mov     eax, [eax+20h]
	jmp     eax
CUIComboBox__GetText endp

CUIComboBox__SaveValue_fix proc
	cmp     dword ptr[ecx+40], 012345678h
	jnz     continue_normal
	;PRINT "skip"
	retn
continue_normal:
	;PRINT "continue normal"
	push    esi
	push    edi
	mov     edi, ecx
	call    CUIOptionsItem__SaveValue
	;
	jmp back_from_CUIComboBox__SaveValue_fix
CUIComboBox__SaveValue_fix endp
