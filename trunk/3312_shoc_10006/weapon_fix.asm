UpdateAddonsVisibility_fix proc
	; делаем вырезанный фрагмент беред врезкой
	; пришлось сместить место врезки на несколько команда ранее,
	; поскольку в нужном нам месте стоит команда, зависимая от таблицы релокаций
	test    eax, eax
	jz      short lab1
	push    1
	push    0
	push    ebx
	mov     ecx, esi
	call    ebp ; CKinematics__LL_SetBoneVisible
lab1:
	;PRINT "UpdateAddonsVisibility_fix 1"
	; делаем что хотели сделать
	; вызываем колбек для объекта оружия
	push edx
	push ecx
	push eax
	push edi
	;
	;PRINT_UINT "object: %x", edi
	;jmp disable_callback
	push    777 ; адрес флагов игнора в стеке
	push    888 ; параметры хита
	push    154 ; константа - тип колбека
	mov     ecx, edi ; this
	add     ecx, 0d8h
;item: 172fd6f8 obj
;item: 172fd620 wpn

	call    CGameObject__callback ; eax = callback
	;PRINT_UINT "aaa: %x", eax
	push    eax ; callback
	; вызываем
	call    script_callback_int_int
	;
disable_callback:
	pop edi
	pop eax
	pop ecx
	pop edx
	;
	;PRINT "UpdateAddonsVisibility_fix 2"
	; делаем вырезанное
	mov     ecx, esi ; <== это было
	call    ds:CKinematics__CalculateBones_Invalidate ; <== вот эта команда будет испорчена релокацией, если врезаться здесь
	mov     eax, [esi]
	mov     edx, [eax+40h]
	push    0
	mov     ecx, esi
	call    edx
	;
	;PRINT "UpdateAddonsVisibility_fix 3"
	;
	pop     esi
	pop     ebp
	pop     ebx
	retn
UpdateAddonsVisibility_fix endp

UpdateHUDAddonsVisibility_fix proc
	push edx
	push ecx
	push eax
	push edi
	;
	push    777 ; адрес флагов игнора в стеке
	push    888 ; параметры хита
	push    155 ; константа - тип колбека
	mov     ecx, ebp ; this
	add     ecx, 0d8h
	call    CGameObject__callback ; eax = callback
	push    eax ; callback
	call    script_callback_int_int
	pop edi
	pop eax
	pop ecx
	pop edx

	; делаем вырезанное
	push    ebx
	push    edi
	push    offset aWpn_scope ; "wpn_scope"
	mov     ecx, esi
	; идём обратно
	jmp back_from_UpdateHUDAddonsVisibility_fix
UpdateHUDAddonsVisibility_fix endp
aWpn_scope db "wpn_scope", 0