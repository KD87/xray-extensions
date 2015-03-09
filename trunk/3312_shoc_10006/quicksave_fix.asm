;quicksave_fix proc
;	mov		dword ptr [ebp-1A8h], offset aKquick ; "kQUICK_SAVE"
;	mov		dword ptr [ebp-1A4h], 4Bh
;	mov		dword ptr [ebp-13Ch], offset aKteam ; "kTEAM"
;	
;	jmp back_from_quicksave_fix
;quicksave_fix endp

;quicksave_fix2 proc
;	lea		ecx, dword ptr [ebp-1A8h]
;	call	sub_100106E0
;	lea		ecx, dword ptr [ebp-154h]
;
;	jmp back_from_quicksave_fix2
;quicksave_fix2 endp

;aKteam db "kTEAM", 0
;aKquick db "kQUICK_SAVE", 0

quicksave_fix proc
	mov		ecx, ds:Console
	mov		ecx, [ecx]
	mov		eax, offset aMain_menuOn ; "main_menu on"
	push	eax
	call	ds:CConsole__Execute

	mov		ecx, ds:Console
	mov		ecx, [ecx]
	mov		eax, offset aSave ; "save"
	push	eax
	call	ds:CConsole__Execute

	pop     edi
	pop     esi
	pop     ebp
	pop     ebx
	add     esp, 414h
	mov     [esp+4], offset aMain_menuOff ; "main_menu off"
	mov     eax, ds:Console
	mov     ecx, [eax]
	jmp     ds:CConsole__Execute
quicksave_fix endp

aSave db "save", 0
aMain_menuOn db "main_menu on", 0
aMain_menuOff db "main_menu off", 0