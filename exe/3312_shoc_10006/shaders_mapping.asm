
shaders_mapping:

	;ss_params
	call    CBlender_Compile__r_Constant
	push    offset ss_params
	push    offset ss_name
	mov     ecx, edi 

	;zoom_dof_params
	call    CBlender_Compile__r_Constant
	push    offset zoom_dof_params
	push    offset zoom_dof_name
	mov     ecx, edi 	
	
	; делаем то, что вырезали
	call    CBlender_Compile__r_Constant ; CBlender_Compile::r_Constant(char const *,R_constant_setup *)
	jmp		back_to_shaders_mapping
	
ss_name db "sunshafts_params", 0
ss_vfptr dd offset ss_setup
ss_params dd offset ss_vfptr

zoom_dof_name db "zoom_dof_params", 0
zoom_dof_vfptr dd offset zoom_dof_setup
zoom_dof_params dd offset zoom_dof_vfptr

; метод для обновления констант риалтайм
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
REGISTER_CONSTANT
mapping_exit:
	retn	4
ss_setup endp

; метод для обновления констант риалтайм
zoom_dof_setup proc
	mov     ecx, [esp+4]
	test    ecx, ecx
	jz      mapping_exit
	
; вычисление константы	
	; зум моуд у нас в виде int, нельзя его напрямую загружать в xmm
	; спасибо Саше, навел на мысль про fpu
	
	fild    zoom_mode		; zoom_mode
	fstp	zoom_mode_float
	
	movss   xmm0, zoom_mode_float		;x
	xorps   xmm1, xmm1					;y
	xorps   xmm2, xmm2					;z
	xorps   xmm3, xmm3					;w

; регистрация константы в системе 
REGISTER_CONSTANT
mapping_exit:
	retn	4
zoom_dof_setup endp

zoom_mode dd 0
zoom_mode_float dd 0
aF dd "%f", 0