game_graph__distance_fix proc
	movss	xmm3, ds:dword_104D2568
	comiss	xmm0, xmm3
	jnz		exit_with_good_distance
			
	; ага, проблемный путь. Надо его сбросить.
	mov     ecx, [ebp+30h]
	mov		[ebp+34h], ecx
	
	jmp		loc_100569C9

exit_with_good_distance:
	; делаем вырезанное
	movss   xmm1, dword ptr [ebp+24h]
	jmp back_from_game_graph__distance_fix
game_graph__distance_fix endp

dword_104D2568 dd 65535.0