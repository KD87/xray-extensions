cuistatic_fix:
	; делаем то, что вырезали
	call    sub_103F1781
	; делаем свое
	PERFORM_EXPORT_CUI_VOID__BOOL CUIStatic__SetTextComplexMode_, "SetTextComplexMode"
	PERFORM_EXPORT_CUIWND__VOID__VOID CUIStatic__AdjustWidthToText_, "AdjustWidthToText"
	PERFORM_EXPORT_CUIWND__VOID__VOID CUIStatic__AdjustHeightToText_, "AdjustHeightToText"
	PERFORM_EXPORT_CUI_VOID__UINT CUIStatic__SetVTextAlignment_, "SetVTextAlign"
	PERFORM_EXPORT_CUI_VOID__FLOAT_FLOAT CUIStatic__SetTextPos_, "SetTextPos"
	; идём обратно
	jmp     back_from_cuistatic_fix

CUIStatic__SetTextComplexMode_ proc
mode_on = dword ptr  8
	push    edi
	push    [esp+mode_on] ; bool
	mov     edi, ecx ; wnd
	call	CUIStatic__SetTextComplexMode
	pop		edi
	retn    4
CUIStatic__SetTextComplexMode_ endp

CUIStatic__AdjustWidthToText_ proc
	push    esi
	mov     esi, ecx ; wnd
	call	CUIStatic__AdjustWeigthToText
	pop		esi
	retn
CUIStatic__AdjustWidthToText_ endp

CUIStatic__AdjustHeightToText_ proc
	push    edi
	mov     edi, ecx ; wnd
	call	CUIStatic__AdjustHeightToText
	pop		edi
	retn
CUIStatic__AdjustHeightToText_ endp

CUIStatic__SetVTextAlignment_ proc
alignment = dword ptr  8
	push    edi
	mov     edi, ecx ; wnd
	mov     ebx, [esp+alignment] ; align
	call	CUIStatic__SetVTextAlignment
	pop		edi
	retn	4
CUIStatic__SetVTextAlignment_ endp

CUIStatic__SetTextPos_ proc
x = dword ptr  4
y = dword ptr  8
	mov     eax, [esp+y]
	push    eax
	mov     eax, [esp+4+x]
	push    eax
	call	CUIStatic__SetTextPos
	retn	8
CUIStatic__SetTextPos_ endp
