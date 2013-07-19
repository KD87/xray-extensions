CCustomZone__hit_callback:
	push	eax
	push	edi
	call 	CCustomZone__set_callback

	; Вырезанное
	mov		ebp, esp
	and		esp, 0FFFFFFF8h
	
	; Возврат
	jmp 	CCustomZone__hit_callback_back

CCustomZone__PlayHitParticles: ; CCustomZone *this<ebx>, CGameObject *pObject<eax>
	push	eax
	push	ebx

	call	CCustomZone__set_callback

	; Вырезанное.
	fldz
	sub esp, 10h
	
	; Возврат.
	jmp CCustomZone__PlayHitParticles_Back

CCustomZone__set_callback proc
anom = dword ptr 8
obj = dword ptr 0Ch
	push	ebp
	mov		ebp, esp

	push	eax
	push	ecx
	push	edi
	
	mov 	edi, [ebp+obj]
	call 	CGameObject__lua_game_object
	
	push 	eax
	push 	128

	push    0               
	push    offset ??_R0?AVCGameObject@@@8
	push    offset off_1054E930 ; .?AVCCustomZone@@
	push    0
	push    [ebp+anom]             
	call    __RTDynamicCast
	add     esp, 14h

	mov 	ecx, eax
	call    CGameObject__callback
	push    eax
	call    script_use_callback

	pop		edi
	pop		ecx
	pop		eax
	pop		ebp
	
	retn	8
CCustomZone__set_callback endp

CTorch__Switch_Callback:      ; CTorch* <esi>, light_on <al>
	push	edi
	
	xor		ebx, ebx
	mov		bl, al
	
	push    0               
	push    offset ??_R0?AVCGameObject@@@8
	push    offset off_10538CFC ; AVCTorch
	push    0
	push    esi             
	call    __RTDynamicCast
	add     esp, 14h	

	push    0
	push    ebx

	push    134 
	mov     ecx, eax
	call    CGameObject__callback
	push    eax
	call    script_callback_int_int	

	pop		edi
	mov		eax, ebx

	mov 	ecx, [esi+18Ch]

	jmp 	CTorch__Switch_Callback_Back