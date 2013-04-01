
CEnvironment__OnFrame_dbg_fix proc
var_68          = dword ptr -68h

	mov eax, [esp+80h+var_68]
	PRINT_FLOAT "TimeWeight: %7.5f", eax
	;
	mov     edx, ds:dword_50BE94
	mov     ecx, ds:dword_50BE9C
	;
	jmp back_from_CEnvironment__OnFrame_dbg_fix
CEnvironment__OnFrame_dbg_fix endp
