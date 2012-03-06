CUITalkDialogWnd__Hide_test:
	pusha
	PRINT "CUITalkDialogWnd__Hide"
	popa
;--
	mov     eax, [esi]
	mov     edx, [eax+74h]
	add     esp, 4
	push    0
	mov     ecx, esi
	mov     byte ptr [esi+4], 0
	call    edx
	mov     byte ptr [esi+56h], 0
	pop     esi
	retn

ALIGN 8
CLevel__g_sv_Spawn_fix proc
	; делаем то, что вырезали
	lea     edi, [ebx+54h]
	push    eax
	PRINT_UINT "creating object: %s", eax
	mov     ecx, edi
	call    CObjectList__Create
	jmp     back_from_CLevel__g_sv_Spawn_fix
CLevel__g_sv_Spawn_fix endp

CLevel__g_sv_Spawn_fix2 proc
	PRINT "finished creating object"
	pop     edi
	pop     esi
	pop     ebp
	add     esp, 2014h
	retn    4
CLevel__g_sv_Spawn_fix2 endp
