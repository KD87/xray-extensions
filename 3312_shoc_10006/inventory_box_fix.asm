inventory_box_fix proc
	; делаем то, что вырезали
	call    xr_vector_u16___push_back
	push    0               ; bool
	push    ebx             ; obj
	mov     ecx, esi        ; this
	call    ds:CObject__H_SetParent
	push    0
	mov     ecx, esi
	call    ds:CObject__setVisible
	push    0
	mov     ecx, esi
	call    ds:CObject__setEnabled
	; вызываем колбек дл€ €шика
	mov     edi, esi ; item
	call    CGameObject__lua_game_object ; аргумент в edi
	push    eax
	
	push    151 ; type = ???
	mov     ecx, ebx ; box
	call    CGameObject__callback ; eax = callback
	push    eax ; callback
	call    script_use_callback
	
	; идЄм обратно
	jmp back_from_inventory_box_fix
inventory_box_fix endp


