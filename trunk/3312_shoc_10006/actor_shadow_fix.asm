CActor__Update_fix proc
	; Вырезанное выполним сразу и занесем в стек, иначе получим не тот результат и исчезнет модель ГГ на статике.
	sbb		eax, eax
	add		eax, 1
	push	eax
	
	; Проверяем тип рендера. 0x5A - R2, 0x51 - R1.
;	mov		ecx, ds:Render
;	mov		ecx, [ecx]
;	mov		eax, [ecx]
;	mov		edx, [eax]
;	call	edx
;	cmp		eax, 5Ah
;	jnz		exit
	mov		ecx, psDeviceFlags
	mov		ecx, [ecx]
	test	ecx, 80000h		;psR2
	jz		exit
	
	mov		eax, [edi+530h]
	test	eax, eax
	jnz		exit

	; Здесь просто заменим значение eax в стеке.
	mov		[esp], dword ptr 1
exit:	
	; eax уже в стеке и его содержимое нам не надо.
	jmp	back_from_CActor__Update_fix
CActor__Update_fix endp

CActor__Update_fix_old proc
	push	eax
;	mov		ecx, ds:Render
;	mov		ecx, [ecx]
;	mov		eax, [ecx]
;	mov		edx, [eax]
;	call	edx			; get_generation()
;	cmp		eax, 5Ah
;	jnz		exit
	mov		ecx, psDeviceFlags
	mov		ecx, [ecx]
	test	ecx, 80000h		;psR2
	jz		exit
	mov		eax, [edi+530h]
	test	eax, eax
	jnz		exit
	pop		eax
	push	1
	jmp	back_from_CActor__Update_fix
exit:
	pop		eax
	sbb		eax, eax
	add		eax, 1
	push	eax
	jmp	back_from_CActor__Update_fix
CActor__Update_fix_old endp

CActor__Update_two_fix proc
;	mov		ecx, ds:Render
;	mov		ecx, [ecx]
;	mov		eax, [ecx]
;	mov		edx, [eax]
;	call	edx			; get_generation()
;	cmp		eax, 5Ah
;	jnz		exit
	mov		ecx, psDeviceFlags
	mov		ecx, [ecx]
	test	ecx, 80000h		;psR2
	jz		exit
	mov		eax, [edi+530h]
	test	eax, eax
	jnz		exit
	mov		eax, 1
	jmp	back_from_CActor__Update_two_fix
	
exit:
	push    esi
	mov     esi, eax
	call    sub_101DEE40
	jmp	back_from_CActor__Update_two_fix
CActor__Update_two_fix endp