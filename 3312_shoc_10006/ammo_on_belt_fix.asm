	; отключаем возврат указателя на рюкзак, если консольная команда включена и ищем у актора
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

	; блокируем поиск патронов в рюкзаке, если консольная команда включена и ищем у актора
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
	
	; вызываем нужную функцию поиска гранат данного типа, если консольная команда включена и ищем у актора 
CInventory__LookForGrenade:
	test    ds:g_ammo_on_belt, 1
	jz      short lfg_ruck
	push	edi
	mov     edi, g_Actor
	mov     edi, [edi+298h]		
	cmp     edi, eax
	pop		edi
	jnz     short lfg_ruck
	call	CInventory__SameInBelt
	jmp		short lfg_exit
lfg_ruck:
	call	CInventory__Same
lfg_exit:
	jmp back_to_CInventory__LookForGrenade

		; вызываем нужную функцию поиска любых гранат, если консольная команда включена и ищем у актора 
CInventory__LookForAnyGrenade:
	test    ds:g_ammo_on_belt, 1
	jz      short lfag_ruck
	push	edi
	mov     edi, g_Actor
	mov     edi, [edi+298h]		
	cmp     edi, ebx
	pop		edi
	jnz     short lfag_ruck
	call	CInventory__SameSlotInBelt
	jmp		short lfag_exit
lfag_ruck:
	call	CInventory__SameSlot
lfag_exit:
	jmp back_to_CInventory__LookForAnyGrenade

	; функция поиска гранат такого же типа, что и pIItem, на поясе
CInventory__SameInBelt proc near
var_4           = dword ptr -4
i               = dword ptr  4
pIItem          = dword ptr  8

	push    ecx
	mov     ecx, [esp+4+i]
	mov     edx, [ecx+28h]
	push    ebx
	push    ebp
	xor     eax, eax
	cmp     [ecx+2Ch], edx
	push    esi
	mov     [esp+10h+var_4], eax
	push    edi
	mov     [esp+14h+var_4], edx
	jz      exit_fail				; size() == 0
	mov     edi, [esp+14h+i]
	mov     esi, [esp+14h+i]
loc_10205C47:                          
	mov     ebp, [edx]
	mov     ecx, [esp+14h+pIItem]
	cmp     ebp, ecx
	jz      short loc_10205CC7
	mov     ecx, [ecx+0D4h]
	mov     ecx, [ecx+0ACh]
	or      eax, 3
	test    ecx, ecx
	jz      short loc_10205C67
	add     dword ptr [ecx], 1
loc_10205C67:               
	mov     esi, [ebp+0D4h]
	mov     esi, [esi+0ACh]
	test    esi, esi
	mov     edi, ecx
	jz      short loc_10205C7C
	add     dword ptr [esi], 1
loc_10205C7C:                         
	cmp     esi, ecx
	jz      short loc_10205CC3
	test    ecx, ecx
	jz      short loc_10205C89
	lea     edx, [ecx+0Ch]
	jmp     short loc_10205C8B
loc_10205C89:                   
	xor     edx, edx
loc_10205C8B:                    
	test    esi, esi
	jz      short loc_10205C94
	lea     ecx, [esi+0Ch]
	jmp     short loc_10205C96
loc_10205C94:   
	xor     ecx, ecx
loc_10205C96:      
	mov     bl, [ecx]
	cmp     bl, [edx]
	jnz     short loc_10205CB6
	test    bl, bl
	jz      short loc_10205CB2
	mov     bl, [ecx+1]
	cmp     bl, [edx+1]
	jnz     short loc_10205CB6
	add     ecx, 2
	add     edx, 2
	test    bl, bl
	jnz     short loc_10205C96
loc_10205CB2:            
	xor     ecx, ecx
	jmp     short loc_10205CBB
loc_10205CB6:                   
	sbb     ecx, ecx
	sbb     ecx, 0FFFFFFFFh
loc_10205CBB:                     
	test    ecx, ecx
	mov     edx, [esp+14h+var_4]
	jnz     short loc_10205CC7
loc_10205CC3:                     
	mov     cl, 1
	jmp     short loc_10205CC9
loc_10205CC7:                      
	xor     cl, cl
loc_10205CC9:                     
	test    al, 2
	jz      short loc_10205CDB
	and     eax, 0FFFFFFFDh
	test    esi, esi
	jz      short loc_10205CDB
	add     dword ptr [esi], 0FFFFFFFFh
	jnz     short loc_10205CDB
	xor     esi, esi
loc_10205CDB:                         
	test    al, 1
	jz      short loc_10205CED
	and     eax, 0FFFFFFFEh
	test    edi, edi
	jz      short loc_10205CED
	add     dword ptr [edi], 0FFFFFFFFh
	jnz     short loc_10205CED
	xor     edi, edi
loc_10205CED:                        
	test    cl, cl
	jnz     short exit_succses
	mov     ecx, [esp+14h+i]
	add     edx, 4
	cmp     [ecx+2Ch], edx
	mov     [esp+14h+var_4], edx
	jnz     loc_10205C47
exit_fail:    
	pop     edi
	pop     esi
	pop     ebp
	xor     eax, eax
	pop     ebx
	pop     ecx
	retn    8
exit_succses:                    
	pop     edi
	pop     esi
	mov     eax, ebp
	pop     ebp
	pop     ebx
	pop     ecx
	retn    8
CInventory__SameInBelt endp

	; функция поиска гранат любого типа на поясе
CInventory__SameSlotInBelt proc near
slot            = dword ptr  4		; slot id
pIItem          = dword ptr  8		; already used item

	push    ebp
	mov     ebp, [esp+4+pIItem]
	push    esi
	mov     esi, [ebx+28h]
	cmp     [ebx+2Ch], esi
	push    edi
	jz      short exit_fail
	nop
cycle:                       
	mov     edi, [esi]
	cmp     edi, ebp
	jz      short same_item
	mov     eax, [edi]
	mov     edx, [eax+0A4h]
	mov     ecx, edi
	call    edx
	cmp     eax, [esp+0Ch+slot]
	jz      short exit_succses
same_item:                    
	add     esi, 4
	cmp     [ebx+2Ch], esi
	jnz     short cycle
exit_fail:                      
	pop     edi
	pop     esi
	xor     eax, eax
	pop     ebp
	retn    8
exit_succses:                  
	mov     eax, edi
	pop     edi
	pop     esi
	pop     ebp
	retn    8
CInventory__SameSlotInBelt endp

grenade_counter_fix:
	test    ds:g_ammo_on_belt, 1
	jz      short gcf_exit
	mov     edi, g_Actor
	mov     edi, [edi+298h]		
	cmp     edi, ecx
	jnz     short gcf_exit	
	test	byte ptr [esp+14h], 2
	jz		short gcf_exit
	lea     ebp, [ecx+24h]
gcf_exit:
	mov     edi, [ebp+4]
	cmp     [ebp+8], edi
	jmp	back_to_grenade_counter_fix
	
grenade_counter_fix1:
	test    ds:g_ammo_on_belt, 1
	jz      short gcf1_exit
	push	edi
	mov		edi, g_Actor
	mov     edi, [edi+298h]		
	cmp     edi, ecx
	pop		edi
	jnz     short gcf1_exit	
	push    2
	push    eax
	mov     eax, [edx+4]
	call    eax
	add		eax, 1			; add one in slot
	jmp	back_to_grenade_counter_fix1	
gcf1_exit:
	push    1
	push    eax
	mov     eax, [edx+4]
	call    eax
	jmp	back_to_grenade_counter_fix1