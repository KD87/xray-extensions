CUIInventoryCellItem__EqualTo_fix proc
;esi == arg: inventory_item
;eax == this: inventory_item
	;jmp return_not_equal
	; not in actor's inventory
	push eax
	push ecx
	;
	mov     eax, [eax+88h]
	mov     ecx, [eax+60h]
	mov     eax, [ecx]
	mov     eax, [eax]
	call    eax
	movzx   eax, word ptr [eax+0A4h] ; owner's id
	and     eax, eax ; actors id is always 0 in single
	;
	pop ecx
	pop eax
	jnz back_to_normal ; not an actor, process as usual
	;and eax, 0ffffh
	;PRINT_UINT "owner id: %d", eax

	pusha
	mov     edx, [eax + 0D4h]
	mov     edx, [edx+0ACh]
	lea     edx, [edx + 0Ch]
	;PRINT_UINT "this: %s", edx
	mov ax, [eax + 132]
	and eax, 04000h
	;PRINT_UINT "ungroup: %x", eax
	popa
	;
	pusha
	mov     edx, [esi + 0D4h]
	mov     edx, [edx+0ACh]
	lea     edx, [edx + 0Ch]
	;PRINT_UINT "this: %s", edx
	mov ax, [esi + 132]
	and eax, 04000h
	;PRINT_UINT "ungroup: %x", eax
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
	; делаем вырезанное
	movss   xmm0, dword ptr [eax+0A8h]
	subss   xmm0, dword ptr [esi+0A8h]
	jmp back_from_CUIInventoryCellItem__EqualTo_fix
CUIInventoryCellItem__EqualTo_fix endp
