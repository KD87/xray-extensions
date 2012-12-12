cobject_check:
	; zoom mode
	push	ecx
	movzx	eax, word ptr [esi+0A4h]	; parent id
	test	eax, eax		; id == actor_id
	jnz		m_state
	mov		eax, [esi+5C8h]	; m_bZoomAimingMode
	and		eax, 1
	mov		zoom_mode, eax

m_state:	
	; weapon state
	mov		eax, [esi+0B4h]	; Parent
	test	eax, eax
	jz		cobject_exit
	movzx	eax, word ptr [eax+0A4h]	; parent id
	test	eax, eax		; id == actor_id
	jnz		cobject_exit
	mov		ecx, esi
	mov		eax, [esi]
	mov		eax, [eax+0A8h]	
	call	eax				; CGameObject::cast_weapon()
	test	eax, eax
	jz		cobject_exit
	mov		eax, [eax+28Ch]	; m_state
	mov		ecx, eax
	sub		ecx, weapon_state
	test	ecx, ecx
	jz		continue
	fld		timer
	fstp	state_time
	mov		ecx, weapon_state
	mov		prev_weapon_state, ecx
continue:
	mov		weapon_state, eax 
	fld		timer
	fsub	dword ptr state_time
	fstp	weapon_state_timer
	
cobject_exit:
	pop		ecx
	; то, что вырезал
	mov     eax, [esi+0B4h]
	jmp back_to_cobject_check

state_time dd 0