CEffectorZoomInertion__Process_fix proc
	mov eax, [g_CEffectorZoomInertion__Process]
	test eax, eax
	jz no_replacement
	jmp [g_CEffectorZoomInertion__Process]
no_replacement:
	sub     esp, 0Ch
	push    ebx
	push    esi
	;
	jmp back_from_CEffectorZoomInertion__Process_fix
CEffectorZoomInertion__Process_fix endp
