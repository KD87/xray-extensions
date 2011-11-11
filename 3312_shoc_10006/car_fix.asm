float_car_exit_distance dd 5.0

car_fix proc
	; делаем то, что вырезали
	mov     al, [edi+2B2h]
	; делаем то, что нам надо
; добавляем своё
	push    edi
	push    esi
	push    eax
	push    ebx
	push    ecx
	push    edx
	
; вызываем скриптовый колбек на смерть
	push    8h ; type = death
	mov     ecx, edi ; ecx = this
	call    CGameObject__callback ; eax = hit_callback
	xor     ecx, ecx
	push    ecx
	push    ecx
	push    eax ; callback

	call    script_death_callback

	pop     edx
	pop     ecx
	pop     ebx
	pop     eax
	pop     esi
	pop     edi

	; идём обратно
	jmp     back_from_car_fix

car_fix endp
