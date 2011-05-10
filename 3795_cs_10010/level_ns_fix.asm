;===============| расширение регистрации пространства имён level |=============
level_ns_extension_1 proc
	call    get_snd_volume_register ; делаем то, что вырезали
	add     esp, 08h
	;jmp back_to_level_ns_ext_1
;------------< регистрируем функцию получения расстояния до объекта, на который смотрим >------
	;pop     ecx
	;pop     ecx
	mov     eax, esp
	push    offset GetTargetDistance
	push    offset aGet_target_dist ; "get_target_dist"
	push    eax
	call    get_snd_volume_register ; регистрируем функцию с прототипом как у   get_snd_volume
	add     esp, 08h
;--------------------------------------
	;jmp skip
;------------< регистрируем функцию установки фактора замедления физики >------
	mov     eax, esp
	push    ecx
	push    offset set_ph_time_factor
	push    offset aSet_ph_time_factor ; "set_ph_time_factor"
	push    eax
	call    register_set_snd_volume
	add     esp, 0Ch
;------------< регистрируем функцию получения фактора замедления физики >------
	mov     eax, esp
	push    offset get_ph_time_factor
	push    offset aGet_ph_time_factor ; "get_ph_time_factor"
	push    eax
	call    get_snd_volume_register ; регистрируем функцию с прототипом как у   get_snd_volume
	add     esp, 08h
;------------< регистрируем функцию установки FOV >------
	mov     eax, esp
	push    ecx
	push    offset SetFOV
	push    offset aSet_fov ; "set_fov"
	push    eax
	call    register_set_snd_volume
	add     esp, 0Ch
;------------< регистрируем функцию получения FOV >------
	mov     eax, esp
	push    offset GetFOV
	push    offset aGet_fov ; "get_fov"
	push    eax
	call    get_snd_volume_register ; регистрируем функцию с прототипом как у   get_snd_volume
	add     esp, 08h
;------------< регистрируем функцию для скрывания миникарты >------
	mov     eax, esp
	push    ecx
	push    offset hide_minimap_old1
	push    offset aHide_minimap ; "hide_minimap"
	push    eax
	call    register_level_disable_input
	add     esp, 0Ch
;------------< регистрируем функцию для показывания миникарты >------
	mov     eax, esp
	push    ecx
	push    offset show_minimap_new
	push    offset aShow_minimap ; "show_minimap"
	push    eax
	call    register_level_disable_input
	add     esp, 0Ch
;------------< регистрируем функцию для получения статуса миникарты >------
	mov     eax, esp
	push    offset minimap_shown_old
	push    offset aMinimap_shown ; "minimap_shown"
	push    eax
	call    register_is_wfx_playing
	pop     ecx
	pop     ecx
skip:
	
level_ns_extension_1 endp

;-------------------------------------------------
	;pop     ecx
	;pop     ecx
	;mov     eax, esp
	;push    offset GetTargetObject
	;push    offset aGet_target_obj ; "get_target_obj"
	;push    eax
	;call    object_by_id_register ; регистрируем функцию с прототипом как у   object_by_id
;--------------------------------------
	jmp back_to_level_ns_ext_1
	
aGet_target_dist db "get_target_dist", 0
;aGet_target_obj  db "get_target_obj", 0
aSet_ph_time_factor db "set_ph_time_factor", 0
aGet_ph_time_factor db "get_ph_time_factor", 0
aGet_fov db "get_fov", 0
aSet_fov db "set_fov", 0
aHide_minimap db "hide_minimap", 0
aShow_minimap db "show_minimap", 0
aMinimap_shown db "minimap_shown", 0


level_ns_extension_2 proc
 ; здесь надо добавлять столько раз   "mov ecx, eax" + "call esi", сколько добавляли функций
; делаем то, что вырезали
	mov     ecx, eax
	call    esi ; luabind::scope::operator,(luabind::scope) ; luabind::scope::operator,(luabind::scope)
	mov     ecx, eax
	call    esi ; luabind::scope::operator,(luabind::scope) ; luabind::scope::operator,(luabind::scope)
; добавляем своё
	; для get_target_dist
	mov     ecx, eax
	call    esi 
	;jmp skip
	; для set_ph_time_factor
	mov     ecx, eax
	call    esi 
	; для get_ph_time_factor
	mov     ecx, eax
	call    esi 
	; для set_fov
	mov     ecx, eax
	call    esi 
	; для get_fov
	mov     ecx, eax
	call    esi 
	; для hide_minimap
	mov     ecx, eax
	call    esi 
	; для show_minimap
	mov     ecx, eax
	call    esi 
	; для minimap_shown
	mov     ecx, eax
	call    esi 
skip:
	; для get_target_obj
	;mov     ecx, eax
	;call    esi 
; идём обратно
	jmp back_to_level_ns_ext_2
level_ns_extension_2 endp

GetTargetDistance proc
	mov     eax, [g_hud] ; CCustomHUD * g_hud
	mov     ecx, [eax]
	call    CCustomHUD__GetRQ ; eax = RQ
	fld     dword ptr [eax+4] ; return EQ.range
	retn
GetTargetDistance endp
	
GetTargetObject_old proc
	mov     eax, [g_hud] ; CCustomHUD * g_hud
	mov     ecx, [eax]
	call    CCustomHUD__GetRQ ; eax = RQ
	;--
	mov     eax, [eax] ; RQ.O
	;--
	;push    dword ptr [eax] ; RQ.O
	;call    smart_cast_CGameObject ; eax = smart_cast<CGameObject*>
	;pop     ecx
	test    eax, eax ; если ничего не нашли
	jnz     return_value
	xor     eax, eax ; то возвращаем nil
	retn
return_value: ; иначе - конвертируем в game_object
	mov     ecx, eax ; this = <найденный CGameObject>
	jmp     CGameObject__lua_game_object
GetTargetObject_old endp

GetHUD proc
	mov     eax, [g_pGameLevel] ; eax = level object
	mov     eax, [eax+40104h] ; eax = phud
	retn
GetHUD endp

CCustomHUD__GetRQ proc
	mov     eax, [ecx+74h]
	add     eax, 8
	retn
CCustomHUD__GetRQ endp	
	
set_ph_time_factor proc
arg_0           = dword ptr  4
	mov     eax, [esp+arg_0]
	mov     [phTimefactor], eax
	retn
set_ph_time_factor endp

get_ph_time_factor proc
	mov     eax, ds:phTimefactor
	fld     dword ptr [eax]
	retn
get_ph_time_factor endp

GetFOV proc
	fld     dword ptr [g_fov]
	retn
GetFOV endp

SetFOV proc
arg_0           = dword ptr  4
	mov     eax, [esp+arg_0]
	mov     [g_fov], eax
	retn
SetFOV endp


hide_minimap_old proc
	mov     eax, g_pGameLevel
	mov     eax, [eax]
	mov     eax, [eax+40104h] ; ecx = pHUD
	mov     eax, [eax]    ; edx = CHUDManager.vtable
	mov     eax, [eax+18h] ; eax = CHUDManager::GetUI
	call    eax            ; eax = GetUI()
	mov     ecx, [eax+64] ; CUIMainIngameWnd*		UIMainIngameWnd; // 64
	;mov     ecx, [eax+1564h] ; CUIZoneMap*			UIZoneMap; // 1564h	
	mov     eax, 0
	push    eax
	call    CUIWindow__Show
	retn
hide_minimap_old endp

hide_minimap_old1 proc
	push eax
	push ecx
	push edx
	
	mov     ecx, g_pGameLevel
	mov     edx, [ecx]
	mov     ecx, [edx+40104h]
	mov     eax, [ecx]
	mov     edx, [eax+18h]
	call    edx
	mov     eax, [eax+40h]
	mov     eax, [eax+1564h]
	mov     byte ptr [eax+4], 0
	
	;mov     eax, [eax]
	;mov     eax, [eax+6Ch]
	;xor     edx, edx
	;push    edx
	;call    eax

	
	
	push    offset hide_msg
	call    ds:[Msg] 
	add     esp, 04h

	pop edx
	pop ecx
	pop eax
	retn
hide_minimap_old1 endp

hide_msg db "trying hide minimap", 0

minimap_shown_old proc
	push ecx
	push edx
	
	mov     ecx, g_pGameLevel
	mov     edx, [ecx]
	mov     ecx, [edx+40104h]
	mov     eax, [ecx]
	mov     edx, [eax+18h]
	call    edx
	mov     eax, [eax+40h]
	mov     edx, [eax+1564h]
	xor eax, eax
	mov     al, byte ptr [edx+4]

	pop edx
	pop ecx
	retn
minimap_shown_old endp

minimap_draw_fix proc
	cmp byte ptr [is_minimap_shown], 0
	jmp back_from_minimap_draw_fix__skip_minimap_drawing ; проверка нашего флажка
	jz back_from_minimap_draw_fix__skip_minimap_drawing ; проверка нашего флажка
	cmp     byte ptr [esi+4], 0 ; выполняем вырезанную инструкцию
	jz back_from_minimap_draw_fix__skip_minimap_drawing ; проверка встроенного флажка, хоть от неё и нет толка
	;
	push    offset hide_msg
	call    ds:[Msg] 
	add     esp, 04h
	;
	jmp back_from_minimap_draw_fix__draw_minimap
minimap_draw_fix endp

hide_minimap proc
	mov [is_minimap_shown], 0
	retn
hide_minimap endp

show_minimap proc
	mov [is_minimap_shown], 1
	retn
show_minimap endp
minimap_shown proc
	mov     al, [is_minimap_shown]
	retn
minimap_shown endp
is_minimap_shown db 1

show_minimap_new proc
	push eax
	push ecx
	push edx
	
	mov     ecx, g_pGameLevel
	mov     edx, [ecx]
	mov     ecx, [edx+40104h]
	mov     eax, [ecx]
	mov     edx, [eax+18h]
	call    edx
	mov     eax, [eax+40h]
	mov     eax, [eax+1564h]
	mov     byte ptr [eax+4], 1

	push    offset show_msg
	call    ds:[Msg] 
	add     esp, 04h
	
	pop edx
	pop ecx
	pop eax
	retn
show_minimap_new endp

show_msg db "trying show minimap", 0