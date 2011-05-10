include game_object_reg_macro.asm
REGISTER_GO__INT register_item_on_belt, "item_on_belt"
REGISTER_GO__INT register_item_in_ruck, "item_on_ruck"

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

REGISTER_INT__STRING_INT register_get_actor_int, "get_actor_int"
REGISTER_INT__STRING_INT register_get_wpn_gl_int, "get_wpn_gl_int"
REGISTER_INT__STRING_INT register_get_wpn_int, "get_wpn_int"
REGISTER_VOID__INT_INT register_set_wpn_int, "set_wpn_int"

REGISTER_INT__STRING_INT register_get_wpn_bone_id, "get_wpn_bone_id"
REGISTER_INT__STRING_INT register_set_wpn_bone_visible, "set_wpn_bone_visible"
REGISTER_INT__STRING_INT register_get_wpn_bone_visible, "get_wpn_bone_visible"

REGISTER_FLOAT__INT register_get_wpn_float, "get_wpn_float"
REGISTER_VOID__VECTOR_FLOAT_INT register_set_wpn_float, "set_wpn_float"

REGISTER_FLOAT__INT register_get_custom_monster_float, "get_custom_monster_float"
REGISTER_INT__STRING_INT register_get_custom_monster_int, "get_custom_monster_int"

REGISTER_INT__STRING_INT register_set_actor_shared_str, "set_actor_shared_str"

game_object_fix proc
; делаем то, что вырезали 
	call    enable_vision_register
; добавляем своё
	; регистрируем функцию разрешения колбеков на нажатия и мышь
	mov     ecx, eax
	mov     byte ptr [esp+58h-38h], bl
	mov     eax, [esp+58h-38h]
	push    eax
	mov     byte ptr [esp+5Ch-40h], bl
	mov     edx, [esp+5Ch-40h]
	push    edx
	push    offset aEnable_Input_Extensions ; "enable_input_extensions"
	lea     eax, [esp+64h-48h]
	mov     ebx, ecx
	mov     [esp+64h-48h], offset enable_input_extensions
	call    enable_vision_register
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
	PERFORM_EXPORT_INT__VOID CScriptGameObject__BeltCount, "belt_count"
	; регистрируем функцию получения количества предметов в рюкзаке
	PERFORM_EXPORT_INT__VOID CScriptGameObject__RuckCount, "ruck_count"
	; регистрируем функцию получения количества слотов
	PERFORM_EXPORT_INT__VOID CScriptGameObject__SlotCount, "slot_number"
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
	; test get_id
	mov     ecx, eax
	mov     byte ptr [esp+58h-38h], bl
	mov     eax, [esp+58h-38h]
	push    eax
	mov     byte ptr [esp+5Ch-40h], bl
	mov     edx, [esp+5Ch-40h]
	push    edx
	push    offset aGet_id ; "get_id"
	lea     eax, [esp+64h-48h]
	mov     ebx, ecx
	mov     [esp+64h-48h], offset CScriptGameObject__GetID
	call    register_general_goodwill
	; регистрируем функцию установки коэффициента спринта для актора
	;mov     ecx, eax
	;mov     byte ptr [esp+58h-38h], bl
	;mov     eax, [esp+58h-38h]
	;push    eax
	;mov     byte ptr [esp+5Ch-40h], bl
	;mov     edx, [esp+5Ch-40h]
	;push    edx
	;push    offset aSet_sprint_factor ; "set_sprint_factor"
	;lea     eax, [esp+64h-48h]
	;mov     ebx, ecx
	;mov     [esp+64h-48h], offset CScriptGameObject__SetSprintFactor
	;call    register__remove_sound
	PERFORM_EXPORT_VOID__FLOAT CScriptGameObject__SetSprintFactor, "set_sprint_factor"

	; регистрируем функцию получения коэффициента спринта для актора
	PERFORM_EXPORT_FLOAT__VOID CScriptGameObject__GetSprintFactor, "get_sprint_factor"
	; регистрируем функцию получения состояния актора
	PERFORM_EXPORT_INT__VOID CScriptGameObject__ActorBodyState, "actor_body_state"

	PERFORM_EXPORT_FLOAT__INT register_get_actor_float, CScriptGameObject__GetActorFloat
	PERFORM_EXPORT_VOID__VECTOR_FLOAT_INT register_set_actor_float, CScriptGameObject__SetActorFloat
	PERFORM_EXPORT_INT__STRING_INT register_get_actor_int, CScriptGameObject__GetActorInt

	PERFORM_EXPORT_INT__STRING_INT register_get_wpn_gl_int, CScriptGameObject__GetWeaponGLInt
	PERFORM_EXPORT_INT__STRING_INT register_get_wpn_int, CScriptGameObject__GetWeaponInt
	PERFORM_EXPORT_VOID__INT_INT register_set_wpn_int, CScriptGameObject__SetWeaponInt
	
	PERFORM_EXPORT_INT__STRING_INT register_get_wpn_bone_id, CScriptGameObject__GetWeaponBoneID
	PERFORM_EXPORT_INT__STRING_INT register_set_wpn_bone_visible, CScriptGameObject__SetWeaponBoneVisible
	PERFORM_EXPORT_INT__STRING_INT register_get_wpn_bone_visible, CScriptGameObject__GetWeaponBoneVisible
	
	PERFORM_EXPORT_FLOAT__INT register_get_wpn_float, CScriptGameObject__GetWeaponFloat
	PERFORM_EXPORT_VOID__VECTOR_FLOAT_INT register_set_wpn_float, CScriptGameObject__SetWeaponFloat
	
	; регистрируем функцию проверки на тип "инвентарный предмет"
	PERFORM_EXPORT_INT__VOID CScriptGameObject__IsInventoryItem, "is_inventory_item"
	; регистрируем функцию проверки на тип "ствол с подствольником"
	PERFORM_EXPORT_INT__VOID CScriptGameObject__IsWeaponGL, "is_weapon_gl"
	; регистрируем функцию проверки на тип "ствол"
	PERFORM_EXPORT_INT__VOID CScriptGameObject__IsWeapon, "is_weapon"
	; регистрируем функцию проверки на тип "actor"
	PERFORM_EXPORT_INT__VOID CScriptGameObject__IsActor, "is_actor"

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
	
	PERFORM_EXPORT_VOID__STRING CScriptGameObject__SetActorVisual, "set_actor_visual"
	
	; идём обратно
	jmp back_from_game_object_fix
game_object_fix endp

aEnable_Input_Extensions db "enable_input_extensions", 0
; aGet_fuel db "get_fuel", 0
; aSet_fuel db "set_fuel", 0
; aGet_fuel_consumption db "get_fuel_consumption", 0
; aSet_fuel_consumption db "set_fuel_consumption", 0
; aGet_fuel_tank db "get_fuel_tank", 0
; aBelt_count db "belt_count", 0
; aRuck_count db "ruck_count", 0
; aSlot_count db "slot_number", 0
; aGet_inventory_weight db "get_inventory_weight", 0
aGet_id db "get_id", 0
aSet_sprint_factor db "set_sprint_factor", 0

ALIGN_8
input_extensions_enabled dd 0

ALIGN_8
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
	; получаем актора
	mov     eax, [ecx+4] ; m_object
	mov     eax, [eax]
	mov     eax, [eax+80h]
	call    eax
	mov     eax, [eax+554h]
	retn
CScriptGameObject__ActorBodyState endp

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

CScriptGameObject__IsInventoryItem proc
	push    esi
	mov     esi, ecx
	push    edi

	mov     edi, [esi+4]
	test    edi, edi
	jz      lab1
	call    CGameObject__lua_game_object
lab1:
	mov     ecx, [esi+4]
	test    ecx, ecx
	jz      exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+74h]
	call    edx
	test    eax, eax
	jz      exit_fail
exit_fail:
	pop     edi
	pop     esi
	retn
CScriptGameObject__IsInventoryItem endp

CScriptGameObject__IsWeaponGL proc
	push    esi

	call CScriptGameObject__IsInventoryItem
	test    eax, eax
	jz      exit_fail
	; это CInventoryItem
	xor     esi, esi
	push    esi             ; 0
	push    offset off_10556CC8 ; a4
	push    offset off_10538CDC ; a3
	push    esi             ; 0
	push    eax             ; inventory_item
	call    __RTDynamicCast
	add     esp, 14h
	test    eax, eax
	jz      exit_fail
	; это CWeaponMagazinedWGrenade
exit_fail:
	pop     esi
	retn
CScriptGameObject__IsWeaponGL endp

CScriptGameObject__GetWeaponGLInt proc
stub  = dword ptr  8
pos   = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push ecx
	
	call    CScriptGameObject__IsWeaponGL
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

CScriptGameObject__IsWeapon proc
	push    esi
	mov     esi, ecx
	push    edi
	mov     edi, [esi+4]
	test    edi, edi
	jz      lab1
	;
	;pusha
	;push    ecx
	;push    offset is_wpn_msg1
	;call    Msg
	;pop     eax
	;pop     eax	
	;popa
	;
	call    CGameObject__lua_game_object
	;
	;pusha
	;push    eax
	;push    offset is_wpn_msg2
	;call    Msg
	;pop     eax
	;pop     eax	
	;popa
	;
lab1:
	mov     ecx, [esi+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+0A8h]
	call    edx
	test    eax, eax
exit_fail:
	pop     edi
	pop     esi
	retn
CScriptGameObject__IsWeapon endp

CScriptGameObject__GetWeaponInt proc
stub  = dword ptr  8
pos   = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push ecx
	
	call    CScriptGameObject__IsWeapon
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
	
	
	call    CScriptGameObject__IsWeapon
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

CScriptGameObject__GetWeaponBoneID proc
bone_name = dword ptr 8
stub      = dword ptr 0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	push    ecx
	push    edx
	push    esi
	
	call    CScriptGameObject__IsWeapon
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
	
	call    CScriptGameObject__IsWeapon
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
	
	call    CScriptGameObject__IsWeapon
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
	
	call    CScriptGameObject__IsWeapon
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

	call    CScriptGameObject__IsWeapon
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


CScriptGameObject__IsCustomMonster proc
	push    esi
	mov     esi, ecx
	push    edi
	mov     edi, [esi+4]
	test    edi, edi
	jz      lab1
	call    CGameObject__lua_game_object
lab1:
	mov     ecx, [esi+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+9Ch]
	call    edx
exit_fail:
	pop     edi
	pop     esi
	retn
CScriptGameObject__IsCustomMonster endp

CScriptGameObject__GetCustomMonsterFloat proc
pos   = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push eax
	push ecx
	
	call    CScriptGameObject__IsCustomMonster
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
	
	call    CScriptGameObject__IsCustomMonster
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

CScriptGameObject__IsActor proc
	push    esi
	mov     esi, ecx
	push    edi
	mov     edi, [esi+4]
	test    edi, edi
	jz      lab1
	call    CGameObject__lua_game_object
lab1:
	mov     ecx, [esi+4]
	test    ecx, ecx
	jz      short exit_fail
	mov     eax, [ecx]
	mov     edx, [eax+80h]
	call    edx
exit_fail:
	pop     edi
	pop     esi
	retn
CScriptGameObject__IsActor endp

CScriptGameObject__GetTestStr proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push ecx
	
	call    CScriptGameObject__IsActor
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

;CScriptGameObject__SetShiftArgument proc
;sarg   = dword ptr  4
;	mov     eax, [esp + sarg]
;	mov     [g_shift_argument], eax
;	retn    4
;CScriptGameObject__SetShiftArgument endp

g_shift_argument dword 0

CScriptGameObject__GetActorSharedStr proc
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push ecx
	
	call    CScriptGameObject__IsActor
	test    eax, eax
	jnz     lab1
	push    offset a_msg_argument0_not_set
	call    Msg
	pop     eax
	jmp     short exit_fail
lab1:
	;---
	mov     ecx, g_shift_argument
	test    ecx, ecx
	jz      exit_fail
	mov     eax, [eax + ecx]
	test    eax, eax
	jz      short exit_fail
	add     eax, 0Ch
	;---
	xor     ecx, ecx
	mov     g_shift_argument, ecx
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


PRINT MACRO msg_txt:REQ
LOCAL lab1_
LOCAL a_msg
	jmp     lab1_
a_msg db msg_txt, 0
lab1_:
	pusha
	push    offset a_msg
	call    Msg
	add     esp, 04h
	popa
ENDM

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

	call    CScriptGameObject__IsActor
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
	
	call    CScriptGameObject__IsActor
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
