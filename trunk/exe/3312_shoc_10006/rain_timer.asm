CEffectsRain__Render_rain_timer:
	; вырезанный кусок
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	sub     esp, 0F8h
	cmp     g_pGameLevel, 0 ; IGame_Level * g_pGameLevel
	push    ebx
	push    ebp
	push    esi
	push    edi
	mov     ebx, ecx
	jz      no_rain
	mov     eax, g_pGamePersistent
	mov     edi, [eax+46Ch]
	movss   xmm0, dword ptr [edi+1CCh]
	movss   xmm1, ds:EPS_L
	comiss  xmm1, xmm0
	ja      no_rain
	; идет дождь. Поехали :)
	; проверка на включение эффекта из скриптов
	movss	xmm2, rain_drops_switch
	comiss	xmm1, xmm2
	ja      exit_rain_with_reset
	; проверка на укрытие
	push    3               		; tgt (tgtBoth)
	lea     eax, [esp+18h]
	push    eax            			 ; range
	xorps	xmm2, xmm2
	movss	dword ptr [esp+20h], xmm2
	movss	dword ptr [esp+28h], xmm2
	fld1
	fstp	dword ptr [esp+24h]
	lea     ecx, [esp+20h]
	push    ecx            			; dir
	mov		eax, offset ds:Device
	mov		ecx, [eax+20Ch]
	mov		dword ptr [esp+3Ch], ecx
	mov		ecx, [eax+210h]
	mov		dword ptr [esp+40h], ecx
	mov		ecx, [eax+214h]
	mov		dword ptr [esp+44h], ecx
	lea     ecx, [esp+3Ch]
	movss   xmm2, max_distance
	push    ecx            			; pos
	mov     ecx, ebx       			; this
	movss   dword ptr [esp+24h], xmm2
	movss	dword ptr [esp+0C8h], xmm0	; вызов CEffect_Rain::RayPick портит xmm-регистры, сохраним
	call	CEffect_Rain__RayPick
	movss	xmm0, dword ptr [esp+0B8h]
	movss	xmm1, ds:EPS_L
	test	eax, eax
	jnz		under_cover
	; проверка на первый кадр с дождем
	cmp		rain_flag, 0
	jnz		short not_first_frame
	; если первый кадр, инициализируем штамп текущим значением глобального таймера
	mov		rain_flag, 1
	; вычисляем скорость забрызгивания стекла
	fld		rain_drop_time_basic
	fdiv	dword ptr [edi+1CCh]
	fstp	rain_drop_time
	; учтем время прошлого дождя, если оно есть add_delta_time = last_rain_duration - rain_timer - min(last_rain_duration, rain_drop_time)
	fld		timer					; st0 = timer
	movss	xmm2, rain_timer
	comiss	xmm1, xmm2
	jnb		fully_dry
	fld		last_rain_duration		; st1 = timer, st0 = last_rain_duration
	fsub	rain_timer				; st1 = timer, st0 = last_rain_duration - rain_timer
	fld		rain_drop_time			; st2 = timer, st1 = last_rain_duration - rain_timer, st0 = rain_drop_time
	fld		last_rain_duration		; st3 = timer, st2 = last_rain_duration - rain_timer, st1 = rain_drop_time, st0 = last_rain_duration
	fcomi	st, st(1)
	jnb		rain_drop_time_is_less_than_last_rain_duration
	fxch
	
rain_drop_time_is_less_than_last_rain_duration:
	fstp	last_rain_duration		; temp. st2 = timer, st1 = last_rain_duration - rain_timer, st0 = min(rain_drop_time, last_rain_duration)
	fsubp							; st1 = timer, st0 = last_rain_duration - rain_timer - min(rain_drop_time, last_rain_duration)
	fldz							; st2 = timer, st1 = llast_rain_duration - rain_timer - min(rain_drop_time, last_rain_duration), st0 = 0
	fcomip	st, st(1)				; st1 = timer, st0 = last_rain_duration - rain_timer - min(rain_drop_time, last_rain_duration)
	fstp	last_rain_duration				; st0 = timer
	jna		fully_dry				; jump if last_rain_duration >= rain_timer + min(rain_drop_time, last_rain_duration)
	fadd	last_rain_duration				; st0 = timer + last_rain_duration - rain_timer - min(rain_drop_time, last_rain_duration)

fully_dry:
	fstp	rain_timestamp
	fldz	
	fstp	last_rain_duration
	
not_first_frame:
	; проверяем, не отрицателен ли дождевой таймер, если отрицателен - обнуляем
	; такое может быть при первом кадре с дождем, если до этого дождь уже как-то раз был в текущей игровой сессии
	movss	xmm2, rain_timer
	comiss	xmm1, xmm2
	jna		short not_negative
	fldz	
	fstp	rain_timer
	
not_negative:
	; устанавливаем таймер дождя
	fld		timer
	fsub	rain_timestamp
	fstp	rain_timer
	jmp		exit_rain
	
no_rain:
	; если нет дождя, проверяем таймер на случай, если дождь только что закончился
	movss	xmm2, rain_timer
	comiss	xmm1, xmm2
	ja		exit_CEffectsRain__Render
	; если таймер не нулевой, уменьшаем его значение на время, прошедшее с предыдущего кадра
	fld		rain_timer
	fld		timer
	fsub	previous_frame_time
	fsubp
	fstp	rain_timer
	; обнуляем флаг первого кадра
	cmp		rain_flag, 0
	jz		short exit_no_rain
	mov		rain_flag, 0
	fld		timer
	fsub	rain_timestamp
	fstp	last_rain_duration
	
exit_no_rain:
	fld		timer
	fstp	previous_frame_time
	jmp		exit_CEffectsRain__Render
	
exit_rain_with_reset:
	mov		rain_flag, 0
	fldz
	fst		last_rain_duration
	fstp	rain_timer
	fld		timer
	fstp	rain_timestamp
	
exit_rain:
	fld		timer
	fstp	previous_frame_time
	jmp	back_to_CEffectsRain__Render_rain_timer
	
under_cover:
	; если нет дождя, проверяем таймер на случай, если дождь только что закончился
	movss	xmm2, rain_timer
	comiss	xmm1, xmm2
	ja		exit_rain
	; если таймер не нулевой, уменьшаем его значение на время, прошедшее с предыдущего кадра
	fld		rain_timer
	fld		timer
	fsub	previous_frame_time
	fsubp
	fstp	rain_timer
	; обнуляем флаг первого кадра
	cmp		rain_flag, 0
	jz		short exit_rain
	mov		rain_flag, 0
	fld		timer
	fsub	rain_timestamp
	fstp	last_rain_duration
	jmp		exit_rain
	
	
EPS_L dd 0.001
rain_drop_time_basic dd 20.0
max_distance dd 50.0
rain_timestamp dd 0
previous_frame_time dd 0
rain_flag dd 0