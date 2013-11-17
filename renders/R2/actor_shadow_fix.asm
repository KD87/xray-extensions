actor_shadow_fix:
	mov		eax, ds:g_pGameLevel
	test	eax, eax
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