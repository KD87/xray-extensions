include game_object_reg_macro.asm

REGISTER_GO__INT register_get_object_arg_1, "get_object_arg_1"

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

REGISTER_INT__STRING_INT        register_get_actor_condition_int,        "get_actor_condition_int"
;---
REGISTER_FLOAT__INT             register_get_game_object_float,      "get_go_float"
REGISTER_VOID__VECTOR_FLOAT_INT register_set_game_object_float,      "set_go_float"
REGISTER_INT__STRING_INT        register_get_game_object_int,        "get_go_int"
REGISTER_VOID__INT_INT          register_set_game_object_int,        "set_go_int"
REGISTER_INT__STRING_INT        register_get_game_object_int16,      "get_go_int16"
REGISTER_VOID__INT_INT          register_set_game_object_int16,      "set_go_int16"
REGISTER_INT__STRING_INT        register_set_game_object_shared_str, "set_go_shared_str"

REGISTER_FLOAT__INT             register_get_car_float,      "get_car_float"
REGISTER_VOID__VECTOR_FLOAT_INT register_set_car_float,      "set_car_float"
REGISTER_INT__STRING_INT        register_get_car_int,        "get_car_int"
REGISTER_VOID__INT_INT          register_set_car_int,        "set_car_int"
REGISTER_INT__STRING_INT        register_get_car_int16,      "get_car_int16"
REGISTER_VOID__INT_INT          register_set_car_int16,      "set_car_int16"

REGISTER_FLOAT__INT             register_get_memory_float,      "get_memory_float"
REGISTER_VOID__VECTOR_FLOAT_INT register_set_memory_float,      "set_memory_float"
REGISTER_INT__STRING_INT        register_get_memory_int,        "get_memory_int"
REGISTER_VOID__INT_INT          register_set_memory_int,        "set_memory_int"
REGISTER_INT__STRING_INT        register_get_memory_int16,      "get_memory_int16"
REGISTER_VOID__INT_INT          register_set_memory_int16,      "set_memory_int16"

REGISTER_INT__STRING_INT        register_save_hud_bone_float, "save_hud_bone_float"
REGISTER_FLOAT__INT             register_get_hud_float, "get_hud_float"
;--
REGISTER_FLOAT__INT             register_get_inventory_item_float,      "get_inventory_item_float"
REGISTER_VOID__VECTOR_FLOAT_INT register_set_inventory_item_float,      "set_inventory_item_float"
REGISTER_INT__STRING_INT        register_get_inventory_item_int,        "get_inventory_item_int"
REGISTER_VOID__INT_INT          register_set_inventory_item_int,        "set_inventory_item_int"
REGISTER_INT__STRING_INT        register_get_inventory_item_int16,      "get_inventory_item_int16"
REGISTER_VOID__INT_INT          register_set_inventory_item_int16,      "set_inventory_item_int16"
REGISTER_INT__STRING_INT        register_set_inventory_item_shared_str, "set_inventory_item_shared_str"
REGISTER_INT__STRING_INT        register_get_inventory_item_int8,        "get_inventory_item_int8"
REGISTER_VOID__INT_INT          register_set_inventory_item_int8,        "set_inventory_item_int8"
	
;--
REGISTER_INT__STRING_INT register_get_actor_int, "get_actor_int"
REGISTER_INT__STRING_INT register_get_actor_int16, "get_actor_int16"
REGISTER_VOID__INT_INT register_set_actor_int, "set_actor_int"

REGISTER_INT__STRING_INT register_get_wpn_gl_int, "get_wpn_gl_int"
REGISTER_INT__STRING_INT register_get_wpn_int, "get_wpn_int"
; -- to del
REGISTER_INT__STRING_INT register_get_holder_int, "get_holder_int"
;
REGISTER_VOID__INT_INT register_set_wpn_int, "set_wpn_int"

;REGISTER_INT__STRING_INT register_get_wpn_bone_id, "get_wpn_bone_id"
REGISTER_INT__STRING_INT register_get_bone_id, "get_bone_id"
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
REGISTER_INT__STRING_INT register_set_hud_shared_str, "set_hud_shared_str"

REGISTER_GO__INT register_item_in_inv_box, "object_from_inv_box"

REGISTER_VECTOR__STRING register_get_hud_bone_pos, "get_hud_bone_pos"

REGISTER_INIFILE__VOID register_get_visual_ini, "get_visual_ini"
REGISTER_VOID__STR_BOOL register_play_hud_anim, "play_hud_animation"

REGISTER_VOID__INT_INT_INT      register_set_goodwill_by_id, "set_goodwill_ex"
REGISTER_VOID__INT_INT_INT      register_change_goodwill_by_id, "change_goodwill_ex"

ALIGN_8
game_object_fix proc
; делаем то, что вырезали 
	call    enable_vision_register
; добавляем своё
	;PRINT "game_object_fix"
	; регистрируем функцию разрешения колбеков на нажатия и мышь
	;PERFORM_EXPORT_VOID__BOOL enable_input_extensions, "enable_input_extensions"
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
	; регистрируем функцию для получения specific_character
	PERFORM_EXPORT_STRING__VOID CScriptGameObject__GetSpecificProfile, "specific_character"
	;--
	PERFORM_EXPORT_FLOAT__INT             register_get_game_object_float,      CScriptGameObject__GetGameObjectFloat
	PERFORM_EXPORT_VOID__VECTOR_FLOAT_INT register_set_game_object_float,      CScriptGameObject__SetGameObjectFloat
	PERFORM_EXPORT_INT__STRING_INT        register_get_game_object_int,        CScriptGameObject__GetGameObjectInt
	PERFORM_EXPORT_VOID__INT_INT          register_set_game_object_int,        CScriptGameObject__SetGameObjectInt
	PERFORM_EXPORT_INT__STRING_INT        register_get_game_object_int16,      CScriptGameObject__GetGameObjectInt16
	PERFORM_EXPORT_VOID__INT_INT          register_set_game_object_int16,      CScriptGameObject__SetGameObjectInt16
	PERFORM_EXPORT_INT__STRING_INT        register_set_game_object_shared_str, CScriptGameObject__SetGameObjectSharedStr

	PERFORM_EXPORT_INT__STRING_INT        register_get_actor_condition_int,    CScriptGameObject__GetActorConditionInt


	PERFORM_EXPORT_FLOAT__INT             register_get_car_float,              CScriptGameObject__GetCarFloat
	PERFORM_EXPORT_VOID__VECTOR_FLOAT_INT register_set_car_float,              CScriptGameObject__SetCarFloat
	PERFORM_EXPORT_INT__STRING_INT        register_get_car_int,                CScriptGameObject__GetCarInt
	PERFORM_EXPORT_VOID__INT_INT          register_set_car_int,                CScriptGameObject__SetCarInt
	PERFORM_EXPORT_INT__STRING_INT        register_get_car_int16,              CScriptGameObject__GetCarInt16
	PERFORM_EXPORT_VOID__INT_INT          register_set_car_int16,              CScriptGameObject__SetCarInt16

	PERFORM_EXPORT_FLOAT__INT             register_get_memory_float,           CScriptGameObject__GetMemoryFloat
	PERFORM_EXPORT_VOID__VECTOR_FLOAT_INT register_set_memory_float,           CScriptGameObject__SetMemoryFloat
	PERFORM_EXPORT_INT__STRING_INT        register_get_memory_int,             CScriptGameObject__GetMemoryInt
	PERFORM_EXPORT_VOID__INT_INT          register_set_memory_int,             CScriptGameObject__SetMemoryInt
	PERFORM_EXPORT_INT__STRING_INT        register_get_memory_int16,           CScriptGameObject__GetMemoryInt16
	PERFORM_EXPORT_VOID__INT_INT          register_set_memory_int16,           CScriptGameObject__SetMemoryInt16
	
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
	PERFORM_EXPORT_VOID__INT_INT register_set_actor_int, CScriptGameObject__SetActorInt

	PERFORM_EXPORT_INT__STRING_INT register_get_wpn_gl_int, CScriptGameObject__GetWeaponGLInt
	PERFORM_EXPORT_INT__STRING_INT register_get_wpn_int, CScriptGameObject__GetWeaponInt
	PERFORM_EXPORT_VOID__INT_INT register_set_wpn_int, CScriptGameObject__SetWeaponInt
	
	;PERFORM_EXPORT_INT__STRING_INT register_get_wpn_bone_id, CScriptGameObject__GetWeaponBoneID
	PERFORM_EXPORT_INT__STRING_INT register_get_bone_id, CScriptGameObject__GetBoneID
	
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

	PERFORM_EXPORT_STRING__VOID CScriptGameObject__GetHudSharedStr, "get_hud_shared_str"
	PERFORM_EXPORT_INT__STRING_INT register_set_hud_shared_str, CScriptGameObject__SetHudSharedStr

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
	PERFORM_EXPORT_UINT__VOID CScriptGameObject__GetGameObject,        "cast_game_object"
	PERFORM_EXPORT_UINT__VOID CScriptGameObject__CCar,                 "cast_car"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsCar,                "is_car"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsHelicopter,         "is_helicopter"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsHolder,             "is_holder"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsEntityAlive,        "is_entity_alive"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsInventoryItem,      "is_inventory_item"
	PERFORM_EXPORT_UINT__VOID CScriptGameObject__CInventoryItem,       "cast_inventory_item"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsInventoryOwner,     "is_inventory_owner"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsActor,              "is_actor"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsCustomMonster,      "is_custom_monster"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsWeapon,             "is_weapon"
	PERFORM_EXPORT_UINT__VOID CScriptGameObject__CWeapon,              "cast_weapon"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsWeaponGL,           "is_weapon_gl"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsInventoryBox,       "is_inventory_box"
	;PERFORM_EXPORT_BOOL__VOID CScriptGameObject__CInventoryBox,       "is_inventory_box1"
	PERFORM_EXPORT_UINT__VOID CScriptGameObject__CInventoryBox,        "cast_inventory_box"
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
	PERFORM_EXPORT_UINT__VOID CScriptGameObject__CHudItem,             "cast_hud_item"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsFoodItem,           "is_food_item"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsArtefact,           "is_artefact"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsAmmo,               "is_ammo"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsMissile,            "is_missile"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsPhysicsShellHolder, "is_physics_shell_holder"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsGrenade,            "is_grenade"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsBottleItem,         "is_bottle_item"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsEatableItem,        "is_eatable_item"
	
	PERFORM_EXPORT_VECTOR__STRING register_get_hud_bone_pos, CScriptGameObject__hud_bone_position
	
	PERFORM_EXPORT_VOID__VOID CScriptGameObject__ProjectorOn, "projector_on"
	PERFORM_EXPORT_VOID__VOID CScriptGameObject__ProjectorOff, "projector_off"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__ProjectorIsOn, "projector_is_on"
	PERFORM_EXPORT_VOID__BOOL CScriptGameObject__SwitchProjector, "switch_projector"
	
	PERFORM_EXPORT_INIFILE__VOID register_get_visual_ini, CScriptGameObject__GetVisualIni
	
	PERFORM_EXPORT_VOID__VOID CScriptGameObject__UpdateCondition, "update_condition"
	
	PERFORM_EXPORT_VOID__STR_BOOL register_play_hud_anim, CScriptGameObject__PlayHudAnimation
	
	PERFORM_EXPORT_INT__STRING_INT register_save_hud_bone_float, CScriptGameObject__SaveHudBoneFloat
	PERFORM_EXPORT_FLOAT__INT      register_get_hud_float, CScriptGameObject__GetHudFloat
	; lights management
	PERFORM_EXPORT_VOID__VOID CScriptGameObject__CreateLight01,  "create_light01"
	PERFORM_EXPORT_VOID__VOID CScriptGameObject__DestroyLight01, "destroy_light01"
	PERFORM_EXPORT_VOID__FLOAT CScriptGameObject__SetLight01Range, "set_light01_range"
	PERFORM_EXPORT_VOID__FLOAT CScriptGameObject__SetLight01Angle, "set_light01_angle"
	PERFORM_EXPORT_VOID__BOOL CScriptGameObject__SetLight01Enabled, "set_light01_enabled"
	PERFORM_EXPORT_VOID__BOOL CScriptGameObject__SetLight01Shadow, "set_light01_shadow"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__GetLight01Enabled, "get_light01_enabled"
	PERFORM_EXPORT_VOID__VECTOR CScriptGameObject__SetLight01Position, "set_light01_pos"
	PERFORM_EXPORT_VOID__VECTOR CScriptGameObject__SetLight01Color, "set_light01_color"
	PERFORM_EXPORT_VOID__INT CScriptGameObject__SetLight01Type, "set_light01_type"
	
	PERFORM_EXPORT_VOID__VECTOR CScriptGameObject__SetCalibratingVector, "set_calibrating_vector"
	
	PERFORM_EXPORT_VOID__VOID CScriptGameObject__InvalidateInventory, "invalidate_inventory"
	;PERFORM_EXPORT_VECTOR__VOID
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__NonscriptUsable, "nonscript_usable"
	;
	PERFORM_EXPORT_VOID__INT_INT register_set_goodwill_by_id, CScriptGameObject__SetGoodwillByID
	PERFORM_EXPORT_VOID__INT_INT register_change_goodwill_by_id, CScriptGameObject__ChangeGoodwillByID

	PERFORM_EXPORT_VOID__GO CScriptGameObject__AttachVehicle, "attach_vehicle"
	
	PERFORM_EXPORT_VOID__BOOL CScriptGameObject__EnableCarPanel, "enable_car_panel"
	
	PERFORM_EXPORT_VOID__VECTOR CScriptGameObject__SetVectorGlobalArg1, "set_vector_global_arg_1"
	PERFORM_EXPORT_VOID__VECTOR CScriptGameObject__SetVectorGlobalArg2, "set_vector_global_arg_2"
	PERFORM_EXPORT_VOID__VECTOR CScriptGameObject__SetVectorGlobalArg3, "set_vector_global_arg_3"
	PERFORM_EXPORT_VOID__VECTOR CScriptGameObject__SetVectorGlobalArg4, "set_vector_global_arg_4"
	
	PERFORM_EXPORT_VOID__VECTOR CScriptGameObject__SetActorDirectionEx, "set_actor_direction_ex"

	PERFORM_EXPORT_VOID__GO CScriptGameObject__SetGOArg1, "set_object_arg_1"
	
	PERFORM_EXPORT_UINT__VOID CScriptGameObject__GetHudItemState,             "get_hud_item_state"
	
	
	; by Real Wolf
	PERFORM_EXPORT_VOID__BOOL CScriptGameObject__SwitchTorch, "switch_torch"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsTorchEnabled, "is_torch_enabled"
	PERFORM_EXPORT_VOID__FLOAT CScriptGameObject__SetTorchRange, "set_torch_range"
	PERFORM_EXPORT_VOID__VECTOR CScriptGameObject__SetTorchColor, "set_torch_color"
	PERFORM_EXPORT_VOID__FLOAT CScriptGameObject__SetTorchOmniRange, "set_torch_omni_range"
	PERFORM_EXPORT_VOID__VECTOR CScriptGameObject__SetTorchOmniColor, "set_torch_omni_color"
	PERFORM_EXPORT_VOID__FLOAT CScriptGameObject__SetTorchGlowRadius, "set_torch_glow_radius"
	PERFORM_EXPORT_VOID__FLOAT CScriptGameObject__SetTorchSpotAngle, "set_torch_spot_angle"
	PERFORM_EXPORT_VOID__STRING CScriptGameObject__SetTorchColorAnimator, "set_torch_color_animator"
	
	PERFORM_EXPORT_INT__STRING_INT        register_get_inventory_item_int8,        CScriptGameObject__GetInvItemInt8
	PERFORM_EXPORT_VOID__INT_INT          register_set_inventory_item_int8,        CScriptGameObject__SetInvItemInt8
	
	PERFORM_EXPORT_STRING__VOID CScriptGameObject__GetVisualName, "get_visual_name"
	PERFORM_EXPORT_VOID__STRING CScriptGameObject__SetVisualName, "set_visual_name"
	
	PERFORM_EXPORT_FLOAT__VOID CScriptGameObject__GetShapeRadius, "get_shape_radius"
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__IsTorch,        "is_torch"
	PERFORM_EXPORT_GO__INT register_get_object_arg_1, CScriptGameObject__GetObjectArg1
	; end
	
	; регистрируем функции установки lsf_params для ламп
	PERFORM_EXPORT_VOID__FLOAT CScriptGameObject__SetLSFSpeed, "set_lsf_speed"
	PERFORM_EXPORT_VOID__FLOAT CScriptGameObject__SetLSFAmount, "set_lsf_amount"
	PERFORM_EXPORT_VOID__FLOAT CScriptGameObject__SetLSFSMAPJitter, "set_lsf_smap_jitter"
	PERFORM_EXPORT_FLOAT__VOID CScriptGameObject__GetLSFSpeed, "get_lsf_speed"
	; регистрируем функцию получения радиуса объекта
	PERFORM_EXPORT_FLOAT__VOID CScriptGameObject__GetRadius, "radius"
	; получение имени кости по индексу
	PERFORM_EXPORT_STRING__VOID CScriptGameObject__GetBoneName, "get_bone_name"
	; наличие визуала (с костями)
	PERFORM_EXPORT_BOOL__VOID CScriptGameObject__HasVisual,          "has_visual"

	; =========================================================================================
	; ========================= added by Ray Twitty (aka Shadows) =============================
	; =========================================================================================
	; ====================================== START ============================================
	; =========================================================================================
	; восстановление прошлого значения FOV актора
	PERFORM_EXPORT_VOID__VOID CScriptGameObject__RestoreCameraFOV, "restore_camera_fov"
	; =========================================================================================
	; ======================================= END =============================================
	; =========================================================================================

	; идём обратно
	jmp back_from_game_object_fix
game_object_fix endp

game_object_fix2 proc
	; делаем то, что вырезали
	call    register__float_rw_property
	; делаем своё
	PERFORM_EXPORT_PROPERTY__FLOAT_RW CScriptGameObject__GetSatiety, CScriptGameObject__ChangeSatiety, "satiety"
	PERFORM_EXPORT_PROPERTY__FLOAT_RW CScriptGameObject__GetAlcohol, CScriptGameObject__ChangeAlcohol, "alcohol"
	PERFORM_EXPORT_PROPERTY__FLOAT_RW CScriptGameObject__GetMaxPower, CScriptGameObject__ChangeMaxPower, "max_power"
	;идём обратно
	jmp     back_from_game_object_fix2
game_object_fix2 endp

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
	;
	pusha
	call    GetGameSP
	test    eax, eax
	jz      exit
	mov     eax,[eax+3Ch] ; InventoryMenu
	test    eax, eax
	jz      exit
	mov     byte ptr [eax+64h], 1 ; m_b_need_reinit = true
exit:	
	popa
	;
	
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
	
	call    CScriptGameObject__CActor
	test    eax, eax
	jz      short exit_fail
	
	fld     dword ptr [eax+1468]
	jmp     short exit_ok
exit_fail:
	fldz
exit_ok:
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
fbuf:
	dword 123.456
a_fail_msg:
	db "fail", 0
a_xxx_msg:
	db "arg=%d", 0
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

CScriptGameObject__GetActorConditionInt proc
stub  = dword ptr  8
pos   = dword ptr  0Ch
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
	mov     eax, dword ptr [eax+ecx]
	jmp     exit
exit_fail:
	xor eax, eax
exit:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__GetActorConditionInt endp

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
CScriptGameObject__SetActorInt proc
pos   = dword ptr  8
value = dword ptr  0Ch

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    eax
	push    edx
	push    ecx
	
	
	call    CScriptGameObject__CActor
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
CScriptGameObject__SetActorInt endp

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


CScriptGameObject__GetBoneID proc
bone_name = dword ptr 8
stub      = dword ptr 0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	push    ecx
	push    edx
	push    esi
	
	mov     eax, [ecx+4]
	call    CGameObject__kinematic

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
CScriptGameObject__GetBoneID endp

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
	mov     ecx, [g_fov]
	mov     [g_last_fov], ecx
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

CScriptGameObject__SetHudSharedStr proc
str_arg   = dword ptr  8
shift_arg = dword ptr  0Ch

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    eax
	push    ebx
	push    ecx
	push    edx

	call    CScriptGameObject__CHudItem
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
CScriptGameObject__SetHudSharedStr endp

CScriptGameObject__GetHudSharedStr proc
	;===========================
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push ecx
	push esi
	
	call    CScriptGameObject__CHudItem
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
CScriptGameObject__GetHudSharedStr endp

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
	mov     eax, offset g_visual_shared_str
	dec     dword ptr [eax]
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

CScriptGameObject__SetCalibratingVector proc
value  = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h

	mov     eax, [ebp + value]
	mov     ecx, [eax]
	mov     [g_test_vector], ecx
	mov     ecx, [eax+4]
	mov     [g_test_vector+4], ecx
	mov     ecx, [eax+8]
	mov     [g_test_vector+8], ecx
	
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__SetCalibratingVector endp
;g_test_vector dd -0.010, 0.020, 0.05
g_test_vector dd 0.0, 0.0, 0.0

CScriptGameObject__hud_bone_position proc
vector_res = dword ptr -4Ch
matrix_res = dword ptr -40h
bone_name  = dword ptr  0Ch
result     = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	sub     esp, 44h + 0Ch
	
	push    ebx
	push    esi
	push    edi
	push    edx
	;
	mov     eax, [ebp+result]
	mov     dword ptr [eax], 0
	mov     dword ptr [eax + 4], 0
	mov     dword ptr [eax + 8], 0
	;pusha
	
	mov     edi, ecx
	;call CScriptGameObject__CWeapon
	;test eax, eax
	;jz exit_fail
	;mov ecx, eax
	;call CWeapon__UpdateFireDependencies_internal
	;mov ecx, edi

	;mov     eax, esp
	;PRINT_UINT "sp1=%x", eax
	
	;shared_data = hud->m_shared_data.baseclass_0.p_;
    ;fire_mat = (_matrix<float> *)(*(_DWORD *)(kinematics + 132) + 160 * LOWORD(shared_data->m_fire_bone));

	
	
	call    CScriptGameObject__GetHudVisual
	test    eax, eax
	jz      exit_fail
	mov     esi, eax
	mov     eax, [ebp+bone_name] ; eax == bone_name
	push    eax
	mov     ecx, esi ; this == ecx
	call    ds:CKinematics__LL_BoneID
	movzx   eax, ax
	;PRINT_UINT "bone_id=%d", eax
	cmp     eax, 0FFFFh
	jz      exit_fail
; ---------------------------------------------------------------------------
	mov     ebx, 160
	mul     ebx
	mov     ecx, eax
	add     ecx, [esi+84h] ; eax = bone xform
	;PRINT_MATRIX "bone_xform", ecx
	mov     eax, offset g_test_vector ; input
	push    eax
	;PRINT_VECTOR "input", eax
	mov     eax, [ebp+result]
	push    eax  ; result
	call matrix_transform_tiny_2args_internal
	;PRINT_UINT "bone_xform=%x", eax
	mov     eax, [ebp+result]
	;PRINT_VECTOR "2nd", eax
	
	mov     ecx, edi
	call CScriptGameObject__CWeapon
	test    eax, eax
	jz      exit_fail
	
	mov     eax, [eax+298h] ; hud
	lea     ecx, [eax+6] ; this = hud xform
	mov     eax, [ebp+result]
	push    eax  ; result
	call matrix_transform_tiny_1arg_internal
	mov     eax, [ebp+result]
	;PRINT_VECTOR "3nd", eax
	
	;PRINT_MATRIX "hud xform:", eax
	;mov     ecx, [edi+4] ; object
	;lea     ecx, [ecx + 50h]
	;push    ecx ; object xform
	;PRINT_MATRIX "object xform:", ecx

	;PRINT_UINT "object_xform=%x", eax
	
	;lea     ecx, [ebp+matrix_res]
	;call    matrix__mul_43
	;PRINT "test2"
	
	;PRINT_MATRIX "transform", ecx
	;mov     ebx, [ebp+result]
	;ASSUME  ebx:PTR Vector3
	;ASSUME  ecx:PTR Matrix4x4
	;mov     eax, [ecx].c_.x
	;mov     [ebx].x, eax ; result[0]
	;mov     eax, [ecx].c_.y
	;mov     [ebx].y, eax ; result[1]
	;mov     eax, [ecx].c_.z
	;mov     [ebx].z, eax ; result[2]
	;ASSUME  ebx:nothing
	;ASSUME  ecx:nothing
exit_fail:
	;popa
	;push ebx
	;push edi
	;assume eax:PTR Vector3
	;assume edi:PTR Vector3
	;mov eax, offset g_saved_vector
	;mov edi, [ebp+result]
	;mov ebx, [eax].x
	;mov [edi].x, ebx
	;mov ebx, [eax].y
	;mov [edi].y, ebx
	;mov ebx, [eax].z
	;mov [edi].z, ebx
	;assume eax:nothing
	;assume edi:nothing
	;pop edi
	;pop ebx
	
	
	mov     eax, [ebp+result]
	
	pop     edx
	pop     edi
	pop     esi
	pop     ebx
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__hud_bone_position endp

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



CScriptGameObject__hud_bone_position_ proc near
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
CScriptGameObject__hud_bone_position_ endp

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

CScriptGameObject__GetSpecificProfile proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push 	edx
	push 	ecx
	
	;input: ecx - CScriptGameObject
	call	CScriptGameObject__ID			;get id
	;output: eax - game id (uint)
	
	push 	eax
	;input: eax - game id (uint)
	call 	ch_info_get_from_id				;get CSE_ALifeTraderAbstract by id
	;output: eax - CSE_ALifeTraderAbstract
	
	mov 	eax, [eax+3Ch]
	add		eax, 0Ch
	
	xor     ecx, ecx
	mov     g_int_argument_0, ecx
	
	pop 	ecx
	pop 	edx
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__GetSpecificProfile endp


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


CScriptGameObject__SwitchTorch proc
arg = byte ptr 8
	push    ebp
	mov     ebp, esp
	push    esi
	
	call    CScriptGameObject__CTorch
	test    eax, eax
	jz      exit
	mov		ecx, eax
	mov		eax, 0
	mov     al, [ebp+arg]
	call    CTorch__Switch
exit:
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__SwitchTorch endp

CScriptGameObject__SetTorchRange proc
range = dword ptr 8
	push	ebp
	mov		ebp, esp

	call	CScriptGameObject__CTorch
	test	eax, eax
	jz		exit

	mov		ecx, [eax+2ACh]
	mov		edx, [ecx]
	mov		edx, [edx+20h]

	push	[ebp+range]

	call	edx
exit:
	mov		esp, ebp
	pop		ebp

	retn	4
CScriptGameObject__SetTorchRange endp

CScriptGameObject__SetTorchColor proc
color = dword ptr 8
	push	ebp
	mov		ebp, esp

	call	CScriptGameObject__CTorch
	test	eax, eax
	jz		exit

	mov		ecx, [eax+2ACh]
	mov		edx, [ecx]
	mov		edx, [edx+2Ch]

	mov 	ebx, [ebp+color]

	push	[ebx]
	push	[ebx+4]
	push	[ebx+8]
	
	call	edx
exit:
	mov		esp, ebp
	pop		ebp

	retn	4
CScriptGameObject__SetTorchColor endp

CScriptGameObject__SetTorchOmniRange proc
range = dword ptr 8
	push	ebp
	mov		ebp, esp

	call	CScriptGameObject__CTorch
	test	eax, eax
	jz		exit

	mov		ecx, [eax+2B0h]
	mov		edx, [ecx]
	mov		edx, [edx+20h]

	push	[ebp+range]

	call	edx
exit:
	mov		esp, ebp
	pop		ebp

	retn	4
CScriptGameObject__SetTorchOmniRange endp

CScriptGameObject__SetTorchOmniColor proc
color = dword ptr 8
	push	ebp
	mov		ebp, esp

	call	CScriptGameObject__CTorch
	test	eax, eax
	jz		exit

	mov		ecx, [eax+2B0h]
	mov		edx, [ecx]
	mov		edx, [edx+2Ch]

	mov 	ebx, [ebp+color]

	push	[ebx]
	push	[ebx+4]
	push	[ebx+8]
	
	call	edx
exit:
	mov		esp, ebp
	pop		ebp

	retn	4
CScriptGameObject__SetTorchOmniColor endp

CScriptGameObject__SetTorchGlowRadius proc
radius = dword ptr 8
	push	ebp
	mov		ebp, esp

	call	CScriptGameObject__CTorch
	test	eax, eax
	jz		exit

	mov		ecx, [eax+2B4h]
	mov		edx, [ecx]
	mov		edx, [edx+10h]

	push	[ebp+radius]

	call	edx
exit:
	mov		esp, ebp
	pop		ebp

	retn	4
CScriptGameObject__SetTorchGlowRadius endp

CScriptGameObject__SetTorchSpotAngle proc
angle = dword ptr 8
	push	ebp
	mov		ebp, esp

	call	CScriptGameObject__CTorch
	test	eax, eax
	jz		exit

	mov		ecx, [eax+2ACh]
	mov		edx, [ecx]
	mov		edx, [edx+1Ch]

	fld		dword ptr [ebp+angle]
	fmul	ds:dbl_104D27F8
	push	ecx
	fstp	dword ptr [esp]
	
	call	edx
exit:
	mov		esp, ebp
	pop		ebp

	retn	4
CScriptGameObject__SetTorchSpotAngle endp

CScriptGameObject__IsTorchEnabled proc
	push    ebp
	mov     ebp, esp
	
	call    CScriptGameObject__CTorch
	test	eax, eax
	jz 		short exit
	mov     eax, [eax + 680]
	and		eax, 0FFh
exit:
	mov     esp, ebp
	pop     ebp

	retn
CScriptGameObject__IsTorchEnabled endp

CScriptGameObject__SetTorchColorAnimator proc
	push 	ebp
	mov		ebp, esp
	
	call	CScriptGameObject__CTorch
	test	eax, eax
	jz		exit	
	
	push	esi
	mov		esi, eax

	mov		ecx, ds:off_1045862C ;?LALib@@3VELightAnimLibrary@@A
	push	[ebp+8]
	call	ds:off_10458630 ;?FindItem@ELightAnimLibrary@@QAEPAVCLAItem@@PBD@Z
	mov		[esi+28Ch], eax
	
	mov		eax, esi
	pop		esi
	
exit:	
	mov		esp, ebp
	pop		ebp
	
	retn	4
CScriptGameObject__SetTorchColorAnimator endp

CScriptGameObject__GetInvItemInt8 proc
stub  = dword ptr  8
pos   = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	
	call    CScriptGameObject__CInventoryItem
	mov     ecx, [ebp + pos]
	mov     eax, [eax + ecx]
	and		eax, 0FFh

	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__GetInvItemInt8 endp

CScriptGameObject__SetInvItemInt8 proc
pos   = dword ptr  8
value = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	push    edx

	call    CScriptGameObject__CInventoryItem
	mov     ecx, [ebp + pos]
	mov     edx, [ebp + value]
	mov     [eax+ecx], dl

	pop     edx
	mov     esp, ebp
	pop     ebp
	retn    08h
CScriptGameObject__SetInvItemInt8 endp



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

CScriptGameObject__GetVisualIni proc
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
	mov     eax, [eax+128]
	jmp     exit
exit_fail:
	mov     eax, 0
exit:
	pop     esi
	pop     edx
	pop     ecx
	
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__GetVisualIni endp

;;
CScriptGameObject__GetMaxPower proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	call    CScriptGameObject__CActor
	test    eax, eax
	jz      not_actor
	; eax == actor
	mov     eax, [eax+93Ch] ; conditions
	fld     dword ptr [eax+068h] ; max_power
	jmp     exit
not_actor:
	fldz
exit:	
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__GetMaxPower endp

CScriptGameObject__ChangeMaxPower proc
value           = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	call    CScriptGameObject__CActor
	test    eax, eax
	jz      exit
	; eax == actor
	mov     eax, [eax+93Ch] ; conditions
	movss   xmm0, dword ptr [eax+068h] ; max_power
	movss   xmm1, dword ptr [ebp+value] ; max_power change
	addss   xmm0, xmm1
	; clamp
	movss   xmm1, dword ptr[float__1_0]
	comiss  xmm0, xmm1
	jbe     short lt_1_0
	movss   xmm0, xmm1
lt_1_0:
	movss   dword ptr [eax+068h], xmm0
exit:	
	mov     esp, ebp
	pop     ebp
	retn    4
ALIGN 8
float__1_0:
	dd 1.0
CScriptGameObject__ChangeMaxPower endp

;;
CScriptGameObject__GetAlcohol proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	call    CScriptGameObject__CActor
	test    eax, eax
	jz      not_actor
	; eax == actor
	mov     eax, [eax+93Ch] ; conditions
	fld     dword ptr [eax+0F8h] ; alcohol
	jmp     exit
not_actor:
	fldz
exit:	
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__GetAlcohol endp

CScriptGameObject__ChangeAlcohol proc
value           = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	call    CScriptGameObject__CActor
	test    eax, eax
	jz      exit
	; eax == actor
	mov     eax, [eax+93Ch] ; conditions
	movss   xmm0, dword ptr [eax+0F8h] ; alcohol
	movss   xmm1, dword ptr [ebp+value] ; alcohol change
	addss   xmm0, xmm1
	;
	movss   xmm1, dword ptr[float__1_0]
	comiss  xmm0, xmm1
	jbe     short lt_1_0
	movss   xmm0, xmm1
lt_1_0:
	movss   dword ptr [eax+0F8h], xmm0
exit:	
	mov     esp, ebp
	pop     ebp
	retn    4
ALIGN 8
float__1_0:
	dd 1.0
CScriptGameObject__ChangeAlcohol endp


CScriptGameObject__GetSatiety proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	call    CScriptGameObject__CActor
	test    eax, eax
	jz      not_actor
	; eax == actor
	mov     eax, [eax+93Ch] ; conditions
	fld     dword ptr [eax+100h] ; satiety
	jmp     exit
not_actor:
	fldz
exit:	
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__GetSatiety endp



CScriptGameObject__ChangeSatiety proc
value           = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	call    CScriptGameObject__CActor
	test    eax, eax
	jz      exit
	; eax == actor
	mov     eax, [eax+93Ch] ; conditions
	movss   xmm0, dword ptr [eax+100h] ; satiety
	movss   xmm1, dword ptr [ebp+value] ; satiety change
	addss   xmm0, xmm1
	;
	movss   xmm1, dword ptr[float__1_0]
	comiss  xmm0, xmm1
	jbe     short lt_1_0
	movss   xmm0, xmm1
lt_1_0:
	movss   dword ptr [eax+100h], xmm0
exit:	
	mov     esp, ebp
	pop     ebp
	retn    4
ALIGN 8
float__1_0:
	dd 1.0
CScriptGameObject__ChangeSatiety endp
; 60h - PsyHealth
; 100h - satiety

CScriptGameObject__UpdateCondition proc
	push ebx
	push edx
	push esi
	push edi
	
	call    CScriptGameObject__CEntityAlive
	cmp     eax, 0
	jz      exit
	;PRINT "updating condition"
	mov     ecx, eax
	mov     ebx, ecx
	mov     esi, [ebx+220h]
	call    CEntityCondition__UpdateConditionTime
	;PRINT "1"
	mov     ecx, [ebx+220h]
	mov     edx, [ecx]
	mov     eax, [edx+24h]
	call    eax
	;PRINT "2"
	mov     edi, [ebx+220h]
	call    CEntityCondition__UpdateWounds
	;PRINT "3"
exit:

	pop edi
	pop esi
	pop edx
	pop ebx
	retn
CScriptGameObject__UpdateCondition endp

CScriptGameObject__PlayHudAnimation proc
motion_ID = dword ptr -4
anim      = dword ptr  8
mix_in    = byte ptr  0Ch

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	sub     esp, 8

	push    esi
	
	call    CScriptGameObject__GetHudVisual
	mov     esi, eax
	mov     ecx, esi ; this == ecx
	mov     eax, [ebp+anim]
	push    eax
	lea     eax, [ebp+motion_ID]
	push    eax
	call    ds:CKinematicsAnimated__ID_Cycle
	cmp     word ptr [ebp+motion_ID], 0FFFFh
	jz      short exit_fail
	;mov     eax, [ebp+anim]
	;PRINT_UINT "ready: %s", eax
	push    0
	push    0
	push    0
	movzx   eax, [ebp+mix_in]
	push    eax
	mov     eax, [ebp+motion_ID]
	push    eax
	mov     ecx, esi ; this == ecx
	call    ds:CKinematicsAnimated__PlayCycle
exit_fail:	
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__PlayHudAnimation endp

CScriptGameObject__GetHudVisual proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    ecx
	
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
	jnz     exit
exit_fail:
	xor     eax, eax
exit:
	pop     ecx
	mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__GetHudVisual endp

CScriptGameObject__SaveHudBoneFloat proc
bone  = dword ptr  8
pos   = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h

	mov     [g_float_res00], 0
	call    CScriptGameObject__GetHudVisual
	test    eax, eax
	jz      exit_fail
	mov     esi, eax
	mov     eax, [ebp+bone] ; eax == bone_name
	push    eax
	mov     ecx, esi ; this == ecx
	call    ds:CKinematics__LL_BoneID
	movzx   eax, ax
	;PRINT_UINT "bone_id=%d", eax
	cmp     eax, 0FFFFh
	;
	;mov     eax, esp
	;PRINT_UINT "sp2=%x", eax
	;
	jz      exit_fail
	;jmp     exit_fail
	;PRINT "test1"
; ---------------------------------------------------------------------------
	movzx   eax, ax
	lea     eax, [eax+eax*4]
	shl     eax, 5
	add     eax, [esi+84h] ; eax == bone_instance

	mov     ecx, [ebp + pos]
	mov     eax, [eax + ecx] ; value
	mov     [g_float_res00], eax

exit_fail:
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__SaveHudBoneFloat endp

CScriptGameObject__GetHudFloat proc
pos = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	fldz
	call    CScriptGameObject__CHudItem
	test    eax, eax
	jz      exit
	mov     eax, [eax+16] ; eax == m_pHUD
	;PRINT_UINT "hud1=%x", eax
	mov     ecx, [eax+72]
	;PRINT_MATRIX "hud_xform:", ecx
	mov     ecx, [ebp + pos]
	;PRINT_UINT "pos=%d", ecx
	fld     dword ptr [eax+ecx]
	;PRINT_UINT "hud2=%x", eax
exit:
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__GetHudFloat endp


CScriptGameObject__CreateLight01 proc
	push esi
	push edi
	
	call CScriptGameObject__CInventoryItem
	mov  edi, eax ; сохраняем inventory_item
	mov  ecx, edi ; ecx = this
	call CInventoryItem_get_user_data
	mov esi, eax ; esi = user_data и также адрес light01
	call create_light ; eax = light
	add     dword ptr [eax+4], 1
	;
	mov [esi], eax
	;mov ecx, esi
	;call light_destroy
	;mov dword ptr [esi], 0
	;
	pop edi
	pop esi
	retn
CScriptGameObject__CreateLight01 endp

CScriptGameObject__DestroyLight01 proc
	call CScriptGameObject__CInventoryItem
	mov  ecx, eax ; ecx = inventory_item
	call CInventoryItem_get_user_data
	mov ecx, eax ; ecx = user_data == light01 address
	call light_destroy
	retn
CScriptGameObject__DestroyLight01 endp

CScriptGameObject__SetLight01Range proc
range = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	call CScriptGameObject__CInventoryItem
	mov  ecx, eax ; ecx = inventory_item
	call CInventoryItem_get_user_data
	mov ecx, eax ; ecx = user_data == light01 address
	mov eax, dword ptr[ebp+range]

	call light_set_range
	
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__SetLight01Range endp

CScriptGameObject__SetLight01Angle proc
angle = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	call CScriptGameObject__CInventoryItem
	mov  ecx, eax ; ecx = inventory_item
	call CInventoryItem_get_user_data
	mov ecx, eax ; ecx = user_data == light01 address
	mov eax, dword ptr[ebp+angle]

	call light_set_angle
	
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__SetLight01Angle endp



CScriptGameObject__SetLight01Enabled proc
enabled = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	call CScriptGameObject__CInventoryItem
	mov  ecx, eax ; ecx = inventory_item
	call CInventoryItem_get_user_data
	mov ecx, eax ; ecx = user_data == light01 address
	mov eax, dword ptr[ebp+enabled]
	and eax, 0FFh
	call light_set_active
	
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__SetLight01Enabled endp

CScriptGameObject__SetLight01Shadow proc
shadow = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	call CScriptGameObject__CInventoryItem
	mov  ecx, eax ; ecx = inventory_item
	call CInventoryItem_get_user_data
	mov ecx, eax ; ecx = user_data == light01 address
	mov eax, dword ptr[ebp+shadow]
	and eax, 0FFh
	call light_set_shadow
	
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__SetLight01Shadow endp

CScriptGameObject__GetLight01Enabled proc
	call CScriptGameObject__CInventoryItem
	mov  ecx, eax ; ecx = inventory_item
	call CInventoryItem_get_user_data
	mov ecx, eax ; ecx = user_data == light01 address
	call light_get_active
	and eax, 0FFh
	retn
CScriptGameObject__GetLight01Enabled endp

CScriptGameObject__SetLight01Position proc
pos = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	call CScriptGameObject__CInventoryItem
	mov  ecx, eax ; ecx = inventory_item
	call CInventoryItem_get_user_data
	mov ecx, eax ; ecx = user_data == light01 address
	mov eax, dword ptr[ebp+pos]
	call light_set_position
	
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__SetLight01Position endp

CScriptGameObject__SetLight01Color proc
col = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push edx
	
	call CScriptGameObject__CInventoryItem
	mov  ecx, eax ; ecx = inventory_item
	call CInventoryItem_get_user_data
	mov ecx, eax ; ecx = user_data == light01 address
	mov eax, dword ptr[ebp+col]
	;push dword ptr [eax]
	;push dword ptr [eax + 4]
	;push dword ptr [eax + 8]
	;call light_set_color
	mov edx, dword ptr [eax]
	mov dword ptr [ecx+6Ch], edx
	mov edx, dword ptr [eax + 4]
	mov dword ptr [ecx+70h], edx
	mov edx, dword ptr [eax + 8]
	mov dword ptr [ecx+74h], edx
	mov edx, dword ptr [value_one]
	mov dword ptr [ecx+78h], edx

	
	pop edx
	mov     esp, ebp
	pop     ebp
	retn    4
value_one:
	dd 1.0
CScriptGameObject__SetLight01Color endp


CScriptGameObject__SetLight01Type proc
type_ = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	call CScriptGameObject__CInventoryItem
	mov  ecx, eax ; ecx = inventory_item
	call CInventoryItem_get_user_data
	mov ecx, eax ; ecx = user_data == light01 address
	mov eax, dword ptr[ebp+type_]
	call light_set_type
	
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__SetLight01Type endp


;CInventoryItem_get_user_data proc ; ecx = this, result in eax
;create_light proc ; да будет свет (результат в eax)
;light_set_shadow proc ; ecx = light_ref, eax = 0/1 - shadow_on

;enum LT {
;	DIRECT,
;	POINT,
;	SPOT,
;	OMNIPART,
;	REFLECTED,
;};

;light_set_type proc ; ecx = light_ref_addr, eax = type
;light_set_position proc ; ecx = light_ref_addr, eax = position (vector)
;light_set_color proc ; ecx = light_ref_addr, stack - 3*float_color
;light_set_range proc ; ecx = light_ref_addr, eax = range (float)
;light_get_active proc ; ecx = light_ref_addr, в eax вернётся результат
;light_set_active proc ; ecx = light_ref_addr, eax = 0/1 active
;light_destroy proc ; ecx = light_ref_addr


CScriptGameObject__InvalidateInventory proc
	call    CScriptGameObject__CInventoryOwner
	test    eax, eax
	jz      exit_fail
	mov     eax, [eax+24h] ; eax = inventory
	mov     ecx, ds:Device
	mov     ecx, [ecx+0F4h]
	mov     [eax+78h], ecx
exit_fail:
	retn
CScriptGameObject__InvalidateInventory endp

CScriptGameObject__NonscriptUsable proc
	mov ecx, [ecx + 4]
	xor eax, eax
	mov al, byte ptr [ecx + 268]
	
	retn
CScriptGameObject__NonscriptUsable endp

CScriptGameObject__SetGoodwillByID proc
for_who  = dword ptr 08h
to_who   = dword ptr 0Ch
goodwill = dword ptr 10h

	push    ebp
	mov     ebp, esp
	push    edx
	;---
	mov     eax, [ebp + to_who]
	push eax
	mov     eax, [ebp + for_who]
	push eax
	mov     eax, [ebp + goodwill]
	call    RELATION_REGISTRY__SetGoodwill
	;---
	pop     edx
	mov     esp, ebp
	pop     ebp
	retn    0Ch
CScriptGameObject__SetGoodwillByID endp

CScriptGameObject__ChangeGoodwillByID proc
for_who  = dword ptr 08h
to_who   = dword ptr 0Ch
goodwill = dword ptr 10h

	push    ebp
	mov     ebp, esp
	push    edx
	push    edi
	;---
	mov     eax, [ebp + goodwill]
	push    eax
	mov     eax, [ebp + for_who]
	push    eax
	movzx   edi, word ptr [ebp + to_who]
	;push eax
	call    RELATION_REGISTRY__ChangeGoodwill
	;---
	pop     edi
	pop     edx
	mov     esp, ebp
	pop     ebp
	retn    0Ch
CScriptGameObject__ChangeGoodwillByID endp


; --------------------- CCar  access function
CScriptGameObject__GetCarFloat proc
pos__ = dword ptr  8
	push    ebp
	mov     ebp, esp

	call    CScriptGameObject__CCar
	mov     ecx, [ebp + pos__]
	fld     dword ptr [eax+ecx]
	
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__GetCarFloat endp

CScriptGameObject__SetCarFloat proc
stub  = dword ptr  8
value = dword ptr  0Ch
pos   = dword ptr  10h

	push    ebp
	mov     ebp, esp
	push    edx

	call    CScriptGameObject__CCar
	mov     ecx, [ebp + pos]
	mov     edx, [ebp + value]
	mov    [eax+ecx], edx

	pop     edx
	mov     esp, ebp
	pop     ebp
	retn    0Ch
CScriptGameObject__SetCarFloat endp


CScriptGameObject__GetCarInt proc
stub  = dword ptr  8
pos   = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	
	call    CScriptGameObject__CCar
	mov     ecx, [ebp + pos]
	mov     eax, [eax + ecx]

	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__GetCarInt endp

CScriptGameObject__SetCarInt proc
pos   = dword ptr  8
value = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	push    edx
	;---
	call    CScriptGameObject__CCar
	mov     ecx, [ebp + pos]
	mov     edx, [ebp + value]
	mov    [eax+ecx], edx
	;---
	pop     edx
	mov     esp, ebp
	pop     ebp
	retn    08h
CScriptGameObject__SetCarInt endp

CScriptGameObject__SetCarInt16 proc
pos   = dword ptr  8
value = dword ptr  0Ch

	push    ebp
	mov     ebp, esp
	push    edx
	;---
	call    CScriptGameObject__CCar
	mov     ecx, [ebp + pos]
	mov     edx, [ebp + value]
	mov    [eax+ecx], dx
	;---
	pop     edx
	mov     esp, ebp
	pop     ebp
	retn    08h
CScriptGameObject__SetCarInt16 endp

CScriptGameObject__GetCarInt16 proc
stub  = dword ptr  8
pos   = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	push    [ebp + pos]
	push    [ebp + pos]
	call    CScriptGameObject__CCar
	mov     ecx, [ebp + pos]
	mov     eax, [eax + ecx]
	and     eax, 0FFFFh
	
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__GetCarInt16 endp

;--------------------- memory access function
CScriptGameObject__GetMemoryFloat proc
pos__ = dword ptr  8
	push    ebp
	mov     ebp, esp

	mov     eax, [ebp + pos__]
	fld     dword ptr [eax]
	
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__GetMemoryFloat endp

CScriptGameObject__SetMemoryFloat proc
stub  = dword ptr  8
value = dword ptr  0Ch
pos   = dword ptr  10h

	push    ebp
	mov     ebp, esp
	push    edx

	mov     ecx, [ebp + pos]
	mov     edx, [ebp + value]
	mov    [ecx], edx

	pop     edx
	mov     esp, ebp
	pop     ebp
	retn    0Ch
CScriptGameObject__SetMemoryFloat endp


CScriptGameObject__GetMemoryInt proc
stub  = dword ptr  8
pos   = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	
	mov     ecx, [ebp + pos]
	mov     eax, [ecx]

	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__GetMemoryInt endp

CScriptGameObject__SetMemoryInt proc
pos   = dword ptr  8
value = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	push    edx
	;---
	mov     ecx, [ebp + pos]
	mov     edx, [ebp + value]
	mov    [ecx], edx
	;---
	pop     edx
	mov     esp, ebp
	pop     ebp
	retn    08h
CScriptGameObject__SetMemoryInt endp

CScriptGameObject__SetMemoryInt16 proc
pos   = dword ptr  8
value = dword ptr  0Ch

	push    ebp
	mov     ebp, esp
	push    edx
	;---
	mov     ecx, [ebp + pos]
	mov     edx, [ebp + value]
	mov    [ecx], dx
	;---
	pop     edx
	mov     esp, ebp
	pop     ebp
	retn    08h
CScriptGameObject__SetMemoryInt16 endp

CScriptGameObject__GetMemoryInt16 proc
stub  = dword ptr  8
pos   = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	mov     ecx, [ebp + pos]
	xor     eax, eax
	mov     ax, word ptr [ecx]
	;and     eax, 0FFFFh
	
	mov     esp, ebp
	pop     ebp
	retn    8
CScriptGameObject__GetMemoryInt16 endp


CScriptGameObject__AttachVehicle proc
veh  = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h

	call    CScriptGameObject__CActor
	; eax = actor
	test    eax, eax
	jz      exit
	;PRINT "is actor"
	push    eax
	
	mov     ecx, [ebp + veh]
	call    CScriptGameObject__CHolder
	test    eax, eax
	jz      exit
	;PRINT "is holder"
	pop     edi
	call    CActor__attach_Vehicle ; vehicle<eax>, int this<edi>
exit:
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__AttachVehicle endp


g_car_panel_visible dd 1

CScriptGameObject__EnableCarPanel proc
is_visible = byte ptr  8
	push    ebp
	mov     ebp, esp
	xor     eax, eax
	mov     al, [ebp+is_visible]
	mov     [g_car_panel_visible], eax
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__EnableCarPanel endp

g_vector_arg_1 Vector3 {0.0, 0.0, 0.0}
g_vector_arg_2 Vector3 {0.0, 0.0, 0.0}
g_vector_arg_3 Vector3 {0.0, 0.0, 0.0}
g_vector_arg_4 Vector3 {0.0, 0.0, 0.0}

CScriptGameObject__SetVectorGlobalArg1 proc
val  = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	
	mov     esi, dword ptr[ebp+val]
	mov     edi, offset g_vector_arg_1
	mov     eax, [esi]
	mov     [edi], eax
	mov     eax, [esi + 4] 
	mov     [edi + 4], eax
	mov     eax, [esi + 8]
	mov     [edi + 8], eax
	
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__SetVectorGlobalArg1 endp

CScriptGameObject__SetVectorGlobalArg2 proc
val  = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	
	mov     esi, dword ptr[ebp+val]
	mov     edi, offset g_vector_arg_2
	mov     eax, [esi]
	mov     [edi], eax
	mov     eax, [esi + 4] 
	mov     [edi + 4], eax
	mov     eax, [esi + 8]
	mov     [edi + 8], eax
	
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__SetVectorGlobalArg2 endp

CScriptGameObject__SetVectorGlobalArg3 proc
val  = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	
	mov     esi, dword ptr[ebp+val]
	mov     edi, offset g_vector_arg_3
	mov     eax, [esi]
	mov     [edi], eax
	mov     eax, [esi + 4] 
	mov     [edi + 4], eax
	mov     eax, [esi + 8]
	mov     [edi + 8], eax
	
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__SetVectorGlobalArg3 endp

CScriptGameObject__SetVectorGlobalArg4 proc
val  = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	
	mov     esi, dword ptr[ebp+val]
	mov     edi, offset g_vector_arg_4
	mov     eax, [esi]
	mov     [edi], eax
	mov     eax, [esi + 4] 
	mov     [edi + 4], eax
	mov     eax, [esi + 8]
	mov     [edi + 8], eax
	
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__SetVectorGlobalArg4 endp

g_object_arg_1 dd ?

CScriptGameObject__SetGOArg1 proc
obj  = dword ptr  8
	push    ebp
	mov     ebp, esp
	
	mov     eax, dword ptr[ebp+val]
	mov     [g_object_arg_1], eax
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__SetGOArg1 endp

CScriptGameObject__GetHudItemState proc
	push esi
	;
	mov     esi, [ecx + 4]
	mov     eax, [esi+0B4h]   ; Parent
	;PRINT_UINT "GetWpnState, parent=%x", eax
	test    eax, eax
	jz      cobject_exit

	movzx   eax, word ptr [eax+0A4h]   ; parent id
	;PRINT_UINT "GetWpnState, parent_id=%d", eax
	test    eax, eax         ; id == actor_id == 0
	jnz     cobject_exit
	; parent == actor
	;mov     ecx, esi
	;mov     eax, [ecx] ; CObject::vftable
	;mov     eax, [eax+0A8h]   ; cast_weapon
	;call    eax            ; CGameObject::cast_weapon()
	;test    eax, eax
	;jz      cobject_exit
	;mov eax, [eax+28Ch]
	;PRINT "is_weapon"
	mov     ecx, esi
	mov     eax, [ecx] ; CObject::vftable
	mov     eax, [eax+074h]   ; cast_inventory_item
	call    eax            ; CGameObject::cast_inventory_item()
	test    eax, eax
	jz      cobject_exit
	;PRINT "is_inventory_item"
	mov     ecx, eax
	mov     eax, [ecx] ; CInventoryItem::vftable
	mov     eax, [eax+124h]   ; cast_hud_item
	call    eax            ; CInventoryItem::cast_hud_item()
	test    eax, eax
	jz      cobject_exit
	;PRINT "is_hud_item"
	; eax = CWeapon
	mov     eax, [eax+4]   ; m_state
cobject_exit:
	;
	pop esi
	retn
CScriptGameObject__GetHudItemState endp
;74h, 124h

CScriptGameObject__SetActorDirectionEx proc
dir_vector  = dword ptr  8

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
	mov     ecx, [eax+530h]
	mov     eax, [eax+ecx*4+524h]
	mov     edx, [eax]
	mov     ecx, eax

;	sub     esp, 0Ch
;	fldz
;	fst     [esp+14h+var_C]
;	fstp    [esp+14h+var_10]
;	fld     [ebp+dir]
;	fstp    [esp+14h+var_14]

	mov     eax, [ebp + dir_vector]
	push    [eax+8]
	push    [eax+4]
	push    [eax+0]

	mov     eax, [edx+1Ch]
	call    eax

	jmp exit
exit_fail:
	PRINT "fail to set actor direction!"
exit:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__SetActorDirectionEx endp

CScriptGameObject__GetVisualName proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h

	mov		eax, [ecx+4]
	mov     eax, [eax+0B0h]
	add		eax, 0Ch
exit:
	mov		esp, ebp
	pop		ebp
	
	retn
CScriptGameObject__GetVisualName endp

CScriptGameObject__SetVisualName proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	push    ebx
	push    ecx
	push    eax
	
	mov		ecx, [ecx+4]
	mov  	ebx, offset g_visual_shared_str
	mov  	eax, [ebp+8]
	call 	set_shared_str

	push	g_visual_shared_str
	call 	CObject__cNameVisual_set
exit:
	pop     eax
	pop     ecx
	pop     ebx
	
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__SetVisualName endp

CScriptGameObject__SetLSFSpeed proc
arg = dword ptr  8
	push    ebp
	mov     ebp, esp
	push    ebx
	push    eax
	
	call CScriptGameObject__get_hanging_lamp ; в eax получаем указатель на CHangingLamp
	
	test	eax, eax
	jnz		object_is_lamp
	PRINT "set_lsf_speed: object is not lamp!"
	jmp		exit

object_is_lamp:	
	mov     ebx, [ebp+arg]
;	PRINT_FLOAT "LSF_SPEED==%f", ebx
	mov		eax, [eax+1D0h]
;	PRINT_UINT "PTR==%d", eax
	mov     [eax + 278h], ebx
	
exit:
	pop     eax
	pop     ebx
	pop     ebp
	retn    4
CScriptGameObject__SetLSFSpeed endp

CScriptGameObject__SetLSFAmount proc
arg = dword ptr  8
	push    ebp
	mov     ebp, esp
	push    ebx
	push    eax
	
	call CScriptGameObject__get_hanging_lamp ; в eax получаем указатель на CHangingLamp
	
	test	eax, eax
	jnz		object_is_lamp
	PRINT "set_lsf_amount: object is not lamp!"
	jmp		exit

object_is_lamp:	
	mov     ebx, [ebp+arg]
;	PRINT_FLOAT "LSF_Amount==%f", ebx
	mov		eax, [eax+1D0h]
	mov     [eax + 27Ch], ebx
	
exit:
	pop     eax
	pop     ebx
	pop     ebp
	retn    4
CScriptGameObject__SetLSFAmount endp

CScriptGameObject__SetLSFSMAPJitter proc
arg = dword ptr  8
	push    ebp
	mov     ebp, esp
	push    ebx
	push    eax
	
	call CScriptGameObject__get_hanging_lamp ; в eax получаем указатель на CHangingLamp
	
	test	eax, eax
	jnz		object_is_lamp
	PRINT "set_lsf_smap_jitter: object is not lamp!"
	jmp		exit

object_is_lamp:	
	mov     ebx, [ebp+arg]
;	PRINT_FLOAT "LSF_SMAP_JITTER==%f", ebx
	mov		eax, [eax+1D0h]
	mov     [eax + 280h], ebx
	
exit:
	pop     eax
	pop     ebx
	pop     ebp
	retn    4
CScriptGameObject__SetLSFSMAPJitter endp

CScriptGameObject__GetLSFSpeed proc
	call CScriptGameObject__get_hanging_lamp
	test	eax, eax
	jnz		object_is_lamp
	PRINT "get_lsf_speed: object is not lamp!"
	fldz
	jmp		exit
	
object_is_lamp:	
	
	mov		eax, [eax+1D0h]
	fld     dword ptr [eax + 278h]
	
exit:
	retn
CScriptGameObject__GetLSFSpeed endp

CScriptGameObject__GetShapeRadius proc
	push	ebp
	mov		ebp, esp
	and		esp, 0FFFFFFF8h
	
	call	CScriptGameObject__CSpaceRestrictor
	test	eax, eax
	jz		short exit
	
	mov		eax, [eax+0A0h]
	fld		dword ptr [eax+30h]
exit:
	mov		esp, ebp
	pop		ebp
	retn
CScriptGameObject__GetShapeRadius endp

CScriptGameObject__GetRadius proc
	mov		ecx, [ecx+4]
	jmp     ds:CObject__Radius
CScriptGameObject__GetRadius endp

; аргумент-индекс передаётся через глобальную переменную (младшие два байта)
CScriptGameObject__GetBoneName proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h

	mov		eax, [ecx+4] ; eax = m_object
	call    CGameObject__kinematic ; eax = CKinematics
	mov     ecx, eax
	mov     eax, [g_int_argument_0]
	;PRINT_UINT "arg=%d", eax
	push    ax
	call    [CKinematics__LL_BoneName_dbg]
	
	;
	;add		eax, 0Ch ; shared string
exit:
	mov		esp, ebp
	pop		ebp
	
	retn
CScriptGameObject__GetBoneName endp

CScriptGameObject__HasVisual proc
	mov		eax, [ecx+4] ; eax = m_object
	call    CGameObject__kinematic ; eax = CKinematics
	test    eax, eax
	jnz     has_vis
	xor     eax, eax
	retn
has_vis:
	mov     eax, 1
	retn
CScriptGameObject__HasVisual endp

; =========================================================================================
; ========================= added by Ray Twitty (aka Shadows) =============================
; =========================================================================================
; ====================================== START ============================================
; =========================================================================================
; восстановление прошлого значения FOV актора
g_last_fov dd 0.0
CScriptGameObject__RestoreCameraFOV proc
	movss   xmm1, ds:flt_1045A260
	movss   xmm2, [g_last_fov]
	comiss  xmm1, xmm2
	ja      short exit_fail

	mov     eax, [g_last_fov]
	push    eax
	call    CScriptGameObject__SetCameraFOV
exit_fail:
	retn
CScriptGameObject__RestoreCameraFOV endp
; =========================================================================================
; ======================================= END =============================================
; =========================================================================================

CScriptGameObject__GetObjectArg1 proc
	mov		eax, g_object_arg_1
	test	eax, eax
	jz		short exit
	
	cmp		dword ptr[eax+4], 0
	jnz		short exit
	xor		eax, eax
exit:
	retn	4
CScriptGameObject__GetObjectArg1 endp