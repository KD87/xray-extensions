include cuiwindow_reg_macro.asm

cuiwindow_fix proc
	; сохраняем всё
	pusha
	; добавляем своё
	PERFORM_EXPORT_CUIWND__VOID__VOID UIWindow__DetachFromParent, "DetachFromParent"
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
