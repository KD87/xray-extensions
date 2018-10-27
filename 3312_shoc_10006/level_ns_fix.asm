include level_ns_reg_macros.asm

;REGISTER_LEVEL__GO__INT register_get_ray_pick_dist, "get_ray_pick_dist", GetRayPickQueryRes
;REGISTER_LEVEL__DLG__VOID register_get_inventory_wnd, "get_inventory_wnd", Level__GetInventoryWindow

;===============| ���������� ����������� ������������ ��� level |=============
level_ns_extension_1:
	call    get_snd_volume_register ; ������ ��, ��� ��������
;------------< ������������ ������� ��������� �������, �� ������� ������� >------
	;push    eax
	;call    get_target_obj_register
	;pop     ecx
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset GetTargetObject
	push    offset aGet_target_obj ; "get_target_obj"
	push    eax
	call    register__ns__go__void ; ������������ ������� � ���������� ��� �   object_by_id
	
	
	
;------------< ������������ ������� ��������� ���������� �� �������, �� ������� ������� >------
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset GetTargetDistance
	push    offset aGet_target_dist ; "get_target_dist"
	push    eax
	call    get_snd_volume_register ; ������������ ������� � ���������� ��� �   get_snd_volume
;--------------------------------------

;------------< ������������ ������� ��������� ���������� ������� ������ �� ���� >------
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset GetCamEffector
	push    offset aHas_cam_effector ; "has_cam_effector"
	push    eax
	call    register__ns__int__int
;--------------------------------------

;------------< ������������ ������� ��������� ���������� pp ������� �� ���� >------
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset GetPpEffector
	push    offset aHas_pp_effector ; "has_pp_effector"
	push    eax
	call    register__ns__int__int
;--------------------------------------

;------------< ������������ ������� ��������� ���������� ��������� ���� >------
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset HasIndicators
	push    offset aHas_indicators ; "has_indicators"
	push    eax
	call    register__ns__bool__void
;--< ��������� ������� ����������� >---
;PERFORM_EXPORT_LEVEL__VOID__FLOAT               set_rain_factor, "set_rain_factor"
PERFORM_EXPORT_LEVEL__INT__INT                  advance_game_time, "advance_game_time"
;PERFORM_EXPORT_LEVEL__FLOAT__VOID               get_float_result00, "get_float_res00"
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
PERFORM_EXPORT_LEVEL__DLG__VOID                 Level__GetTradeWindow,     "get_trade_wnd"
PERFORM_EXPORT_LEVEL__GO__INT                   Level__GetSecondTalker,    "get_second_talker"

PERFORM_EXPORT_LEVEL__INT__INT                  Level__VertexId, "vertex_id"

; =========================================================================================
; ========================= added by Ray Twitty (aka Shadows) =============================
; =========================================================================================
; ====================================== START ============================================
; =========================================================================================
; �������� �����
PERFORM_EXPORT_LEVEL__INT__INT                  SendEventMouseWheel, "send_event_mouse_wheel"
PERFORM_EXPORT_LEVEL__INT__INT                  SendEventKeyHold, "send_event_key_hold"
PERFORM_EXPORT_LEVEL__INT__INT                  SendEventKeyRelease, "send_event_key_release"
PERFORM_EXPORT_LEVEL__INT__INT                  SendEventKeyPressed, "send_event_key_press"
; ������ � ����������� ������ ������������
PERFORM_EXPORT_LEVEL__VOID__FLOAT               CE_Set_Time, "set_ce_time"
PERFORM_EXPORT_LEVEL__VOID__FLOAT               CE_Set_Amplitude, "set_ce_amplitude"
PERFORM_EXPORT_LEVEL__VOID__FLOAT               CE_Set_PeriodNumber, "set_ce_period_number"
PERFORM_EXPORT_LEVEL__VOID__FLOAT               CE_Set_Power, "set_ce_power"
PERFORM_EXPORT_LEVEL__BOOL__VOID                CE_Add, "add_ce"
; ���������� ����� �������� �� ������� �������
PERFORM_EXPORT_LEVEL__INT__INT                  GetTargetElement, "get_target_element"
; =========================================================================================
; ======================================= END =============================================
; ===========================================================================
;------------< ������������ ������� ��������� ������ ������������ ������������ �� ������� >------
PERFORM_EXPORT_LEVEL__VECTOR__INT               Level__GetTriangleVertex1, "get_tri_vertex1"
PERFORM_EXPORT_LEVEL__VECTOR__INT               Level__GetTriangleVertex2, "get_tri_vertex2"
PERFORM_EXPORT_LEVEL__VECTOR__INT               Level__GetTriangleVertex3, "get_tri_vertex3"
;------------< ������������ ������� ��������� �������� ������������ ������������ �� �������: �����������������>------
PERFORM_EXPORT_LEVEL__FLOAT__STR_INT_BOOL_STR	Level__GetMtlShootFactor, "get_tri_shootfactor"
;------------< ������������ ������� ��������� �������� ������������ ������������ �� �������: �����>------
PERFORM_EXPORT_LEVEL__INT__INT					Level__GetMtlFlags, 	"get_tri_flags"

;PRINT "all_registered"
;--------------------------------------
	jmp back_to_level_ns_ext_1
	
aGet_target_dist db "get_target_dist", 0

level_ns_extension_2: ; ����� ���� ��������� ������� ���   "mov ecx, eax" + "call esi", ������� ��������� �������
; ������ ��, ��� ��������
	mov     ecx, eax
	call    esi ; luabind::scope::operator,(luabind::scope) ; luabind::scope::operator,(luabind::scope)
	mov     ecx, eax
	call    esi ; luabind::scope::operator,(luabind::scope) ; luabind::scope::operator,(luabind::scope)
; ��������� ���
	; ��� get_target_obj �� ��������� ?
	mov     ecx, eax
	call    esi
	; ��� get_target_dist
	mov     ecx, eax
	call    esi
	; ��� has_cam_effector
	mov     ecx, eax
	call    esi
	; ��� has_pp_effector
	mov     ecx, eax
	call    esi
	; ��� has_indicators
	mov     ecx, eax
	call    esi
	; ��� set_rain_factor
	;mov     ecx, eax
	;call    esi
	; ��� advance_game_time
	mov     ecx, eax
	call    esi
	; ��� get_float_result00
	;mov     ecx, eax
	;call    esi
	; ��� get_memory_float
	mov     ecx, eax
	call    esi
	; ��� get_memory_int
	mov     ecx, eax
	call    esi
	; ��� perform_ray_pick_query
	mov     ecx, eax
	call    esi
	; ��� get_ray_pick_query_res
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
	; get_trade_wnd
	mov     ecx, eax
	call    esi
	; get_second_talker
	mov     ecx, eax
	call    esi
	; ��� vertex_ix
	mov     ecx, eax
	call    esi	
	; �������� �����
	mov     ecx, eax
	call    esi
	mov     ecx, eax
	call    esi
	mov     ecx, eax
	call    esi
	mov     ecx, eax
	call    esi
	; ������ � ����������� ������ ������������
	mov     ecx, eax
	call    esi
	mov     ecx, eax
	call    esi
	mov     ecx, eax
	call    esi
	mov     ecx, eax
	call    esi
	mov     ecx, eax
	call    esi
	; ��� get_target_element
	mov     ecx, eax
	call    esi
	; ��� get_tri_vertex1/2/3
	mov     ecx, eax
	call    esi	
	mov     ecx, eax
	call    esi	
	mov     ecx, eax
	call    esi	
	; get_tri_shootfactor
	mov     ecx, eax
	call    esi
	; get_tri_flags
	mov     ecx, eax
	call    esi
; ��� �������
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
	test    eax, eax ; ���� ������ �� �����
	jnz     return_value
	xor     eax, eax ; �� ���������� nil
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

	; ��������� ������
	mov     ecx, ds:g_pGamePersistent
	mov     edx, [ecx]
	mov     ecx, [edx+46Ch]
	call    ds:CEnvironment__Invalidate

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
	;PRINT "CALifeTimeManager__game_time"
	;PRINT_UINT "eax=%x", eax
	;PRINT_UINT "edx=%x", edx
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

;g_float_res00 dd 0.0

;get_float_result00 proc
;	fld     dword ptr [g_float_res00]
;	retn
;get_float_result00 endp

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
	;mov eax, offset g_vector_arg_1
	;PRINT_VECTOR arg1, eax
	;mov eax, offset g_vector_arg_2
	;PRINT_VECTOR arg1, eax
	mov     eax, dword ptr [g_object_arg_1] ; CScriptGameObject*
	test		eax, eax
	jz      no_ingore_object  ; check if ignore object is not defined
	mov     eax, dword ptr [eax + 4] ; CObject *O
no_ingore_object:
	push    eax
	push    offset rq_res ;  collide::rq_result &
	push    dword ptr [g_int_argument_1] ; collide::rq_target
	push    dword ptr [g_float_arg1] ; float range
	push    offset g_vector_arg_1 ;dir
	push    offset g_vector_arg_2 ;start
	mov     eax, ds:g_pGameLevel
	mov     ecx, [eax]
	add     ecx, 0CCh
	call    ds:CObjectSpace__RayPick ;(_vector3<float> const &,_vector3<float> const &,float,collide::rq_target,collide::rq_result &,CObject *) ; ������ ���� �������
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

Level__GetTradeWindow proc
	call    Level__GetTalkWindow
	test    eax, eax
	jz      exit
	mov     eax, [eax + 104]
exit:
	retn
Level__GetTradeWindow endp

Level__GetSecondTalker proc
	push    edi
	push    ecx
	call    Level__GetTalkWindow
	test    eax, eax
	jz      exit
	mov     ecx, [eax + 120]
	xor     eax, eax
	test    ecx, ecx
	jz      exit
	call    cast_CInventoryOwner_to_CGameObject
	mov     edi, eax
	call    CGameObject__lua_game_object
exit:
	pop    ecx
	pop    edi
	retn
Level__GetSecondTalker endp

cast_CInventoryOwner_to_CGameObject proc ; ecx = inventory owner
	push    ecx
	
	mov     eax, [ecx]
	mov     eax, [eax]
	call    eax
	
	pop     ecx
	retn
cast_CInventoryOwner_to_CGameObject endp

Level__VertexId proc
	mov     eax, g_ai_space
	mov     eax, [eax+0Ch]	
	push    offset g_vector_arg_1

	call 	CLevelGraph__vertex_id
	
	retn
Level__VertexId endp

; =========================================================================================
; ========================= added by Ray Twitty (aka Shadows) =============================
; =========================================================================================
; ====================================== START ============================================
; =========================================================================================
; �������� ������� ������ � ������
SendEventMouseWheel proc
direction       = dword ptr  4
	mov     eax, ds:g_pGameLevel
	mov     eax, [eax]
	mov     edx, [eax+10h]
	mov     edx, [edx+14h]
	lea     ecx, [eax+10h]
	mov     eax, [esp+direction]
	push    eax
	call    edx
	retn
SendEventMouseWheel endp

SendEventKeyHold proc
id       = dword ptr  4
	mov     eax, ds:g_pGameLevel
	mov     eax, [eax]
	mov     edx, [eax+10h]
	mov     edx, [edx+28h]
	lea     ecx, [eax+10h]
	mov     eax, [esp+id]
	push    eax
	call    edx
	retn
SendEventKeyHold endp

SendEventKeyRelease proc
id       = dword ptr  4
	mov     eax, ds:g_pGameLevel
	mov     eax, [eax]
	mov     edx, [eax+10h]
	mov     edx, [edx+24h]
	lea     ecx, [eax+10h]
	mov     eax, [esp+id]
	push    eax
	call    edx
	retn
SendEventKeyRelease endp

SendEventKeyPressed proc
id       = dword ptr  4
	mov     eax, ds:g_pGameLevel
	mov     eax, [eax]
	mov     edx, [eax+10h]
	mov     edx, [edx+20h]
	lea     ecx, [eax+10h]
	mov     eax, [esp+id]
	push    eax
	call    edx
	retn
SendEventKeyPressed endp

; ������ � ����������� ������ ������������
global_ce_time dd 0.0
global_ce_amplitude dd 0.0
global_ce_period_number dd 0.0
global_ce_power dd 0.0

CE_Set_Time proc near
time = dword ptr  8
	push    ebp
	mov     ebp, esp
	mov     eax, [ebp+time]
	mov     [global_ce_time], eax
	mov     esp, ebp
	pop     ebp
	retn
CE_Set_Time endp

CE_Set_Amplitude proc near
amp = dword ptr  8
	push    ebp
	mov     ebp, esp
	mov     eax, [ebp+amp]
	mov     [global_ce_amplitude], eax
	mov     esp, ebp
	pop     ebp
	retn
CE_Set_Amplitude endp

CE_Set_PeriodNumber proc near
periods = dword ptr  8
	push    ebp
	mov     ebp, esp
	mov     eax, [ebp+periods]
	mov     [global_ce_period_number], eax
	mov     esp, ebp
	pop     ebp
	retn
CE_Set_PeriodNumber endp

CE_Set_Power proc near
power = dword ptr  8
	push    ebp
	mov     ebp, esp
	mov     eax, [ebp+power]
	mov     [global_ce_power], eax
	mov     esp, ebp
	pop     ebp
	retn
CE_Set_Power endp

CE_Add proc
	push    offset global_ce_power
	push    offset global_ce_period_number
	push    offset global_ce_amplitude
	push    offset global_ce_time
	call    xr_new__CMonsterEffectorHit
	add     esp, 10h

	mov     ecx, g_Actor
	mov     ecx, [ecx+554h]
	push    eax
	call    ds:CCameraManager__AddCamEffector
	retn
CE_Add endp

; ���������� ����� �������� �� ������� �������
GetTargetElement proc
	mov     eax, [g_hud] ; CCustomHUD * g_hud
	mov     ecx, [eax]
	call    CCustomHUD__GetRQ ; eax = RQ
	mov     eax, [eax+8] ; return EQ.element
	retn
GetTargetElement endp
; =========================================================================================
; ======================================= END =============================================
; =========================================================================================

Level__GetTriangleVertex1 proc
res   = dword ptr  8
index = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	push    ecx
	push    edx
	push edi
	push esi
	
	mov     eax, [ebp + index] ; results.element
	;PRINT_UINT "index = %d", eax
	cmp		eax, -1				; �������� �� -1
	jz		exit
	mov     ecx, ds:g_pGameLevel
	mov     ecx, [ecx]      ; ecx = game_level address
	mov     esi, [ecx+0DCh] ; tri array
	mov     edi, [ecx+0E4h] ; vertexes array
	shl     eax, 4          ; eax = results.element * 8
	;movzx   edx, word ptr [eax+ecx+0Ch] ; edx = *(game_level + 0dch) + results.element*8 + 12
	lea     ecx, [eax+esi] ; eax = *(game_level + 0dch) + results.element*8 == pTri
	mov     eax, [ecx]     ; index of first vertex
	; ������� eax �� 12
	lea     eax, [eax + eax*2] ; eax = ind * 3
	lea     ecx, [edi + eax*4] ; ecx = edi + ind * 12
	;

	;lea     ecx, [edi + eax] ; pointer to the position of the vertex

	mov     eax, [ebp+res]
	
	mov     edx, [ecx]
	;PRINT_UINT "tri1 = %d", edx
	mov     [eax], edx
	mov     edx, [ecx+4]
	;PRINT_UINT "tri2 = %d", edx
	mov     [eax+4], edx
	mov     edx, [ecx+8]
	;PRINT_UINT "tri3 = %d", edx
	mov     [eax+8], edx
	jmp		return
exit:
	mov     eax, [ebp+res]
	xor		edx, edx
	mov     [eax], edx
	mov     [eax+4], edx
	mov     [eax+8], edx
return:
	pop esi
	pop edi
	pop     edx
	pop     ecx
	mov     esp, ebp
	pop     ebp
	retn    
Level__GetTriangleVertex1 endp

Level__GetTriangleVertex2 proc
res   = dword ptr  8
index = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	push    ecx
	push    edx
	push edi
	push esi
	
	mov     eax, [ebp + index] ; results.element
	cmp		eax, -1
	jz		exit
	mov     ecx, ds:g_pGameLevel
	mov     ecx, [ecx]      ; ecx = game_level address
	mov     esi, [ecx+0DCh] ; tri array
	mov     edi, [ecx+0E4h] ; vertexes array
	shl     eax, 4          ; eax = results.element * 8
	lea     ecx, [eax+esi] ; eax = *(game_level + 0dch) + results.element*8 == pTri
	mov     eax, [ecx + 4]     ; index of second vertex
	; ������� eax �� 12
	lea     eax, [eax + eax*2] ; eax = ind * 3
	lea     ecx, [edi + eax*4] ; ecx = edi + ind * 12
	;
	mov     eax, [ebp+res]
	mov     edx, [ecx]
	mov     [eax], edx
	mov     edx, [ecx+4]
	mov     [eax+4], edx
	mov     edx, [ecx+8]
	mov     [eax+8], edx
	jmp		return
exit:
	mov     eax, [ebp+res]
	xor		edx, edx
	mov     [eax], edx
	mov     [eax+4], edx
	mov     [eax+8], edx
return:
	pop esi
	pop edi
	pop     edx
	pop     ecx
	mov     esp, ebp
	pop     ebp
	retn    
Level__GetTriangleVertex2 endp

Level__GetTriangleVertex3 proc
res   = dword ptr  8
index = dword ptr  0Ch
	push    ebp
	mov     ebp, esp
	push    ecx
	push    edx
	push edi
	push esi
	
	mov     eax, [ebp + index] ; results.element
	cmp		eax, -1
	jz		exit
	mov     ecx, ds:g_pGameLevel
	mov     ecx, [ecx]      ; ecx = game_level address
	mov     esi, [ecx+0DCh] ; tri array
	mov     edi, [ecx+0E4h] ; vertexes array
	shl     eax, 4          ; eax = results.element * 8
	lea     ecx, [eax+esi] ; eax = *(game_level + 0dch) + results.element*8 == pTri
	mov     eax, [ecx + 8]     ; index of second vertex
	; ������� eax �� 12
	lea     eax, [eax + eax*2] ; eax = ind * 3
	lea     ecx, [edi + eax*4] ; ecx = edi + ind * 12
	;
	mov     eax, [ebp+res]
	mov     edx, [ecx]
	mov     [eax], edx
	mov     edx, [ecx+4]
	mov     [eax+4], edx
	mov     edx, [ecx+8]
	mov     [eax+8], edx
	jmp		return
exit:
	mov     eax, [ebp+res]
	xor		edx, edx
	mov     [eax], edx
	mov     [eax+4], edx
	mov     [eax+8], edx
return:
	pop esi
	pop edi
	pop     edx
	pop     ecx
	mov     esp, ebp
	pop     ebp
	retn    
Level__GetTriangleVertex3 endp

; --------=====�������=====---------
Level__GetMtlShootFactor proc		
arg0 = dword ptr 8		; string
arg1 = dword ptr 0Ch	; integer
arg2 = byte  ptr 10h	; boolean (byte)
arg3 = dword ptr 14h	; string
	push    ebp
	mov     ebp, esp
	push    ecx
	push    edx
	push 	esi
	;----------------------
	;mov     eax, [ebp + arg0] 	; 
	;PRINT_UINT "arg0 = %s", eax
	;movzx	eax, [ebp + arg2] 	; 
	;PRINT_UINT "arg2 = %d", eax
	;mov     eax, [ebp + arg3] 	; 
	;PRINT_UINT "arg3 = %s", eax
	;----------------------
	mov     eax, [ebp + arg1]	; results.element
	;PRINT_UINT "element = %d", eax
	cmp		eax, -1
	jz		exit
	mov     ecx, ds:g_pGameLevel
	mov     ecx, [ecx]
	mov     esi, [ecx+0DCh] 	; tri array
	shl     eax, 4				; eax = results.element * 8
	mov     cx,  [eax+esi+0Ch]
	and     cx,	 3FFFh
	movzx   edx, cx				; hit_material_idx
	mov     eax, ds:dword_10560718
	mov     ecx, [eax+edx*4]	; ecx = mtl
	fld 	dword ptr [ecx+28h]	; � ���� ������������
	;mov	ecx, [ecx+28h]		; ecx = mtl->fShootFactor
	;PRINT_FLOAT "MtlShootFactor=%f", ecx
	jmp		return
exit:
	fldz						; � ���� ������. ����
return:
	;----------------------
	pop 	esi
	pop     edx
	pop     ecx
	mov     esp, ebp
	pop     ebp
	retn    
Level__GetMtlShootFactor  endp
; --------===============---------

; --------=====�������=====---------
Level__GetMtlFlags proc		
index = dword ptr  8
	push    ebp
	mov     ebp, esp
	push    ecx
	push    edx
	push 	esi
	;----------------------
	mov     eax, [ebp + index] 	;[g_int_argument_0]	; results.element
	;PRINT_UINT "element = %d", eax
	inc		eax
	jz		exit				; if (element != -1)
	dec		eax					; {
	mov     ecx, ds:g_pGameLevel
	mov     ecx, [ecx]
	mov     esi, [ecx+0DCh] 	; tri array
	shl     eax, 4				; eax = results.element * 8
	mov     cx,  [eax+esi+0Ch]
	and     cx,	 3FFFh
	movzx   edx, cx				; hit_material_idx
	mov     eax, ds:dword_10560718
	mov     ecx, [eax+edx*4]	; ecx = mtl
	mov		eax, [ecx+0Ch]		; eax = mtl->Flags
exit:							; }
	;----------------------
	pop 	esi
	pop     edx
	pop     ecx
	mov     esp, ebp
	pop     ebp
	retn    
Level__GetMtlFlags  endp
; --------===============---------
