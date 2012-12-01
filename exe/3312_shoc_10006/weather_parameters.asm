test_weather:
	mov		esi, [ebp+2ACh]	; CurrentCycleName
	mov		ebx, [esi+04h]
	push	ebx
	push	offset message
	call	ds:Msg
	mov		ecx, ds:pSettings
	mov		ecx, [ecx]
	push 	offset aSSIntense
	push	esi
	call    ds:CInifile__r_float ; CInifile::r_float(char const *,char const *)
	fstp    dword ptr [weather_ss_intensity]
	pop     esi
	pop     ebp
	pop     ebx
	add     esp, 8
	retn    8
	
aSunShafts db "sun_shafts_intensity", 0
message db "current cycle name length is %d", 0