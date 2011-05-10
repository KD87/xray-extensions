UpdateAddonsVisibility_fix proc
	;push    eax
	;push    ecx
	;push    esi
	pusha
	
	;push    edi
	;push    offset weapon_addons_fix_msg1
	;call    Msg
	;pop     eax
	;pop     eax

	;
	add edi, 0D8h
	;push    edi
	;push    offset weapon_addons_fix_msg2
	;call    Msg
	;pop     eax
	;pop     eax
	
	call    CGameObject__lua_game_object ; eax = who_go
	
	;push eax
	
	;push    eax
	;push    offset weapon_addons_fix_msg3
	;call    Msg
	;pop     eax
	;pop     eax
	
	;pop eax

	;mov     eax, [eax+4]
	;push    eax
	;mov     eax, offset weapon_addons_fix_msg4
	;push    eax
	;call    Msg
	;pop     eax
	;pop     eax
	
	push    150 ; type = 
	mov     ecx, edi ; ecx = this
	;mov     ecx, g_Actor
	call    CGameObject__callback ; eax = hit_callback
	push    eax ; callback
	call    script_callback__void
	

	;
	popa
	;pop     esi
	;pop     ecx
	;pop     eax
	
	; делаем вырезанное
	mov     ecx, esi ; <== это было
	call    ds:CKinematics__CalculateBones_Invalidate
	; идём обратно
	jmp     back_from_UpdateAddonsVisibility_fix
UpdateAddonsVisibility_fix endp

weapon_addons_fix_msg1 db "xxx1: %x", 0
weapon_addons_fix_msg2 db "xxx2: %x", 0
weapon_addons_fix_msg3 db "xxx3: %x", 0
weapon_addons_fix_msg4 db "xxx4: %x", 0
