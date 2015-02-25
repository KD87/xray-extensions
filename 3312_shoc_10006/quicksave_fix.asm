quicksave_fix proc
	mov		dword ptr [ebp-1A8h], offset aKquick ; "kQUICK_SAVE"
	mov		dword ptr [ebp-1A4h], 4Bh
	mov		dword ptr [ebp-13Ch], offset aKteam ; "kTEAM"
	
	jmp back_from_quicksave_fix
quicksave_fix endp

quicksave_fix2 proc
	lea		ecx, dword ptr [ebp-1A8h]
	call	sub_100106E0
	lea		ecx, dword ptr [ebp-154h]

	jmp back_from_quicksave_fix2
quicksave_fix2 endp

aKteam db "kTEAM", 0
aKquick db "kQUICK_SAVE", 0