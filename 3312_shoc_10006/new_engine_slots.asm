;0 - knife
;1 - pistol
;2 - automatic
;3 - grenades
;5 - bolt
;6 - outfit
;7 - pda
; new
;4 - bunocular
;8 - detector
;9 - torch
;10 - helmet
; extra
;11 - nightvision googles
;12 - biodetector

	; создание и инициализаци€ объектов CUIDagDropListEx дл€ слотов
CUIInventoryWnd__Init__:		;103BA6AD
; old
	call    loc_103BBB40
; knife
	mov     ecx, ds:Memory
	push    0B0h
	call    esi
	test    eax, eax
	jz      short cannot_alloc1
	mov     ecx, eax
	call    sub_10418420
	jmp     short sucsess_alloc1
cannot_alloc1:
	xor     eax, eax
sucsess_alloc1:
	mov     edx, [ebp+0]
	mov     [ebp+knife], eax
	push    eax
	mov     eax, [edx+34h]
	mov     ecx, ebp
	call    eax
	mov     ecx, [ebp+knife]
	mov     byte ptr [ecx+54h], 1
	mov     edx, [ebp+knife]
	push    edx
	lea     eax, [esp+24h]
	push    eax
	xor     ebx, ebx
	mov     edi, offset aDragdrop_knife ; "dragdrop_knife"
	call    sub_103E6820
	mov     eax, [ebp+knife]
	add     esp, 8
	mov     ecx, ebp
	call    loc_103BBB40
; binocular
	mov     ecx, ds:Memory
	push    0B0h
	call    esi
	test    eax, eax
	jz      short cannot_alloc2
	mov     ecx, eax
	call    sub_10418420
	jmp     short sucsess_alloc2
cannot_alloc2:
	xor     eax, eax
sucsess_alloc2:
	mov     edx, [ebp+0]
	mov     [ebp+binocular], eax
	push    eax
	mov     eax, [edx+34h]
	mov     ecx, ebp
	call    eax
	mov     ecx, [ebp+binocular]
	mov     byte ptr [ecx+54h], 1
	mov     edx, [ebp+binocular]
	push    edx
	lea     eax, [esp+24h]
	push    eax
	xor     ebx, ebx
	mov     edi, offset aDragdrop_binocular ; "dragdrop_binocular"
	call    sub_103E6820
	mov     eax, [ebp+binocular]
	add     esp, 8
	mov     ecx, ebp
	call    loc_103BBB40
; detector
	mov     ecx, ds:Memory
	push    0B0h
	call    esi
	test    eax, eax
	jz      short cannot_alloc3
	mov     ecx, eax
	call    sub_10418420
	jmp     short sucsess_alloc3
cannot_alloc3:
	xor     eax, eax
sucsess_alloc3:
	mov     edx, [ebp+0]
	mov     [ebp+detector], eax
	push    eax
	mov     eax, [edx+34h]
	mov     ecx, ebp
	call    eax
	mov     ecx, [ebp+detector]
	mov     byte ptr [ecx+54h], 1
	mov     edx, [ebp+detector]
	push    edx
	lea     eax, [esp+24h]
	push    eax
	xor     ebx, ebx
	mov     edi, offset aDragdrop_detector ; "dragdrop_detector"
	call    sub_103E6820
	mov     eax, [ebp+detector]
	add     esp, 8
	mov     ecx, ebp
	call    loc_103BBB40
; torch
	mov     ecx, ds:Memory
	push    0B0h
	call    esi
	test    eax, eax
	jz      short cannot_alloc4
	mov     ecx, eax
	call    sub_10418420
	jmp     short sucsess_alloc4
cannot_alloc4:
	xor     eax, eax
sucsess_alloc4:
	mov     edx, [ebp+0]
	mov     [ebp+torch], eax
	push    eax
	mov     eax, [edx+34h]
	mov     ecx, ebp
	call    eax
	mov     ecx, [ebp+torch]
	mov     byte ptr [ecx+54h], 1
	mov     edx, [ebp+torch]
	push    edx
	lea     eax, [esp+24h]
	push    eax
	xor     ebx, ebx
	mov     edi, offset aDragdrop_torch ; "dragdrop_torch"
	call    sub_103E6820
	mov     eax, [ebp+torch]
	add     esp, 8
	mov     ecx, ebp
	call    loc_103BBB40
; helmet
	mov     ecx, ds:Memory
	push    0B0h
	call    esi
	test    eax, eax
	jz      short cannot_alloc5
	mov     ecx, eax
	call    sub_10418420
	jmp     short sucsess_alloc5
cannot_alloc5:
	xor     eax, eax
sucsess_alloc5:
	mov     edx, [ebp+0]
	mov     [ebp+helmet], eax
	push    eax
	mov     eax, [edx+34h]
	mov     ecx, ebp
	call    eax
	mov     ecx, [ebp+helmet]
	mov     byte ptr [ecx+54h], 1
	mov     edx, [ebp+helmet]
	push    edx
	lea     eax, [esp+24h]
	push    eax
	xor     ebx, ebx
	mov     edi, offset aDragdrop_helmet ; "dragdrop_helmet"
	call    sub_103E6820
	mov     eax, [ebp+helmet]
	add     esp, 8
	mov     ecx, ebp
	call    loc_103BBB40
; NV
	mov     ecx, ds:Memory
	push    0B0h
	call    esi
	test    eax, eax
	jz      short cannot_alloc6
	mov     ecx, eax
	call    sub_10418420
	jmp     short sucsess_alloc6
cannot_alloc6:
	xor     eax, eax
sucsess_alloc6:
	mov     edx, [ebp+0]
	mov     [ebp+nv], eax
	push    eax
	mov     eax, [edx+34h]
	mov     ecx, ebp
	call    eax
	mov     ecx, [ebp+nv]
	mov     byte ptr [ecx+54h], 1
	mov     edx, [ebp+nv]
	push    edx
	lea     eax, [esp+24h]
	push    eax
	xor     ebx, ebx
	mov     edi, offset aDragdrop_nv ; "dragdrop_nv"
	call    sub_103E6820
	mov     eax, [ebp+nv]
	add     esp, 8
	mov     ecx, ebp
	call    loc_103BBB40
; biodetector
	mov     ecx, ds:Memory
	push    0B0h
	call    esi
	test    eax, eax
	jz      short cannot_alloc7
	mov     ecx, eax
	call    sub_10418420
	jmp     short sucsess_alloc7
cannot_alloc7:
	xor     eax, eax
sucsess_alloc7:
	mov     edx, [ebp+0]
	mov     [ebp+biodetector], eax
	push    eax
	mov     eax, [edx+34h]
	mov     ecx, ebp
	call    eax
	mov     ecx, [ebp+biodetector]
	mov     byte ptr [ecx+54h], 1
	mov     edx, [ebp+biodetector]
	push    edx
	lea     eax, [esp+24h]
	push    eax
	xor     ebx, ebx
	mov     edi, offset aDragdrop_biodetector ; "dragdrop_biodetector"
	call    sub_103E6820
	mov     eax, [ebp+biodetector]
	add     esp, 8
	mov     ecx, ebp
	call    loc_103BBB40
	jmp	back_to_CUIInventoryWnd__Init__	;103BA6B2

	; создание объектов CUICellItem дл€ слотов
CUIInventoryWnd__InitInventory__:	;103BBD8D
;old	
	mov     eax, [edx+90h]
	call    eax
; knife	
	mov     ecx, [edi+26A8h]	; Inventory
	mov     eax, [ecx+38h]		; m_slots
;	add     eax, 20h			; slot_idx*10h
	mov     eax, [eax+4]		; pItem
	cmp     eax, ebx
	jz      short no_item1
	call    sub_10418330
	mov     ecx, [edi+knife]	; obj
	mov     edx, [ecx]
	push    eax
	mov     eax, [edx+90h]
	call    eax
no_item1:
; binocular	
	mov     ecx, [edi+26A8h]	; Inventory
	mov     eax, [ecx+38h]		; m_slots
	add     eax, 40h			; slot_idx*10h
	mov     eax, [eax+4]		; pItem
	cmp     eax, ebx
	jz      short no_item2
	call    sub_10418330
	mov     ecx, [edi+binocular]	; obj
	mov     edx, [ecx]
	push    eax
	mov     eax, [edx+90h]
	call    eax
no_item2:
; detector	
	mov     ecx, [edi+26A8h]	; Inventory
	mov     eax, [ecx+38h]		; m_slots
	add     eax, 80h			; slot_idx*10h
	mov     eax, [eax+4]		; pItem
	cmp     eax, ebx
	jz      short no_item3
	call    sub_10418330
	mov     ecx, [edi+detector]	; obj
	mov     edx, [ecx]
	push    eax
	mov     eax, [edx+90h]
	call    eax
no_item3:
; torch	
	mov     ecx, [edi+26A8h]	; Inventory
	mov     eax, [ecx+38h]		; m_slots
	add     eax, 90h			; slot_idx*10h
	mov     eax, [eax+4]		; pItem
	cmp     eax, ebx
	jz      short no_item4
	call    sub_10418330
	mov     ecx, [edi+torch]	; obj
	mov     edx, [ecx]
	push    eax
	mov     eax, [edx+90h]
	call    eax
no_item4:
; helmet	
	mov     ecx, [edi+26A8h]	; Inventory
	mov     eax, [ecx+38h]		; m_slots
	add     eax, 0A0h			; slot_idx*10h
	mov     eax, [eax+4]		; pItem
	cmp     eax, ebx
	jz      short no_item5
	call    sub_10418330
	mov     ecx, [edi+helmet]	; obj
	mov     edx, [ecx]
	push    eax
	mov     eax, [edx+90h]
	call    eax
no_item5:
; nv	
	mov     ecx, [edi+26A8h]	; Inventory
	mov     eax, [ecx+38h]		; m_slots
	add     eax, 0B0h			; slot_idx*10h
	mov     eax, [eax+4]		; pItem
	cmp     eax, ebx
	jz      short no_item6
	call    sub_10418330
	mov     ecx, [edi+nv]	; obj
	mov     edx, [ecx]
	push    eax
	mov     eax, [edx+90h]
	call    eax
no_item6:
; biodetector	
	mov     ecx, [edi+26A8h]	; Inventory
	mov     eax, [ecx+38h]		; m_slots
	add     eax, 0C0h			; slot_idx*10h
	mov     eax, [eax+4]		; pItem
	cmp     eax, ebx
	jz      short no_item7
	call    sub_10418330
	mov     ecx, [edi+biodetector]	; obj
	mov     edx, [ecx]
	push    eax
	mov     eax, [edx+90h]
	call    eax
no_item7:
	jmp back_toCUIInventoryWnd__InitInventory__		;103BBD95
	
	; получение €чейки дл€ слота
CUIInventoryWnd__GetSlotList proc	;103BC590
	cmp     ecx, 0FFFFFFFFh		; idx
	jz      no_slot
	push    esi
	mov     esi, [edx+26A8h]
	mov     eax, ecx
	shl     eax, 4
	add     eax, [esi+38h]
	pop     esi
	cmp     byte ptr [eax+8], 0
	jnz     short no_slot
	mov     eax, ecx
	test	eax, eax
	jz		short is_knife	; eax == 0
	sub     eax, 1
	jz      short is_pistol	; eax == 1
	sub     eax, 1
	jz      short is_automatic	; eax == 2
	; fix start
	sub     eax, 2
	jz      short is_binocular	; eax == 4
	sub     eax, 2
	jz      short is_outfit		; eax == 6
	sub     eax, 2
	jz      short is_detector	; eax == 8
	sub     eax, 1
	jz      short is_torch		; eax == 9
	sub     eax, 1
	jz      short is_helmet		; eax == 10
	sub     eax, 1
	jz      short is_nv			; eax == 11
	sub     eax, 1
	jz      short is_biodetector	; eax == 12
	; fix end
	jmp     short no_slot
is_outfit:  	
	mov     eax, [edx+10B8h]	;outfit
	retn
is_automatic:     
	mov     eax, [edx+10B4h]
	retn
is_pistol: 
	mov     eax, [edx+10B0h]
	retn
is_biodetector:     
	mov     eax, [edx+biodetector]
	retn
is_nv:     
	mov     eax, [edx+nv]
	retn
is_helmet:     
	mov     eax, [edx+helmet]
	retn
is_torch:     
	mov     eax, [edx+torch]
	retn
is_detector:     
	mov     eax, [edx+detector]
	retn
is_binocular:     
	mov     eax, [edx+binocular]
	retn
is_knife:
	mov		eax, [edx+knife]
	retn
no_slot: 
	xor     eax, eax
	retn
CUIInventoryWnd__GetSlotList endp	
	
	; очистка €чеек дл€ слотов
CUIInventoryWnd__ClearAllLists proc	;103BC5E0
	push    ecx
	mov     eax, [esi+10A8h]
	push    1
	call    sub_10418D70
	mov     eax, [esi+10ACh]
	push    1
	call    sub_10418D70
	mov     eax, [esi+10B8h]
	push    1
	call    sub_10418D70
	mov     eax, [esi+10B0h]
	push    1
	call    sub_10418D70
	mov     eax, [esi+10B4h]
	push    1
	call    sub_10418D70
	; place new code here
	mov     eax, [esi+knife]
	push    1
	call    sub_10418D70	
	mov     eax, [esi+binocular]
	push    1
	call    sub_10418D70	
	mov     eax, [esi+detector]
	push    1
	call    sub_10418D70	
	mov     eax, [esi+torch]
	push    1
	call    sub_10418D70	
	mov     eax, [esi+helmet]
	push    1
	call    sub_10418D70	
	mov     eax, [esi+nv]
	push    1
	call    sub_10418D70	
	mov     eax, [esi+biodetector]
	push    1
	call    sub_10418D70	
	; end of new code place
	pop     ecx
	retn
CUIInventoryWnd__ClearAllLists endp
	
	; блок худа слотов
CInventory__Init__:
	add     eax, 90h
	; новое
	mov     eax, [esi+38h]
	mov     [eax+0A9h], bl	; helmet
	mov     [eax+0B9h], bl	; nightvision
		jmp back_to_CInventory__Init__
	
	; смещени€ указателей на €чейки в объекте CInventory
knife = dword ptr 26C4h
binocular = dword ptr 26C8h
detector = dword ptr 26CCh
torch = dword ptr 26D0h
helmet = dword ptr 26D4h
nv = dword ptr 26D8h
biodetector = dword ptr 26DCh
	; имена дл€ настроек €чеек слотов в inventory_new.xml
aDragdrop_knife db "dragdrop_knife", 0
aDragdrop_binocular db "dragdrop_binocular", 0
aDragdrop_detector db "dragdrop_detector", 0
aDragdrop_torch db "dragdrop_torch", 0
aDragdrop_helmet db "dragdrop_helmet", 0
aDragdrop_nv db "dragdrop_nv", 0
aDragdrop_biodetector db "dragdrop_biodetector", 0

; заставл€ем движок учитывать предмет из шлемового слота при подсчете хита актору
CActor__HitArtefactsOnBelt proc
hit_power       = dword ptr  4
hit_type        = dword ptr  8
	sub     esp, 8
	movss   xmm0, ds:pick_dist
	push    esi
	push    edi
	mov     edi, ecx
	mov     eax, [edi+298h]	; m_inventory
	mov     esi, [eax+28h]	; m_belt
	cmp     [eax+2Ch], esi
	movss   dword ptr [esp+8h], xmm0
	xorps   xmm0, xmm0
	movss   dword ptr [esp+0Ch], xmm0
	jz      short check_slot
	push    ebx
	mov     ebx, [esp+14h+hit_type]
	push	eax
	
begin_iteration: 
	mov     ecx, [esi]
	test    ecx, ecx
	jz      short next
	mov     eax, [ecx]
	mov     edx, [eax+12Ch]
	call    edx
	test    eax, eax
	jz      short next
	mov     edx, [eax]
	mov     ecx, eax
	mov     eax, [edx+98h]
	call    eax
	test    eax, eax
	jz      short next
	mov     edx, [eax+318h]
	fld1
	lea     ecx, [eax+318h]
	mov     eax, [edx+8]
	push    ebx
	push    ecx
	fstp    dword ptr [esp]
	call    eax
	fadd    dword ptr [esp+10h]
	movss   xmm0, dword ptr [esp+14h]
	addss   xmm0, ds:pick_dist
	movss   dword ptr [esp+14h], xmm0
	fstp    dword ptr [esp+10h]
	
next:
	mov     ecx, [edi+298h]
	add     esi, 4
	cmp     [ecx+2Ch], esi
	jnz     short begin_iteration
	pop		eax
	pop     ebx	
	
check_slot:
	; получаем итем в слоте
	mov		eax, [eax+38h]	; m_slots._Myfirst
	mov		ecx, [eax+0A4h] ; item in slot #10 (CInventoryItem *)
	test    ecx, ecx
	jz      short exit
	; кастуем в CGameObject
	mov     eax, [ecx]
	mov     edx, [eax+12Ch]
	call    edx
	test    eax, eax
	jz      short exit
	; кастуем в CArtefact
	mov     edx, [eax]
	mov     ecx, eax
	mov     eax, [edx+98h]
	call    eax
	test    eax, eax
	jz      short exit
	; узнаем защиту от хита
	mov     edx, [eax+318h]	; m_ArtefactHitImmunities
	fld1
	lea     ecx, [eax+318h]
	mov     eax, [edx+8]
	push	ebx
	mov     ebx, [esp+14h+hit_type]	
	push    ebx
	push    ecx
	fstp    dword ptr [esp]	; hit_power (всегда 1 почему-то)
	call    eax	;AffectHit(power, hit_type)
	pop		ebx
	; подсчитываем хит
	fadd    dword ptr [esp+8h]
	movss   xmm0, dword ptr [esp+0Ch]
	addss   xmm0, ds:pick_dist
	movss   dword ptr [esp+0Ch], xmm0
	fstp    dword ptr [esp+8h]

exit:
	fld     dword ptr [esp+8h]
	pop     edi
	fsub    dword ptr [esp+8h]
	pop     esi
	fmul    dword ptr [esp+8+hit_power]
	add     esp, 8
	retn    8
CActor__HitArtefactsOnBelt endp

pick_dist dd 1.0