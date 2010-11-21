; в ПДА можно добавлять свои разделы - ГГ будет получать инфопоршень при выборе нвоого раздела
; !!! не забывать дизейбилть инфопоршни от других вкладок иначе не будет срабатывать коллбеки на получение инфопоршней

;edi - указатель на id выбранной закладки
CUIPdaWnd__SetActiveSubdialog_chunk proc
	push	edx
	push	ecx
	push	eax
	
	mov		eax, [edi]
	add		eax, 10h
	push	eax
	call	InventoryUtilities__SendInfoToActor
	add     esp, 4
	
	pop		eax
	pop		ecx
	pop		edx
	
	cmp     eax, [edi]
	jnz     CUIPdaWnd__SetActiveSubdialog_1
	pop     edi
	pop     esi
	retn    4
CUIPdaWnd__SetActiveSubdialog_chunk endp
