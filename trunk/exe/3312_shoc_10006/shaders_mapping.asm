
shaders_mapping:

	;ss_params
	call    CBlender_Compile__r_Constant
	push    offset ss_params
	push    offset ss_name
	mov     ecx, edi 
		
	;common_params
	call    CBlender_Compile__r_Constant
	push    offset common_params
	push    offset common_name
	mov     ecx, edi 	
		
	;common_params2
	call    CBlender_Compile__r_Constant
	push    offset common_params2
	push    offset common_name2
	mov     ecx, edi 	
	
	;script_params
	call    CBlender_Compile__r_Constant
	push    offset script_params
	push    offset script_params_name
	mov     ecx, edi 	
	
	; делаем то, что вырезали
	call    CBlender_Compile__r_Constant ; CBlender_Compile::r_Constant(char const *,R_constant_setup *)
	jmp		back_to_shaders_mapping
	
ss_name db "sunshafts_params", 0
ss_vfptr dd offset ss_setup
ss_params dd offset ss_vfptr

common_name2 db "common_params2", 0
common_vfptr2 dd offset common_setup2
common_params2 dd offset common_vfptr2

common_name db "common_params", 0
common_vfptr dd offset common_setup
common_params dd offset common_vfptr

script_params_name db "script_params", 0
script_vfptr dd offset script_setup
script_params dd offset script_vfptr

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ѕараметры саншафтов
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ss_setup proc
	mov     ecx, [esp+4]
	test    ecx, ecx
	jz      mapping_exit
	
; вычисление константы	
	
	mov		eax, ds:g_pGamePersistent
	mov		eax, [eax+46Ch]	;pEnvironment
	mov		eax, [eax+1D0h]
	movss   xmm0, dword ptr [eax+0Ch]	;x
	movss   xmm1, dword ptr [eax+10h]	;y
;	xorps   xmm0, xmm0					;z
;	xorps   xmm1, xmm1					;z
	xorps   xmm2, xmm2					;z
	xorps   xmm3, xmm3					;w
; регистраци€ константы в системе 
REGISTER_CONSTANT_VECTOR
mapping_exit:
	retn	4
ss_setup endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ќбщие параметры
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

common_setup proc
	mov     ecx, [esp+4]
	test    ecx, ecx
	jz      mapping_exit
	
; вычисление константы	
	mov		eax, offset ds:Device	;CRenderDevice *Device
	fild	dword ptr [eax+100h]	;Device.dwWidth
	fstp	width_float
	movss   xmm0, width_float		;x
	
	fild	dword ptr [eax+104h]	;Device.dwHeight	
	fstp	height_float
	movss   xmm1, height_float		;y
	
	fld1
	fdiv	width_float				;Device.dwWidth
	fstp	inv_width
	movss   xmm2, inv_width			;z
	
	fld1
	fdiv	height_float			;Device.dwHeight
	fstp	inv_height
	movss   xmm3, inv_height		;w

; регистраци€ константы в системе 
REGISTER_CONSTANT_VECTOR
mapping_exit:
	retn	4
common_setup endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ќбщие параметры 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

common_setup2 proc
	mov     ecx, [esp+4]
	test    ecx, ecx
	jz      mapping_exit
	
; вычисление константы	
	mov		eax, offset ds:Device	;CRenderDevice *Device
	fld		dword ptr [eax+33Ch]	;Device.fFOV
	fmul	to_rad
	fstp	ffov
	movss   xmm0, ffov				;x
	
	movss   xmm1, dword ptr [eax+340h]		;y, 	;Device.fASPECT
	
	xorps   xmm2, xmm2					;z
	xorps   xmm3, xmm3					;w
	
; регистраци€ константы в системе 
REGISTER_CONSTANT_VECTOR
mapping_exit:
	retn	4
common_setup2 endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ѕараметры, передаваемые из скриптов
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

script_setup proc
	mov     ecx, [esp+4]
	test    ecx, ecx
	jz      mapping_exit
	
; вычисление константы	

	movss   xmm0, sunshafts_exposure	;x
	movss   xmm1, sunshafts_density		;y
	xorps   xmm2, xmm2					;z
	xorps   xmm3, xmm3					;w
; регистраци€ константы в системе 
REGISTER_CONSTANT_VECTOR
mapping_exit:
	retn	4
script_setup endp


; нужные константы
sun_shafts_weather_defined dd 1.0
dumb_one dd 1.0
width_float dd 0
height_float dd 0
inv_width dd 0
inv_height dd 0
ffov dd 0.0
to_rad dd 0.017453292
aF dd "%f", 0