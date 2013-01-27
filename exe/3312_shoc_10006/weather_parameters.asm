switch_parameters:
	push	eax
	push	edi
	mov		eax, [esp+20h]	; shared_str
	test	eax, eax	; str_value
	jz		short end_of_weather_parameters
	lea		edi, [eax+0Ch]
	
	mov     eax, ds:pSettings ; CInifile * pSettings
	mov     eax, [eax]     ; _DWORD
	push	edi ;
	push    offset aWeathers
	call	ds:CInifile__r_string
	push	eax
	push	offset aMsg
	call	Msg
	add		esp, 8
	
	mov     eax, ds:pSettings ; CInifile * pSettings
	mov     eax, [eax]     ; _DWORD
	push	offset aSunShafts ; "sun_shafts"
	push    edi
	call	ds:CInifile__r_float
	fstp	ds:sun_shafts_weather_defined
	mov     eax, ds:pSettings ; CInifile * pSettings
	mov     eax, [eax]     ; _DWORD
	push	offset aRainDrop ; "rain_max_drop_angle"
	push    edi
	call	ds:CInifile__r_float
	fld		ds:radian
	fmulp	
	fstp	ds:drop_max_angle

end_of_weather_parameters:
	pop		edi
	pop		eax
	
	; делаем вырезанное
	cmp     esi, ebx
	jz      short switch_parameters_exit
	add     dword ptr [esi], 0FFFFFFFFh
	
switch_parameters_exit:
	jmp	back_to_switch_parameters
	
aSunShafts db "sun_shafts", 0
aRainDrop db "rain_max_drop_angle", 0
aWeathers db "weathers", 0
aMsg db "%s", 0
radian dd 0.01745329252