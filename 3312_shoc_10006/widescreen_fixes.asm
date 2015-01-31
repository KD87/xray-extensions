
width_k dd 3F400000h	; 0.75 for 16:9 mode
CUIMainIngameWnd__UpdatePickUpItem_EXT_CHUNK proc
var_4		= dword ptr -4h
var_18		= dword ptr -18h

	call	ui_core__is_16_9_mode
	test	al, al
	jz      NOT_16_9_MODE
	movss   xmm0, dword ptr [esp+14h]				; width
	mulss   xmm0, [esp+14h+var_4]					; scale
	movss   xmm1, ds:width_k
	mulss   xmm0, xmm1
	jmp		PROC_CONTINUE

NOT_16_9_MODE:
	movss   xmm0, dword ptr [esp+14h]				; width
	mulss   xmm0, [esp+14h+var_4]					; scale
	
PROC_CONTINUE:
	mov     edx, [esi+3448h]
	mov     eax, [edx+28h]
	lea     edi, [esi+3448h]
	push    ecx
	mov     ecx, edi
	movss   dword ptr [esp+18h+var_18], xmm0
	call    eax
	
	jmp		CUIMainIngameWnd__UpdatePickUpItem_EXT_CHUNK_OUT
CUIMainIngameWnd__UpdatePickUpItem_EXT_CHUNK endp


scaled_width dd 3F554FDFh		; 0.83325 == 1.111 * 0.75 (for 16:9) , 1.111 == 50/45
scaled_height dd 42480000h		; 50 - scaled height
dword_104D2484 dd 42340000h		; 45 - original height
CUIMainIngameWnd__SetAmmoIcon_EXT_CHUNK proc
var_4		= dword ptr -4h
var_14		= dword ptr -14h

; UIWeaponIcon.SetWidth(w)
; ------------- NEW CODE----------------
	call	ui_core__is_16_9_mode
	test	al, al
	jz      NOT_16_9_MODE
	movss   xmm0, ds:scaled_width
	mulss   xmm0, [esp+10h+var_4]
	movss   dword ptr [esp+10h+var_4], xmm0
	mov     edx, [edi]
	fld     [esp+10h+var_4]
	mov     eax, [edx+28h]
	push    ecx
	mov     ecx, edi
	fstp    [esp+14h+var_14]
	call    eax
	fld     ds:scaled_height
	mov     edx, [edi]
	mov     eax, [edx+24h]
	push    ecx
	mov     ecx, edi
	fstp    [esp+14h+var_14]
	call    eax
	pop     edi
	add     esp, 0Ch
	retn

NOT_16_9_MODE:
; ------------- NEW CODE----------------
	mov     edx, [edi]
	fld     [esp+10h+var_4]
	mov     eax, [edx+28h]
	push    ecx
	mov     ecx, edi
	fstp    [esp+14h+var_14]
	call    eax
	fld     ds:dword_104D2484
	mov     edx, [edi]
	mov     eax, [edx+24h]
	push    ecx
	mov     ecx, edi
	fstp    [esp+14h+var_14]
	call    eax
	pop     edi
	add     esp, 0Ch
	retn

; DEBUG:
;	mov     eax, [esp+10h+var_4]
;	PRINT_FLOAT "icon_width=%f",eax
CUIMainIngameWnd__SetAmmoIcon_EXT_CHUNK endp
