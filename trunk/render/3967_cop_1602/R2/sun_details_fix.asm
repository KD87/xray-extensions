sun_details_1_fix proc near 
	;r2_sun flag
	test    byte ptr ps_r2_ls_flags, 1
	jz	short clear

	mov		ecx, bSUN
	test	ecx, ecx
	jz		short clear
	
	;r2_sun_details flag
	test    byte ptr ps_r2_ls_flags, 8
	jnz	short is_on

clear:
	mov     ecx, [edi+4]
	mov     eax, [edi]
	cmp     eax, ecx
	;уходим
	jz      back_to_sun_details_1_fix

	mov     esi, ecx
	sub     esi, ecx
	jle     short exit

	push    esi
	push    ecx
	push    eax
	call    ds:memmove
	add     esp, 0Ch
	add		eax, esi

	jmp	short exit
is_on:
	lea     ecx, [esp+0B8h]
	mov     eax, [ecx]
	sub     eax, [ecx+10h]
	and     eax, 1
	;уходим
	jz      back_to_sun_details_1_fix
	mov     eax, [edi]
	
exit:
	mov     [edi+4], eax
	jmp     back_to_sun_details_1_fix
sun_details_1_fix endp

sun_check:
	mov		eax,[ebp+54h]
	mov		bSUN, eax
	; делаем вырезанное
	mov     esi, 0Fh
	jmp		back_to_sun_check
	
bSUN dd 0