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

CEntityCondition__UpdateConditionTime_dbg_fix proc
	PRINT "dbg_fix"
	PRINT_UINT "eax=%x", eax
	PRINT_UINT "edx=%x", edx
	; делаем то, что вырезали
	mov     [esi+0C8h], eax
	mov     [esi+0CCh], edx
	jmp back_from_CEntityCondition__UpdateConditionTime_dbg_fix
CEntityCondition__UpdateConditionTime_dbg_fix endp

CEntityCondition__UpdateConditionTime_dbg_fix2 proc
	PRINT "dbg_fix2"
	PRINT_UINT "eax=%x", eax
	PRINT_UINT "edx=%x", edx
	; делаем то, что вырезали
	mov     [esi+0C8h], eax
	mov     [esi+0CCh], edx
	jmp back_from_CEntityCondition__UpdateConditionTime_dbg_fix2
CEntityCondition__UpdateConditionTime_dbg_fix2 endp


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

