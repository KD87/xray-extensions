
; unsigned int SlotsToCheck[7]
SlotsToCheck    dd 0, 1, 2, 3, 4, 5, 0Ah

CActor__OnNextWeaponSlot proc
	push    esi
	cmp     g_mouse_wheel_sc, 0
	jz      loc_101DEF31
	mov     esi, [ecx+298h]
	mov     edx, [esi+48h]
	cmp     edx, 0FFFFFFFFh
	jnz     short loc_101DEEB9
	mov     edx, [esi+50h]
	cmp     edx, 0FFFFFFFFh
	jnz     short loc_101DEEB9
	xor     edx, edx

loc_101DEEB9:
	xor     eax, eax
	jmp     short loc_101DEEC0

loc_101DEEC0:
	cmp     SlotsToCheck[eax*4], edx
	jz      short loc_101DEED3
	add     eax, 1
	cmp     eax, 7
	jb      short loc_101DEEC0
	pop     esi
	retn

loc_101DEED3:
	cmp     eax, 7
	jnb     short loc_101DEF31
	add     eax, 1
	cmp     eax, 7
	jnb     short loc_101DEF31
	mov     edx, [esi+38h]
	jmp     short loc_101DEEF0

loc_101DEEF0:
	mov     esi, SlotsToCheck[eax*4]
	shl     esi, 4
	cmp     dword ptr [esi+edx+4], 0
	jnz     short loc_101DEF0B
	add     eax, 1
	cmp     eax, 7
	jb      short loc_101DEEF0
	pop     esi
	retn

loc_101DEF0B:
	add     ecx, 238h
	cmp     SlotsToCheck[eax*4], 0Ah
	jnz     short loc_101DEF26
	mov     eax, [ecx]
	mov     edx, [eax+20h]
	push    1Eh
	call    edx
	pop     esi
	retn

loc_101DEF26:
	mov     edx, [ecx]
	add     eax, 18h
	push    eax
	mov     eax, [edx+20h]
	call    eax

loc_101DEF31:
	pop     esi
	retn
CActor__OnNextWeaponSlot endp


CActor__OnPrevWeaponSlot proc
	push    esi
	cmp     g_mouse_wheel_sc, 0
	jz      loc_101DEFBE
	mov     esi, [ecx+298h]
	mov     edx, [esi+48h]
	cmp     edx, 0FFFFFFFFh
	jnz     short loc_101DEF59
	mov     edx, [esi+50h]
	cmp     edx, 0FFFFFFFFh
	jnz     short loc_101DEF59
	xor     edx, edx

loc_101DEF59:
	xor     eax, eax
	jmp     short loc_101DEF60

loc_101DEF60:
	cmp     SlotsToCheck[eax*4], edx
	jz      short loc_101DEF73
	add     eax, 1
	cmp     eax, 7
	jb      short loc_101DEF60
	pop     esi
	retn

loc_101DEF73:
	cmp     eax, 7
	jnb     short loc_101DEFBE
	add     eax, 0FFFFFFFFh
	js      short loc_101DEFBE
	mov     edx, [esi+38h]

loc_101DEF80:
	mov     esi, SlotsToCheck[eax*4]
	shl     esi, 4
	cmp     dword ptr [esi+edx+4], 0
	jnz     short loc_101DEF98
	sub     eax, 1
	jns     short loc_101DEF80
	pop     esi
	retn

loc_101DEF98:
	add     ecx, 238h
	cmp     SlotsToCheck[eax*4], 0Ah
	jnz     short loc_101DEFB3
	mov     eax, [ecx]
	mov     edx, [eax+20h]
	push    1Eh
	call    edx
	pop     esi
	retn

loc_101DEFB3:
	mov     edx, [ecx]
	add     eax, 18h
	push    eax
	mov     eax, [edx+20h]
	call    eax

loc_101DEFBE:
	pop     esi
	retn
CActor__OnPrevWeaponSlot endp
