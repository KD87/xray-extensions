;===============| расширение регистрации пространства имён level |=============
level_ns_extension_1:
	call    get_snd_volume_register ; делаем то, что вырезали
;------------< регистрируем функцию получения расстояния до объекта, на который смотрим >------
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset GetTargetDistance
	push    offset aGet_target_dist ; "get_target_dist"
	push    eax
	call    get_snd_volume_register ; регистрируем функцию с прототипом как у   get_snd_volume
;--------------------------------------
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset GetTargetObject
	push    offset aGet_target_obj ; "get_target_obj"
	push    eax
	call    object_by_id_register ; регистрируем функцию с прототипом как у   object_by_id
;--------------------------------------
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset GetActorBodyState
	push    offset aGet_actor_body_state ; "get_actor_body_state"
	push    eax
	call    get_time_days_register ; регистрируем функцию с прототипом как у   get_time_days
;--------------------------------------
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset SetFov
	push    offset aSet_fov ; "set_fov"
	push    eax
	call    set_snd_volume_register ; регистрируем функцию с прототипом как у   set_snd_volume
;--------------------------------------
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset GetFov
	push    offset aGet_fov ; "get_fov"
	push    eax
	call    get_snd_volume_register ; регистрируем функцию с прототипом как у   get_snd_volume
;--------------------------------------
	jmp back_to_level_ns_ext_1
	
aGet_target_dist db "get_target_dist", 0
aGet_target_obj  db "get_target_obj", 0
aGet_actor_body_state db "get_actor_body_state", 0
aSet_fov db "set_fov", 0
aGet_fov db "get_fov", 0

level_ns_extension_2: ; здесь надо добавлять столько раз   "mov ecx, eax" + "call esi", сколько добавляли функций
; делаем то, что вырезали
	mov     ecx, eax
	call    esi ; luabind::scope::operator,(luabind::scope) ; luabind::scope::operator,(luabind::scope)
	mov     ecx, eax
	call    esi ; luabind::scope::operator,(luabind::scope) ; luabind::scope::operator,(luabind::scope)
; добавляем своё
	; для get_target_dist
	mov     ecx, eax
	call    esi 
	; для get_target_obj
	mov     ecx, eax
	call    esi 
	; для get_actor_body_state
	mov     ecx, eax
	call    esi 
	; для set_fov
	mov     ecx, eax
	call    esi 
	; для get_fov
	mov     ecx, eax
	call    esi 
; идём обратно
	jmp back_to_level_ns_ext_2


GetTargetDistance:
	mov     eax, [g_hud] ; CCustomHUD * g_hud
	mov     ecx, [eax]
	call    CCustomHUD__GetRQ ; eax = RQ
	fld     dword ptr [eax+4] ; return EQ.range
	retn
	
GetTargetObject:
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
return_value: ; иначе - конвертируем в game_object
	mov     ecx, eax ; this = <найденный CGameObject>
	jmp     CGameObject__lua_game_object

GetActorBodyState proc
	mov     eax, [g_Actor]
	test    eax, eax
	jz      short exit_fail
	mov     eax, [eax+1428] ; mstate_real (0x594 = 1428)
exit_fail:
	retn
GetActorBodyState endp

SetFov proc
arg_0           = dword ptr  4
	mov     eax, [esp+arg_0]
	mov     [g_fov], eax
	retn
SetFov endp

GetFov proc
	fld     dword ptr [g_fov]
	retn
GetFov endp
