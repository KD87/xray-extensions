cuilistbox_fix1 proc
	; делаем своё
	xor     eax, eax
	push    eax
	mov     eax, offset CUIListBox__GetMainInputReceiver
	push    eax
	push    offset aGetMainInputReceiver ; "GetMainInputReceiver"
	; делаем то, что вырезали
	xor     eax, eax
	push    eax
	mov     eax, offset CUIScrollView__GetItem
	; идём обратно
	jmp    back_from_cuilistbox_fix1
cuilistbox_fix1 endp

aGetMainInputReceiver db "GetMainInputReceiver",0

cuilistbox_fix2 proc
	; делаем то, что вырезали
	call    register__cuilistbox__CUIWindows__UINT
	mov     ecx, eax
	; делаем своё
	call    register__cuilistbox__CUIWindows__UINT ; для регистрации своей функции, которая вернёт нам input receiver
	mov     ecx, eax
	; идём обратно
	jmp    back_from_cuilistbox_fix2
cuilistbox_fix2 endp


CUIListBox__GetMainInputReceiver proc near
stub = dword ptr  4
	call    CurrentGameUI
	test    eax, eax
	jz      exit
	mov     ecx, eax
	add     ecx, 10h
	call    CDialogHolder__TopInputReceiver
exit:
	retn    4
CUIListBox__GetMainInputReceiver endp

