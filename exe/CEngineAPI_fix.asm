WinMain_impl_fix proc
	pop eax ; затычка для того, чтобы вернуть указатель стека
	;
	mov     ecx, [Console]
	push    offset aRendererRend_0 ; "renderer renderer_r2"
	call    CConsole__Execute
	;
	jmp back_from_WinMain_impl_fix
WinMain_impl_fix endp

CCC_r2__Execute_fix proc
	mov     [renderer_value], 2 ; на всякий случай
	push    1
	push    80000h
	mov     ecx, offset psDeviceFlags
	call    _flags_unsigned_int___set
	mov     [r2_sun_static], 0
	retn    4
CCC_r2__Execute_fix endp
