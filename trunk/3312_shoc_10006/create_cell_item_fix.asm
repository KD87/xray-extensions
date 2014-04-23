static_for_callback dd 0
create_cell_item_fix proc
	push	loc
	sub		esp, 8
	push	ebx
	push	esi
	jmp		create_cell_item_changed
loc:
	mov		static_for_callback, eax
	pusha
	
	mov		eax, [eax+17Ch]
	test	eax, eax
	jz		short exit
	
	mov		edi, [eax+0D4h]
	test	edi, edi
	jz		short exit
	
	call	CGameObject__lua_game_object
	test	eax, eax
	jz		short exit
	
	push 	eax
	push 	136

	mov 	ecx, g_Actor
	call    CGameObject__callback
	push    eax
	call    script_use_callback
exit:	
	popa
	mov		static_for_callback, 0
	retn
create_cell_item_fix endp

CUIFrameWindow__GetTitleStatic_fix proc
	mov		eax, static_for_callback
	retn
CUIFrameWindow__GetTitleStatic_fix endp