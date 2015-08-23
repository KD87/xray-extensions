aErrorInStalker_new db "! visual's error in stalker with name %s"

CALifeStoryRegistry__add_fix:
	cmp     eax, [ebp+8]
	jz      loc_1006CA49
	PRINT_UINT "Warning! Was found duplicate story id [%d].", edi
	jmp		loc_1006CA65

aSh db "hud\scope", 0
a_torso_5_aim_0 db "_torso_5_aim_0", 0
aTracerTexture db "effects\bullet_tracer", 0
TALK_DIST dd 150.0
