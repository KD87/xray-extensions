; фикс для корректного использования rain_color
envdescriptor_hack_rain_color_fix:
	mov		eax, [edi+1D0h]
	push	eax
	mov     eax, [eax]
	add     ecx, 40h
	mov     [esp+34h], eax
	pop		eax
	movss   xmm2, dword ptr [esp+30h]
	sar     ecx, 1Fh
	and     edx, ecx
	mov     ecx, [eax+4h]
	xor     edx, esi
	mov     [esp+20h], edx
	mov     edx, [eax+8h]
	jmp back_to_envdescriptor_hack_rain_color_fix