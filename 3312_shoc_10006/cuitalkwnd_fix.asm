CUITalkWnd__Hide_fix:
	push	offset aUi_talk_hide
	call	SendInfoToActor
	add		esp, 4
	
	; Вырезанное.
	mov		eax, [esi]
	mov		edx, [eax+74h]
	
	jmp		CUITalkWnd__Hide_fix_back