override_set_mapping proc
	push	ecx
	mov		ecx, psDeviceFlags
	test	ecx, 80000h		;psR2
	pop		ecx
	jz		exit_1
	jmp		g_CBlender_Compile__SetMapping
	
exit_1:
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	jmp		back_to_set_mapping
override_set_mapping endp
	
override_updatecl proc
	push	ecx
	mov		ecx, psDeviceFlags
	test	ecx, 80000h		;psR2
	pop		ecx
	jz		exit_2
	jmp		g_CObject__UpdateCL
	
exit_2:	
	push    ecx
	fld     ds:__real
	push    esi
	jmp		back_to_updatecl
override_updatecl endp
	
cer__Render proc
	push	ecx
	mov		ecx, psDeviceFlags
	test	ecx, 80000h		;psR2
	pop		ecx
	jz		exit_3
	
;	push	ecx
;	mov		ecx, ds:Render
;	mov		eax, [ecx]
;	mov		edx, [eax]
;	call	edx			; get_generation()
;	pop		ecx
;	cmp		eax, 5Ah	
;	jnz		cer__Render_exit
	jmp		g_CEffect_Rain__Render
	
exit_3:
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	jmp		back_to_cer__Render
cer__Render endp
	
__real dd 0.25