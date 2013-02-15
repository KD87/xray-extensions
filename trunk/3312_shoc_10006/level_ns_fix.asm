include level_ns_reg_macros.asm

;REGISTER_LEVEL__GO__INT register_get_ray_pick_dist, "get_ray_pick_dist", GetRayPickQueryRes
;REGISTER_LEVEL__DLG__VOID register_get_inventory_wnd, "get_inventory_wnd", Level__GetInventoryWindow

;===============| расширение регистрации пространства имён level |=============
level_ns_extension_1:
	call    get_snd_volume_register ; делаем то, что вырезали
;------------< регистрируем функцию получения объекта, на который смотрим >------
	;push    eax
	;call    get_target_obj_register
	;pop     ecx
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset GetTargetObject
	push    offset aGet_target_obj ; "get_target_obj"
	push    eax
	call    register__ns__go__void ; регистрируем функцию с прототипом как у   object_by_id
	
	
	
;------------< регистрируем функцию получения расстояния до объекта, на который смотрим >------
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset GetTargetDistance
	push    offset aGet_target_dist ; "get_target_dist"
	push    eax
	call    get_snd_volume_register ; регистрируем функцию с прототипом как у   get_snd_volume
;--------------------------------------

;------------< регистрируем функцию получения активности эффекта камеры по айди >------
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset GetCamEffector
	push    offset aHas_cam_effector ; "has_cam_effector"
	push    eax
	call    register__ns__int__int
;--------------------------------------

;------------< регистрируем функцию получения активности pp эффекта по айди >------
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset GetPpEffector
	push    offset aHas_pp_effector ; "has_pp_effector"
	push    eax
	call    register__ns__int__int
;--------------------------------------

;------------< регистрируем функцию получения активности элементов худа >------
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset HasIndicators
	push    offset aHas_indicators ; "has_indicators"
	push    eax
	call    register__ns__bool__void
;--< установка степени дождливости >---
;PERFORM_EXPORT_LEVEL__VOID__FLOAT               set_rain_factor, "set_rain_factor"
PERFORM_EXPORT_LEVEL__INT__INT                  advance_game_time, "advance_game_time"
PERFORM_EXPORT_LEVEL__FLOAT__VOID               get_float_result00, "get_float_res00"
PERFORM_EXPORT_LEVEL__FLOAT__STR_INT_BOOL_STR   get_memory_float, "get_memory_float"
PERFORM_EXPORT_LEVEL__INT__INT                  get_memory_int, "get_memory_int"
PERFORM_EXPORT_LEVEL__BOOL__VOID                PerformRayPickQuery, "perform_ray_pick_query"
PERFORM_EXPORT_LEVEL__FLOAT__VOID               GetRayPickQueryRes, "get_ray_pick_dist"
PERFORM_EXPORT_LEVEL__GO__INT                   GetRayPickQueryObj, "get_ray_pick_obj"
PERFORM_EXPORT_LEVEL__INT__INT                  GetRayPickQueryElement, "get_ray_pick_element"
PERFORM_EXPORT_LEVEL__DLG__VOID                 Level__GetInventoryWindow, "get_inventory_wnd"
PERFORM_EXPORT_LEVEL__DLG__VOID                 Level__GetPDAWindow,       "get_pda_wnd"
PERFORM_EXPORT_LEVEL__DLG__VOID                 Level__GetTalkWindow,      "get_talk_wnd"
PERFORM_EXPORT_LEVEL__DLG__VOID                 Level__GetCarBodyWindow,   "get_car_body_wnd"


;PRINT "all_registered"
;--------------------------------------
	jmp back_to_level_ns_ext_1
	
aGet_target_dist db "get_target_dist", 0

level_ns_extension_2: ; здесь надо добавлять столько раз   "mov ecx, eax" + "call esi", сколько добавляли функций
; делаем то, что вырезали
	mov     ecx, eax
	call    esi ; luabind::scope::operator,(luabind::scope) ; luabind::scope::operator,(luabind::scope)
	mov     ecx, eax
	call    esi ; luabind::scope::operator,(luabind::scope) ; luabind::scope::operator,(luabind::scope)
; добавляем своё
	; для get_target_obj не требуется ?
	mov     ecx, eax
	call    esi
	; для get_target_dist
	mov     ecx, eax
	call    esi
	; для has_cam_effector
	mov     ecx, eax
	call    esi
	; для has_pp_effector
	mov     ecx, eax
	call    esi
	; для has_indicators
	mov     ecx, eax
	call    esi
	; для set_rain_factor
	;mov     ecx, eax
	;call    esi
	; для advance_game_time
	mov     ecx, eax
	call    esi
	; для get_float_result00
	mov     ecx, eax
	call    esi
	; для get_memory_float
	mov     ecx, eax
	call    esi
	; для get_memory_int
	mov     ecx, eax
	call    esi
	; для perform_ray_pick_query
	mov     ecx, eax
	call    esi
	; для get_ray_pick_query_res
	mov     ecx, eax
	call    esi
	; get_ray_pick_obj
	mov     ecx, eax
	call    esi
	; get_ray_pick_element
	mov     ecx, eax
	call    esi
	; get_inventory_wnd
	mov     ecx, eax
	call    esi
	; get_pda_wnd
	mov     ecx, eax
	call    esi
	; get_talk_wnd
	mov     ecx, eax
	call    esi
	; get_car_body_wnd
	mov     ecx, eax
	call    esi
; идём обратно
	jmp back_to_level_ns_ext_2

CCustomHUD__GetRQ proc
	mov     eax, [ecx+34h]
	add     eax, 0Ch
	retn
CCustomHUD__GetRQ endp	

GetTargetDistance proc
	mov     eax, [g_hud] ; CCustomHUD * g_hud
	mov     ecx, [eax]
	call    CCustomHUD__GetRQ ; eax = RQ
	fld     dword ptr [eax+4] ; return EQ.range
	retn
GetTargetDistance endp

smart_cast_CGameObject proc
arg_0           = dword ptr  4
	mov     eax, [esp+arg_0]
	retn
smart_cast_CGameObject endp

GetTargetObject proc
	mov     eax, [g_hud] ; CCustomHUD * g_hud
	mov     ecx, [eax]
	call    CCustomHUD__GetRQ ; eax = RQ
	push    dword ptr [eax] ; RQ.O
	call    smart_cast_CGameObject ; eax = smart_cast<CGameObject*>
	pop     ecx
	test    eax, eax ; если ничего не нашли
	jnz     return_value
	xor     eax, eax ; то возвращаем nil
	retn
return_value:
	push    edi
	mov     edi, eax
	call    CGameObject__lua_game_object
	pop     edi
	retn
GetTargetObject endp

GetCamEffector proc
id 		= dword ptr  4

	mov     edx, [esp+id]
	and     edx, 0FFFFh
	mov     ecx, g_Actor
	mov     ecx, [ecx+554h]
	push    edx
	call    ds:CCameraManager__GetCamEffector
	test    eax, eax
	jnz	short exit
	xor	al, al
	retn
exit:
	mov	al, 1
	retn
GetCamEffector endp

GetPpEffector proc
id 		= dword ptr  4

	mov     ecx, g_Actor
	mov     edx, [esp+id]
	mov     ecx, [ecx+554h]
	push    edx
	call    ds:CCameraManager__GetPPEffector
	test    eax, eax
	jnz	short exit
	xor	al, al
	retn
exit:
	mov	al, 1
	retn
GetPpEffector endp

HasIndicators proc
	mov     ecx, ds:g_pGameLevel
	mov     edx, [ecx]
	mov     ecx, [edx+148h]
	mov     eax, [ecx]
	mov     edx, [eax+18h]
	call    edx
	cmp	byte ptr [eax+30h], 0
	setnz   al
	retn
HasIndicators endp

get_target_obj_register proc
var_8           = dword ptr -8
var_4           = byte ptr -4
arg_0           = dword ptr  8
	push    ebp
	mov     ebp, esp
	push    ecx
	push    ecx
	mov     ecx, ds:Memory
	push    esi
	push    14h
	call    ds:xrMemory__mem_alloc ; xrMemory::mem_alloc(uint)
	mov     esi, eax
	test    esi, esi
	jz      loc_101AF65F
	mov     ecx, esi
	call    ds:??0registration@detail@luabind@@QAE@XZ ; luabind::detail::registration::registration(void)
	mov     dword ptr [esi], offset off_10481E80
	mov     dword ptr [esi+8], offset aGet_target_obj ; "get_target_obj"
	mov     dword ptr [esi+0Ch], offset GetTargetObject
	jmp     loc_101AF661
get_target_obj_register endp

aGet_target_obj  db "get_target_obj", 0
aHas_cam_effector  db "has_cam_effector", 0
aHas_pp_effector  db "has_pp_effector", 0
aHas_indicators  db "has_indicators", 0

register__ns__go__void proc near
var_8           = dword ptr -8
var_4           = byte ptr -4
arg_0           = dword ptr  8
arg_4           = dword ptr  0Ch
arg_8           = dword ptr  10h
	
	push    ebp
	mov     ebp, esp
	push    ecx
	push    ecx
	mov     ecx, ds:Memory
	push    esi
	push    14h
	call    ds:xrMemory__mem_alloc ; xrMemory::mem_alloc(uint)
	mov     esi, eax
	test    esi, esi
	jz      short lab1
	mov     ecx, esi
	call    ds:??0registration@detail@luabind@@QAE@XZ ; luabind::detail::registration::registration(void)
	mov     eax, [ebp+arg_4]
	mov     [esi+8], eax
	mov     eax, [ebp+arg_8]
	mov     dword ptr [esi], offset off_10481E80
	mov     [esi+0Ch], eax
	jmp     short lab2
lab1:
	xor     esi, esi
lab2:
	and     [ebp+var_8], 0
	push    ecx
	mov     eax, esp
	lea     ecx, [ebp+var_4]
	mov     [eax], esi
	call    ds:??0scope@luabind@@QAE@V?$auto_ptr@Uregistration@detail@luabind@@@std@@@Z ; luabind::scope::scope(std::auto_ptr<luabind::detail::registration>)
	mov     ecx, [ebp+arg_0]
	push    eax
	call    ds:??0scope@luabind@@QAE@ABU01@@Z ; luabind::scope::scope(scope::scope const &)
	lea     ecx, [ebp+var_4]
	call    ds:??1scope@luabind@@QAE@XZ ; luabind::scope::~scope(void)
	mov     ecx, [ebp+var_8]
	test    ecx, ecx
	jz      short lab3
	mov     eax, [ecx]
	push    1
	call    dword ptr [eax]
	
lab3:
	mov     eax, [ebp+arg_0]
	pop     esi
	leave
	retn
register__ns__go__void endp
	
set_rain_factor proc near
rain_factor = dword ptr  8
	push    ebp
	mov     ebp, esp
	push    edx
	mov     eax, ds:g_pGamePersistent
	mov     eax, [eax]
	mov     eax, [eax+46Ch]
	mov     edx, [ebp+rain_factor]
	mov     dword ptr [eax+1CCh], edx
	;PRINT
	pop     edx
	mov     esp, ebp
	pop     ebp
	retn
set_rain_factor endp

advance_game_time proc
additional_time = dword ptr 8
	push    ebp
	mov     ebp, esp
	mov     eax, ds:g_pGameLevel
	mov     eax, [eax]
	mov     eax, [eax+45F4h]
	mov     ecx, [eax+108D4h]
	mov     eax, [ebp + additional_time]
	push    ecx
	push    eax
	call    game_sv_Single__AdvanceGameTime
	
	pop     ecx
	call    game_GameState__UpdateTime
	mov     esp, ebp
	pop     ebp
	retn
advance_game_time endp

game_sv_Single__AdvanceGameTime proc near
additional_time = dword ptr 8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	cmp     g_ai_space, 0
	push    esi
	push    edi
	
	mov     esi, ecx
	jnz     ai_space_exists
	call    xr_new_CAI_Space_
	mov     ecx, eax
	mov     g_ai_space, eax
	call    CAI_Space__init
ai_space_exists:
	mov     eax, g_ai_space
	mov     eax, [eax+18h]
	test    eax, eax
	jz      exit
	mov     ecx, [eax+0Ch]
	mov     edx, [ecx+4]
	cmp     byte ptr [edx+eax+40h], 0
	jz      exit
	mov     esi, [esi+120h]
	mov     eax, [esi+0Ch]
	mov     ecx, [eax+4]
	mov     edi, [ecx+esi+18h]
	call    CALifeTimeManager__game_time
	PRINT "CALifeTimeManager__game_time"
	PRINT_UINT "eax=%x", eax
	PRINT_UINT "edx=%x", edx
	add     eax, [ebp + additional_time]
	jnc     no_carry
	inc     edx
no_carry:
	mov     [edi+8], eax
	mov     [edi+0Ch], edx
	mov     edx, ds:Device
	mov     eax, [edx+204h]
	mov     [edi+18h], eax
	
	pop     edi
exit:
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    4
game_sv_Single__AdvanceGameTime endp


game_GameState__UpdateTime proc near
	push    esi
	mov     eax, ds:g_pGameLevel
	mov     eax, [eax]
	mov     esi, [eax+45D0h] ; esi = game
	;dbg
	mov     eax, [esi+70h]
	mov     edx, [esi+74h]
	;PRINT_UINT "eax1=%x", eax
	;PRINT_UINT "edx1=%x", edx
	;dbg
	call    __game_time
	;PRINT_UINT "eax=%x", eax
	;PRINT_UINT "edx=%x", edx
	mov     [esi+70h], eax
	mov     [esi+74h], edx
	;PRINT "1"
	mov     eax, ds:g_pGameLevel
	;PRINT "2"
	mov     eax, [eax]
	;PRINT "3"
	lea     ecx, [eax+160h]
	;PRINT "4"
	call    ds:IPureClient__timeServer_Async
	;PRINT "tsasync"
	mov     [esi+68h], eax
	mov     dword ptr [esi+6Ch], 0
	
	pop     esi
	retn
game_GameState__UpdateTime endp

g_float_res00 dd 0.0

get_float_result00 proc
	fld     dword ptr [g_float_res00]
	retn
get_float_result00 endp

get_memory_float proc
;var_4           = byte ptr -4
arg0 = dword ptr 8
arg1 = dword ptr 0Ch
arg2 = byte ptr 0Fh
arg3 = dword ptr 14h
	push    ebp
	mov     ebp, esp
	;and     esp, 0FFFFFFF8h
	
	;mov eax, [ebp+arg0]
	;PRINT_UINT "arg0=%s", eax
	mov eax, [ebp+arg1]
	;PRINT_UINT "flt_addr=%x", eax
	fld dword ptr [eax]
	mov  eax, dword ptr [eax]
	;PRINT_FLOAT "flt_val=%f", eax
	;PRINT_UINT "arg1=%d", eax
	;xor eax, eax
	;movzx eax, [ebp+arg2]
	;PRINT_UINT "arg2=%d", eax
	;mov eax, [ebp+arg3]
	;PRINT_UINT "arg3=%s", eax
	;fldz

	mov     esp, ebp
	pop     ebp
	retn    
get_memory_float endp

get_memory_int proc
addr_ = dword ptr  4
	mov     eax, [esp+addr_]
	;PRINT_UINT "int_addr=%x", eax
	mov     eax, [eax]
	;PRINT_UINT "int_val=%x", eax
	retn
get_memory_int endp

rq_res collide__rq_result {0, 123.0, 0}
;g_vector_arg_1 -- db.actor:set_vector_global_arg_1(v)
;g_int_argument_1     -- set_int_arg0(n)
;g_float_arg1   -- set_float_args_12(a,b)
;g_object_arg_1 -- db.actor:set_object_arg_1(obj)


PerformRayPickQuery proc
	mov eax, offset g_vector_arg_1
	;PRINT_VECTOR arg1, eax
	mov eax, offset g_vector_arg_2
	;PRINT_VECTOR arg1, eax
	push    dword ptr [g_object_arg_1] ; CObject *O
	push    offset rq_res ;  collide::rq_result &
	
	push    dword ptr [g_int_argument_1] ; collide::rq_target
	push    dword ptr [g_float_arg1] ; float range
	push    offset g_vector_arg_1 ;dir
	push    offset g_vector_arg_2 ;start
	mov     eax, ds:g_pGameLevel
	mov     ecx, [eax]
	add     ecx, 0CCh
	call    ds:CObjectSpace__RayPick ;(_vector3<float> const &,_vector3<float> const &,float,collide::rq_target,collide::rq_result &,CObject *) ; правые идут первыми
	retn
PerformRayPickQuery endp

GetRayPickQueryRes proc
	fld rq_res.range
	retn
GetRayPickQueryRes endp

GetRayPickQueryObj proc
	push    edi
	
	mov     eax, [rq_res.O]
	;PRINT_UINT "eax = %d", eax
	test    eax, eax
	jz      exit
	mov     edi, eax
	call    CGameObject__lua_game_object
exit:

	pop     edi
	retn
GetRayPickQueryObj endp

GetRayPickQueryElement proc
	mov     eax, [rq_res.element]
	retn
GetRayPickQueryElement endp

Level__GetInventoryWindow proc
	call    GetGameSP
	test    eax, eax
	jz      exit
	mov     eax, [eax + 60]
	;push    1
	;push    eax
	;call    game_cl_GameState__StartStopMenu
exit:
	;xor eax, eax
	retn
Level__GetInventoryWindow endp

Level__GetPDAWindow proc
	call    GetGameSP
	test    eax, eax
	jz      exit
	mov     eax, [eax + 64]
exit:
	retn
Level__GetPDAWindow endp

Level__GetTalkWindow proc
	call    GetGameSP
	test    eax, eax
	jz      exit
	mov     eax, [eax + 68]
exit:
	retn
Level__GetTalkWindow endp

Level__GetCarBodyWindow proc
	call    GetGameSP
	test    eax, eax
	jz      exit
	mov     eax, [eax + 72]
exit:
	retn
Level__GetCarBodyWindow endp
