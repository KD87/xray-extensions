aErrorInStalker_new db "! visual's error in stalker with name %s"

CALifeStoryRegistry__add_fix:
	cmp     eax, [ebp+8]
	jz      loc_1006CA49
	PRINT_UINT "Warning! Was found duplicate story id [%d].", edi
	jmp		loc_1006CA65
	
	
aSh db "hud\scope", 0