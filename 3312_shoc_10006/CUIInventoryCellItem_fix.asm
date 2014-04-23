CUIInventoryCellItem__EqualTo_fix proc
;esi == arg: inventory_item
;eax == this: inventory_item

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	; by Real Wolf
	; Вызываем коллбек для ручного регулирования группировки предметов.
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	pusha
	mov 	edi, [eax+0D4h]
	call 	CGameObject__lua_game_object	
	
	test	eax, eax
	jz		short exit
	
	mov		g_object_arg_1, eax
	mov 	edi, [esi+0D4h]
	call 	CGameObject__lua_game_object
	
	test	eax, eax
	jz		short exit
	
	push 	eax
	push 	143

	mov 	ecx, g_Actor
	call    CGameObject__callback
	push    eax
	call    script_use_callback
	
	; Обнуление в коллбеке означает негруппировку.
	cmp		g_object_arg_1, 0
	mov		g_object_arg_1, 0
	popa
	
	jz		return_not_equal
	jmp		short other_code
exit:
	mov		g_object_arg_1, 0
	popa
	

other_code:	
	; check manual grouping flag 
	push eax
	mov eax, [g_manual_grouping_active]
	test eax, eax
	pop eax
	jz back_to_normal
	; not in actor's inventory
	push eax
	push ecx
	;
	mov     eax, [eax+88h]
	and     eax, eax
	jnz lab2
	pop ecx
	pop eax
	jmp back_to_normal ; has no owner, process as usual
lab2:
	mov     ecx, [eax+60h]
	and     ecx, ecx
	jnz lab1
	pop ecx
	pop eax
	jmp back_to_normal ; has no owner, process as usual
lab1:
	mov     eax, [ecx]
	mov     eax, [eax]
	call    eax
	movzx   eax, word ptr [eax+0A4h] ; owner's id
	and     eax, eax ; actors id is always 0 in single
	;
	pop ecx
	pop eax

	jnz back_to_normal ; not an actor, process as usual

	pusha
	mov     edx, [eax + 0D4h]
	mov     edx, [edx+0ACh]
	lea     edx, [edx + 0Ch]
	mov ax, [eax + 132]
	and eax, 04000h
	popa
	;
	pusha
	mov     edx, [esi + 0D4h]
	mov     edx, [edx+0ACh]
	lea     edx, [edx + 0Ch]
	mov ax, [esi + 132]
	and eax, 04000h
	popa

	;
	push eax
	mov ax, [eax + 132]
	test eax, 04000h
	pop eax
	jnz return_not_equal
	push eax
	mov ax, [esi + 132]
	test eax, 04000h
	pop eax
	jnz return_not_equal
	jmp back_to_normal
return_not_equal:
	xor     eax, eax
	pop     edi
	pop     edi
	pop     ebx
	pop     ecx
	retn    4
back_to_normal:
	;PRINT "GO NORMAL"
	; делаем вырезанное
	movss   xmm0, dword ptr [eax+0A8h]
	subss   xmm0, dword ptr [esi+0A8h]
	jmp back_from_CUIInventoryCellItem__EqualTo_fix
CUIInventoryCellItem__EqualTo_fix endp
