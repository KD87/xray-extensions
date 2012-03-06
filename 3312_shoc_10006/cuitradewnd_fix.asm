; int this<eax>, int item<ebx>
CUITradeWnd__CanMoveToOther_fix proc
	; делаем своё
	; проверяем глобальный флажок
	push    eax
	mov     eax, [g_trade_filtration_active]
	test    eax, eax
	pop     eax
	jz      no_filtration
	; проверяем флажок явной установки торговли предмета
	push    eax
	push    ebx
	;mov     eax, [ebx]      ; item
	mov     eax, [ebx+132] ; флажки торговли предмета
	;and eax, 0ffffh
	;PRINT_UINT "1st_check: %x", ebx
	and     eax, 01000h
	pop     ebx
	pop     eax
	jz      no_explicit_enable
	PRINT "explicitly tradable"
	mov     eax, 1
	retn
no_explicit_enable:
	; проверяем флажок явного запрета торговли предмета
	push    eax
	push    ebx
	;mov     eax, [ebx]      ; item
	mov     eax, [ebx+132] ; флажки торговли предмета
	;and eax, 0ffffh
	;PRINT_UINT "2nd_check: %x", ebx
	and     eax, 02000h
	pop     ebx
	pop     eax
	jz      no_explicit_disable
	PRINT "explicitly untradable"
	xor     eax, eax
	retn
no_explicit_disable:
;
no_filtration:
	; делаем то, что вырезали
	sub     esp, 1Ch
	push    esi
	mov     esi, eax
	mov     eax, [esi+5Ch]
	; идём обратно
	jmp     back_from_CUITradeWnd__CanMoveToOther_fix
CUITradeWnd__CanMoveToOther_fix endp

CUITradeWnd__FillList_fix proc
this_           = dword ptr  4
	; делаем, что вырезали
	mov     ebx, [esi]      ; a2
	; делаем своё
	push    eax
	mov     eax, [g_trade_filtration_active]
	test    eax, eax
	pop     eax
	jz      no_filtration
	;
	push    eax
	mov     eax, [ebx+132] ; флажки торговли предмета
	and     eax, 01000h
	pop     eax
	jz      no_explicit_enable
	mov     al, 1
	jmp     lab1
no_explicit_enable:
;
	push    eax
	mov     eax, [ebx+132] ; флажки торговли предмета
	and     eax, 02000h
	pop     eax
	jz      no_explicit_disable
	mov     al, 0
	jmp     lab1
no_explicit_disable:
no_filtration:
	;push eax
	;mov eax, [ebx+132]
	;PRINT_UINT "%x", eax
	;pop eax
	;
	mov     eax, [esp+10h+this_] ; this
	call    CUITradeWnd__CanMoveToOther
lab1:
	test    al, al
	; идём обратно
	jmp     back_from_CUITradeWnd__FillList_fix
CUITradeWnd__FillList_fix endp
