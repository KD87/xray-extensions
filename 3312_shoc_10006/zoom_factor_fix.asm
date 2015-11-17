zoom_factor_fix1 proc
	push    ecx
	mov     eax, [ecx+3ACh]
	cmp     eax, 2
	jnz     short loc_1021CAA5
	test    byte ptr [ecx+3A8h], 1
	jnz     short loc_1021CAAA

loc_1021CAA5:
	cmp     eax, 1
	jnz     short loc_1021CABC

loc_1021CAAA:
	movss   xmm0, dword ptr [ecx+3F0h]
	jmp		short final_calc

loc_1021CABC:
	movss   xmm0, dword ptr [ecx+3ECh]
	
final_calc:
	movss	xmm1, default_fov
	divss	xmm0, xmm1
	movss	xmm1, g_fov
	mulss	xmm0, xmm1
	movss   dword ptr [esp], xmm0
	fld     dword ptr [esp]
	pop     ecx
	retn
zoom_factor_fix1 endp

zoom_factor_fix2 proc
	movss	xmm3, dword ptr [ecx+3F0h]
	movss   xmm1, g_fov
	mulss	xmm3, xmm1
	movss	xmm1, default_fov
	divss	xmm3, xmm1
	movaps  xmm0, xmm1
	subss   xmm0, xmm3
	movaps  xmm2, xmm0
	mulss   xmm2, ds:dword_10459FB8
	mulss   xmm0, ds:dword_10459FAC
	mulss   xmm0, ds:dword_104D2410
	subss   xmm1, xmm2
	movss   xmm2, dword ptr [ecx+3E0h]
	subss   xmm2, xmm0
	movaps  xmm0, xmm2
	movss   dword ptr [ecx+3E0h], xmm2
	comiss  xmm3, xmm0
	jbe     short loc_102343DF
	movss   dword ptr [ecx+3E0h], xmm3
	retn

loc_102343DF:
	comiss  xmm0, xmm1
	jbe     short locret_102343EC
	movss   dword ptr [ecx+3E0h], xmm1

locret_102343EC:
	retn
zoom_factor_fix2 endp

zoom_factor_fix3 proc
	movss	xmm3, dword ptr [ecx+3F0h]
	movss   xmm1, g_fov
	mulss	xmm3, xmm1
	movss	xmm1, default_fov
	divss	xmm3, xmm1
	movaps  xmm0, xmm1
	subss   xmm0, xmm3
	movaps  xmm2, xmm0
	mulss   xmm0, ds:dword_10459FAC
	mulss   xmm2, ds:dword_10459FB8
	mulss   xmm0, ds:dword_104D2410
	addss   xmm0, dword ptr [ecx+3E0h]
	subss   xmm1, xmm2
	movss   dword ptr [ecx+3E0h], xmm0
	comiss  xmm3, xmm0
	jbe     short loc_10234448
	movss   dword ptr [ecx+3E0h], xmm3
	retn

loc_10234448:
	comiss  xmm0, xmm1
	jbe     short locret_10234455
	movss   dword ptr [ecx+3E0h], xmm1

locret_10234455:
	retn
zoom_factor_fix3 endp

zoom_factor_fix4 proc

	push    ecx
	mov     eax, [ecx+3B4h]
	cmp     eax, 2
	jnz     short loc_1022B404
	test    [ecx+3A8h], al
	jnz     short loc_1022B409

loc_1022B404:
	cmp     eax, 1
	jnz     short loc_1022B41A

loc_1022B409:
	cmp     byte ptr [ecx+958h], 0
	jz      short loc_1022B41A
	jmp		short loc_1022B445

loc_1022B41A:
	mov     eax, [ecx+3ACh]
	cmp     eax, 2
	jnz     short loc_1022B42E
	test    byte ptr [ecx+3A8h], 1
	jnz     short loc_1022B433

loc_1022B42E:
	cmp     eax, 1
	jnz     short loc_1022B445

loc_1022B433:
	movss   xmm0, dword ptr [ecx+3F0h]
	jmp		short final_calc

loc_1022B445:
	movss   xmm0, dword ptr [ecx+3ECh]
	
final_calc:
	movss	xmm1, default_fov
	divss	xmm0, xmm1
	movss	xmm1, g_fov
	mulss	xmm0, xmm1
	movss   dword ptr [esp], xmm0
	fld     dword ptr [esp]
	pop     ecx
	retn
zoom_factor_fix4 endp

default_fov dd 67.5

