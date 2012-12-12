CInventory__Get:                           ; CODE XREF: sub_101E8160+11j
	test    ds:g_ammo_on_belt, 1			; значение консольной команды-флага
	jz      short CInventory__Get_lab1
	mov     ecx, g_Actor
	mov     ecx, [ecx+298h]		
	cmp     eax, ecx
	jz      short CInventory__Get_exit
CInventory__Get_lab1:                           ; CODE XREF: sub_101E8160+3E2D74j
	add     eax, 14h
	jmp     back_to_CInventory__Get ;loc_10205D79
CInventory__Get_exit:                           ; CODE XREF: sub_101E8160+3E2D84j
	pop     edi
	pop     esi
	pop     ebp
	xor     eax, eax
	pop     ebx
	pop     ecx
	retn    8

CWeapon__GetCurrentAmmo:                           ; CODE XREF: sub_101FD360+F2j
	test    ds:g_ammo_on_belt, 1
	jz      short CWeapon__GetCurrentAmmo_lab2
	mov     edi, g_Actor
	mov     edi, [edi+298h]		
	cmp     eax, edi
	jz      CWeapon__GetCurrentAmmo_not_inventory_owner ;1021C2BA
CWeapon__GetCurrentAmmo_lab2:                           ; CODE XREF: sub_101FD360+3CDBA2j
	mov     edi, [eax+18h]
	cmp     [eax+1Ch], edi
	jmp     CWeapon__GetCurrentAmmo_not_ammo_on_belt	;1021C26C
	
	
get_grenade: ;10206316
	cmp		ecx, 0
	jz		no_belt
	mov     eax, [ecx+28h]
	push    esi
	movzx   esi, word ptr [edx+0A4h]
	jmp		back_to_get_grenade ;10206321
no_belt:
	xor		eax, eax
	retn
	