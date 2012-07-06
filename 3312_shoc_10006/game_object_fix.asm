include game_object_reg_macro.asm

REGISTER_GO__INT register_item_on_belt, "item_on_belt"
REGISTER_GO__INT register_item_in_ruck, "item_in_ruck"

REGISTER_BOOL__GO register_is_on_belt, "is_on_belt"
REGISTER_BOOL__GO register_is_in_ruck, "is_in_ruck" ; ------
REGISTER_BOOL__GO register_is_in_slot, "is_in_slot" ; ------

REGISTER_BOOL__GO register_move_to_ruck, "move_to_ruck"
REGISTER_BOOL__GO register_move_to_belt, "move_to_belt" ; --
REGISTER_BOOL__GO register_move_to_slot, "move_to_slot" ; --
REGISTER_BOOL__GO register_move_to_slot_and_activate, "move_to_slot_and_activate" ; --

REGISTER_BOOL__GO register_can_move_to_slot, "can_move_to_slot" ; --
REGISTER_BOOL__GO register_can_move_to_ruck, "can_move_to_ruck" ;--
REGISTER_BOOL__GO register_can_move_to_belt, "can_move_to_belt" ; --

REGISTER_FLOAT__INT register_get_actor_float, "get_actor_float"
REGISTER_VOID__VECTOR_FLOAT_INT register_set_actor_float, "set_actor_float"

REGISTER_FLOAT__INT register_get_actor_condition_float, "get_actor_condition_float"
REGISTER_VOID__VECTOR_FLOAT_INT register_set_actor_condition_float, "set_actor_condition_float"
;---
REGISTER_FLOAT__INT             register_get_game_object_float,      "get_go_float"
REGISTER_VOID__VECTOR_FLOAT_INT register_set_game_object_float,      "set_go_float"
REGISTER_INT__STRING_INT        register_get_game_object_int,        "get_go_int"
REGISTER_VOID__INT_INT          register_set_game_object_int,        "set_go_int"
REGISTER_INT__STRING_INT        register_get_game_object_int16,      "get_go_int16"
REGISTER_VOID__INT_INT          register_set_game_object_int16,      "set_go_int16"
REGISTER_INT__STRING_INT        register_set_game_object_shared_str, "set_go_shared_str"
;--
REGISTER_FLOAT__INT             register_get_inventory_item_float,      "get_inventory_item_float"
REGISTER_VOID__VECTOR_FLOAT_INT register_set_inventory_item_float,      "set_inventory_item_float"
REGISTER_INT__STRING_INT        register_get_inventory_item_int,        "get_inventory_item_int"
REGISTER_VOID__INT_INT          register_set_inventory_item_int,        "set_inventory_item_int"
REGISTER_INT__STRING_INT        register_get_inventory_item_int16,      "get_inventory_item_int16"
REGISTER_VOID__INT_INT          register_set_inventory_item_int16,      "set_inventory_item_int16"
REGISTER_INT__STRING_INT        register_set_inventory_item_shared_str, "set_inventory_item_shared_str"
;--
REGISTER_INT__STRING_INT register_get_actor_int, "get_actor_int"
REGISTER_INT__STRING_INT register_get_actor_int16, "get_actor_int16"

REGISTER_INT__STRING_INT register_get_wpn_gl_int, "get_wpn_gl_int"
REGISTER_INT__STRING_INT register_get_wpn_int, "get_wpn_int"
; -- to del
REGISTER_INT__STRING_INT register_get_holder_int, "get_holder_int"
;
REGISTER_VOID__INT_INT register_set_wpn_int, "set_wpn_int"

REGISTER_INT__STRING_INT register_get_wpn_bone_id, "get_wpn_bone_id"
;REGISTER_INT__STRING_INT register_get_wpn_hud_bone_id, "get_wpn_hud_bone_id"

REGISTER_INT__STRING_INT register_get_hud_bone_id, "get_hud_bone_id"
REGISTER_INT__STRING_INT register_set_wpn_bone_visible, "set_wpn_bone_visible"
REGISTER_INT__STRING_INT register_set_hud_bone_visible, "set_hud_bone_visible"
REGISTER_INT__STRING_INT register_get_wpn_bone_visible, "get_wpn_bone_visible"
REGISTER_INT__STRING_INT register_get_bone_visible, "get_bone_visible"
REGISTER_INT__STRING_INT register_set_bone_visible, "set_bone_visible"

REGISTER_FLOAT__INT register_get_wpn_float, "get_wpn_float"
REGISTER_VOID__VECTOR_FLOAT_INT register_set_wpn_float, "set_wpn_float"

REGISTER_FLOAT__INT register_get_custom_monster_float, "get_custom_monster_float"
REGISTER_INT__STRING_INT register_get_custom_monster_int, "get_custom_monster_int"

REGISTER_INT__STRING_INT register_set_actor_shared_str, "set_actor_shared_str"
REGISTER_INT__STRING_INT register_set_wpn_shared_str, "set_wpn_shared_str"

REGISTER_GO__INT register_item_in_inv_box, "object_from_inv_box"

REGISTER_VECTOR__STRING register_get_hud_bone_pos, "get_hud_bone_pos"

ALIGN_8
game_object_fix proc
; делаем то, что вырезали 
	call    enable_vision_register
; добавляем своё
	PRINT "game_object_fix"
	; регистрируем функцию разрешения колбеков на нажатия и мышь
	PERFORM_EXPORT_VOID__BOOL enable_input_extensions, "enable_input_extensions"
	; регистрируем функцию получения топлива у машины
	PERFORM_EXPORT_FLOAT__VOID CScriptGameObject__GetFuel, "get_fuel"
	; регистрируем функцию получения потребления топлива у машины
	PERFORM_EXPORT_FLOAT__VOID CScriptGameObject__GetFuelConsumption, "get_fuel_consumption"
	; регистрируем функцию получения объёма бака у машины
	PERFORM_EXPORT_FLOAT__VOID CScriptGameObject__GetFuelTank, "get_fuel_tank"
	; регистрируем функцию установки топлива у машины
	PERFORM_EXPORT_VOID__FLOAT CScriptGameObject__SetFuel, "set_fuel"
	; регистрируем функцию установки потребления топлива у машины
	PERFORM_EXPORT_VOID__FLOAT CScriptGameObject__SetFuelConsumption, "set_fuel_consumption"
	; регистрируем функцию получения предмета с пояса по номеру
	PERFORM_EXPORT_GO__INT register_item_on_belt, CScriptGameObject__item_on_belt
	; регистрируем функцию получения предмета из рюкзака по номеру
	PERFORM_EXPORT_GO__INT register_item_in_ruck, CScriptGameObject__item_in_ruck
	; регистрируем функцию получения количества предметов на поясе
	PERFORM_EXPORT_UINT__VOID CScriptGameObject__BeltCount, "belt_count"
	; регистрируем функцию получения количества предметов в рюкзаке
	PERFORM_EXPORT_UINT__VOID CScriptGameObject__RuckCount, "ruck_count"
	; регистрируем функцию получения количества слотов
	PERFORM_EXPORT_UINT__VOID CScriptGameObject__SlotCount, "slot_number"
	; регистрируем функцию перемещения предмета предмета в рюкзак
	PERFORM_EXPORT_BOOL__GO register_move_to_ruck, CScriptGameObject__MoveToRuck
	; регистрируем функцию перемещения предмета предмета на пояс
	PERFORM_EXPORT_BOOL__GO register_move_to_belt, CScriptGameObject__MoveToBelt
	; регистрируем функцию перемещения предмета предмета в слот без активациии
	PERFORM_EXPORT_BOOL__GO register_move_to_slot, CScriptGameObject__MoveToSlotNotActivate
	; регистрируем функцию перемещения предмета предмета в слот с одновременной активацией
	PERFORM_EXPORT_BOOL__GO register_move_to_slot_and_activate, CScriptGameObject__MoveToSlotAndActivate
	; регистрируем функцию определения того, что предмет находится на поясе
	PERFORM_EXPORT_BOOL__GO register_is_on_belt, CScriptGameObject__IsOnBelt
	; регистрируем функцию определения того, что предмет находится в рюкзаке
	PERFORM_EXPORT_BOOL__GO register_is_in_ruck, CScriptGameObject__IsInRuck
	; регистрируем функцию определения того, что предмет находится в слоте
	PERFORM_EXPORT_BOOL__GO register_is_in_slot, CScriptGameObject__IsInSlot
	; регистрируем функцию получения общего веса инвентаря
	PERFORM_EXPORT_FLOAT__VOID CScriptGameObject__GetInventoryWeight, "get_inventory_weight"
	; регистрируем функцию получения предмета из инвентарного ящика по номеру
	PERFORM_EXPORT_GO__INT register_item_in_inv_box, CScriptGameObject__item_in_inv_box
	; test get_id
	PERFORM_EXPORT_INT__VOID CScriptGameObject__GetID, "get_id"
	; регистрируем функцию установки коэффициента спринта для актора
	PERFORM_EXPORT_VOID__FLOAT CScriptGameObject__SetSprintFactor, "set_sprint_factor"
	; регистрируем функцию получения коэффициента спринта для актора
	PERFORM_EXPORT_FLOAT__VOID CScriptGameObject__GetSprintFactor, "get_sprint_factor"
	; регистрируем функцию получения состояния актора
	PERFORM_EXPORT_UINT__VOID CScriptGameObject__ActorBodyState, "actor_body_state"
	; регистрируем функцию получения видимости актора
	PERFORM_EXPORT_UINT__VOID CScriptGameObject__GetActorVisible, "get_actor_visible"
	
	; регистрируем функцию получения max weight
	PERFORM_EXPORT_FLOAT__VOID CScriptGameObject__GetActorMaxWeight, "get_actor_max_weight"
	; регистрируем функцию получения max walk weight
	PERFORM_EXPORT_FLOAT__VOID CScriptGameObject__GetActorMaxWalkWeight, "get_actor_max_walk_weight"
	; регистрируем функцию установки max weight
	PERFORM_EXPORT_VOID__FLOAT CScriptGameObject__SetActorMaxWeight, "set_actor_max_weight"
	; регистрируем функцию установки max walk weight
	PERFORM_EXPORT_VOID__FLOAT CScriptGameObject__SetActorMaxWalkWeight, "set_actor_max_walk_weight"
	; регистрируем функцию получения take distance
	PERFORM_EXPORT_FLOAT__VOID CScriptGameObject__GetActorTakeDist, "get_actor_take_dist"
	; регистрируем функцию установки take distance
	PERFORM_EXPORT_VOID__FLOAT CScriptGameObject__SetActorTakeDist, "set_actor_take_dist"
	;--
	PERFORM_EXPORT_FLOAT__INT             register_get_game_object_float,      CScriptGameObject__GetGameObjectFloat
	PERFORM_EXPORT_VOID__VECTOR_FLOAT_INT register_set_game_object_float,      CScriptGameObject__SetGameObjectFloat
	PERFORM_EXPORT_INT__STRING_INT        register_get_game_object_int,        CScriptGameObject__GetGameObjectInt
	PERFORM_EXPORT_VOID__INT_INT          register_set_game_object_int,        CScriptGameObject__SetGameObjectInt
	PERFORM_EXPORT_INT__STRING_INT        register_get_game_object_int16,      CScriptGameObject__GetGameObjectInt16
	PERFORM_EXPORT_VOID__INT_INT          register_set_game_object_int16,      CScriptGameObject__SetGameObjectInt16
	PERFORM_EXPORT_INT__STRING_INT        register_set_game_object_shared_str, CScriptGameObject__SetGameObjectSharedStr
	
	PERFORM_EXPORT_STRING__VOID      CScriptGameObject__GetGameObjectSharedStr, "get_go_shared_str"
	;--
	PERFORM_EXPORT_FLOAT__INT             register_get_inventory_item_float,      CScriptGameObject__GetInventoryItemFloat
	PERFORM_EXPORT_VOID__VECTOR_FLOAT_INT register_set_inventory_item_float,      CScriptGameObject__SetInventoryItemFloat
	PERFORM_EXPORT_INT__STRING_INT        register_get_inventory_item_int,        CScriptGameObject__GetInventoryItemInt
	PERFORM_EXPORT_VOID__INT_INT          register_set_inventory_item_int,        CScriptGameObject__SetInventoryItemInt
	PERFORM_EXPORT_INT__STRING_INT        register_get_inventory_item_int16,      CScriptGameObject__GetInventoryItemInt16
	PERFORM_EXPORT_VOID__INT_INT          register_set_inventory_item_int16,      CScriptGameObject__SetInventoryItemInt16
	PERFORM_EXPORT_INT__STRING_INT        register_set_inventory_item_shared_str, CScriptGameObject__SetInventoryItemSharedStr
	
	PERFORM_EXPORT_STRING__VOID      CScriptGameObject__GetInventoryItemSharedStr, "get_inventory_item_shared_str"
	;--
	PERFORM_EXPORT_FLOAT__INT register_get_actor_float, CScriptGameObject__GetActorFloat
	PERFORM_EXPORT_VOID__VECTOR_FLOAT_INT register_set_actor_float, CScriptGameObject__SetActorFloat
	PERFORM_EXPORT_FLOAT__INT register_get_actor_condition_float, CScriptGameObject__GetActorConditionFloat
	PERFORM_EXPORT_VOID__VECTOR_FLOAT_INT register_set_actor_condition_float, CScriptGameObject__SetActorConditionFloat
	PERFORM_EXPORT_INT__STRING_INT register_get_actor_int, CScriptGameObject__GetActorInt
	PERFORM_EXPORT_INT__STRING_INT register_get_actor_int16, CScriptGameObject__GetActorInt16

	PERFORM_EXPORT_INT__STRING_INT register_get_wpn_gl_int, CScriptGameObject__GetWeaponGLInt
	PERFORM_EXPORT_INT__STRING_INT register_get_wpn_int, CScriptGameObject__GetWeaponInt
	PERFORM_EXPORT_VOID__INT_INT register_set_wpn_int, CScriptGameObject__SetWeaponInt
	
	PERFORM_EXPORT_INT__STRING_INT register_get_wpn_bone_id, CScriptGameObject__GetWeaponBoneID
	;PERFORM_EXPORT_INT__STRING_INT register_get_wpn_hud_bone_id, CScriptGameObject__GetWeaponHudBoneID
	
	PERFORM_EXPORT_INT__STRING_INT register_get_hud_bone_id, CScriptGameObject__GetHudBoneID
	
	PERFORM_EXPORT_INT__STRING_INT register_set_wpn_bone_visible, CScriptGameObject__SetWeaponBoneVisible
	PERFORM_EXPORT_INT__STRING_INT register_set_hud_bone_visible, CScriptGameObject__SetHudBoneVisible
	
	PERFORM_EXPORT_INT__STRING_INT register_get_wpn_bone_visible, CScriptGameObject__GetWeaponBoneVisible
	PERFORM_EXPORT_INT__STRING_INT register_get_bone_visible, CScriptGameObject__GetBoneVisible
	PERFORM_EXPORT_INT__STRING_INT register_set_bone_visible, CScriptGameObject__SetBoneVisible
	
	PERFORM_EXPORT_FLOAT__INT register_get_wpn_float, CScriptGameObject__GetWeaponFloat
	PERFORM_EXPORT_VOID__VECTOR_FLOAT_INT register_set_wpn_float, CScriptGameObject__SetWeaponFloat
	
	
	PERFORM_EXPORT_UINT__VOID CScriptGameObject__IsGameObject, "is_game_object"

	; регистрируем функцию получения FOV актора
	PERFORM_EXPORT_FLOAT__VOID CScriptGameObject__GetCameraFOV, "get_camera_fov"
	; регистрируем функцию установки FOV актора
	PERFORM_EXPORT_VOID__FLOAT CScriptGameObject__SetCameraFOV, "set_camera_fov"
	;
	PERFORM_EXPORT_FLOAT__INT register_get_custom_monster_float, CScriptGameObject__GetCustomMonsterFloat
	PERFORM_EXPORT_INT__STRING_INT register_get_custom_monster_int, CScriptGameObject__GetCustomMonsterInt

	PERFORM_EXPORT_VOID__STRING CScriptGameObject__TestStr, "test_str"
	PERFORM_EXPORT_STRING__VOID CScriptGameObject__GetActorSharedStr, "get_actor_shared_str"
	PERFORM_EXPORT_INT__STRING_INT register_set_actor_shared_str, CScriptGameObject__SetActorSharedStr
	
	PERFORM_EXPORT_STRING__VOID CScriptGameObject__GetWpnSharedStr, "get_wpn_shared_str"
	PERFORM_EXPORT_INT__STRING_INT register_set_wpn_shared_str, CScriptGameObject__SetWpnSharedStr
	
	PERFORM_EXPORT_VOID__STRING CScriptGameObject__SetActorVisual, "set_actor_visual"
	
	PERFORM_EXPORT_VOID__GO CScriptGameObject__OpenInventoryBox, "open_inventory_box"
	; регистрируем функцию получения количества предметов в ящике
	PERFORM_EXPORT_UINT__VOID CScriptGameObject__InvBoxCount, "inv_box_count"
	; получение инвентарного веса
	PERFORM_EXPORT_FLOAT__VOID CScriptGameObject__GetWeght, "get_weight"
	; получение владельца машины, как game_object
	PERFORM_EXPORT_GO__VOID	CScriptGameObject__GetHolderOwner, "get_holder_owner"
	PERFORM_EXPORT_INT__STRING_INT register_get_holder_int, CScriptGameObject__GetHolderInt
	; получение скорости кровотечения
	;PERFORM_EXPORT_FLOAT__VOID CScriptGameObject__GetBleedingSpeed, "get_bleeding_speed"
	; изменение скорости кровотечения
	PERFORM_EXPORT_VOID__FLOAT CScriptGameObject__ChangeBleedingSpeed, "heal_wounds"
	
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__GetCarShift,          "get_car_shift"
	
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__GetGameObject,        "is_game_object"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsCar,                "is_car"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsHolder,             "is_holder"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsEntityAlive,        "is_entity_alive"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsInventoryItem,      "is_inventory_item"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsInventoryOwner,     "is_inventory_owner"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsActor,              "is_actor"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsCustomMonster,      "is_custom_monster"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsWeapon,             "is_weapon"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsWeaponGL,           "is_weapon_gl"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsInventoryBox,       "is_inventory_box"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__CInventoryBox,       "is_inventory_box1"
	PERFORM_EXPORT_UINT__VOID CScriptGameObject__CInventoryBox,       "cast_inventory_box"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsMedkit,             "is_medkit"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsEatableItem,        "is_eatable_item"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsAntirad,            "is_antirad"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsOutfit,             "is_outfit"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsScope,              "is_scope"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsSilencer,           "is_silencer"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsGrenadeLauncher,    "is_grenade_launcher"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsWeaponMagazined,    "is_weapon_magazined"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsSpaceRestrictor,    "is_space_restrictor"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsStalker,            "is_stalker"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsCustomZone,         "is_anomaly"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsBaseMonster,        "is_monster"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsExplosive,          "is_explosive"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsScriptZone,         "is_script_zone"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsProjector,          "is_projector"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsTrader,             "is_trader"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsHudItem,            "is_hud_item"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsFoodItem,           "is_food_item"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsArtefact,           "is_artefact"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsAmmo,               "is_ammo"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsMissile,            "is_missile"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsPhysicsShellHolder, "is_physics_shell_holder"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsGrenade,            "is_grenade"
	
	PERFORM_EXPORT_VECTOR__STRING register_get_hud_bone_pos, CScriptGameObject__hud_bone_position
	
	PERFORM_EXPORT_VOID__VOID CScriptGameObject__ProjectorOn, "projector_on"
	PERFORM_EXPORT_VOID__VOID CScriptGameObject__ProjectorOff, "projector_off"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__ProjectorIsOn, "projector_is_on"
	PERFORM_EXPORT_VOID__BOOL CScriptGameObject__SwitchProjector, "switch_projector"
	; идём обратно
	jmp back_from_game_object_fix
game_object_fix endp

input_extensions_enabled dd 0

enable_input_extensions    proc near               ; DATA XREF: script_register_game_object2+51Fo
arg_0           = byte ptr  8
	mov eax, [ebp+4]
	mov [input_extensions_enabled], eax
	retn 4
enable_input_extensions    endp

CScriptGameObject__GetFuel proc
var_4 = dword ptr -4

	push    ebp
	mov     ebp, esp
	
	call CScriptGameObject__get_car
	
	; this + 1256 ; fuel
	; this +  1260 ; fuel_tank
	; this +  1264 ; fuel_consumption
	fld     dword ptr [eax + 1256] ; 
	
	pop     ebp
	retn
CScriptGameObject__GetFuel endp

CScriptGameObject__GetFuelConsumption proc
	call CScriptGameObject__get_car
	fld     dword ptr [eax + 1264]
	retn
CScriptGameObject__GetFuelConsumption endp

CScriptGameObject__GetFuelTank proc
	call CScriptGameObject__get_car
	fld     dword ptr [eax + 1260]
	retn
CScriptGameObject__GetFuelTank endp


CScriptGameObject__SetFuel proc
dir = dword ptr  8
	push    ebp
	mov     ebp, esp
	push    ebx
	push    eax
	
	call CScriptGameObject__get_car
	
	mov     ebx, [ebp+dir]
	mov     [eax + 1256], ebx
	
	pop     eax
	pop     ebx
	pop     ebp
	retn    4
CScriptGameObject__SetFuel endp


CScriptGameObject__SetFuelConsumption proc
dir = dword ptr  8
	push    ebp
	mov     ebp, esp
	push    ebx
	push    eax
	
	call CScriptGameObject__get_car
	
	mov     ebx, [ebp+dir]
	mov     [eax + 1264], ebx
	
	pop     eax
	pop     ebx
	pop     ebp
	retn    4
CScriptGameObject__SetFuelConsumption endp

CScriptGameObject__item_on_belt proc

arg_0   = dword ptr  8

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	;---
	mov     ecx, [ecx+4] ; ecx = m_object
	test    ecx, ecx
	jz      short fail_exit ; как это может быть?
	mov     eax, [ecx]
	mov     eax, [eax+70h]
	call    eax          ; smart_cast<CInventoryOwner*> eax = inventory_owner
	test    eax, eax
	jz      short fail_exit
	;---
	mov     ecx, [eax+24h] ; ecx = inventory
	
	mov     esi, [ebp+arg_0] ; esi = i
	;
	mov     edx, [ecx+40] ; edx = belt.begin
	mov     eax, [ecx+44] ; eax = belt.end
	sub     eax, edx
	sar     eax, 2        ; eax = belt.size()
	cmp     eax, esi
	jbe     short fail_exit
	shl     esi, 2
	mov     eax, [esi+edx] ;+4]
	test    eax, eax
	jz      short fail_exit
	;-----------
	mov     edi, [eax+0D4h] ; inventory_item -> CGameObject
	;-----------
	;mov     edx, [eax]
	;mov     ecx, eax
	;mov     eax, [edx+12Ch]
	;call    eax
	;test    eax, eax
	;jz      short fail_exit
	;mov     edi, eax
	;-----------
	call    CGameObject__lua_game_object
	jmp     exit
fail_exit:
	xor     eax, eax
exit:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__item_on_belt endp

CScriptGameObject__item_in_ruck proc

arg_0   = dword ptr  8

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	;---
	mov     ecx, [ecx+4] ; ecx = m_object
	test    ecx, ecx
	jz      short fail_exit ; как это может быть?
	mov     eax, [ecx]
	mov     eax, [eax+70h]
	call    eax          ; smart_cast<CInventoryOwner*> eax = inventory_owner
	test    eax, eax
	jz      short fail_exit
	;---
	mov     ecx, [eax+24h] ; ecx = inventory
	
	mov     esi, [ebp+arg_0] ; esi = i
	;
	mov     edx, [ecx+24] ; edx = ruck.begin
	mov     eax, [ecx+28] ; eax = ruck.end
	sub     eax, edx
	sar     eax, 2        ; eax = ruck.size()
	cmp     eax, esi
	jbe     short fail_exit
	shl     esi, 2
	mov     eax, [esi+edx];+4]
	test    eax, eax
	jz      short fail_exit
	mov     edi, [eax+0D4h]
	call    CGameObject__lua_game_object
	jmp     exit
fail_exit:
	xor     eax, eax
exit:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__item_in_ruck endp



CScriptGameObject__SlotCount proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	;---
	mov     ecx, [ecx+4] ; ecx = m_object
	test    ecx, ecx
	jz      short fail_exit ; как это может быть?
	mov     eax, [ecx]
	mov     eax, [eax+70h]
	call    eax          ; smart_cast<CInventoryOwner*> eax = inventory_owner
	test    eax, eax
	jz      short fail_exit
	;---
	mov     ecx, [eax+24h] ; ecx = inventory
	;
	mov     edx, [ecx+56]; [ecx+28] ; edx = slot.begin
	mov     eax, [ecx+60]; [ecx+32] ; eax = slot.end
	sub     eax, edx
	sar     eax, 4        ; eax = belt.size()
	jmp     exit
fail_exit:
	xor     eax, eax
exit:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__SlotCount endp


CScriptGameObject__BeltCount proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	;---
	mov     ecx, [ecx+4] ; ecx = m_object
	test    ecx, ecx
	jz      short fail_exit ; как это может быть?
	mov     eax, [ecx]
	mov     eax, [eax+70h]
	call    eax          ; smart_cast<CInventoryOwner*> eax = inventory_owner
	test    eax, eax
	jz      short fail_exit
	;---
	mov     ecx, [eax+24h] ; ecx = inventory
	;
	mov     edx, [ecx+40] ; edx = belt.begin
	mov     eax, [ecx+44] ; eax = belt.end
	sub     eax, edx
	sar     eax, 2        ; eax = belt.size()
	jmp     exit
fail_exit:
	xor     eax, eax
exit:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__BeltCount endp

CScriptGameObject__RuckCount proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	;---
	mov     ecx, [ecx+4] ; ecx = m_object
	test    ecx, ecx
	jz      short fail_exit ; как это может быть?
	mov     eax, [ecx]
	mov     eax, [eax+70h]
	call    eax          ; smart_cast<CInventoryOwner*> eax = inventory_owner
	test    eax, eax
	jz      short fail_exit
	;---
	mov     ecx, [eax+24h] ; ecx = inventory
	;
	mov     edx, [ecx+24]; edx = ruck.begin
	mov     eax, [ecx+28]; eax = ruck.end
	sub     eax, edx
	sar     eax, 2        ; eax = ruck.size()
	jmp     exit
fail_exit:
	xor     eax, eax
exit:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__RuckCount endp

CScriptGameObject__MoveToRuck proc near
arg_0 = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    ecx
	push    ebx
	push    esi
	mov     esi, [ebp+arg_0]
	test    esi, esi
	push    edi
	mov     ebx, ecx
	jnz     short argument_is_not_null
exit_fail:
	; 
	;push    offset msg_fail
	;call    Msg
	;add     esp, 4
	
	xor     eax, eax ; return false
	;
	pop     edi
	pop     esi
	pop     ebx
	mov     esp, ebp
	pop     ebp
	retn    4
	; ---------------------------------------------------------------------------
argument_is_not_null:
	mov     edi, [esi+4]
	test    edi, edi
	jz      short lab1
	call    CGameObject__lua_game_object
lab1:
	mov     ecx, [esi+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+74h]
	call    edx
	mov     esi, eax
	test    esi, esi
	jz      short exit_fail
	mov     edi, [ebx+4]
	test    edi, edi
	jz      short lab2
	call    CGameObject__lua_game_object
lab2:
	mov     ecx, [ebx+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+70h]
	call    edx
	test    eax, eax
	jz      short exit_fail
	mov     eax, [eax+24h]
	; здесь имеем eax == inventory, esi == item
	push    esi
	mov     esi, eax
	
	call    CInventory__Ruck ; int this<esi>, int item
	
	
	pop     edi
	pop     esi
	pop     ebx
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__MoveToRuck endp

CScriptGameObject__GetInventoryWeight proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	
	;jmp exit
	; получаем инвентарь
	mov     ecx, [ecx+4] ; ecx = m_object
	test    ecx, ecx
	jz      short fail ; как это может быть?
	mov     eax, [ecx]
	mov     eax, [eax+70h]
	call    eax          ; smart_cast<CInventoryOwner*> eax = inventory_owner
	test    eax, eax
	jz      short fail
	;---
	mov     edi, [eax+24h] ; esi = inventory

	call CInventory__CalcTotalWeight
	movss   [buf], xmm0
	fld     dword ptr [buf]
	jmp     exit2
fail:
	 fldz
exit2:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn
buf dword ?
CScriptGameObject__GetInventoryWeight endp

CScriptGameObject__IsOnBelt_old proc near
arg_0           = dword ptr  8

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	push    ebx
	
	;jmp exit
	; получаем инвентарь
	mov     ecx, [ecx+4] ; ecx = m_object
	test    ecx, ecx
	jz      short fail ; как это может быть?
	mov     eax, [ecx]
	mov     eax, [eax+70h]
	call    eax          ; smart_cast<CInventoryOwner*> eax = inventory_owner
	test    eax, eax
	jz      short fail
	;---
	mov     ebx, [eax+24h] ; esi = inventory
	

	; получаем предмет
	mov     eax, [ebp+arg_0] ; arg_0 == game_object
	test    eax, eax
	jz      fail
	mov     eax, [eax+4]
	test    eax, eax
	jz      fail
	mov     eax, [eax]
	mov     eax, [eax+74h]
	call    eax
	test    eax, eax
	jz      fail
	;-------------------------
	mov ecx, ebx
	call CInventory__InBelt ; int item<eax>, int this<ecx>
exit:
	jmp     exit2
fail:
	xor     eax, eax
exit2:
	pop     ebx
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__IsOnBelt_old endp


CScriptGameObject__GetID proc
arg_0           = dword ptr  8

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	push    ebx
	
	;jmp exit
	; получаем инвентарь
	mov     ecx, [ecx+4] ; ecx = m_object
	test    ecx, ecx
	jz      short fail ; как это может быть?
	mov     eax, [ecx]
	mov     eax, [eax+70h]
	call    eax          ; smart_cast<CInventoryOwner*> eax = inventory_owner
	test    eax, eax
	jz      short fail
	;---
	mov     ebx, [eax+24h] ; esi = inventory
	

	; получаем предмет
	mov     eax, [ebp+arg_0] ; arg_0 == game_object
	test    eax, eax
	jz      fail
	mov     eax, [eax+4]
	test    eax, eax
	jz      fail
	mov     eax, [eax]
	mov     eax, [eax+74h]
	call    eax
	test    eax, eax
	jz      fail
	
	mov     eax, [eax+0D4h]
	movzx   eax, word ptr [eax+0A4h]

	;-------------------------
	;mov ecx, ebx
	;call CInventory__InBelt ; int item<eax>, int this<ecx>
exit:
	jmp     exit2
fail:
	mov     eax, 0FFFFh
exit2:
	pop     ebx
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__GetID endp


CScriptGameObject__IsOnBelt proc
arg_0 = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    ecx
	push    ebx
	push    esi
	mov     esi, [ebp+arg_0]
	test    esi, esi
	push    edi
	mov     ebx, ecx
	jnz     short argument_is_not_null
exit_fail:
	; 
	;push    offset msg_is_on_belt_fail
	;call    Msg
	;add     esp, 4
	
	xor     eax, eax ; return false
	;
	pop     edi
	pop     esi
	pop     ebx
	mov     esp, ebp
	pop     ebp
	retn    4
	; ---------------------------------------------------------------------------
argument_is_not_null:
	mov     edi, [esi+4]
	test    edi, edi
	jz      short lab1
	call    CGameObject__lua_game_object
lab1:
	mov     ecx, [esi+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+74h]
	call    edx
	mov     esi, eax
	test    esi, esi
	jz      short exit_fail
	mov     edi, [ebx+4]
	test    edi, edi
	jz      short lab2
	call    CGameObject__lua_game_object
lab2:
	mov     ecx, [ebx+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+70h]
	call    edx
	test    eax, eax
	jz      short exit_fail
	mov     eax, [eax+24h]
	; здесь имеем eax == inventory, esi == item
	mov     ecx, eax
	mov     eax, esi
	
	call    CInventory__InBelt ; int item<eax>, int this<ecx>
	
	
	pop     edi
	pop     esi
	pop     ebx
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__IsOnBelt endp

;"is_in_ruck" ; ------
CScriptGameObject__IsInRuck proc
arg_0 = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    ecx
	push    ebx
	push    esi
	mov     esi, [ebp+arg_0]
	test    esi, esi
	push    edi
	mov     ebx, ecx
	jnz     short argument_is_not_null
exit_fail:
	; 
	;push    offset msg_is_on_belt_fail
	;call    Msg
	;add     esp, 4
	
	xor     eax, eax ; return false
	;
	pop     edi
	pop     esi
	pop     ebx
	mov     esp, ebp
	pop     ebp
	retn    4
	; ---------------------------------------------------------------------------
argument_is_not_null:
	mov     edi, [esi+4]
	test    edi, edi
	jz      short lab1
	call    CGameObject__lua_game_object
lab1:
	mov     ecx, [esi+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+74h]
	call    edx
	mov     esi, eax
	test    esi, esi
	jz      short exit_fail
	mov     edi, [ebx+4]
	test    edi, edi
	jz      short lab2
	call    CGameObject__lua_game_object
lab2:
	mov     ecx, [ebx+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+70h]
	call    edx
	test    eax, eax
	jz      short exit_fail
	mov     eax, [eax+24h]
	; здесь имеем eax == inventory, esi == item
	mov     ecx, eax
	mov     eax, esi
	
	call    CInventory__CanPutInRuck ; == ! CInventory__InRuck ; int item<eax>, int this<ecx>
	;call    CInventory__InBelt ; int item<eax>, int this<ecx>
	;xor     eax, 01h
	
	pop     edi
	pop     esi
	pop     ebx
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__IsInRuck endp

;"is_in_slot" ; ------
CScriptGameObject__IsInSlot proc
arg_0 = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    ecx
	push    ebx
	push    esi
	mov     esi, [ebp+arg_0]
	test    esi, esi
	push    edi
	mov     ebx, ecx
	jnz     short argument_is_not_null
exit_fail:
	; 
	;push    offset msg_is_on_belt_fail
	;call    Msg
	;add     esp, 4
	
	xor     eax, eax ; return false
	;
	pop     edi
	pop     esi
	pop     ebx
	mov     esp, ebp
	pop     ebp
	retn    4
	; ---------------------------------------------------------------------------
argument_is_not_null:
	mov     edi, [esi+4]
	test    edi, edi
	jz      short lab1
	call    CGameObject__lua_game_object
lab1:
	mov     ecx, [esi+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+74h]
	call    edx
	mov     esi, eax
	test    esi, esi
	jz      short exit_fail
	mov     edi, [ebx+4]
	test    edi, edi
	jz      short lab2
	call    CGameObject__lua_game_object
lab2:
	mov     ecx, [ebx+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+70h]
	call    edx
	test    eax, eax
	jz      short exit_fail
	mov     eax, [eax+24h]
	; здесь имеем eax == inventory, esi == item
	mov     ebx, eax
	mov     edi, esi
	
	call    CInventory__InSlot ; int this<ebx>, int item<edi>
	
	pop     edi
	pop     esi
	pop     ebx
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__IsInSlot endp

;"move_to_belt" ; --
CScriptGameObject__MoveToBelt proc
arg_0 = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    ecx
	push    ebx
	push    esi
	mov     esi, [ebp+arg_0]
	test    esi, esi
	push    edi
	mov     ebx, ecx
	jnz     short argument_is_not_null
exit_fail:
	; 
	;push    offset msg_is_on_belt_fail
	;call    Msg
	;add     esp, 4
	
	xor     eax, eax ; return false
	;
	pop     edi
	pop     esi
	pop     ebx
	mov     esp, ebp
	pop     ebp
	retn    4
	; ---------------------------------------------------------------------------
argument_is_not_null:
	mov     edi, [esi+4]
	test    edi, edi
	jz      short lab1
	call    CGameObject__lua_game_object
lab1:
	mov     ecx, [esi+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+74h]
	call    edx
	mov     esi, eax
	test    esi, esi
	jz      short exit_fail
	mov     edi, [ebx+4]
	test    edi, edi
	jz      short lab2
	call    CGameObject__lua_game_object
lab2:
	mov     ecx, [ebx+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+70h]
	call    edx
	test    eax, eax
	jz      short exit_fail
	mov     eax, [eax+24h]
	; здесь имеем eax == inventory, esi == item
	push    esi
	
	call    CInventory__Belt ; this<eax>, int item <stack>
	
	pop     edi
	pop     esi
	pop     ebx
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__MoveToBelt endp

;"move_to_slot_and_activate" ; --
CScriptGameObject__MoveToSlotAndActivate proc
arg_0 = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    ecx
	push    ebx
	push    esi
	mov     esi, [ebp+arg_0]
	test    esi, esi
	push    edi
	mov     ebx, ecx
	jnz     short argument_is_not_null
exit_fail:
	; 
	;push    offset msg_is_on_belt_fail
	;call    Msg
	;add     esp, 4
	
	xor     eax, eax ; return false
	;
	pop     edi
	pop     esi
	pop     ebx
	mov     esp, ebp
	pop     ebp
	retn    4
	; ---------------------------------------------------------------------------
argument_is_not_null:
	mov     edi, [esi+4]
	test    edi, edi
	jz      short lab1
	call    CGameObject__lua_game_object
lab1:
	mov     ecx, [esi+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+74h]
	call    edx
	mov     esi, eax
	test    esi, esi
	jz      short exit_fail
	mov     edi, [ebx+4]
	test    edi, edi
	jz      short lab2
	call    CGameObject__lua_game_object
lab2:
	mov     ecx, [ebx+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+70h]
	call    edx
	test    eax, eax
	jz      short exit_fail
	mov     eax, [eax+24h]
	; здесь имеем eax == inventory, esi == item
	mov     edx, 0
	push    edx
	mov     ecx, eax
	mov     eax, esi
	
	call    CInventory__Slot ; item<eax>, this<ecx>, bool activate <stack>
	
	pop     edi
	pop     esi
	pop     ebx
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__MoveToSlotAndActivate endp

;"move_to_slot" ; --
CScriptGameObject__MoveToSlotNotActivate proc
arg_0 = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    ecx
	push    ebx
	push    esi
	mov     esi, [ebp+arg_0]
	test    esi, esi
	push    edi
	mov     ebx, ecx
	jnz     short argument_is_not_null
exit_fail:
	; 
	;push    offset msg_is_on_belt_fail
	;call    Msg
	;add     esp, 4
	
	xor     eax, eax ; return false
	;
	pop     edi
	pop     esi
	pop     ebx
	mov     esp, ebp
	pop     ebp
	retn    4
	; ---------------------------------------------------------------------------
argument_is_not_null:
	mov     edi, [esi+4]
	test    edi, edi
	jz      short lab1
	call    CGameObject__lua_game_object
lab1:
	mov     ecx, [esi+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+74h]
	call    edx
	mov     esi, eax
	test    esi, esi
	jz      short exit_fail
	mov     edi, [ebx+4]
	test    edi, edi
	jz      short lab2
	call    CGameObject__lua_game_object
lab2:
	mov     ecx, [ebx+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+70h]
	call    edx
	test    eax, eax
	jz      short exit_fail
	mov     eax, [eax+24h]
	; здесь имеем eax == inventory, esi == item
	mov     edx, 1
	push    edx
	mov     ecx, eax
	mov     eax, esi
	
	call    CInventory__Slot ; item<eax>, this<ecx>, bool activate <stack>
	
	pop     edi
	pop     esi
	pop     ebx
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__MoveToSlotNotActivate endp


;"can_move_to_slot" ; --
;"can_move_to_ruck" ;--
;"can_move_to_belt" ; --

CScriptGameObject__SetSprintFactor proc
sprint_factor = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	mov     esi, ecx
	push    edi
	
	mov     edi, [esi+4]
	test    edi, edi
	jz      short lab1
	call    CGameObject__lua_game_object

lab1:
	mov     ecx, [esi+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+80h]
	call    edx
	test    eax, eax
	jz      short exit_fail


	;---
	mov     ecx, [ebp + sprint_factor]
	mov    [eax+1468], ecx
	jmp     exit
exit_fail:
;	push offset a_fail_msg
;	call  Msg
;	pop  eax
exit:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__SetSprintFactor endp
a_error_msg db "no actor", 0
a_ok_msg db "done", 0

CScriptGameObject__GetSprintFactor proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	
	; получаем актора
	mov     eax, [ecx+4] ; m_object
	test    eax, eax
	jz      short exit_fail
	mov     eax, [eax]
	mov     eax, [eax+80h]
	call    eax
	test    eax, eax ; eax = actor
	jz      short exit_fail
	
	fld     dword ptr [eax+5BCh]
	;push offset a_ok_msg
	;call  Msg
	;pop  eax
	jmp     exit2
exit_fail:
	fldz
exit2:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__GetSprintFactor endp

CScriptGameObject__ActorBodyState proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push	ecx
	
	call    CScriptGameObject__CActor
	test    eax, eax
	jz      short exit_fail
	;---------------
	mov     eax, [eax+1428]
	jmp     exit_ok
exit_fail:
	xor     eax, eax
exit_ok:
	pop	ecx
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__ActorBodyState endp

CScriptGameObject__GetActorVisible proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push	ecx
	
	call    CScriptGameObject__CActor
	test    eax, eax
	jz      short exit_no
	;------
	push	eax
	call    ds:CObject__getVisible
	test	eax, eax
	jz	short exit_no
	mov	al, 1
	jmp     short exit
exit_no:
	xor     al, al
exit:
	pop	ecx
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__GetActorVisible endp

CScriptGameObject__GetActorFloat proc
pos__ = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	;sub     esp, 40h
	push    esi
	mov     esi, ecx
	push    edi
	
	mov     edi, [esi+4]
	test    edi, edi
	jz      short lab1
	call    CGameObject__lua_game_object

lab1:
	mov     ecx, [esi+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+80h]
	call    edx
	test    eax, eax
	jz      short exit_fail


	;---
	mov     ecx, [ebp + pos__]
	fld     dword ptr [eax+ecx]
	;fld     [fbuf]
	;push ecx
	;push offset a_xxx_msg
	;call  Msg
	;pop  eax
	;pop  eax
	jmp     exit
exit_fail:
	;push offset a_fail_msg
	;call  Msg
	;pop  eax
	fldz
exit:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    4
fbuf dword 123.456
a_fail_msg db "fail", 0
a_xxx_msg db "arg=%d", 0
CScriptGameObject__GetActorFloat endp

CScriptGameObject__GetActorConditionFloat proc
pos__ = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	;sub     esp, 40h
	push    esi
	mov     esi, ecx
	push    edi
	
	mov     edi, [esi+4]
	test    edi, edi
	jz      short lab1
	call    CGameObject__lua_game_object

lab1:
	mov     ecx, [esi+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+80h]
	call    edx
	test    eax, eax
	jz      short exit_fail


	;---
	mov     ecx, [ebp + pos__]	;take offest
	mov		eax, [eax + 93Ch]		;take CActorCondition
	fld     dword ptr [eax+ecx]
	jmp     exit
exit_fail:
	fldz
exit:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__GetActorConditionFloat endp


CScriptGameObject__GetActorTakeDist proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	
	mov     eax, g_Actor
	test    eax, eax ; eax = actor
	jz      short exit_fail
	
	mov		ecx, [eax+298h]
	fld     dword ptr [ecx+74h]
	jmp     exit2
exit_fail:
	fldz
exit2:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__GetActorTakeDist endp

CScriptGameObject__SetActorTakeDist proc
argv = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	mov     esi, ecx
	push    edi
	
	mov     eax, g_Actor
	test    eax, eax ; eax = actor
	jz      short exit


	;---
	mov     ecx, [ebp + argv]
	mov		eax, [eax+298h]
	mov    [eax+74h], ecx
	jmp     exit
exit:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__SetActorTakeDist endp



CScriptGameObject__GetActorMaxWeight proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	
	mov     eax, g_Actor
	test    eax, eax ; eax = actor
	jz      short exit_fail
	
	mov		ecx, [eax+298h]
	fld     dword ptr [ecx+68h]
	jmp     exit2
exit_fail:
	fldz
exit2:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__GetActorMaxWeight endp

CScriptGameObject__SetActorMaxWeight proc
argv = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	mov     esi, ecx
	push    edi
	
	mov     eax, g_Actor
	test    eax, eax ; eax = actor
	jz      short exit


	;---
	mov     ecx, [ebp + argv]
	mov		eax, [eax+298h]
	mov    [eax+68h], ecx
	jmp     exit
exit:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__SetActorMaxWeight endp


CScriptGameObject__GetActorMaxWalkWeight proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	
	; получаем актора
	mov     eax, g_Actor
	test    eax, eax ; eax = actor
	jz      short exit_fail
	
	mov		ecx, [eax+93Ch]
	fld     dword ptr [ecx+138h]
	jmp     exit2
exit_fail:
	fldz
exit2:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__GetActorMaxWalkWeight endp


CScriptGameObject__SetActorMaxWalkWeight proc
argv = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	mov     esi, ecx
	push    edi
	
	mov     eax, g_Actor
	test    eax, eax ; eax = actor
	jz      short exit


	;---
	mov     ecx, [ebp + argv]
	mov		eax, [eax+93Ch]
	mov    [eax+138h], ecx
	jmp     exit
exit:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__SetActorMaxWalkWeight endp



CScriptGameObject__SetActorFloat proc
stub  = dword ptr  8
value = dword ptr  0Ch
pos   = dword ptr  10h

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	mov     esi, ecx
	push    edi

	push    eax
	push    ecx
	push    edx

	
	mov     edi, [esi+4]
	test    edi, edi
	jz      short lab1
	call    CGameObject__lua_game_object

lab1:
	mov     ecx, [esi+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+80h]
	call    edx
	test    eax, eax
	jz      short exit_fail

	mov     ecx, [ebp + pos]
	mov     edx, [ebp + value]
	mov    [eax+ecx], edx
exit_fail:
	pop     edx
	pop     ecx
	pop     eax
	
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    0Ch
CScriptGameObject__SetActorFloat endp

CScriptGameObject__SetActorConditionFloat proc
stub  = dword ptr  8
value = dword ptr  0Ch
pos   = dword ptr  10h

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	mov     esi, ecx
	push    edi

	push    eax
	push    ecx
	push    edx

	
	mov     edi, [esi+4]
	test    edi, edi
	jz      short lab1
	call    CGameObject__lua_game_object

lab1:
	mov     ecx, [esi+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+80h]
	call    edx
	test    eax, eax
	jz      short exit_fail

	mov     ecx, [ebp + pos]
	mov     edx, [ebp + value]
	mov		eax, [eax + 93Ch]		;take CActorCondition
	mov    [eax+ecx], edx
exit_fail:
	pop     edx
	pop     ecx
	pop     eax
	
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    0Ch
CScriptGameObject__SetActorConditionFloat endp


CScriptGameObject__GetActorInt proc
stub  = dword ptr  8
pos   = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	mov     esi, ecx
	push    edi
	
	mov     edi, [esi+4]
	test    edi, edi
	jz      short lab1
	call    CGameObject__lua_game_object

lab1:
	mov     ecx, [esi+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+80h]
	call    edx
	test    eax, eax
	jz      short exit_fail
	;---
	mov     ecx, [ebp + pos]
	mov     eax, [eax + ecx]
	jmp     exit
exit_fail:
	xor     eax, eax
exit:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__GetActorInt endp

CScriptGameObject__GetActorInt16 proc
stub  = dword ptr  8
pos   = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	push    [ebp + pos]
	push    [ebp + pos]
	call    CScriptGameObject__GetActorInt
	and     eax, 0FFFFh
	
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__GetActorInt16 endp


CScriptGameObject__GetWeaponGLInt proc
stub  = dword ptr  8
pos   = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push ecx
	
	call    CScriptGameObject__CWeaponGL
	test    eax, eax
	jz      short exit_fail
	;---
	mov     ecx, [ebp + pos]
	;push eax
	;push ecx
	;push offset a_xxx_msg
	;call  Msg
	;pop  eax
	;pop  eax
	mov     eax, [eax + ecx]
	;pop eax
	;mov eax, [eax+2392]
	jmp     exit
exit_fail:
	xor     eax, eax
exit:
	pop ecx
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__GetWeaponGLInt endp

dbg_msg db "arg=%d", 0

is_wpn_msg1 db "is_wpn_msg1: %x", 0
is_wpn_msg2 db "is_wpn_msg2: %x", 0

CScriptGameObject__GetWeaponInt proc
stub  = dword ptr  8
pos   = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push ecx
	
	call    CScriptGameObject__CWeapon
	test    eax, eax
	jz      short exit_fail
	;---
	mov     ecx, [ebp + pos]
	mov     eax, [eax + ecx]
	;---
	jmp     exit
exit_fail:
	xor     eax, eax
exit:
	pop ecx
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__GetWeaponInt endp

CScriptGameObject__SetWeaponInt proc

pos   = dword ptr  8
value = dword ptr  0Ch

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    eax
	push    edx
	push    ecx
	
	
	call    CScriptGameObject__CWeapon
	test    eax, eax
	jz      short exit

	;---
	mov     edx, [ebp + value]
	mov     ecx, [ebp + pos]
	mov     [eax + ecx], edx
	;---
exit:
	pop     ecx
	pop     edx
	pop     eax
	mov     esp, ebp
	pop     ebp
	retn    08h
CScriptGameObject__SetWeaponInt endp



CScriptGameObject__GetHudBoneID proc
stub  = dword ptr  8
pos   = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h

	call    CScriptGameObject__CHudItem
	
	mov     eax, [eax+16] ; eax == m_pHUD
	movzx   ecx, byte ptr [eax+4]
	test    ecx, ecx
	jnz     exit_fail
	
	mov     eax, [eax+48h]
	mov     ecx, [eax+8]    ; ecx == visual
	test    ecx, ecx
	jz      exit_fail
	
	mov     eax, [ecx]
	mov     eax, [eax+18h]
	call    eax             ; pHudVisual = smart_cast<CKinematics*>(m_pHUD->Visual());
	test    eax, eax
	jz      exit_fail

	push    [ebp + bone_name] ; offset aWpn_scope ; "wpn_scope"
	mov     ecx, eax
	call    ds:CKinematics__LL_BoneID
	
	jmp     exit
exit_fail:
	mov     eax, -2
exit:
	
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__GetHudBoneID endp

CScriptGameObject__SetHudBoneVisible proc
bone_name = dword ptr 8
visible   = dword ptr 0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	push    esi

	call    CScriptGameObject__CHudItem
	
	mov     eax, [eax+16] ; eax == m_pHUD
	movzx   ecx, byte ptr [eax+4]
	test    ecx, ecx
	jnz     exit_fail
	
	mov     eax, [eax+48h]
	mov     ecx, [eax+8]    ; ecx == visual
	test    ecx, ecx
	jz      exit_fail
	
	mov     eax, [ecx]
	mov     eax, [eax+18h]
	call    eax             ; pHudVisual = smart_cast<CKinematics*>(m_pHUD->Visual());
	test    eax, eax
	jz      exit_fail
	mov     esi, eax

	push    [ebp + bone_name] 
	mov     ecx, eax ; pHudVisual
	call    ds:CKinematics__LL_BoneID
	
	push    1
	push    [ebp + visible]
	push    eax ; bone_id
	mov     ecx, esi ; pHudVisual
	call    ds:CKinematics__LL_SetBoneVisible
	mov     ecx, esi
	call    ds:CKinematics__CalculateBones_Invalidate

	jmp     exit
exit_fail:
	mov     eax, -2
exit:
	
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__SetHudBoneVisible endp


CScriptGameObject__GetWeaponBoneID proc
bone_name = dword ptr 8
stub      = dword ptr 0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	push    ecx
	push    edx
	push    esi
	
	call    CScriptGameObject__CWeapon
	test    eax, eax
	jz      short exit_fail
	;---
	;jmp exit
	mov     eax, [eax+168h]
	test    eax, eax
	jz      short exit_fail
	mov     eax, [eax]
	mov     eax, [eax+18h]
	call    eax
	;push [ebp + bone_name]
	;call msg
	;pop ecx
	
	;mov     esi, eax ; esi = visual
	;mov     ecx, esi ; this == visual
	;mov     eax, [ebp + bone_name]
	;push    eax
	push    [ebp + bone_name]
	mov     ecx, eax
	call    ds:CKinematics__LL_BoneID
	movzx   eax, ax
	jmp     exit
exit_fail:
	mov     eax, -1
exit:
	pop     esi
	pop     edx
	pop     ecx
	
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__GetWeaponBoneID endp

a_str_msg db "arg=%s", 0

CScriptGameObject__SetWeaponBoneVisible proc
bone_name = dword ptr 8
visible   = dword ptr 0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	push    ecx
	push    edx
	push    esi
	
	call    CScriptGameObject__CWeapon
	test    eax, eax
	jz      short exit_fail
	;---
	mov     ecx, [eax+168h]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+18h]
	call    edx
	
	mov     esi, eax ; esi = visual
	mov     ecx, esi ; this == visual
	mov     eax, [ebp + bone_name]
	push    eax
	call    ds:CKinematics__LL_BoneID
	movzx   ecx, ax

	;push    eax ; bone_id
	;call    ds:CKinematics__LL_GetBoneVisible
	;test    eax, eax

	push    1
	mov     eax, [ebp + visible]
	push    eax
	push    ecx ; bone_id
	mov     ecx, esi
	call    ds:CKinematics__LL_SetBoneVisible

	mov     ecx, esi
	call    ds:CKinematics__CalculateBones_Invalidate
	
	mov     ecx, esi
	mov     eax, [ecx]
	mov     edx, [eax+40h]
	push    0
	call    edx


	
	;---
	mov     eax, 1 ; success
	jmp     exit
exit_fail:
	xor     eax, eax ; fail
exit:
	pop     esi
	pop     edx
	pop     ecx
	
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__SetWeaponBoneVisible endp

CScriptGameObject__GetWeaponBoneVisible proc
bone_name = dword ptr 8
visible   = dword ptr 0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	push    ecx
	push    edx
	push    esi
	
	call    CScriptGameObject__CWeapon
	test    eax, eax
	jz      short exit_fail
	;---
	mov     ecx, [eax+168h]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+18h]
	call    edx
	
	mov     esi, eax ; esi = visual
	mov     ecx, esi ; this == visual
	mov     eax, [ebp + bone_name]
	push    eax
	call    ds:CKinematics__LL_BoneID
	movzx   eax, ax

	push    eax ; bone_id
	mov     ecx, esi
	call    ds:CKinematics__LL_GetBoneVisible
	jmp     exit
exit_fail:
	mov     eax, -1
exit:
	pop     esi
	pop     edx
	pop     ecx
	
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__GetWeaponBoneVisible endp

;------------------------------------------------------------------

CScriptGameObject__GetWeaponFloat proc
pos   = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push eax
	push ecx
	
	call    CScriptGameObject__CWeapon
	test    eax, eax
	jz      short exit_fail
	;---
	mov     ecx, [ebp + pos]
	fld     dword ptr [eax+ecx]
	;---
	jmp     exit
exit_fail:
	fldz
exit:
	pop ecx
	pop eax
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__GetWeaponFloat endp

CScriptGameObject__SetWeaponFloat proc
stub  = dword ptr  8
value = dword ptr  0Ch
pos   = dword ptr  10h

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h

	push    eax
	push    ecx
	push    edx

	call    CScriptGameObject__CWeapon
	test    eax, eax
	jz      short exit_fail
	

	mov     ecx, [ebp + pos]
	mov     edx, [ebp + value]
	mov    [eax+ecx], edx
exit_fail:
	pop     edx
	pop     ecx
	pop     eax
	
	mov     esp, ebp
	pop     ebp
	retn    0Ch
CScriptGameObject__SetWeaponFloat endp

CScriptGameObject__GetCameraFOV proc
	fld     dword ptr [g_fov]
	retn
CScriptGameObject__GetCameraFOV endp

CScriptGameObject__SetCameraFOV proc
value = dword ptr  04h
	mov     eax, [esp+value]
	mov     [g_fov], eax
	retn    4
CScriptGameObject__SetCameraFOV endp

CScriptGameObject__GetCustomMonsterFloat proc
pos   = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push eax
	push ecx
	
	call    CScriptGameObject__CCustomMonster
	test    eax, eax
	jz      short exit_fail
	;---
	mov     ecx, [ebp + pos]
	fld     dword ptr [eax+ecx]
	;---
	jmp     exit
exit_fail:
	fldz
exit:
	pop ecx
	pop eax
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__GetCustomMonsterFloat endp

CScriptGameObject__GetCustomMonsterInt proc
stub  = dword ptr  8
pos   = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push ecx
	
	call    CScriptGameObject__CCustomMonster
	test    eax, eax
	jz      short exit_fail
	;---
	mov     ecx, [ebp + pos]
	mov     eax, [eax + ecx]
	;---
	jmp     exit
exit_fail:
	xor     eax, eax
exit:
	pop ecx
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__GetCustomMonsterInt endp


set_shared_str proc ; ebx = (shared_str*)   eax = (char*)
	push    ecx
	push    edx
	
	push    eax
	mov     ecx, ds:g_pStringContainer
	mov     ecx, [ecx]
	call    str_container__dock
	test    eax, eax
	jz      short lab1
	inc dword ptr [eax] ;add     dword ptr [eax], 1
lab1:
	mov     ecx, [ebx]
	test    ecx, ecx
	jz      short lab2
	dec dword ptr [ecx] ;add     dword ptr [ecx], 0FFFFFFFFh
	mov     edx, [ebx]
	cmp     dword ptr [edx], 0
	jnz     short lab2
	mov     dword ptr [ebx], 0
lab2:
	mov     [ebx], eax
	
	pop     edx
	pop     ecx
	retn
set_shared_str endp

CScriptGameObject__TestStr proc
sarg   = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push eax
	push ecx
	
	;1388
	;1392
	;1396
	;1400
	;1404
	;1408
	;1412
	
	mov     eax, [ebp+sarg]
	push    eax
	call    Msg
	pop     eax
	
	pop ecx
	pop eax
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__TestStr endp

CScriptGameObject__GetTestStr proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push ecx
	
	call    CScriptGameObject__CActor
	test    eax, eax
	jz      short exit_fail
	;---
	mov     eax, [eax+1392]
	test    eax, eax
	jz      short exit_fail
	add     eax, 0Ch
	;---
	jmp     exit
exit_fail:
	xor     eax, eax
exit:
	pop ecx
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__GetTestStr endp

CScriptGameObject__GetWpnSharedStr proc
	;===========================
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push ecx
	push esi
	
	call    CScriptGameObject__CWeapon
	test    eax, eax
	jnz     lab1
	push    offset a_msg_argument0_not_set
	call    Msg
	pop     eax
	jmp     short exit_fail
lab1:

	mov     ecx, g_int_argument_0
	test    ecx, ecx
	jz      exit_fail
	mov     eax, [eax + ecx]
	test    eax, eax
	jz      short exit_fail
	lea     eax, [eax+0Ch]
	;add     eax, 0Ch
	;PRINT "it's work"
	xor     ecx, ecx
	mov     g_int_argument_0, ecx
	jmp exit
exit_fail:
	xor     eax, eax
exit:
	pop esi
	pop ecx
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__GetWpnSharedStr endp

CScriptGameObject__SetWpnSharedStr proc
str_arg   = dword ptr  8
shift_arg = dword ptr  0Ch

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    eax
	push    ebx
	push    ecx
	push    edx

	call    CScriptGameObject__CWeapon
	test    eax, eax
	jz      exit_fail
	
	
	mov  ebx, eax
	add  ebx, [ebp+shift_arg]
	mov  eax, [ebp+str_arg]
	call set_shared_str; ebx = (shared_str*)   eax = (char*)
exit_fail:	
	pop     edx
	pop     ecx
	pop     ebx
	pop     eax
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__SetWpnSharedStr endp

CScriptGameObject__GetActorSharedStr proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push ecx
	
	call    CScriptGameObject__CActor
	test    eax, eax
	jnz     lab1
	push    offset a_msg_argument0_not_set
	call    Msg
	pop     eax
	jmp     short exit_fail
lab1:
	;---
	mov     ecx, g_int_argument_0
	test    ecx, ecx
	jz      exit_fail
	mov     eax, [eax + ecx]
	test    eax, eax
	jz      short exit_fail
	add     eax, 0Ch
	;---
	xor     ecx, ecx
	mov     g_int_argument_0, ecx
	jmp     exit
exit_fail:
	xor     eax, eax
exit:
	pop ecx
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__GetActorSharedStr endp
a_msg_argument0_not_set db "!!Hidden argument #0 is not defined!", 0


CScriptGameObject__SetActorSharedStr proc
str_arg   = dword ptr  8
shift_arg = dword ptr  0Ch

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    eax
	push    ebx
	push    ecx
	push    edx

	call    CScriptGameObject__CActor
	test    eax, eax
	jz      exit_fail
	
	
	mov  ebx, eax
	add  ebx, [ebp+shift_arg]
	mov  eax, [ebp+str_arg]
	call set_shared_str; ebx = (shared_str*)   eax = (char*)
exit_fail:	
	pop     edx
	pop     ecx
	pop     ebx
	pop     eax
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__SetActorSharedStr endp

a_test_string db "test test 123", 0
a_test1 db "arg=%d", 0

g_visual_shared_str dword 0

CScriptGameObject__SetActorVisual proc
str_arg   = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	push    esi
	push    eax
	push    ebx
	push    ecx
	
	call    CScriptGameObject__CActor
	test    eax, eax
	jz      exit_fail
	mov     esi, eax
	
	mov  ebx, offset g_visual_shared_str
	mov  eax, [ebp+str_arg]
	call set_shared_str; ebx = (shared_str*)   eax = (char*)
	
	mov     ecx, esi
	push    eax
	call CActor__ChangeVisual ; ecx = CActor   stack = shared_str
	;call CObject__cNameVisual_set ; ecx = CObject   eax = shared_str
	
exit_fail:
	
	pop     ecx
	pop     ebx
	pop     eax
	pop     esi
	
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__SetActorVisual endp

CScriptGameObject__OpenInventoryBox proc
SGO_inv_box = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    ecx
	push    ebx
	push    esi
	push    edi

	mov     esi, ecx ; SGO_actor
	;
	call    GetGameSP
	test    eax, eax
	jz      exit
	mov     edi, eax ; hud
	mov     ecx, [ebp+SGO_inv_box]
	call    CScriptGameObject__CInventoryBox
	push    eax
	mov     ecx, esi
	call    CScriptGameObject__CInventoryOwner
	push    eax

	mov     eax, edi
	call    CUIGameSP__StartCarBody
exit:
	pop     edi
	pop     esi
	pop     ebx
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__OpenInventoryBox endp

GetGameSP proc ; no args, eax - result
	push    ecx
	push    edx
	
	mov     ecx, ds:g_pGameLevel
	mov     edx, [ecx]
	mov     ecx, [edx+148h]
	mov     eax, [ecx]
	mov     edx, [eax+18h]
	call    edx
	mov     eax, [eax+2Ch]
	test    eax, eax
	jz      exit
	push    0               ; a5
	push    offset off_1054F0E8 ; a4
	push    offset off_1054F0CC ; a3
	push    0               ; a2
	push    eax             ; a1
	call    __RTDynamicCast
	add     esp, 14h
exit:
	pop     edx
	pop     ecx
	retn
GetGameSP endp

CScriptGameObject__item_in_inv_box proc
index   = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	;---
	;eax == id
	;mov     eax, [ebp+index]
	;call    GetClientObjectByID
	;jmp exit
	;--------------------------
	call    CScriptGameObject__CInventoryBox  ; ecx - argument, eax - result
	test    eax, eax
	jz      short fail_exit
	;mov     esi, eax 
	; здесь в eax - CInventoryBox
	mov     ecx, [eax+16Ch] ; items.begin
	mov     eax, [eax+170h] ; items.end
	sub     eax, ecx
	sar     eax, 1        ; eax = items.size()
	mov     edi, [ebp+index]
	cmp     eax, edi
	jbe     short fail_exit
	shl     edi, 1
	xor     eax, eax
	mov     ax, word ptr [ecx+edi] ;
	;eax == id
	call    GetClientObjectByID
	;test    eax, eax
	;jz      fail_exit
	;mov     edi, eax
	;call    CGameObject__lua_game_object
	jmp     exit
fail_exit:
	xor     eax, eax
exit:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__item_in_inv_box endp


GetClientObjectByID proc
	push    ecx
	push    edi
	
	push    eax
	call    get_object_by_id
	add     esp, 4
	
	pop     edi
	pop     ecx
	retn
GetClientObjectByID endp

CScriptGameObject__InvBoxCount proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	;---
	call    CScriptGameObject__CInventoryBox  ; ecx - argument, eax - result
	test    eax, eax
	jz      short fail_exit
	;---
	mov     ecx, [eax+16Ch] ; items.begin
	mov     eax, [eax+170h] ; items.end
	sub     eax, ecx
	sar     eax, 1        ; eax = items.size()
	jmp     exit
fail_exit:
	xor     eax, eax
exit:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__InvBoxCount endp

CScriptGameObject__GetWeght proc
	push    ebp
	mov     ebp, esp
	push    ecx
	push    eax
	
	call    CScriptGameObject__CInventoryItem
	
	mov     ecx, eax
	
	mov     eax, [ecx]
	mov     eax, [eax+90h]
	call    eax

	pop     eax
	pop     ecx
	pop     ebp
	retn
CScriptGameObject__GetWeght endp


CScriptGameObject__GetHolderOwner proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	;---
	call    CScriptGameObject__CHolder
	test    eax, eax
	jz      short fail_exit
	
	mov     edi, [eax+4]
	test    edi, edi
	jz      short fail_exit
	call    CGameObject__lua_game_object
	jmp     exit
fail_exit:
	xor     eax, eax
exit:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__GetHolderOwner endp

CScriptGameObject__GetHolderInt proc
stub  = dword ptr  8
pos   = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push ecx
	
	call    CScriptGameObject__CHolder
	test    eax, eax
	jz      short exit_fail
	;---
	mov     ecx, [ebp + pos]
	mov     eax, [eax + ecx]
	;---
	jmp     exit
exit_fail:
	xor     eax, eax
exit:
	pop ecx
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__GetHolderInt endp

CScriptGameObject__IsGameObject proc
	mov     eax, [ecx+4]
	retn
CScriptGameObject__IsGameObject endp

CScriptGameObject__GetGOSharedStr proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push ecx
	
	call    CScriptGameObject__CActor
	test    eax, eax
	jnz     lab1
	push    offset a_msg_argument0_not_set
	call    Msg
	pop     eax
	jmp     short exit_fail
lab1:
	;---
	mov     ecx, g_int_argument_0
	test    ecx, ecx
	jz      exit_fail
	mov     eax, [eax + ecx]
	test    eax, eax
	jz      short exit_fail
	add     eax, 0Ch
	;---
	xor     ecx, ecx
	mov     g_int_argument_0, ecx
	jmp     exit
exit_fail:
	xor     eax, eax
exit:
	pop ecx
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__GetGOSharedStr endp
;a_msg_argument0_not_set db "!!Hidden argument #0 is not defined!", 0


CScriptGameObject__SetGOSharedStr proc
str_arg   = dword ptr  8
shift_arg = dword ptr  0Ch

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    eax
	push    ebx
	push    ecx
	push    edx

	call    CScriptGameObject__CActor
	test    eax, eax
	jz      exit_fail
	
	
	mov  ebx, eax
	add  ebx, [ebp+shift_arg]
	mov  eax, [ebp+str_arg]
	call set_shared_str; ebx = (shared_str*)   eax = (char*)
exit_fail:	
	pop     edx
	pop     ecx
	pop     ebx
	pop     eax
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__SetGOSharedStr endp

CScriptGameObject__GetBleedingSpeed proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    eax
	push    esi

	call    CScriptGameObject__CEntityAlive
	test    eax, eax
	jz      exit_fail
	mov     esi, [eax+220h]
	call    CEntityCondition__BleedingSpeed
	movss   [buf1], xmm0
	fld     dword ptr [buf1]
	jmp     exit
exit_fail:
	fldz
exit:
	pop     esi
	pop     eax
	mov     esp, ebp
	pop     ebp
	retn
buf1 dd ?
CScriptGameObject__GetBleedingSpeed endp

CScriptGameObject__ChangeBleedingSpeed proc
bleeding_delta = dword ptr  8
	push    ebp
	mov     ebp, esp
	push    eax
	push    edi
	
	call    CScriptGameObject__CEntityAlive
	test    eax, eax
	jz      exit_fail
	mov     edi, [eax+220h]
	mov     eax, [ebp+bleeding_delta]
	push    eax
	call    CEntityCondition__ChangeBleeding
exit_fail:
	
	pop     edi
	pop     eax
	pop     ebp
	retn    4
CScriptGameObject__ChangeBleedingSpeed endp



CScriptGameObject__hud_bone_position_ proc
var_10          = dword ptr -10h
var_C           = dword ptr -0Ch
var_8           = dword ptr -8
result          = dword ptr  8
bone_name       = dword ptr  0Ch

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	sub     esp, 44h
	push    ebx
	push    esi
	push    edi
	
	mov     esi, [ebp+bone_name] ; esi == bone_name
	mov     ebx, ecx ; ebx == this == CScriptGameObject
	
	mov     eax, [ebx+4]    ; eax == object
	mov     ecx, [eax+90h]  ; ecx == visual
	test    ecx, ecx        ; if (visual != 0) goto lab4
	jnz     short lab4
	xor     eax, eax
	push    esi
	mov     ecx, eax
	call    ds:CKinematics__LL_BoneID
	movzx   esi, ax
	jmp     short lab5
; ---------------------------------------------------------------------------

lab4:
	mov     eax, [ecx]
	mov     edx, [eax+18h]
	call    edx
	push    esi
	mov     ecx, eax
	call    ds:CKinematics__LL_BoneID
	movzx   esi, ax
	jmp     short lab5
; ---------------------------------------------------------------------------
lab2:
	mov     eax, [ebx+4]
	mov     ecx, [eax+90h]
	test    ecx, ecx
	jnz     short lab7
	xor     eax, eax
	jmp     short lab8
; ---------------------------------------------------------------------------
lab7:
	mov     eax, [ecx]
	mov     edx, [eax+18h]
	call    edx

lab8:
	movzx   esi, word ptr [eax+8Ch] ; CKinematics::root_bone_id

lab5:
	mov     eax, [ebx+4]
	mov     ecx, [eax+90h]
	test    ecx, ecx
	jnz     short lab10
	xor     eax, eax
	jmp     short lab11
; ---------------------------------------------------------------------------
lab10:
	mov     eax, [ecx]
	mov     edx, [eax+18h]
	call    edx
lab11:
	; eax == smart_cast<CKinematics*>(object().Visual())
	; esi == bone_id
	; ebx == CScriptGameObject
	mov     edi, [ebx+4]
	movzx   ecx, si
	lea     esi, [ecx+ecx*4]
	shl     esi, 5
	add     esi, [eax+84h]

	mov     eax, [ebx+4]
	movss   xmm0, dword ptr [esi+38h]
	movss   xmm1, dword ptr [esi+34h]
	movss   xmm3, dword ptr [eax+70h]
	movss   xmm4, dword ptr [eax+60h]
	movss   xmm2, dword ptr [esi+30h]
	mulss   xmm3, xmm0
	mulss   xmm4, xmm1
	addss   xmm3, xmm4
	movss   xmm4, dword ptr [eax+50h]
	mulss   xmm4, xmm2
	addss   xmm3, xmm4
	addss   xmm3, dword ptr [eax+80h]
	movss   xmm4, dword ptr [eax+54h]
	movss   [esp+50h+var_10], xmm3
	movss   xmm3, dword ptr [eax+74h]
	mov     ecx, [esp+50h+var_10]
	mulss   xmm3, xmm0
	mulss   xmm4, xmm2
	addss   xmm3, xmm4
	movss   xmm4, dword ptr [eax+64h]
	mulss   xmm4, xmm1
	addss   xmm3, xmm4
	addss   xmm3, dword ptr [eax+84h]
	movss   [esp+50h+var_C], xmm3
	movss   xmm3, dword ptr [eax+78h]
	mov     edx, [esp+50h+var_C]
	mulss   xmm3, xmm0
	movss   xmm0, dword ptr [eax+58h]
	mulss   xmm0, xmm2
	addss   xmm3, xmm0
	movss   xmm0, dword ptr [eax+68h]
	mulss   xmm0, xmm1
	addss   xmm3, xmm0
	addss   xmm3, dword ptr [eax+88h]
	mov     eax, [ebp+result]
	mov     [eax], ecx ; result[0]
	movss   [esp+4Ch+var_8], xmm3
	mov     ecx, [esp+4Ch+var_8]
	mov     [eax+4], edx ; result[1]
	mov     [eax+8], ecx ; result[2]
	
	pop     edi
	pop     esi
	pop     ebx
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__hud_bone_position_ endp

CScriptGameObject__bone_position proc near
result          = dword ptr  8
bone_name       = dword ptr  0Ch

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h

	push    ebx
	push    esi
	push    edi
	
	mov     ebx, [ecx+4] ; ebx == this == object
	
	mov     ecx, [ebx+90h]  ; ecx == visual == this для следующего вызова
	
	mov     eax, [ecx]
	mov     eax, [eax+18h]
	call    eax ; eax == smart_cast<CKinematics*>(object().Visual())
	; eax = kinematics
	mov     edi, eax ; сохраняем kinematics
	
	push    [ebp+bone_name]
	mov     ecx, eax
	call    ds:CKinematics__LL_BoneID ; eax = kinematics.LL_BoneID(bone_name)
	movzx   ecx, ax ; ecx == bone_id
	
	; 
	; ecx == bone_id
	; ebx == object
	lea     esi, [ecx+ecx*4]
	shl     esi, 5
	add     esi, [edi+84h]   ; esi == bone_instance

	mov     eax, [ebp+result]

	movss   xmm0, dword ptr [esi+38h] ; xmm0 = v3
	movss   xmm1, dword ptr [esi+34h] ; xmm1 = v2
	movss   xmm2, dword ptr [esi+30h] ; xmm2 = v1
	
	movss   xmm3, dword ptr [ebx+70h] ; xmm3 = x31
	movss   xmm4, dword ptr [ebx+60h] ; xmm4 = x21
	mulss   xmm3, xmm0                ; xmm3 = x31 * v3
	mulss   xmm4, xmm1                ; xmm4 = x21 * v2
	addss   xmm3, xmm4                ; xmm3 = x31 * v3 + x21 * v2
	movss   xmm4, dword ptr [ebx+50h] ; xform[1][1]
	mulss   xmm4, xmm2                ; xmm4 = x11 * v1
	addss   xmm3, xmm4                ; xmm3 = x31 * v3 + x21 * v2 + x11 * v1
	addss   xmm3, dword ptr [ebx+80h] ; x41 ; xmm3 = x31 * v3 + x21 * v2 + x11 * v1 + x41
	movss   xmm4, dword ptr [ebx+54h] ; x12 ;
	
	movss   dword ptr [eax], xmm3
	
	movss   xmm3, dword ptr [ebx+74h] ; xmm3 = x32
	mulss   xmm3, xmm0                ; xmm3 = x32 * v3
	mulss   xmm4, xmm2                ; xmm4 = x12 * v1
	addss   xmm3, xmm4                ; xmm3 = x12 * v1 + x32 * v3
	movss   xmm4, dword ptr [ebx+64h] ; xmm4 = x22
	mulss   xmm4, xmm1                ; xmm4 = x22 * v2
	addss   xmm3, xmm4                ; xmm3 = x12 * v1 + x32 * v3 + x22 * v2
	addss   xmm3, dword ptr [ebx+84h] ; xmm3 = x12 * v1 + x32 * v3 + x22 * v2 + x42 * 1
	
	movss   dword ptr [eax + 4], xmm3
	
	movss   xmm3, dword ptr [ebx+78h] ; xmm3 = x33
	mulss   xmm3, xmm0                ; xmm3 = x33 * v3
	movss   xmm0, dword ptr [ebx+58h] ; xmm0 = x13
	mulss   xmm0, xmm2                ; xmm0 = x13 * v1
	addss   xmm3, xmm0                ; xmm3 = x13 * v1 + x33 * v3
	movss   xmm0, dword ptr [ebx+68h] ; xmm0 = x23
	mulss   xmm0, xmm1                ; xmm0 = x23 * v2
	addss   xmm3, xmm0                ; xmm3 = x13 * v1 + x33 * v3 + x23 * v2
	addss   xmm3, dword ptr [ebx+88h] ; xmm3 = x13 * v1 + x23 * v2 + x33 * v3 + x43 * 1
	
	movss   dword ptr [eax + 8], xmm3
	
	pop     edi
	pop     esi
	pop     ebx
	
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__bone_position endp


;	test    ecx, ecx
;	jz      exit_fail
	
;	mov     eax, [ecx]
;	mov     eax, [eax+18h]
;	call    eax             ; pHudVisual = smart_cast<CKinematics*>(m_pHUD->Visual());



CScriptGameObject__hud_bone_position proc near
result          = dword ptr  8
bone_name       = dword ptr  0Ch

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h

	push    ebx
	push    esi
	push    edi
	
	
	call    CScriptGameObject__CHudItem
	mov     ebx, eax
	
	mov     eax, [eax+16] ; eax == m_pHUD
	movzx   ecx, byte ptr [eax+4]
	test    ecx, ecx
	jnz     exit_fail
	
	mov     eax, [eax+48h]
	mov     ecx, [eax+8]    ; ecx == visual

	;mov     ebx, [ecx+4] ; ebx == this == object
	
	;mov     ecx, [ebx+90h]  ; ecx == visual == this для следующего вызова
	
	mov     eax, [ecx]
	mov     eax, [eax+18h]
	call    eax ; eax == smart_cast<CKinematics*>(object().Visual())
	; eax = kinematics
	mov     edi, eax ; сохраняем kinematics
	
	push    [ebp+bone_name]
	mov     ecx, eax
	call    ds:CKinematics__LL_BoneID ; eax = kinematics.LL_BoneID(bone_name)
	movzx   ecx, ax ; ecx == bone_id
	
	; 
	; ecx == bone_id
	; ebx == object
	lea     esi, [ecx+ecx*4]
	shl     esi, 5
	add     esi, [edi+84h]   ; esi == bone_instance

	mov     eax, [ebp+result]

	movss   xmm0, dword ptr [esi+38h] ; xmm0 = v3
	movss   xmm1, dword ptr [esi+34h] ; xmm1 = v2
	movss   xmm2, dword ptr [esi+30h] ; xmm2 = v1
	
	movss   xmm3, dword ptr [ebx+70h] ; xmm3 = x31
	movss   xmm4, dword ptr [ebx+60h] ; xmm4 = x21
	mulss   xmm3, xmm0                ; xmm3 = x31 * v3
	mulss   xmm4, xmm1                ; xmm4 = x21 * v2
	addss   xmm3, xmm4                ; xmm3 = x31 * v3 + x21 * v2
	movss   xmm4, dword ptr [ebx+50h] ; xform[1][1]
	mulss   xmm4, xmm2                ; xmm4 = x11 * v1
	addss   xmm3, xmm4                ; xmm3 = x31 * v3 + x21 * v2 + x11 * v1
	addss   xmm3, dword ptr [ebx+80h] ; x41 ; xmm3 = x31 * v3 + x21 * v2 + x11 * v1 + x41
	movss   xmm4, dword ptr [ebx+54h] ; x12 ;
	
	movss   dword ptr [eax], xmm3
	
	movss   xmm3, dword ptr [ebx+74h] ; xmm3 = x32
	mulss   xmm3, xmm0                ; xmm3 = x32 * v3
	mulss   xmm4, xmm2                ; xmm4 = x12 * v1
	addss   xmm3, xmm4                ; xmm3 = x12 * v1 + x32 * v3
	movss   xmm4, dword ptr [ebx+64h] ; xmm4 = x22
	mulss   xmm4, xmm1                ; xmm4 = x22 * v2
	addss   xmm3, xmm4                ; xmm3 = x12 * v1 + x32 * v3 + x22 * v2
	addss   xmm3, dword ptr [ebx+84h] ; xmm3 = x12 * v1 + x32 * v3 + x22 * v2 + x42 * 1
	
	movss   dword ptr [eax + 4], xmm3
	
	movss   xmm3, dword ptr [ebx+78h] ; xmm3 = x33
	mulss   xmm3, xmm0                ; xmm3 = x33 * v3
	movss   xmm0, dword ptr [ebx+58h] ; xmm0 = x13
	mulss   xmm0, xmm2                ; xmm0 = x13 * v1
	addss   xmm3, xmm0                ; xmm3 = x13 * v1 + x33 * v3
	movss   xmm0, dword ptr [ebx+68h] ; xmm0 = x23
	mulss   xmm0, xmm1                ; xmm0 = x23 * v2
	addss   xmm3, xmm0                ; xmm3 = x13 * v1 + x33 * v3 + x23 * v2
	addss   xmm3, dword ptr [ebx+88h] ; xmm3 = x13 * v1 + x23 * v2 + x33 * v3 + x43 * 1
	
	movss   dword ptr [eax + 8], xmm3
exit_fail:
	mov     eax, [ebp+result]

	pop     edi
	pop     esi
	pop     ebx
	
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__hud_bone_position endp

; ------------------- GameObject access function ----------------
CScriptGameObject__GetGameObjectFloat proc
pos__ = dword ptr  8
	push    ebp
	mov     ebp, esp

	mov     ecx, [ecx+4]
	mov     eax, [ebp + pos__]
	fld     dword ptr [eax+ecx]
	
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__GetGameObjectFloat endp

CScriptGameObject__SetGameObjectFloat proc
stub  = dword ptr  8
value = dword ptr  0Ch
pos   = dword ptr  10h

	push    ebp
	mov     ebp, esp
	push    edx

	mov     ecx, [ecx+4]
	mov     eax, [ebp + pos]
	mov     edx, [ebp + value]
	mov    [eax+ecx], edx

	pop     edx
	mov     esp, ebp
	pop     ebp
	retn    0Ch
CScriptGameObject__SetGameObjectFloat endp


CScriptGameObject__GetGameObjectInt proc
stub  = dword ptr  8
pos   = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	
	mov     ecx, [ecx+4]
	mov     eax, [ebp + pos]
	mov     eax, [eax + ecx]

	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__GetGameObjectInt endp

CScriptGameObject__SetGameObjectInt proc
pos   = dword ptr  8
value = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	push    edx
	;---
	mov     ecx, [ecx+4]
	mov     eax, [ebp + pos]
	mov     edx, [ebp + value]
	mov    [eax+ecx], edx
	;---
	pop     edx
	mov     esp, ebp
	pop     ebp
	retn    08h
CScriptGameObject__SetGameObjectInt endp

CScriptGameObject__SetGameObjectInt16 proc
pos   = dword ptr  8
value = dword ptr  0Ch

	push    ebp
	mov     ebp, esp
	push    edx
	;---
	mov     ecx, [ecx+4]
	mov     eax, [ebp + pos]
	mov     edx, [ebp + value]
	mov    [eax+ecx], dx
	;---
	pop     edx
	mov     esp, ebp
	pop     ebp
	retn    08h
CScriptGameObject__SetGameObjectInt16 endp

CScriptGameObject__GetGameObjectInt16 proc
stub  = dword ptr  8
pos   = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	push    [ebp + pos]
	push    [ebp + pos]
	call    CScriptGameObject__GetGameObjectInt
	and     eax, 0FFFFh
	
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__GetGameObjectInt16 endp

CScriptGameObject__GetGameObjectSharedStr proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push ecx
	
	mov     eax, [ecx+4]
	test    eax, eax
	jnz     lab1
	push    offset a_msg_argument0_not_set
	call    Msg
	pop     eax
	jmp     short exit_fail
lab1:
	;---
	mov     ecx, g_int_argument_0
	test    ecx, ecx
	jz      exit_fail
	mov     eax, [eax + ecx]
	test    eax, eax
	jz      short exit_fail
	add     eax, 0Ch
	;---
	xor     ecx, ecx
	mov     g_int_argument_0, ecx
	jmp     exit
exit_fail:
	xor     eax, eax
exit:
	pop ecx
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__GetGameObjectSharedStr endp


CScriptGameObject__SetGameObjectSharedStr proc
str_arg   = dword ptr  8
shift_arg = dword ptr  0Ch

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    eax
	push    ebx
	push    ecx
	push    edx

	mov     eax, [ecx+4]
	test    eax, eax
	jz      exit_fail
	
	
	mov  ebx, eax
	add  ebx, [ebp+shift_arg]
	mov  eax, [ebp+str_arg]
	call set_shared_str; ebx = (shared_str*)   eax = (char*)
exit_fail:	
	pop     edx
	pop     ecx
	pop     ebx
	pop     eax
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__SetGameObjectSharedStr endp


; --------------------- CInventoryItem  access function
CScriptGameObject__GetInventoryItemFloat proc
pos__ = dword ptr  8
	push    ebp
	mov     ebp, esp

	call    CScriptGameObject__CInventoryItem
	mov     ecx, [ebp + pos__]
	fld     dword ptr [eax+ecx]
	
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__GetInventoryItemFloat endp

CScriptGameObject__SetInventoryItemFloat proc
stub  = dword ptr  8
value = dword ptr  0Ch
pos   = dword ptr  10h

	push    ebp
	mov     ebp, esp
	push    edx

	call    CScriptGameObject__CInventoryItem
	mov     ecx, [ebp + pos]
	mov     edx, [ebp + value]
	mov    [eax+ecx], edx

	pop     edx
	mov     esp, ebp
	pop     ebp
	retn    0Ch
CScriptGameObject__SetInventoryItemFloat endp


CScriptGameObject__GetInventoryItemInt proc
stub  = dword ptr  8
pos   = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	
	call    CScriptGameObject__CInventoryItem
	mov     ecx, [ebp + pos]
	mov     eax, [eax + ecx]

	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__GetInventoryItemInt endp

CScriptGameObject__SetInventoryItemInt proc
pos   = dword ptr  8
value = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	push    edx
	;---
	call    CScriptGameObject__CInventoryItem
	mov     ecx, [ebp + pos]
	mov     edx, [ebp + value]
	mov    [eax+ecx], edx
	;---
	pop     edx
	mov     esp, ebp
	pop     ebp
	retn    08h
CScriptGameObject__SetInventoryItemInt endp

CScriptGameObject__SetInventoryItemInt16 proc
pos   = dword ptr  8
value = dword ptr  0Ch

	push    ebp
	mov     ebp, esp
	push    edx
	;---
	call    CScriptGameObject__CInventoryItem
	mov     ecx, [ebp + pos]
	mov     edx, [ebp + value]
	mov    [eax+ecx], dx
	;---
	pop     edx
	mov     esp, ebp
	pop     ebp
	retn    08h
CScriptGameObject__SetInventoryItemInt16 endp

CScriptGameObject__GetInventoryItemInt16 proc
stub  = dword ptr  8
pos   = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	push    [ebp + pos]
	push    [ebp + pos]
	call    CScriptGameObject__GetInventoryItemInt
	and     eax, 0FFFFh
	
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__GetInventoryItemInt16 endp

CScriptGameObject__GetInventoryItemSharedStr proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push ecx
	
	call    CScriptGameObject__CInventoryItem
	test    eax, eax
	jnz     lab1
	push    offset a_msg_argument0_not_set
	call    Msg
	pop     eax
	jmp     short exit_fail
lab1:
	;---
	mov     ecx, g_int_argument_0
	test    ecx, ecx
	jz      exit_fail
	mov     eax, [eax + ecx]
	test    eax, eax
	jz      short exit_fail
	add     eax, 0Ch
	;---
	xor     ecx, ecx
	mov     g_int_argument_0, ecx
	jmp     exit
exit_fail:
	xor     eax, eax
exit:
	pop ecx
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__GetInventoryItemSharedStr endp


CScriptGameObject__SetInventoryItemSharedStr proc
str_arg   = dword ptr  8
shift_arg = dword ptr  0Ch

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    eax
	push    ebx
	push    ecx
	push    edx

	call    CScriptGameObject__CInventoryItem
	test    eax, eax
	jz      exit_fail
	
	
	mov  ebx, eax
	add  ebx, [ebp+shift_arg]
	mov  eax, [ebp+str_arg]
	call set_shared_str; ebx = (shared_str*)   eax = (char*)
exit_fail:	
	pop     edx
	pop     ecx
	pop     ebx
	pop     eax
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__SetInventoryItemSharedStr endp

CInventoryOwner__HasInfo proc ; не доделано!!!!!!!!!!!!!!!!
	; eax - адрес строки
	; 
	push    ecx
	mov     ecx, g_pStringContainer
	mov     esi, esp
	mov     dword ptr [esi], 0
	mov     ecx, [ecx]
	push    eax
	call    str_container__dock
	test    eax, eax
	jz      short loc_10146FCE
	add     dword ptr [eax], 1
loc_10146FCE:
	mov     ecx, [esi]
	test    ecx, ecx
	jz      short loc_10146FE4
	add     dword ptr [ecx], 0FFFFFFFFh
	mov     edx, [esi]
	cmp     dword ptr [edx], 0
	jnz     short loc_10146FE4
	mov     dword ptr [esi], 0
loc_10146FE4:
	mov     [esi], eax
	mov     eax, [edi]
	mov     edx, [eax+8Ch]
	mov     ecx, edi
	call    edx
	pop     edi
	pop     esi
	retn    4
CInventoryOwner__HasInfo endp

disable_info_portion_fix proc
arg_0           = dword ptr  4
	;PRINT "disable_info_portion_fix. start"
	;
	mov     eax, [esp+arg_0]
	
	push    ecx
	push    edi
	push    esi
	;PRINT_UINT "disable_info_portion_fix. s=%s", eax
	push    eax
	call    CScriptGameObject__HasInfo
	and     eax, 0FFh
	;PRINT_UINT "disable_info_portion_fix. dis=%d", eax
	pop     esi
	pop     edi
	pop     ecx
	
	test    eax, eax ; если инфопорция есть, то будем забирать. Продолжаем как обычно
	jnz     just_continue
	;а иначе, просто выходим из функции, поскольку делать нечего
	;PRINT "disable_info_portion_fix. do nothing"
	xor     al, al
	;pop     edi
	;pop     esi
	retn    4
just_continue:
	; делаем то, что вырезали
	push    esi
	mov     esi, ecx
	push    edi
	mov     edi, [esi+4]
	test    edi, edi
	; идём обратно
	jmp back_from_disable_info_portion_fix
disable_info_portion_fix endp

CScriptGameObject__ProjectorOn proc
	push    esi
	call    CScriptGameObject__CProjector
	test    eax, eax
	jz      exit
	mov     esi, eax
	call    CProjector__TurnOn
exit:
	pop     esi
	retn
CScriptGameObject__ProjectorOn endp

CScriptGameObject__ProjectorOff proc
	push    esi
	call    CScriptGameObject__CProjector
	test    eax, eax
	jz      exit
	mov     esi, eax
	call    CProjector__TurnOff
exit:
	pop     esi
	retn
CScriptGameObject__ProjectorOff endp

CScriptGameObject__ProjectorIsOn proc
	push    esi
	call    CScriptGameObject__CProjector
	test    eax, eax
	jz      exit
	mov     ecx, [eax+1C8h]
	mov     eax, [ecx]
	mov     eax, [eax+8]
	call    eax
	test    al, al
	jz      exit
	mov     eax, 1
exit:
	pop     esi
	retn
CScriptGameObject__ProjectorIsOn endp

CScriptGameObject__SwitchProjector proc
arg_0 = byte ptr  8
	push    ebp
	mov     ebp, esp
	push    esi
	
	call    CScriptGameObject__CProjector
	test    eax, eax
	jz      exit
	mov     esi, eax
	xor     eax, eax
	mov     al, [ebp+arg_0]
	test    eax, eax
	jz      turn_off
	call    CProjector__TurnOn
	jmp     exit
turn_off:
	call    CProjector__TurnOff
exit:
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__SwitchProjector endp






CGameObject__kinematic proc ; eax = this - CGameObject
	mov     ecx, [eax+90h]
	test    ecx, ecx
	jz     exit_no_visual
	mov     eax, [ecx]
	mov     eax, [eax+18h]
	call    eax
	jmp     exit
exit_no_visual:
	xor     eax, eax
exit:
	retn
CGameObject__kinematic endp ; eax = kinematics

CScriptGameObject__SetBoneVisible proc
bone_name = dword ptr 8
visible   = dword ptr 0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	push    ecx
	push    edx
	push    esi
	
	mov     eax, [ecx+4]
	test    eax, eax
	jz      exit_fail
	call    CGameObject__kinematic
	
	mov     esi, eax ; esi = visual
	mov     ecx, esi ; this == visual
	mov     eax, [ebp + bone_name]
	push    eax
	call    ds:CKinematics__LL_BoneID
	movzx   ecx, ax

	;push    eax ; bone_id
	;call    ds:CKinematics__LL_GetBoneVisible
	;test    eax, eax

	push    1
	mov     eax, [ebp + visible]
	push    eax
	push    ecx ; bone_id
	mov     ecx, esi
	call    ds:CKinematics__LL_SetBoneVisible

	mov     ecx, esi
	call    ds:CKinematics__CalculateBones_Invalidate
	
	mov     ecx, esi
	mov     eax, [ecx]
	mov     edx, [eax+40h]
	push    0
	call    edx


	
	;---
	mov     eax, 1 ; success
	jmp     exit
exit_fail:
	xor     eax, eax ; fail
exit:
	pop     esi
	pop     edx
	pop     ecx
	
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__SetBoneVisible endp

CScriptGameObject__GetBoneVisible proc
bone_name = dword ptr 8
visible   = dword ptr 0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	push    ecx
	push    edx
	push    esi
	
	mov     eax, [ecx+4]
	test    eax, eax
	jz      exit_fail
	call    CGameObject__kinematic
	test    eax, eax
	jz      exit_fail
	;---
	mov     esi, eax ; esi = visual
	mov     ecx, esi ; this == visual
	mov     eax, [ebp + bone_name]
	push    eax
	call    ds:CKinematics__LL_BoneID
	movzx   eax, ax

	push    eax ; bone_id
	mov     ecx, esi
	call    ds:CKinematics__LL_GetBoneVisible
	jmp     exit
exit_fail:
	mov     eax, 0
exit:
	pop     esi
	pop     edx
	pop     ecx
	
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__GetBoneVisible endp
