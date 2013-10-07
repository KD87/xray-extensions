CCameraManager__Update2 proc near

var_10          = dword ptr -10h
var_C           = dword ptr -0Ch
var_8           = dword ptr -8
arg_0           = dword ptr  4

	PRINT "CCameraManager__Update2"
	mov     eax, [esp+arg_0]
	mov     edx, [eax+20h]
	push    edx
	mov     edx, ds:g_pGamePersistent
	mov     edx, [edx+46Ch]
	fld     dword ptr [edx+1B4h]
	sub     esp, 0Ch
	fstp    [esp+10h+var_8]
	lea     edx, [eax+64h]
	fld     dword ptr [eax+74h]
	fstp    [esp+10h+var_C]
	fld     dword ptr [eax+70h]
	fstp    [esp+10h+var_10]
	push    edx
	lea     edx, [eax+58h]
	push    edx
	add     eax, 4Ch
	push    eax
	call    [CCameraManager__Update0]
	retn    4
CCameraManager__Update2 endp

CCar__cam_Update_fix proc
	mov     ecx, [esi+2DCh]
	mov     edx, ds:g_pGameLevel
	mov     eax, [edx]
	push    ecx
	mov     ecx, [eax+40h]
	;call    [CCameraManager__Update1]
	;call    CCameraManager__Update2
	call [g_CCameraManager__Update3]
	pop     esi
	add     esp, 18h
	retn    8
CCar__cam_Update_fix endp

CCar__cam_Update_fix0 proc
	mov eax, [g_CCar__cam_Update]
	test eax, eax
	jz no_replacement
	jmp [g_CCar__cam_Update]
no_replacement:
	sub     esp, 18h
	xorps   xmm0, xmm0
	;
	jmp back_from_CCar__cam_Update_fix0
CCar__cam_Update_fix0 endp

