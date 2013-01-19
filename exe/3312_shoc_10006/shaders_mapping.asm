
shaders_mapping:

	;ss_params
	call    CBlender_Compile__r_Constant
	push    offset ss_params
	push    offset ss_name
	mov     ecx, edi 

	;weapon_states
	call    CBlender_Compile__r_Constant
	push    offset weapon_states
	push    offset weapon_s_name
	mov     ecx, edi 	

	;weapon_timers
	call    CBlender_Compile__r_Constant
	push    offset weapon_timers
	push    offset weapon_t_name
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

weapon_s_name db "weapon_states", 0
weapon_s_vfptr dd offset weapon_s_setup
weapon_states dd offset weapon_s_vfptr

weapon_t_name db "weapon_timers", 0
weapon_t_vfptr dd offset weapon_t_setup
weapon_timers dd offset weapon_t_vfptr

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

weapon_s_setup proc
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
	fild    prev_weapon_state		; previous weapon_state
	fstp	prev_weapon_state_float
	
	movss   xmm0, zoom_mode_float			;x
	movss   xmm1, weapon_state_float		;y
	movss   xmm2, prev_weapon_state_float	;z
	xorps   xmm3, xmm3		;w

; регистрация константы в системе 
REGISTER_CONSTANT_VECTOR
mapping_exit:
	retn	4
weapon_s_setup endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Оружейные таймеры
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

weapon_t_setup proc
	mov     ecx, [esp+4]
	test    ecx, ecx
	jz      mapping_exit
	
; вычисление константы	

	movss   xmm0, weapon_state_timer			;x
	movss   xmm1, weapon_prev_state_time		;y
	movss   xmm2, heating_value					;z
	xorps   xmm3, xmm3		;w

; регистрация константы в системе 
REGISTER_CONSTANT_VECTOR
mapping_exit:
	retn	4
weapon_t_setup endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Общие параметры
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
	
	fld		dword ptr [eax+33Ch]	;Device.fFOV
	fld		to_rad
	fmulp
	fstp	ffov
	movss   xmm2, ffov				;z
	
	movss   xmm3, dword ptr [eax+340h]		;w, 	;Device.fASPECT

; регистрация константы в системе 
REGISTER_CONSTANT_VECTOR
mapping_exit:
	retn	4
common_setup endp

; нужные константы
dumb_one dd 1.0
width_float dd 0
height_float dd 0
zoom_mode dd 0
zoom_mode_float dd 0
weapon_state dd 0
weapon_state_float dd 0
prev_weapon_state dd 0
prev_weapon_state_float dd 0
weapon_state_timer dd 0
weapon_prev_state_time dd 0
heating_value dd 0
ffov dd 0.0
to_rad dd 0.017453292
aF dd "%f", 0