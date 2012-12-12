
shaders_mapping:

	;ss_params
	call    CBlender_Compile__r_Constant
	push    offset ss_params
	push    offset ss_name
	mov     ecx, edi 

	;weapon_params
	call    CBlender_Compile__r_Constant
	push    offset weapon_params
	push    offset weapon_name
	mov     ecx, edi 	

	;common_params
	call    CBlender_Compile__r_Constant
	push    offset common_params
	push    offset common_name
	mov     ecx, edi 	
		
	; делаем то, что вырезали
	call    CBlender_Compile__r_Constant ; CBlender_Compile::r_Constant(char const *,R_constant_setup *)
	jmp		back_to_shaders_mapping
	
ss_name db "sunshafts_params", 0
ss_vfptr dd offset ss_setup
ss_params dd offset ss_vfptr

weapon_name db "weapon_params", 0
weapon_vfptr dd offset weapon_setup
weapon_params dd offset weapon_vfptr

common_name db "common_params", 0
common_vfptr dd offset common_setup
common_params dd offset common_vfptr

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Параметры саншафтов
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ss_setup proc
	mov     ecx, [esp+4]
	test    ecx, ecx
	jz      mapping_exit
	
; вычисление константы	

	movss   xmm0, sunshafts_exposure	;x
	xorps   xmm1, xmm1					;y
	xorps   xmm2, xmm2					;z
	xorps   xmm3, xmm3					;w
; регистрация константы в системе 
REGISTER_CONSTANT_VECTOR
mapping_exit:
	retn	4
ss_setup endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Оружейные параметры
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

weapon_setup proc
	mov     ecx, [esp+4]
	test    ecx, ecx
	jz      mapping_exit
	
; вычисление константы	
	; зум моуд у нас в виде int, нельзя его напрямую загружать в xmm
	; спасибо Саше, навел на мысль про fpu
	
	fild    zoom_mode		; zoom_mode
	fstp	zoom_mode_float
	fild    weapon_state		; weapon_state
	fstp	weapon_state_float
	fild    prev_weapon_state		; previuos weapon_state
	fstp	prev_weapon_state_float
	
	movss   xmm0, zoom_mode_float			;x
	movss   xmm1, weapon_state_float		;y
	movss   xmm2, prev_weapon_state_float	;z
	movss   xmm3, weapon_state_timer		;w

; регистрация константы в системе 
REGISTER_CONSTANT_VECTOR
mapping_exit:
	retn	4
weapon_setup endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Общие параметры
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

common_setup proc
	mov     ecx, [esp+4]
	test    ecx, ecx
	jz      mapping_exit
	
; вычисление константы	
	mov		eax, offset ds:Device	;CRenderDevice *Device
	mov		eax, [eax+100h]		;Device->dwWidth
	mov		wdth, eax
	fild    wdth				; width
	fstp	width_float
	movss   xmm0, width_float		;x
	
	mov		eax, offset ds:Device	;CRenderDevice *Device
	mov		eax, [eax+104h]		;Device->dwHeight
	mov		hght, eax
	fild    hght				; height
	fstp	height_float
	movss   xmm1, height_float		;y
	
	xorps   xmm2, xmm2				;z
	xorps   xmm3, xmm3				;w

; регистрация константы в системе 
REGISTER_CONSTANT_VECTOR
mapping_exit:
	retn	4
common_setup endp

; нужные константы
wdth dd 0
hght dd 0
width_float dd 0
height_float dd 0
zoom_mode dd 0
zoom_mode_float dd 0
weapon_state dd 0
weapon_state_float dd 0
prev_weapon_state dd 0
prev_weapon_state_float dd 0
weapon_state_timer dd 0
aF dd "%f", 0