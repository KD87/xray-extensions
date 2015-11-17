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

; передаем объект машины в колбек
	call    CGameObject__lua_game_object
	push    0 ; who
	push    eax ; victim

; вызываем скриптовый колбек на смерть
	push    8h ; type = death
	mov     ecx, edi ; ecx = this
	call    CGameObject__callback ; eax = hit_callback
	xor     ecx, ecx
	;push    ecx
	;push    ecx
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

;g_marker db "marker_marker", 0
car_panel_fix proc
	mov     ecx, ds:g_pGameLevel
	mov     edx, [ecx]
	mov     ecx, [edx+148h]
	mov     eax, [ecx]
	mov     edx, [eax+18h]
	call    edx
	mov     eax, [eax+38h]
	lea     ecx, [eax+0C74h]
	mov     eax, [ecx]
	mov     edx, [eax+7Ch]
	;push    1
	;mov     eax, [g_car_panel_visible]
	push    [g_car_panel_visible]
	;
	call    edx
	jmp     back_from_car_panel_fix
car_panel_fix endp
