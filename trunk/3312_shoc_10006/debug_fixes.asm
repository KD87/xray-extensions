CUITalkDialogWnd__Hide_test:
	pusha
	PRINT "CUITalkDialogWnd__Hide"
	popa
;--
	mov     eax, [esi]
	mov     edx, [eax+74h]
	add     esp, 4
	push    0
	mov     ecx, esi
	mov     byte ptr [esi+4], 0
	call    edx
	mov     byte ptr [esi+56h], 0
	pop     esi
	retn

ALIGN 8
CLevel__g_sv_Spawn_fix proc
	; делаем то, что вырезали
	lea     edi, [ebx+54h]
	push    eax
	PRINT_UINT "creating object: %s", eax
	push eax
	mov eax, [ebp+54]
	and eax, 0ffffh
	PRINT_UINT "ID=%d", eax
	mov eax, [ebp+56]
	and eax, 0ffffh
	PRINT_UINT "Parent_ID=%d", eax
	pop eax
	mov     ecx, edi
	call    CObjectList__Create
	jmp     back_from_CLevel__g_sv_Spawn_fix
CLevel__g_sv_Spawn_fix endp

CLevel__g_sv_Spawn_fix2 proc
	PRINT "finished creating object"
	pop     edi
	pop     esi
	pop     ebp
	add     esp, 2014h
	retn    4
CLevel__g_sv_Spawn_fix2 endp

CWeapon__UpdateFireDependencies_internal_dbg_fix2 proc
	PRINT_UINT "wpn=%x", ebx
	PRINT_UINT "hud=%x", eax
	lea     eax, [ebx+298h]
	PRINT_UINT "hud_cell_addr=%x", eax
	mov     eax, [ebx+298h]
	PRINT_MATRIX "hud_xform:", edx
	; делаем то, что вырезали
	movzx   ecx, word ptr [edx+0Ch] ; ecx = fire_bone
	movss   xmm0, dword ptr [edx+14h]
	jmp back_from_CWeapon__UpdateFireDependencies_internal_dbg_fix2
CWeapon__UpdateFireDependencies_internal_dbg_fix2 endp

g_saved_vector Vector3 {0.0, 0.0, 0.0}

CShootingObject__RenderLight_dbg_fix2 proc
	; своё
	PRINT_VECTOR "fire point", eax
	push ebx
	push edi
	assume eax:PTR Vector3
	assume edi:PTR Vector3
	mov edi, offset g_saved_vector
	;mov Vector3 ptr [ebx].x, Vector3 ptr [eax].x
	mov ebx, [eax].x
	mov [edi].x, ebx
	mov ebx, [eax].y
	mov [edi].y, ebx
	mov ebx, [eax].z
	mov [edi].z, ebx
	assume eax:nothing
	assume edi:nothing
	pop edi
	pop ebx
	; делаем то, что вырезали
	call    CShootingObject__Light_Render
	jmp back_from_CShootingObject__RenderLight_dbg_fix2
CShootingObject__RenderLight_dbg_fix2 endp

CCustomZone__feel_touch_contact_dbg_fix proc
	; делаем то, что вырезали
	mov     edx, [esi]
	mov     eax, [edx+0E0h]
	mov     ecx, esi
	PRINT_UINT "call=%x", eax
	call    eax
	push eax
	mov eax, [CAI_Stalker__IsVisibleForZones]
	PRINT_UINT "call2=%x", eax
	pop eax
	;
	jmp back_from_CCustomZone__feel_touch_contact_dbg_fix
CCustomZone__feel_touch_contact_dbg_fix endp


CGameGraph__distance_fix proc
	call CGameGraph__distance_check
	push eax
	push ecx
	push esi
	and eax, 0FFFFh
	PRINT_UINT "CGameGraph__distance: v1 = %d", eax
	and esi, 0FFFFh
	PRINT_UINT "CGameGraph__distance: v2 = %d", esi
	pop esi
	pop ecx
	pop eax
	;
	mov     ecx, [ecx+38h]
	movzx   eax, ax
	;
	jmp back_from_CGameGraph__distance_fix
CGameGraph__distance_fix endp

CALL_ACTOR_CALLBACK_INT_INT MACRO code:REQ, reg_arg1:REQ, reg_arg2:REQ
	push edx
	push ecx
	push eax
	push edi
	
	push    reg_arg2
	push    reg_arg1
	push    code
	; получаем объект колбека
	mov     ecx, g_Actor
	call    CGameObject__callback ; eax = callback
	push    eax ; callback
	; вызываем
	call    script_callback_int_int
	;
	pop edi
	pop eax
	pop ecx
	pop edx
ENDM

CGameGraph__distance_check proc
	push ecx
	push edx
	push esi
	push eax
	
	;
	mov     ecx, [ecx+38h]
	movzx   eax, ax
	movzx   edx, ax
	imul    edx, 2Ah
	mov     eax, [edx+ecx+20h]
	add     edx, ecx
	add     eax, ecx
	movzx   ecx, byte ptr [edx+28h]
	lea     ecx, [ecx+ecx*2]
	lea     ecx, [eax+ecx*2]
	cmp     eax, ecx
	jz      fail
loc_10056392:
	cmp     [eax], si
	jz      is_ok
	add     eax, 6
	cmp     eax, ecx
	jnz     loc_10056392
fail:
	; восстанавливаем нужные нам регистры
	pop eax
	pop esi
	; пишем их обратно в стек
	push esi
	push eax
	;
	PRINT "CGameGraph__distance failed!"
	and eax, 0FFFFh
	PRINT_UINT "g0 = %d", eax
	and esi, 0FFFFh
	PRINT_UINT "g1 = %d", esi
	mov edx, [ebp] ; m_object
	movzx edx, word ptr [edx + 54]
	PRINT_UINT "object_id = %d", edx
	shl eax, 16
	or eax, esi
	
	CALL_ACTOR_CALLBACK_INT_INT 153, edx, eax
	;
is_ok:
	pop eax
	pop esi
	pop edx
	pop ecx
	retn
CGameGraph__distance_check endp


CEntityCondition__UpdateConditionTime_dbg proc near
var_C           = qword ptr -0Ch
	;PRINT " #"
	PRINT "#CEntityCondition__UpdateConditionTime_dbg"
	sub     esp, 0Ch
	push    ebx
	push    edi
	;
	mov     eax, ds:g_pGameLevel
	mov     eax, [eax]
	mov     ecx, [eax+45D0h]
	mov     ebx, 1 ; EGameTypes.GAME_SINGLE == 1
	cmp     [ecx+10h], ebx
	jnz     not_single
	; if (game == single)
	;PRINT "is single"
	mov     eax, ecx
	mov     edx, [eax]
	mov     eax, [edx+1Ch]
	call    eax
	jmp     begin_calculations
	; if (game != single)
not_single:
	;PRINT "is not single"
	lea     ecx, [eax+160h]
	call    ds:IPureClient__timeServer
	xor     edx, edx  ; edx = 0
begin_calculations:
	;PRINT "cur_time:"
	PRINT_UINT "cur_time %d", eax
	;PRINT_UINT "%x", edx
	cmp     byte ptr [esi+0E8h], 0 ; m_bTimeValid
	jz      time_is_not_valid
	; if (m_bTimeValid) {
	;PRINT "m_iLastTimeCalled"
	mov     edi, [esi+0CCh] ; m_iLastTimeCalled_h
	;PRINT_UINT "%d", edi
	mov     ecx, [esi+0C8h] ; m_iLastTimeCalled
	PRINT_UINT "m_iLastTimeCalled %d", ecx
	cmp     edx, edi
	jb      curr_time_less_than_m_iLastTimeCalled
	ja      lab3
	cmp     eax, ecx ; if (curr_time < m_iLastTimeCalled) {
	jbe     curr_time_less_than_m_iLastTimeCalled
	; curr_time >= m_iLastTimeCalled
lab3:
	mov     ebx, eax
	sub     ebx, ecx
	mov     ecx, edx
	sbb     ecx, edi
	mov     edi, ecx
	and     ecx, 7FFFFFFFh
	mov     dword ptr [esp+14h+var_C], ebx
	mov     dword ptr [esp+14h+var_C+4], ecx
	fild    [esp+14h+var_C]
	and     edi, 80000000h
	mov     dword ptr [esp+14h+var_C+4], edi
	mov     dword ptr [esp+14h+var_C], 0
	fild    [esp+14h+var_C]
	mov     [esi+0C8h], eax ; m_iLastTimeCalled
	mov     [esi+0CCh], edx ; m_iLastTimeCalled_h
	fchs
	faddp   st(1), st
	fmul    ds:flt_1045A260 ; 0.001
	fstp    dword ptr [esi+0D0h] ; m_fDeltaTime
	;
	mov     eax, dword ptr [esi+0D0h]
	PRINT_FLOAT "v1: m_fDeltaTime: %f #", eax
	mov     eax, [esi+0C8h] ; m_iLastTimeCalled
	PRINT_UINT "ltc %d", eax
	;
	pop     edi                                              ; return;
	pop     ebx
	add     esp, 0Ch
	retn
;-------------------------------
curr_time_less_than_m_iLastTimeCalled:
	xorps   xmm0, xmm0                                      ; 0.0
	jmp     lab6
time_is_not_valid:
	xorps   xmm0, xmm0
	mov     [esi+0E8h], bl            ; m_bTimeValid = true
	movss   dword ptr [esi+78h], xmm0 ; m_fDeltaHealth
	movss   dword ptr [esi+7Ch], xmm0 ; m_fDeltaPower
	movss   dword ptr [esi+80h], xmm0 ; m_fDeltaRadiation
	movss   dword ptr [esi+88h], xmm0 ; m_fDeltaCircumspection
	movss   dword ptr [esi+8Ch], xmm0 ; m_fDeltaEntityMorale
lab6:
	pop     edi
	movss   dword ptr [esi+0D0h], xmm0 ; m_fDeltaTime
	mov     [esi+0C8h], eax ; m_iLastTimeCalled
	mov     [esi+0CCh], edx ; m_iLastTimeCalled_h
	;
	mov     eax, dword ptr [esi+0D0h]
	PRINT_FLOAT "v2: m_fDeltaTime: %f #", eax
	mov     eax, [esi+0C8h] ; m_iLastTimeCalled
	PRINT_UINT "ltc %d", eax
	;
	pop     ebx
	add     esp, 0Ch
	retn
CEntityCondition__UpdateConditionTime_dbg endp

game_GameState__GetGameTime_dbg_fix proc
var_8           = qword ptr -8
;	sub     esp, 8
;	mov     eax, ds:g_pGameLevel
	;-PRINT "game_GameState__GetGameTime_dbg_fix"
	mov     eax, [eax]
	push    esi
	mov     esi, ecx
	push    edi
	lea     ecx, [eax+160h]
	call    ds:IPureClient__timeServer_Async
	;-PRINT_UINT "IPureClient__timeServer_Async: %d", eax
	mov     ecx, eax
	xor     eax, eax
	sub     ecx, [esi+68h]
	;-PRINT "m_qwStartProcessorTime"
	;-PRINT_UINT "%d", ecx
	sbb     eax, [esi+6Ch]
	;-PRINT_UINT "%d", eax
	;
	push eax
	;-PRINT "m_qwStartGameTime"
	mov     eax, [esi+70h]
	;-PRINT_UINT "%d", eax
	mov     eax, [esi+74h]
	;-PRINT_UINT "%d", eax
	pop eax
	;
	mov     dword ptr [esp+10h+var_8], ecx
	mov     ecx, eax
	and     eax, 7FFFFFFFh
	mov     dword ptr [esp+10h+var_8+4], eax
	fild    [esp+10h+var_8]
	and     ecx, 80000000h
	mov     dword ptr [esp+10h+var_8+4], ecx
	mov     dword ptr [esp+10h+var_8], 0
	fild    [esp+10h+var_8]
	mov     ecx, 9Eh
	fchs
	faddp   st(1), st
	fmul    dword ptr [esi+78h]
	fstp    dword ptr [esp+10h+var_8]
	mov     edi, dword ptr [esp+10h+var_8]
	mov     edx, edi
	sar     edx, 17h
	and     edx, 0FFh
	sub     ecx, edx
	mov     eax, edi
	or      eax, 0FF800000h
	shl     eax, 8
	shr     eax, cl
	sub     ecx, 60h
	mov     edx, 1
	shl     edx, cl
	sub     edx, 1
	sar     edx, 8
	and     edx, edi
	neg     edx
	sbb     edx, edx
	sar     edi, 1Fh
	add     edx, 1
	and     edx, edi
	sub     eax, edx
	add     ecx, 40h
	sar     ecx, 1Fh
	and     eax, ecx
	xor     eax, edi
	cdq
	add     eax, [esi+70h]
	pop     edi
	adc     edx, [esi+74h]
	pop     esi
	add     esp, 8
	PRINT "t: "
	PRINT_UINT "%d", eax
	PRINT_UINT "%x", edx
	PRINT " #"
	retn
game_GameState__GetGameTime_dbg_fix endp


game_sv_Single__GetGameTime_dbg_fix proc
	PRINT "game_sv_Single__GetGameTime_dbg_fix #"
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	cmp     g_ai_space, 0
	push    esi
	push    edi
	mov     esi, ecx
	jnz     short loc_102D5A24
	call    xr_new_CAI_Space_
	mov     ecx, eax
	mov     g_ai_space, eax
	call    CAI_Space__init
loc_102D5A24:
	mov     eax, g_ai_space
	mov     eax, [eax+18h]
	test    eax, eax
	jz      short loc_102D5A4F
	mov     ecx, [eax+0Ch]
	mov     edx, [ecx+4]
	cmp     byte ptr [edx+eax+40h], 0
	jz      short loc_102D5A4F
	mov     edx, [ecx+4]
	mov     edi, [edx+eax+18h]
	PRINT "CALifeTimeManager__game_time #"
	call    CALifeTimeManager__game_time
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn
loc_102D5A4F:
	mov     ecx, esi
	PRINT "game_GameState__GetGameTime #"
	call    game_GameState__GetGameTime
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn
game_sv_Single__GetGameTime_dbg_fix endp

game_GameState__SetGameTimeFactor_dbg_fix proc
arg_0 = dword ptr  4
	PRINT "game_GameState__SetGameTimeFactor_dbg_fix #"
	push    esi
	mov     esi, ecx
	mov     eax, [esi]
	mov     edx, [eax+1Ch]
	call    edx
	PRINT_UINT "%d #", eax
	PRINT_UINT "%x", edx
	mov     [esi+70h], eax
	mov     eax, ds:g_pGameLevel
	mov     [esi+74h], edx
	mov     eax, [eax]
	lea     ecx, [eax+160h]
	call    ds:IPureClient__timeServer_Async
	movss   xmm0, [esp+4+arg_0]
	mov     [esi+68h], eax
	mov     dword ptr [esi+6Ch], 0
	movss   dword ptr [esi+78h], xmm0
	pop     esi
	retn    4
game_GameState__SetGameTimeFactor_dbg_fix endp

game_GameState__SetGameTimeFactor__INT64_float_dbg_fix proc
arg_0           = dword ptr  4
arg_4           = dword ptr  8
arg_8           = dword ptr  0Ch
	PRINT "game_GameState__SetGameTimeFactor__INT64_float_dbg_fix #"
	mov     eax, [esp+arg_0]
	mov     ecx, [esp+arg_4]
	PRINT_UINT "%x #", eax
	PRINT_UINT "%x", ecx
	mov     edx, ds:g_pGameLevel
	mov     [esi+74h], ecx
	mov     [esi+70h], eax
	mov     eax, [edx]
	lea     ecx, [eax+160h]
	call    ds:IPureClient__timeServer_Async
	movss   xmm0, [esp+arg_8]
	mov     [esi+68h], eax
	mov     dword ptr [esi+6Ch], 0
	movss   dword ptr [esi+78h], xmm0
	retn    0Ch
game_GameState__SetGameTimeFactor__INT64_float_dbg_fix endp

CScriptGameObject__Hit_dbg_fix proc
	PRINT "SCRIPT HIT"
	;
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	;
	jmp back_from_CScriptGameObject__Hit_dbg_fix
CScriptGameObject__Hit_dbg_fix endp
