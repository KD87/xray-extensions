MAKE_CASTING1 MACRO casting_fun_name:REQ, vcall_offset:REQ
LOCAL exit_fail
ALIGN_8
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

a_casting_error db "casting no script object", 0
print_error_msg proc
	pusha
	push    offset a_casting_error
	call    Msg
	pop eax
	popa
	retn
print_error_msg endp

; приведение типа через RTTI
MAKE_CASTING2 MACRO casting_fun_name:REQ, proc_offset:REQ
LOCAL lab1
LOCAL exit
ALIGN_8
casting_fun_name proc near
;	push esi
;	push edi
;	push ecx
	
;	mov    esi, ecx
;	mov     edi, [esi+4]
;	test    edi, edi
;	jz      short lab2
;	call    CGameObject__lua_game_object
;lab2:
;	mov     eax, [esi+4]
	mov     eax, [ecx+4]
	test    eax, eax
	jnz     short lab1
	;
	call print_error_msg
	;
	jmp     short exit
lab1:
	push    0               ; a5
	push    offset proc_offset ; a4
	push    offset ??_R0?AVCGameObject@@@8 ; a3
	push    0               ; a2
	push    eax             ; a1
	call    __RTDynamicCast
	add     esp, 14h
exit:
	;pop ecx
	;pop edi
	;pop esi
	ret
casting_fun_name endp
ENDM

; приведение типа для инвентарных предметов через промежуточное приведение к CInventoryItem
; с последующим приведением через RTTI
MAKE_CASTING3 MACRO casting_fun_name:REQ, proc_offset:REQ
LOCAL exit_fail
ALIGN_8
casting_fun_name proc near
	call CScriptGameObject__CInventoryItem
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
LOCAL exit
ALIGN_8
casting_fun_name proc
	mov     ecx, [ecx+4]
	;PRINT_UINT "obj=%x", ecx
	test    ecx, ecx
	mov     eax, ecx
	jz      short exit
	mov     eax, [ecx]
	mov     eax, [eax+proc_offset1]
	call    eax
	;PRINT_UINT "1st=%x", eax
	;
	test    eax, eax
	jz      short exit
	mov     edx, [eax]
	mov     ecx, eax
	mov     eax, [edx+proc_offset2]
	call    eax
	;PRINT_UINT "2nd=%x", eax
exit:
	retn
casting_fun_name endp
ENDM

MAKE_CHECK_FUN MACRO check_fun_name:REQ, cast_fun_name:REQ
LOCAL return_false
ALIGN_8
check_fun_name proc near
	call   cast_fun_name
	test   eax, eax
	jz     return_false
	mov    eax, 1
return_false:
	retn
check_fun_name endp
ENDM

                                                              ; CAttachmentOwner* CGameObject::cast_attachment_owner(); 
MAKE_CASTING1 CScriptGameObject__CInventoryOwner,      70h   ; CInventoryOwner* CGameObject::cast_inventory_owner();
MAKE_CASTING1 CScriptGameObject__CInventoryItem,       74h   ; CInventoryItem* CGameObject::cast_inventory_item();
                                                      ; 78h   ; CEntity* CGameObject::cast_entity(); 
MAKE_CASTING1 CScriptGameObject__CEntityAlive,         7Ch   ; CEntityAlive* CGameObject::cast_entity_alive();
MAKE_CASTING1 CScriptGameObject__CActor,               80h   ; CActor* CGameObject::cast_actor();
                                                      ; 84h   ; CGameObject* CGameObject::cast_game_object();
MAKE_CASTING1 CScriptGameObject__CCustomZone,         088h   ; CCustomZone* CGameObject::cast_custom_zone();
MAKE_CASTING1 CScriptGameObject__IsPhysicsShellHolder, 08Ch   ; CPhysicsShellHolder* CGameObject::cast_physics_shell_holder(); 
													  ; 90h   ; IInputReceiver* CGameObject::cast_input_receiver();
													  ; 94h   ; CParticlesPlayer* CGameObject::cast_particles_player(); 
MAKE_CASTING1 CScriptGameObject__CArtefact,            98h   ; CArtefact* CGameObject::cast_artefact(); 
MAKE_CASTING1 CScriptGameObject__CCustomMonster,       9Ch   ; CCustomMonster* CGameObject::cast_custom_monster(); 
MAKE_CASTING1 CScriptGameObject__CStalker,            0A0h   ; CAI_Stalker* CGameObject::cast_stalker(); 
                                                      ;0A4h   ; CScriptEntity* CGameObject::cast_script_entity(); 
MAKE_CASTING1 CScriptGameObject__CWeapon,             0A8h   ; CWeapon* CGameObject::cast_weapon(); 
MAKE_CASTING1 CScriptGameObject__CExplosive,          0ACh   ; CExplosive* CGameObject::cast_explosive(); 
MAKE_CASTING1 CScriptGameObject__CSpaceRestrictor,    0B0h   ; CSpaceRestrictor* CGameObject::cast_restrictor(); 
;MAKE_CASTING1 CScriptGameObject__CAttachableItem,     0B4h   ; CAttachableItem* CGameObject::cast_attachable_item(); 
MAKE_CASTING1 CScriptGameObject__CHolder,             0B8h   ; CHolderCustom* CGameObject::cast_holder_custom(); 
MAKE_CASTING1 CScriptGameObject__CBaseMonster,        0BCh   ; CBaseMonster* CGameObject::cast_base_monster(); 

;MAKE_CASTING1 CScriptGameObject__CEatableItem, 114h  ; <== not working yet


MAKE_CASTING2 CScriptGameObject__CInventoryBox, off_1054F0B0
MAKE_CASTING2 CScriptGameObject__CScriptZone, off_1054F064
MAKE_CASTING2 CScriptGameObject__CProjector, off_1054F5E8
MAKE_CASTING2 CScriptGameObject__CTrader, off_1054D518
MAKE_CASTING2 CScriptGameObject__CCar, ??_R0?AVCCar@@@8
MAKE_CASTING2 CScriptGameObject__CHelicopter, off_1054F02C

MAKE_CASTING3 CScriptGameObject__CWeaponGL, off_10556CC8
MAKE_CASTING3 CScriptGameObject__CMedkit, off_10557248
MAKE_CASTING3 CScriptGameObject__CAntirad, off_10557214
MAKE_CASTING3 CScriptGameObject__COutfit, off_1054F094
MAKE_CASTING3 CScriptGameObject__CScope, off_10556C58
MAKE_CASTING3 CScriptGameObject__CSilencer, off_10556C70
MAKE_CASTING3 CScriptGameObject__CGrenadeLauncher, off_10556C88
MAKE_CASTING3 CScriptGameObject__CFoodItem, off_1055578C
MAKE_CASTING3 CScriptGameObject__CGrenade, off_105557A4
MAKE_CASTING3 CScriptGameObject__CBottleItem, off_1055722C

MAKE_CASTING4 CScriptGameObject__CWeaponMagazined, 0A8h, 130h
MAKE_CASTING4 CScriptGameObject__CEatableItem,  74h, 114h  ; 
MAKE_CASTING4 CScriptGameObject__CMissile,      74h, 120h  ;	CMissile* CInventoryItem::cast_missile();
MAKE_CASTING4 CScriptGameObject__CHudItem,      74h, 124h  ;	CHudItem* CInventoryItem::cast_hud_item();
MAKE_CASTING4 CScriptGameObject__CAmmo,         74h, 128h  ;	CWeaponAmmo* CInventoryItem::cast_weapon_ammo();
; additional wrappers for checking functions, just convert return value to plain one if nonzero
MAKE_CHECK_FUN CScriptGameObject__IsInventoryBox	   , CScriptGameObject__CInventoryBox
MAKE_CHECK_FUN CScriptGameObject__IsInventoryOwner	   , CScriptGameObject__CInventoryOwner
MAKE_CHECK_FUN CScriptGameObject__IsInventoryItem	   , CScriptGameObject__CInventoryItem
MAKE_CHECK_FUN CScriptGameObject__IsEntityAlive		   , CScriptGameObject__CEntityAlive
MAKE_CHECK_FUN CScriptGameObject__IsActor			   , CScriptGameObject__CActor
MAKE_CHECK_FUN CScriptGameObject__IsCustomZone		   , CScriptGameObject__CCustomZone
MAKE_CHECK_FUN CScriptGameObject__IssPhysicsShellHolder, CScriptGameObject__IsPhysicsShellHolder

MAKE_CHECK_FUN CScriptGameObject__IsArtefact		   , CScriptGameObject__CArtefact
MAKE_CHECK_FUN CScriptGameObject__IsCustomMonster	   , CScriptGameObject__CCustomMonster
MAKE_CHECK_FUN CScriptGameObject__IsStalker			   , CScriptGameObject__CStalker
MAKE_CHECK_FUN CScriptGameObject__IsWeapon			   , CScriptGameObject__CWeapon

MAKE_CHECK_FUN CScriptGameObject__IsExplosive		   , CScriptGameObject__CExplosive
MAKE_CHECK_FUN CScriptGameObject__IsSpaceRestrictor	   , CScriptGameObject__CSpaceRestrictor

MAKE_CHECK_FUN CScriptGameObject__IsHolder			   , CScriptGameObject__CHolder

MAKE_CHECK_FUN CScriptGameObject__IsBaseMonster		   , CScriptGameObject__CBaseMonster
;
MAKE_CHECK_FUN CScriptGameObject__IsScriptZone		   , CScriptGameObject__CScriptZone
MAKE_CHECK_FUN CScriptGameObject__IsProjector		   , CScriptGameObject__CProjector
MAKE_CHECK_FUN CScriptGameObject__IsTrader			   , CScriptGameObject__CTrader
MAKE_CHECK_FUN CScriptGameObject__IsCar				   , CScriptGameObject__CCar
MAKE_CHECK_FUN CScriptGameObject__IsHelicopter         , CScriptGameObject__CHelicopter
MAKE_CHECK_FUN CScriptGameObject__IsWeaponGL		   , CScriptGameObject__CWeaponGL
MAKE_CHECK_FUN CScriptGameObject__IsMedkit			   , CScriptGameObject__CMedkit
MAKE_CHECK_FUN CScriptGameObject__IsAntirad			   , CScriptGameObject__CAntirad
MAKE_CHECK_FUN CScriptGameObject__IsOutfit			   , CScriptGameObject__COutfit
MAKE_CHECK_FUN CScriptGameObject__IsScope			   , CScriptGameObject__CScope
MAKE_CHECK_FUN CScriptGameObject__IsSilencer		   , CScriptGameObject__CSilencer
MAKE_CHECK_FUN CScriptGameObject__IsGrenadeLauncher	   , CScriptGameObject__CGrenadeLauncher
MAKE_CHECK_FUN CScriptGameObject__IsFoodItem		   , CScriptGameObject__CFoodItem
MAKE_CHECK_FUN CScriptGameObject__IsWeaponMagazined	   , CScriptGameObject__CWeaponMagazined
MAKE_CHECK_FUN CScriptGameObject__IsEatableItem 	   , CScriptGameObject__CEatableItem
MAKE_CHECK_FUN CScriptGameObject__IsMissile			   , CScriptGameObject__CMissile
MAKE_CHECK_FUN CScriptGameObject__IsHudItem			   , CScriptGameObject__CHudItem
MAKE_CHECK_FUN CScriptGameObject__IsAmmo			   , CScriptGameObject__CAmmo
MAKE_CHECK_FUN CScriptGameObject__IsGrenade            , CScriptGameObject__CGrenade
MAKE_CHECK_FUN CScriptGameObject__IsBottleItem         , CScriptGameObject__CBottleItem

;	CEatableItem* CInventoryItem::cast_eatable_item();  108
;	CWeapon* CInventoryItem::cast_weapon();       112
;	CFoodItem* CInventoryItem::cast_food_item();  116


ALIGN_8
CScriptGameObject__GetGameObject proc near
	mov     eax, [ecx+4]
	retn
CScriptGameObject__GetGameObject endp


ALIGN_8
CScriptGameObject__GetCarShift proc
	push    esi
	mov     esi, ecx
	push    edi
	
	call    CScriptGameObject__CCar
	
	mov     esi, [esi+4]
	sub     eax, esi

	pop     edi
	pop     esi
	retn
CScriptGameObject__GetCarShift endp

