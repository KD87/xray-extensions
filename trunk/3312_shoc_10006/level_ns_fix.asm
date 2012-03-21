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
	mov     ecx, ds:?Memory@@3VxrMemory@@A ; xrMemory Memory
	push    esi
	push    14h
	call    ds:?mem_alloc@xrMemory@@QAEPAXI@Z ; xrMemory::mem_alloc(uint)
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
	mov     ecx, ds:?Memory@@3VxrMemory@@A ; xrMemory Memory
	push    esi
	push    14h
	call    ds:?mem_alloc@xrMemory@@QAEPAXI@Z ; xrMemory::mem_alloc(uint)
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
	
