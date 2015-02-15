actor_visual_fix proc
	mov		ecx, [esi+298h]
	mov		eax, [ecx+38h]
	add		eax, 60h
	mov		eax, [eax+4]
	test	eax, eax
	jnz		loc_1024C35F
	; делаем вырезанное
;	mov		ecx, [esi+298h]
	jmp back_from_actor_visual_fix
actor_visual_fix endp

actor_visual_drop_fix proc
	mov     dword ptr [eax+4], 0
	mov		edx, [ebp+0]
	mov		eax, [edx+0A4h]
	mov		ecx, ebp
	call	eax
	
	; проверяем номер слота
	cmp		eax, 6
	jnz		short no_need_to_reset_visual
	
	; ок, выкидывают броню из слота. Просто вызовем для нее OnMoveToRuck
	mov		edx, [ebp+0]
	mov		edx, [edx+9Ch]
	mov		ecx, ebp
	call	edx
	
	; делаем вырезанное
no_need_to_reset_visual:
	jmp back_from_actor_visual_drop_fix
actor_visual_drop_fix endp
