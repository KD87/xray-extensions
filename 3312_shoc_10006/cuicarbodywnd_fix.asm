;.text:103CBF42                 mov     eax, [edi]
;.text:103CBF44                 call    create_cell_item
CUICarBodyWnd__UpdateLists_fix proc
	; eax == cell_item, esi == this (UICarBodyWnd), edi == **CInventoryItem
	push eax
	push ebx
	push esi
	push edi
	mov     ebx, [edi]      ; a2
	mov     edi, eax

	;
	; проверяем, что активирован глобальный режим использования ручной раскраски
	cmp     [g_manual_highlignt_active], 1 ; z set if g_manual_highlignt_active == 1
	jnz     no_colorization ; флажок не установлен, не раскрашиваем
	; проеряем флаг ручной раскраски
	mov     eax, [ebx+132] ; флажки предмета
	test    eax, 08000h ; пользовательский ii флажок "manual_highlighting"
	jz      no_colorization ; в отличие от cmp, z устанавливается если НЕ равен маске
	; задано подсветить предмет кастомным цветом, индекс которого хранится в 4-х битах по смещению 134
	push    esi
	mov     esi, [ebx+134]
	and     esi, 0Fh
	mov     eax, [g_highlight_colors + esi*4]
	pop     esi
	push    eax
	;
	mov     eax, [edi]
	mov     edx, [eax+90h]
	mov     ecx, edi
	call    edx ; SetColor
no_colorization:
	;
	pop edi
	pop esi
	pop ebx
	pop eax
	; делаем вырезанное
	mov     ecx, [esi+74h]
	mov     edx, [ecx]
	;
	jmp back_from_CUICarBodyWnd__UpdateLists_fix
CUICarBodyWnd__UpdateLists_fix endp
