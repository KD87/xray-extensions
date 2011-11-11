MAKE_CASTING1 MACRO casting_fun_name:REQ, vcall_offset:REQ
casting_fun_name proc near
	mov     ecx, [ecx+4]
	mov     eax, ecx
	test    eax, eax
	jz      short exit_fail
	mov     eax, [eax]
	mov     eax, [eax+vcall_offset]
	call    eax
exit_fail:
	retn
casting_fun_name endp
ENDM

; приведение типа через RTTI
MAKE_CASTING2 MACRO casting_fun_name:REQ, proc_offset:REQ
casting_fun_name proc near
	mov     eax, [ecx+4]
	test    eax, eax
	jz      short exit
	push    0               ; a5
	push    offset proc_offset ; a4
	push    offset ??_R0?AVCGameObject@@@8 ; a3
	push    0               ; a2
	push    eax             ; a1
	call    __RTDynamicCast
	add     esp, 14h
exit:
	ret
casting_fun_name endp
ENDM

; приведение типа для инвентарных предметов через промежуточное приведение к CInventoryItem
; с последующим приведением через RTTI
MAKE_CASTING3 MACRO casting_fun_name:REQ, proc_offset:REQ
casting_fun_name proc near
	call CScriptGameObject__IsInventoryItem
	test    eax, eax
	jz      exit_fail
	; это CInventoryItem
	push    0             ; a5
	push    offset proc_offset ; это надо передавать в качестве параметра макроса
	push    offset off_10538CDC ; это у всех таких функций одинаковое
	push    0             ; a2
	push    eax             ; a1
	call    __RTDynamicCast
	add     esp, 14h
exit_fail:
	retn
casting_fun_name endp
ENDM

; странное приведение типа через два последовательных приведения
; встречается редко
MAKE_CASTING4 MACRO casting_fun_name:REQ, proc_offset1:REQ, proc_offset2:REQ
casting_fun_name proc
	mov     ecx, [ecx+4]
	PRINT_UINT "obj=%x", ecx
	test    ecx, ecx
	mov     eax, ecx
	jz      short exit
	mov     eax, [ecx]
	mov     eax, [eax+proc_offset1]
	call    eax
	PRINT_UINT "1st=%x", eax
	;
	test    eax, eax
	jz      short exit
	mov     edx, [eax]
	mov     ecx, eax
	mov     eax, [edx+proc_offset2]
	call    eax
	PRINT_UINT "2nd=%x", eax
exit:
	retn
casting_fun_name endp
ENDM

                                                              ; CAttachmentOwner* CGameObject::cast_attachment_owner(); 
MAKE_CASTING1 CScriptGameObject__IsInventoryOwner,      70h   ; CInventoryOwner* CGameObject::cast_inventory_owner();
MAKE_CASTING1 CScriptGameObject__IsInventoryItem,       74h   ; CInventoryItem* CGameObject::cast_inventory_item();
                                                      ; 78h   ; CEntity* CGameObject::cast_entity(); 
MAKE_CASTING1 CScriptGameObject__IsEntityAlive,         7Ch   ; CEntityAlive* CGameObject::cast_entity_alive();
MAKE_CASTING1 CScriptGameObject__IsActor,               80h   ; CActor* CGameObject::cast_actor();
                                                      ; 84h   ; CGameObject* CGameObject::cast_game_object();
MAKE_CASTING1 CScriptGameObject__IsCustomZone,         088h   ; CCustomZone* CGameObject::cast_custom_zone();
MAKE_CASTING1 CScriptGameObject__IsPhysicsShellHolder, 08Ch   ; CPhysicsShellHolder* CGameObject::cast_physics_shell_holder(); 
													  ; 90h   ; IInputReceiver* CGameObject::cast_input_receiver();
													  ; 94h   ; CParticlesPlayer* CGameObject::cast_particles_player(); 
MAKE_CASTING1 CScriptGameObject__IsArtefact,            98h   ; CArtefact* CGameObject::cast_artefact(); 
MAKE_CASTING1 CScriptGameObject__IsCustomMonster,       9Ch   ; CCustomMonster* CGameObject::cast_custom_monster(); 
MAKE_CASTING1 CScriptGameObject__IsStalker,            0A0h   ; CAI_Stalker* CGameObject::cast_stalker(); 
                                                      ;0A4h   ; CScriptEntity* CGameObject::cast_script_entity(); 
MAKE_CASTING1 CScriptGameObject__IsWeapon,             0A8h   ; CWeapon* CGameObject::cast_weapon(); 
MAKE_CASTING1 CScriptGameObject__IsExplosive,          0ACh   ; CExplosive* CGameObject::cast_explosive(); 
MAKE_CASTING1 CScriptGameObject__IsSpaceRestrictor,    0B0h   ; CSpaceRestrictor* CGameObject::cast_restrictor(); 
;MAKE_CASTING1 CScriptGameObject__IsAttachableItem,     0B4h   ; CAttachableItem* CGameObject::cast_attachable_item(); 
MAKE_CASTING1 CScriptGameObject__IsHolder,             0B8h   ; CHolderCustom* CGameObject::cast_holder_custom(); 
MAKE_CASTING1 CScriptGameObject__IsBaseMonster,        0BCh   ; CBaseMonster* CGameObject::cast_base_monster(); 

;MAKE_CASTING1 CScriptGameObject__IsEatableItem, 114h  ; <== not working yet


MAKE_CASTING2 CScriptGameObject__CInventoryBox, off_1054F0B0
MAKE_CASTING2 CScriptGameObject__IsScriptZone, off_1054F064
MAKE_CASTING2 CScriptGameObject__IsProjector, off_1054F5E8
MAKE_CASTING2 CScriptGameObject__IsTrader, off_1054D518
MAKE_CASTING2 CScriptGameObject__IsCar, ??_R0?AVCCar@@@8

MAKE_CASTING3 CScriptGameObject__IsWeaponGL, off_10556CC8
MAKE_CASTING3 CScriptGameObject__IsMedkit, off_10557248
MAKE_CASTING3 CScriptGameObject__IsAntirad, off_10557214
MAKE_CASTING3 CScriptGameObject__IsOutfit, off_1054F094
MAKE_CASTING3 CScriptGameObject__IsScope, off_10556C58
MAKE_CASTING3 CScriptGameObject__IsSilencer, off_10556C70
MAKE_CASTING3 CScriptGameObject__IsGrenadeLauncher, off_10556C88
MAKE_CASTING3 CScriptGameObject__IsFoodItem, off_1055578C

MAKE_CASTING4 CScriptGameObject__IsWeaponMagazined, 0A8h, 130h
MAKE_CASTING4 CScriptGameObject__IsEatableItem1, 74h, 11Ch  ; <== not working yet
MAKE_CASTING4 CScriptGameObject__IsMissile,      74h, 120h  ;	CMissile* CInventoryItem::cast_missile();
MAKE_CASTING4 CScriptGameObject__IsHudItem,      74h, 124h  ;	CHudItem* CInventoryItem::cast_hud_item();
MAKE_CASTING4 CScriptGameObject__IsAmmo,         74h, 128h  ;	CWeaponAmmo* CInventoryItem::cast_weapon_ammo();

;	CEatableItem* CInventoryItem::cast_eatable_item();  108
;	CWeapon* CInventoryItem::cast_weapon();       112
;	CFoodItem* CInventoryItem::cast_food_item();  116


CScriptGameObject__GetGameObject proc
	mov     eax, [ecx+4]
	retn
CScriptGameObject__GetGameObject endp


CScriptGameObject__GetCarShift proc
	push    esi
	mov     esi, ecx
	push    edi
	
	call    CScriptGameObject__IsCar
	
	mov     esi, [esi+4]
	sub     eax, esi

	pop     edi
	pop     esi
	retn
CScriptGameObject__GetCarShift endp


CScriptGameObject__IsEatableItem proc ; не работает!!!!!!!!!!!!!!!!!!!!!
	call    CScriptGameObject__IsInventoryItem
	test    eax, eax
	jz      short exit_fail
	mov     eax, [eax]
	mov     edx, [eax+114h]
	call    edx
exit_fail:
	pop     edi
	pop     esi
	retn
CScriptGameObject__IsEatableItem endp


; на входе CScriptGameObject
;CScriptGameObject__IsEntityAlive proc
;	push    esi
;	mov     esi, ecx
;	push    edi
;	mov     edi, [esi+4]
;	test    edi, edi
;	jz      lab1
;	call    CGameObject__lua_game_object
;lab1:
;	mov     ecx, [esi+4]
;	test    ecx, ecx
;	jz      short exit_fail
;	mov     eax, [ecx]
;	mov     edx, [eax+7Ch]
;	call    edx
;exit_fail:
;	pop     edi
;	pop     esi
;	retn
;CScriptGameObject__IsEntityAlive endp

; CScriptGameObject__IsHolder proc
	; push    esi
	; mov     esi, ecx
	; push    edi
	; mov     edi, [esi+4]
	; test    edi, edi
	; jz      lab1
	; call    CGameObject__lua_game_object
; lab1:
	; mov     ecx, [esi+4]
	; test    ecx, ecx
	; jz      short exit_fail
	; mov     eax, [ecx]
	; mov     edx, [eax+0B8h]
	; call    edx
	; test    eax, eax
; exit_fail:
	; pop     edi
	; pop     esi
	; retn
; CScriptGameObject__IsHolder endp

; Cast_SGO_to_CInventoryItem proc
	; push    esi
	; push    edi
	; push    edx

	; mov     esi, ecx
	; mov     edi, [esi+4]
	; test    edi, edi
	; jz      short lab1
	; call    CGameObject__lua_game_object
; lab1:
	; mov     ecx, [esi+4]
	; test    ecx, ecx
	; jz      short exit
	; mov     eax, [ecx]
	; mov     edx, [eax+74h]
	; call    edx
; exit:
	; pop     edx
	; pop     edi
	; pop     esi
	; ret
; Cast_SGO_to_CInventoryItem endp

; Cast_SGO_to_CInventoryOwner proc  ; ecx - argument, eax - result
	; push    esi
	; push    edi
	; push    edx

	; mov     esi, ecx
	; mov     edi, [esi+4]
	; test    edi, edi
	; jz      short lab1
	; call    CGameObject__lua_game_object
; lab1:
	; mov     ecx, [esi+4]
	; test    ecx, ecx
	; jz      short exit
	; mov     eax, [ecx]
	; mov     edx, [eax+70h]
	; call    edx
; exit:
	; pop     edx
	; pop     edi
	; pop     esi
	; ret
; Cast_SGO_to_CInventoryOwner endp


; Cast_SGO_to_CInventoryBox proc  ; ecx - argument, eax - result
	; push    esi
	; push    edi

	; mov     esi, ecx
	; mov     edi, [esi+4]
	; test    edi, edi
	; jz      short lab1
	; call    CGameObject__lua_game_object
; lab1:
	; mov     esi, [esi+4]
	; xor     eax, eax
	; test    esi, esi
	; jz      short exit
	; push    0               ; a5
	; push    offset off_1054F0B0 ; a4
	; push    offset ??_R0?AVCGameObject@@@8 ; a3
	; push    0               ; a2
	; push    esi             ; a1
	; call    __RTDynamicCast
	; add     esp, 14h
; exit:
	; pop     edi
	; pop     esi
	; ret
; Cast_SGO_to_CInventoryBox endp

; Cast_SGO_to_CActor proc ; ecx - argument, eax - result
	; push    esi
	; push    edi
	; push    edx
	
	; mov     esi, ecx
	; push    edi
	; mov     edi, [esi+4]
	; test    edi, edi
	; jz      short lab1
	; call    CGameObject__lua_game_object
; lab1:
	; mov     ecx, [esi+4]
	; xor     eax, eax
	; test    ecx, ecx
	; jz      short exit
	; mov     eax, [ecx]
	; mov     edx, [eax+80h]
	; call    edx
; exit:
	; pop     edx
	; pop     edi
	; pop     esi
	; ret
; Cast_SGO_to_CActor endp


; CScriptGameObject__IsActor proc
	; push    esi
	; mov     esi, ecx
	; push    edi
	; mov     edi, [esi+4]
	; test    edi, edi
	; jz      lab1
	; call    CGameObject__lua_game_object
; lab1:
	; mov     ecx, [esi+4]
	; test    ecx, ecx
	; jz      short exit_fail
	; mov     eax, [ecx]
	; mov     edx, [eax+80h]
	; call    edx
; exit_fail:
	; pop     edi
	; pop     esi
	; retn
; CScriptGameObject__IsActor endp


; CScriptGameObject__IsCustomMonster proc
	; push    esi
	; mov     esi, ecx
	; push    edi
	; mov     edi, [esi+4]
	; test    edi, edi
	; jz      lab1
	; call    CGameObject__lua_game_object
; lab1:
	; mov     ecx, [esi+4]
	; test    ecx, ecx
	; jz      short exit_fail
	; mov     eax, [ecx]
	; mov     edx, [eax+9Ch]
	; call    edx
; exit_fail:
	; pop     edi
	; pop     esi
	; retn
; CScriptGameObject__IsCustomMonster endp


; CScriptGameObject__IsWeapon proc
	; push    esi
	; mov     esi, ecx
	; push    edi
	; mov     edi, [esi+4]
	; test    edi, edi
	; jz      lab1
	; ;
	; call    CGameObject__lua_game_object
	; ;
; lab1:
	; mov     ecx, [esi+4]
	; test    ecx, ecx
	; jz      short exit_fail
	; mov     eax, [ecx]
	; mov     edx, [eax+0A8h]
	; call    edx
	; test    eax, eax
; exit_fail:
	; pop     edi
	; pop     esi
	; retn
; CScriptGameObject__IsWeapon endp

; CScriptGameObject__IsInventoryItem proc
	; push    esi
	; mov     esi, ecx
	; push    edi

	; mov     edi, [esi+4]
	; test    edi, edi
	; jz      lab1
	; call    CGameObject__lua_game_object
; lab1:
	; mov     ecx, [esi+4]
	; test    ecx, ecx
	; jz      exit_fail
	; mov     eax, [ecx]
	; mov     edx, [eax+74h]
	; call    edx
	; test    eax, eax
	; jz      exit_fail
; exit_fail:
	; pop     edi
	; pop     esi
	; retn
; CScriptGameObject__IsInventoryItem endp

; CScriptGameObject__IsWeaponGL proc
	; push    esi

	; call CScriptGameObject__IsInventoryItem
	; test    eax, eax
	; jz      exit_fail
	; ; это CInventoryItem
	; xor     esi, esi
	; push    esi             ; 0
	; push    offset off_10556CC8 ; a4
	; push    offset off_10538CDC ; a3
	; push    esi             ; 0
	; push    eax             ; inventory_item
	; call    __RTDynamicCast
	; add     esp, 14h
	; test    eax, eax
	; jz      exit_fail
	; ; это CWeaponMagazinedWGrenade
; exit_fail:
	; pop     esi
	; retn
; CScriptGameObject__IsWeaponGL endp
