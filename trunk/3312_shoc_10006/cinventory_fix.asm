CInventory__CInventory_fix proc
	xor     eax, eax
	mov     [esi+60h], eax ; обнуляем m_pOwner
	
	; делаем то, что вырезали
	mov     eax, esi
	pop     ebx
	add     esp, 110h
	retn
CInventory__CInventory_fix endp

CInventory__Take_fix proc
	; делаем то, что вырезали
	mov     ecx, [ebx+60h]
	cmp     ecx, ecx
	jz      skip
	mov     eax, [ecx]
	mov     edx, [eax+0B4h]
	push    ebp
	call    edx
skip:
	; идём обратно
	jmp back_from_CInventory__Take_fix
CInventory__Take_fix endp

CInventory__Ruck_fix proc
	; делаем то, что вырезали
	mov     ecx, [esi+60h]
	cmp     ecx, ecx ; 
	jz      skip
	mov     eax, [ebp+98h]
	mov     edx, [ecx]
	mov     edx, [edx+0BCh]
	push    eax
	push    ebp
	call    edx
skip:
	; идём обратно
	jmp back_from_CInventory__Ruck_fix
CInventory__Ruck_fix endp

CInventory__DropItem_fix proc
	; делаем то, что вырезали
	mov     ecx, [esi+60h]
	cmp     ecx, ecx ; 
	jz      skip
	mov     edx, [ecx]
	push    eax
	mov     eax, [edx+0C4h]
	call    eax
skip:
	; идём обратно
	jmp back_from_CInventory__DropItem_fix
CInventory__DropItem_fix endp


CInventory__Eat_fix proc
var_2018        = dword ptr -2018h
;var_2014        = dword ptr -2014h
;var_2010        = word ptr -2010h
;var_10          = dword ptr -10h
this_           = dword ptr  4

	;PRINT "inventory_use"
	; сохраняем регистры
	push    ecx
	push    eax
	push    edx
	push    edi
	push    ebp
	; вызываем колбек на предиспользование предмета
	mov     ecx, ds:g_pGamePersistent
	mov     edx, [ecx]
	mov     eax, [edx+424h]
	;PRINT_UINT "game_type: %x", eax
	cmp     eax, 1
	jz     single_game
	test    eax, eax
	jnz     do_not_call ; not_single_game
single_game:
	;PRINT "single"
	mov     eax, [esp+2028h+this_ + 20] ; this == inventory
	mov     ecx, g_actor
	cmp     [ecx+298h], eax ; compare with actor's inventory
	jnz     do_not_call ; not actor's inventory
	; CInventoryItem* -> CGameObject*
	;PRINT "call before use"
	mov     edx, [ebx] ; ebx == CInventoryItem* item
	mov     eax, [edx+12Ch]
	mov     ecx, ebx
	call    eax
	mov     edi, eax ; edi == CGgameObject*

	mov     edx, g_actor
	mov     eax, [edx+164h]
	lea     ecx, [esp+2028h+var_2018 + 20]
	push    ecx
	push    eax
	mov     [esp+2030h+var_2018 + 20], 156
	call    CGameObject__callback_helper
	mov     ebp, eax
	call    CGameObject__lua_game_object
	push    eax
	push    ebp
	call    script_use_callback
do_not_call:
	; восстанавливаем регистры
	pop    ebp
	pop    edi
	pop    edx
	pop    eax
	pop    ecx
	; делаем вырезанное
	mov     edx, [edi]
	mov     eax, [edx+130h]
	; идём обратно
	jmp     back_from_CInventory__Eat_fix
CInventory__Eat_fix endp
