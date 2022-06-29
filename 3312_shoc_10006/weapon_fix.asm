UpdateAddonsVisibility_fix proc
	;
	; делаем что хотели сделать
	; вызываем колбек для объекта оружия
	push ecx
	push eax
	push edi
	;
	movzx eax, byte ptr [edi + 936]
	;PRINT_UINT "UpdateAddonsVisibility: %x", eax
	test eax, 040h
	jz disable_callback
	;PRINT "UpdateAddonsVisibility_fix 1"
	;PRINT_UINT "object: %x", edi
	
	push    777 ; заглушка
	push    888 ; заглушка
	push    154 ; константа - тип колбека
	mov     ecx, edi ; this
	add     ecx, 0d8h
;item: 172fd6f8 obj
;item: 172fd620 wpn

	call    CGameObject__callback ; eax = callback
	;PRINT_UINT "aaa: %x", eax
	push    eax ; callback
	; вызываем
	call    script_callback_int_int
	;
disable_callback:
	pop edi
	pop eax
	pop ecx
	;
	;PRINT "UpdateAddonsVisibility_fix 2"
	; делаем вырезанное
	mov     ecx, esi ; <== это было
	call    ds:CKinematics__CalculateBones_Invalidate ; <== вот эта команда будет испорчена релокацией, если врезаться здесь
	mov     eax, [esi]
	mov     edx, [eax+40h]
	push    0
	mov     ecx, esi
	call    edx
	;
	;PRINT "UpdateAddonsVisibility_fix 3"
	;
	pop     esi
	pop     ebp
	pop     ebx
	retn
UpdateAddonsVisibility_fix endp

UpdateHUDAddonsVisibility_fix proc
	push ecx
	push eax
	
	movzx eax, byte ptr [ebp + 936]
	;PRINT_UINT "UpdateHUDAddonsVisibility_fix: this = ebp = %d", ebp
	;PRINT_UINT "UpdateHUDAddonsVisibility: %x", eax
	test eax, 040h
	jz disable_callback
	;PRINT "UpdateHUDAddonsVisibility 1"
	;
	push    777 ; заглушка
	push    888 ; заглушка
	push    155 ; константа - тип колбека
	mov     ecx, ebp ; this
	add     ecx, 0d8h
	call    CGameObject__callback ; eax = callback
	push    eax ; callback
	;PRINT "before HUD update callback"
	call    script_callback_int_int
	;PRINT "after HUD update callback"
disable_callback:
	pop eax
	pop ecx

	; делаем вырезанное
	push    ebx
	push    edi
	push    offset aWpn_scope ; "wpn_scope"
	mov     ecx, esi
	; идём обратно
	jmp back_from_UpdateHUDAddonsVisibility_fix
UpdateHUDAddonsVisibility_fix endp
aWpn_scope db "wpn_scope", 0

CWeaponMagazinedWGrenade__UseScopeTexture_fix proc
	mov    al, byte ptr [ecx+3A8h] ; m_flagsAddOnState
	and     al, 080h
	jz     go_as_usual
	xor     eax, eax
	;mov     eax, 1
	retn
go_as_usual:
	mov     eax, [ecx+3B4h]
	cmp     eax, 2 ; IsGrenadeLauncherAttached()
	jnz     short loc_1022B3D3
	test    [ecx+3A8h], al
	jnz     short loc_1022B3D8
loc_1022B3D3:
	cmp     eax, 1 ; m_bGrenadeMode
	jnz     short return_true
loc_1022B3D8:
	cmp     byte ptr [ecx+958h], 0
	jz      short return_true
	xor     eax, eax ; return false
	retn
; ---------------------------------------------------------------------------
return_true:
	mov     eax, 1 ; return true
	retn
CWeaponMagazinedWGrenade__UseScopeTexture_fix endp

CWeapon__UseScopeTexture_fix proc
	mov     al, [ecx+3A8h] ; m_flagsAddOnState
	and     eax, 080h
	jnz     lab1
	; return true
	mov     eax, 1
	;PRINT_UINT "eax=%x", eax
	retn
lab1:
	; return false
	xor     eax, eax
	;PRINT_UINT "eax=%x", eax
	retn
CWeapon__UseScopeTexture_fix endp

;CWeaponMagazined__InitAddons_fix1 proc
;	; делаем вырезанное
;	pop     edi
;	pop     esi
;	pop     ebp
;	pop     ebx
;	add     esp, 10h
;	;
;	pop ecx
;	PRINT_UINT "CWeaponMagazined__InitAddons_fix1: this = ecx = %d", ecx
;	retn
;CWeaponMagazined__InitAddons_fix1 endp

CWeaponMagazined__InitAddons_fix2 proc

	;PRINT "CWeaponMagazined__InitAddons_fix"
	; делаем вырезанное
	pop     edi
	pop     esi
	pop     ebp
	pop     ebx
	add     esp, 10h
	;
	pop ecx
	push ecx
	;
	push    1 ; признак типа, 1 - CWeaponMagazined
	push    1 ; признак типа
	push    158 ; константа - тип колбека
	;mov     ecx, edi ; this
	add     ecx, 0d8h
	call    CGameObject__callback ; eax = callback
	push    eax ; callback
	call    script_callback_int_int
	;
	pop ecx
	;PRINT_UINT "CWeaponMagazined__InitAddons_fix2: this = ecx = %d", ecx
	
	retn
CWeaponMagazined__InitAddons_fix2 endp

CWeaponMagazinedWGrenade__InitAddons_fix proc
	push ecx
	
	push    2 ; признак типа, 2 - CWeaponMagazinedWGrenade
	push    2 ; признак типа
	push    158 ; константа - тип колбека
	mov     ecx, esi ; this
	add     ecx, 0d8h
	call    CGameObject__callback ; eax = callback
	push    eax ; callback
	call    script_callback_int_int
	
	pop ecx

	;PRINT "CWeaponMagazinedWGrenade__InitAddons_fix"
	; делаем вырезанное
	pop     esi
	retn
CWeaponMagazinedWGrenade__InitAddons_fix endp


CWeaponMagazined__InitAddons_fix_dbg1 proc
	;PRINT_UINT "CWeaponMagazined__InitAddons_fix_dbg1: edi = %d", edi
	push    eax
	mov     eax, [edx+20h]
	mov     ecx, ebp
	;
	jmp back_from_CWeaponMagazined__InitAddons_fix_dbg1
CWeaponMagazined__InitAddons_fix_dbg1 endp

CWeaponMagazined__InitAddons_fix0 proc
	;PRINT_UINT "CWeaponMagazined__InitAddons_fix_dbg2: ecx = %d", ecx
	;
	; saving this pointer
	push ecx
	;
	sub     esp, 10h
	push    ebx
	push    ebp
	push    esi
	jmp back_from_CWeaponMagazined__InitAddons_fix0
CWeaponMagazined__InitAddons_fix0 endp

; =========================================================================================
; ========================= added by Ray Twitty (aka Shadows) =============================
; =========================================================================================
; ====================================== START ============================================
; =========================================================================================
; отключение автоматической перезарядки оружия
;void CWeaponMagazined::switch2_Empty() {
;	OnZoomOut();
;	if (ParentIsActor()) {
;		SwitchState(eIdle);
;		OnEmptyClick();
;	} else if (!TryReload())
;		OnEmptyClick();
;	else
;		inherited::FireEnd();
;}
CWeaponMagazined__switch2_Empty_fix proc
	mov     eax, [esi]
	mov     edx, [eax+1Ch]
	mov     ecx, esi
	call    edx ; ParentIsActor()
	test    eax, eax
	jz      exit

	mov     eax, [esi+288h]
	mov     edx, [eax+28h]
	lea     ecx, [esi+288h]
	push    0
	call    edx ; SwitchState(eIdle);
	mov     ecx, esi
	jmp     loc_10227088 ; goto OnEmptyClick();

exit:
	; делаем вырезанное
	call    CWeaponMagazined__TryReload
	test    al, al
	mov     ecx, esi
	jnz     loc_10227093 ; goto inherited::FireEnd();
	jmp     loc_10227088 ; goto OnEmptyClick();
CWeaponMagazined__switch2_Empty_fix endp
; =========================================================================================
; ======================================= END =============================================
; =========================================================================================
