load_ltx_overload:
	mov		ecx, [esp+4]
	push	ecx
	call	g_CTextureDescrMngr__LoadLTX
	pop		ecx
	retn	4
	
load_thm_overload:
	mov		ecx, [esp+4]
	push	ecx
	call	g_CTextureDescrMngr__LoadTHM
	pop		ecx
	retn	4