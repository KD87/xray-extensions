; расширение регистрации CUIStatic
CUIStatic_extention_1:
	xor     eax, eax
	push    eax
	mov     eax, offset CUIStatic__SetTextureRect
	push    eax
	push    offset aSettexturerect ; "SetTextureRect"
; добавляем ещё один метод
	xor     eax, eax
	push    eax
	mov     eax, offset CUIStatic__SetHeading
	push    eax
	push    offset aSetHeading ; "SetHeading"

; ---------------------------
	jmp     back_to_CUIStatic_ext_1;


CUIStatic_extention_2:
; это добавленный
	mov     ecx, eax
	call    SetTextureRect_register    ; SetTextureRect_register
; это оригинальный
	mov     ecx, eax
	call    SetTextureRect_register    ; SetTextureRect
; ---------------------------
	jmp     back_to_CUIStatic_ext_2;

CUIStatic__SetHeading:	
arg_0           = dword ptr  4
	mov     eax, dword ptr [esp+arg_0]
	mov     eax, dword ptr [eax]
	mov     byte ptr [ecx+0C8h], 1
	mov     byte ptr [ecx+0C9h], 1
	mov     dword ptr [ecx+0CCh], eax
	retn    4
	
	
aSettexturerect db "SetTextureRect", 0
aSetHeading db "SetHeading", 0