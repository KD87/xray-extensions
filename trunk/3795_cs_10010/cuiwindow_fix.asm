cuiwindow_fix:

	push    ecx
	push    ecx
	mov     ecx, offset CUIWindow__GetMouseX
	push    ecx
	push    offset aGetMouseX

	push    ecx
	push    ecx
	mov     ecx, offset CUIWindow__GetMouseY
	push    ecx
	push    offset aGetMouseY
	
	push    eax
	call    GetWidth_register
	pop     ecx
	
	push    eax
	call    GetWidth_register
	pop     ecx

	; делаем то, что вырезали
	push    eax
	call    SetWndPos_register ;                        // SetWndPos или SetWndSize
	pop     ecx
	; идём обратно
	jmp back_from_cuiwindow_fix

	
aGetMouseX db "GetMouseX", 0
aGetMouseY db "GetMouseY", 0


CUIWindow__GetMouseX:
	fld     dword ptr [ecx+64]
	retn

CUIWindow__GetMouseY:
	fld     dword ptr [ecx+68]
	retn
