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
	; изменилс€ ли стейт
	sub		ecx, weapon_state
	test	ecx, ecx		; изменилс€ ли стейт
	jz		continue
	mov		ecx, weapon_state
	mov		prev_weapon_state, ecx
	; инит таймера нагрева
	fld		timer
	fstp	state_time_heat
	; инит старого состо€ни€ нагрева
	fld		heating_value
	fstp	prev_heating_value
	; инит таймера состо€ни€
	fld		timer
	fstp	state_time
	; сохранение старого таймера состо€ни€
	fld		weapon_state_timer
	fstp	weapon_prev_state_time
	mov		weapon_state, eax 
	
	; стейт не помен€лс€
continue:
	cmp		weapon_state, 1
	jz		heating
	cmp		weapon_state, 2
	jz		heating
	; не стрел€ем
	movss	xmm0, ds:heating_value
	movss	xmm1, ds:EPS
	comiss  xmm1, xmm0
	ja      check_rest
	fld		prev_heating_value
	fadd	dword ptr state_time_heat
	fsub	dword ptr timer
	fstp	heating_value
	jmp		check_rest
	; стрел€ем
heating:
	fld		timer
	fsub	dword ptr state_time_heat	
	fadd	dword ptr prev_heating_value
	fstp	heating_value
	
check_rest:
	fld		timer
	fsub	dword ptr state_time
	fstp	weapon_state_timer
	
cobject_exit:
	pop		ecx
	; то, что вырезал
	mov     eax, [esi+0B4h]
	jmp back_to_cobject_check

state_time dd 0				; значение глобального таймера в момент переключени€ состо€ни€
state_time_heat dd 0		; значение глобального таймера в момент переключени€ состо€ни€
prev_heating_value dd 0
EPS dd 0.00001