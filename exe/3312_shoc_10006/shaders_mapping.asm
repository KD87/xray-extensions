
shaders_mapping:

	;ss_params
	call    CBlender_Compile__r_Constant
	push    offset ss_params
	push    offset ss_name
	mov     ecx, edi 

	; делаем то, что вырезали
	call    CBlender_Compile__r_Constant ; CBlender_Compile::r_Constant(char const *,R_constant_setup *)
	jmp		back_to_shaders_mapping
	
ss_name db "ss_params", 0
ss_vfptr dd offset ss_setup
ss_params dd offset ss_vfptr

; метод для обновления констант риалтайм
ss_setup proc near
	mov     ecx, [esp+4]
	test    ecx, ecx
	jz      mapping_exit
	
; вычисление константы	

	movss   xmm0, sunshafts_exposure	;x
	
;	push	eax
;	push	ecx
;	mov		eax, ds:g_GamePersistent
;	mov		eax, [eax+46Ch]	; pEnvironment
;	mov		eax, [eax+2ACh]	; CurrentCycleName
;	mov		ecx, ds:pSettings
;	mov		ecx, [ecx]
;	push 	offset aSSIntense
;	push	eax
;	call    ds:CInifile__r_float ; CInifile::r_float(char const *,char const *)
;	fstp    dword ptr [weather_ss_intensity]
	xorps	xmm1, xmm1	;y
;	pop		ecx
;	pop		eax	

	xorps   xmm2, xmm2					;z
	xorps   xmm3, xmm3					;w
; регистрация константы в системе 
REGISTER_CONSTANT
mapping_exit:
	retn	4
ss_setup endp

aSSIntense db "sun_shafts_intensity", 0
weather_ss_intensity dd ?
