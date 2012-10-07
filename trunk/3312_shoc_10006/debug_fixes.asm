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
