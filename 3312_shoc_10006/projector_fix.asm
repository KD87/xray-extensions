
; Hit(SHit* pHDS);
Projector__Hit proc
pHDS = dword ptr  8
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	push    edx
	
	mov     esi, ecx
	mov     edx, [ebp+pHDS]
	assume  edx:PTR SHit
; аргументы помещаем с конца
	movzx   eax, [edx].boneID
	;PRINT_UINT "boneid = %d", eax
	push    eax
	
	mov     edi, [edx].who
	;PRINT_UINT "who=%x", edi
	call    CGameObject__lua_game_object ; eax = who_go
	push    eax             ; who_go
	;PRINT "who is done"
	
	lea     eax, [edx].dir_
	;PRINT_vector "dir", eax
	mov     ecx, [eax + 8h]
	push    ecx ; push dir_x
	mov     ecx, [eax + 4h]
	push    ecx ; push dir_y
	mov     ecx, [eax]
	push    ecx ; push dir_z
	
	mov     eax, [edx].power
	assume edx:nothing
	;PRINT_FLOAT "power = %f", eax
	push    eax
	
	mov     edi, esi
	call    CGameObject__lua_game_object ; target_go
	push    eax             ; target_go
	;PRINT "target is done"
	
	push    10h ; type = hit
	mov     ecx, esi ; ecx = this
	call    CGameObject__callback ; eax = hit_callback
	push    eax ; callback
	;PRINT "calback"

	call    script_hit_callback
	;PRINT "called"
	
	pop     edx
	pop     edi
	pop     esi
	
	pop     ebx
	mov     esp, ebp
	pop     ebp
	retn 4
Projector__Hit endp
