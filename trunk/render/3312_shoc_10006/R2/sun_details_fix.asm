sun_details_1_fix proc near 
	;r2_sun flag
	test    byte ptr ps_r2_ls_flags, 1
	jz	short clear

	;r2_sun_details flag
	test    byte ptr ps_r2_ls_flags, 8
	jnz	short is_on

clear:
	mov     ecx, [ebp+8]
	mov     esi, [ebp+4]
	cmp     esi, ecx
	;уходим
	jz      back_to_sun_details_1_fix

	mov     eax, ecx
	sub     eax, ecx
	sar     eax, 2
	test    eax, eax
	lea     edx, ds:0[eax*4]
	lea     ebx, [edx+esi]
	jle     short exit

	push    edx
	push    ecx
	push    edx
	push    esi
	call    ds:memmove_s
	add     esp, 10h

	jmp	short exit
is_on:
	lea     ecx, [esp+94h]
	mov     eax, [ecx]
	sub     eax, [ecx+14h]
	and     eax, 0Fh
	;уходим
	jz      back_to_sun_details_1_fix

	mov     ebx, [ebp+4]
exit:
	mov     [ebp+8], ebx
	jmp     back_to_sun_details_1_fix
sun_details_1_fix endp