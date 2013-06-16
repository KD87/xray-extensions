CUIListWnd__script_register_fix PROC

	push    ecx
	xor     ecx, ecx
	push    ecx
	mov     ecx, offset CUIListWnd__SetSelectedItem
	push    ecx
	push    offset aSetSelectedItem ; "SetSelectedItem"

	
	push    eax
	call    sub_104207F6
	pop     ecx

	; делаем вырезанное
	push    eax
	call    sub_104207F6
	pop     ecx
	; идём обратно
	jmp back_from_CUIListWnd__script_register_fix

CUIListWnd__script_register_fix ENDP

aSetSelectedItem db "SetSelectedItem", 0

CUIListWnd__SetSelectedItem proc ; ecx == this
arg_0           = dword ptr  4

	mov     eax, [esp+arg_0]
	mov     [ecx+88h], eax
	retn    4
CUIListWnd__SetSelectedItem    endp

