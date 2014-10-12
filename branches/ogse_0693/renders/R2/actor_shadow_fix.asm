actor_shadow_fix:
; загружен ли левел
	mov		eax, ds:g_pGameLevel
	test	eax, eax
	jz		exit
	
; phase == PHASE_SMAP
	push	eax
	mov		eax, ds:RImplementation
	mov		eax, [eax]
	mov		eax, [eax+124h]
	test	eax, eax
	pop		eax
	jz		exit
	
; 4253E3 - CHUDManager::Render_First()  set_invisible (false/true)
; 1C8948 - CActor::renderable_Render() убрали hudview
	
	mov		eax, [eax]
	push	eax
	mov     eax, [eax+148h]
	mov     edx, [eax]
	mov     ecx, eax
	mov     eax, [edx+0Ch]
	call    eax
	pop		eax
	
exit:
	; old
	add     [edi+320h], ebx

	jmp back_to_actor_shadow_fix