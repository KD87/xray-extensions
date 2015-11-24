g_ignore_game_state_update dd 0

game_cl_GameState__net_import_GameTime_fix proc
var_1C          = dword ptr -1Ch
var_C           = dword ptr -0Ch
var_8           = dword ptr -8
arg_0           = dword ptr  8
	;PRINT "game_cl_GameState__net_import_GameTime_dbg_fix"
	;
	mov eax, [g_ignore_game_state_update]
	test eax, eax
	jz doing_update
	mov [g_ignore_game_state_update], 0
	;PRINT "ignore_once"
	jmp ignore_game_state_update
doing_update:
	;
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	sub     esp, 0Ch
	push    ebx
	push    esi
	mov     esi, [ebp+arg_0]
	mov     eax, [esi+2004h]
	mov     ecx, [eax+esi]
	mov     edx, [eax+esi+4]
	add     eax, 8
	mov     [esi+2004h], eax
	push    edi
	mov     edi, [eax+esi]
	add     eax, 4
	mov     [esi+2004h], eax
	mov     eax, ds:g_pGameLevel
	mov     [esp+18h+var_C], edi
	mov     edi, [eax]
	mov     edi, [edi+45D0h]
	;
	;PRINT "m_qwStartGameTime before"
	push eax
	mov     eax, [esi+70h]
	;PRINT_UINT "%x", eax
	mov     eax, [esi+74h]
	;PRINT_UINT "%x", eax
	pop eax
	;
	;PRINT "m_qwStartGameTime after"
	mov     [edi+70h], ecx
	;PRINT_UINT "%x", ecx
	mov     [edi+74h], edx
	;PRINT_UINT "%x", edx
	mov     eax, [eax]
	lea     ecx, [eax+160h]
	call    ds:IPureClient__timeServer_Async
	movss   xmm0, [esp+18h+var_C]
	mov     edx, ds:g_pGameLevel
	mov     [edi+68h], eax
	mov     dword ptr [edi+6Ch], 0
	movss   dword ptr [edi+78h], xmm0
	mov     eax, [esi+2004h]
	mov     ebx, [eax+esi]
	mov     edi, [eax+esi+4]
	add     eax, 8
	mov     [esi+2004h], eax
	mov     ecx, [eax+esi]
	add     eax, 4
	mov     [esi+2004h], eax
	mov     eax, [edx]
	mov     [esp+18h+var_C], ecx
	mov     ecx, [eax+45D0h]
	mov     eax, [ecx]
	mov     edx, [eax+28h]
	call    edx
	fld     [esp+18h+var_C]
	push    ecx
	fstp    [esp+1Ch+var_1C]
	mov     [esp+1Ch+var_8], eax
	mov     eax, ds:g_pGameLevel
	mov     eax, [eax]
	push    edi
	push    ebx
	mov     esi, edx
	call    CLevel__SetEnvironmentGameTimeFactor
	cmp     esi, edi
	jb      short loc_102AC542
	ja      short loc_102AC52E
	cmp     [esp+18h+var_8], ebx
	jbe     short loc_102AC542
loc_102AC52E:
	; if (Device.dwPrecacheFrame > 0)
	; делаем Invalidate пока непрокэшировали, потом уже не надо
	mov     ecx, ds:Device
	cmp     dword ptr [ecx+0F8h], 0
	jz      short loc_102AC542

	mov     ecx, ds:g_pGamePersistent
	mov     edx, [ecx]
	mov     ecx, [edx+46Ch]
	call    ds:CEnvironment__Invalidate
loc_102AC542:
	pop     edi
	pop     esi
	pop     ebx
	mov     esp, ebp
	pop     ebp
ignore_game_state_update:
	retn    4
game_cl_GameState__net_import_GameTime_fix endp
