include cuiwindow_reg_macro.asm

cuiwindow_fix proc
	; сохраняем всё
	pusha
	; добавляем своё
	PERFORM_EXPORT_CUIWND__VOID__VOID UIWindow__DetachFromParent, "DetachFromParent"
	PERFORM_EXPORT_CUIWND__VOID__VOID CUIWindow__BringToTop, "BringToTop"
	PERFORM_EXPORT_CUIWND__VOID__VOID CUIWindow__Update_virtualcall, "Update"
	PERFORM_EXPORT_CUIWND__FLOAT__VOID CUIWindow__GetVPos, "GetVPos"
	PERFORM_EXPORT_CUIWND__FLOAT__VOID CUIWindow__GetHPos, "GetHPos"
	PERFORM_EXPORT_CUIWND__FLOAT__VOID CUIWindow__GetCursorX, "GetCursorX"
	PERFORM_EXPORT_CUIWND__FLOAT__VOID CUIWindow__GetCursorY, "GetCursorY"
	PERFORM_EXPORT_CUIWND__FLOAT__VOID CUIWindow__GetAbsolutePosX, "GetAbsolutePosX"
	PERFORM_EXPORT_CUIWND__FLOAT__VOID CUIWindow__GetAbsolutePosY, "GetAbsolutePosY"
	; восстанавливаем всё
	popa
	; делаем то, что вырезали 
	push    ecx
	mov     ecx, esp
	push    eax
	call    edi
	; идём обратно
	jmp back_from_cuiwindow_fix
cuiwindow_fix endp

UIWindow__DetachFromParent proc
	mov     eax, [ecx+2Ch] ; parent
	test    eax, eax
	jz      exit ; no parent
	push    ecx
	mov     ecx, eax
	mov     eax, [ecx]
	call    dword ptr [eax+38h] ; 
exit:
	retn
UIWindow__DetachFromParent endp

CUIWindow__BringToTop proc
	mov     eax, [ecx+2Ch] ; parent
	test    eax, eax
	jz      exit ; no parent
	; eax == this == parent windows
	push    ecx ; аргумент в стеке - окно, которое понимаем наверх
	call CUIWindow__BringToTop_
exit:
	retn
CUIWindow__BringToTop endp

g_counter_just_for_show dd 0
scroll_vew_fix proc

	pusha
	mov eax, dword ptr[g_counter_just_for_show]
	PRINT_UINT "cntr=%d", eax
	inc eax
	mov dword ptr[g_counter_just_for_show], eax
	popa
	; делаем то, что вырезали 
	push    ecx
	push    esi
	push    edi
	mov     edi, ecx
	; идём обратно
	jmp back_from_scroll_vew_fix
scroll_vew_fix endp

CUIWindow__Update_virtualcall proc near
	mov     eax, [ecx]
	jmp     dword ptr [eax+10h]
CUIWindow__Update_virtualcall endp

CUIWindow__GetHPos proc
	fld     dword ptr [ecx+5]
	retn
CUIWindow__GetHPos endp

CUIWindow__GetVPos proc
	fld     dword ptr [ecx+9]
	retn
CUIWindow__GetVPos endp

CUIWindow__GetCursorX proc
	fld     dword ptr [ecx+68]
	retn
CUIWindow__GetCursorX endp

CUIWindow__GetCursorY proc
	fld     dword ptr [ecx+72]
	retn
CUIWindow__GetCursorY endp

CUIWindow__GetAbsolutePosX proc
	fldz
sum:
	fadd	dword ptr[ecx+5]
	mov     ecx, [ecx+2Ch]
	test	ecx, ecx
	jnz		short sum
	retn
CUIWindow__GetAbsolutePosX endp

CUIWindow__GetAbsolutePosY proc
	fldz
sum:
	fadd	dword ptr[ecx+9]
	mov     ecx, [ecx+2Ch]
	test	ecx, ecx
	jnz		short sum
	retn
CUIWindow__GetAbsolutePosY endp		