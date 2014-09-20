game_object_destructor_fix:
	mov     eax, [edi+4]
	test	eax, eax
	jnz		short ptr_is_ok
	
	; попался кривой указатель, выходим и дампим имя объекта в лог
	mov		eax, [esp]	; CGameObject ptr
	mov		eax, [eax+0A8h]	; str_value в eax
	add		eax, 0Ch	; сдвиг до строки
	PRINT_UINT "CGAMEOBJECT DESTRUCTOR FIX: something wrong with the object %s", eax
	pop     edi
	pop     ebx
	pop     ecx
	retn
	
ptr_is_ok:
	mov     ecx, [eax]
	jmp	back_from_game_object_destructor_fix