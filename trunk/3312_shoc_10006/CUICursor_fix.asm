cursor_change_sens:
	mov		edx, g_ui_mouse_sens
	mov		dword ptr[eax+84h], edx
	fld     dword ptr [eax+84h]

	jmp		cursor_change_sens_back