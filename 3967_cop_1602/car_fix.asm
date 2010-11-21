; можно кататься в ЗП на машинках

;на стеке указатель на машину(CHolderCustom)
CActor__attach_Vehicle proc
pCar           = dword ptr  8

	push    ebp
	mov     ebp, esp
	push    ebx
	push    esi
	push    edi
	mov     edi, [ebp+pCar]
	xor     ebx, ebx
	cmp     edi, ebx
	mov     esi, ecx
	jz      m_end
	
	;call    CActor__PickupModeOff
	mov     [esi+4C4h], edi
	
	mov     ecx, [esi+4C4h]
	mov     eax, [ecx]
	push    esi
	;CHolderCustom::attach_Actor
	call    dword ptr [eax+28h] 
	test    al, al
	jnz     m_1
	mov     [esi+4C4h], ebx
	jmp     m_end

m_1:
	mov     eax, [esi+4C4h]
	cmp     eax, ebx
	jnz     loc_101C19B5
	xor     edi, edi
	jmp     loc_101C19BE

loc_101C19B5:  
	push    eax
	call    SmartDynamicCast__CSmartMatcher_CCar_CHolderCustom___smart_cast_
	pop     ecx
	mov     edi, eax

loc_101C19BE:
	mov     eax, [esi]
	mov     ecx, esi
	call    dword ptr [eax+194h]
	mov     ecx, [eax+0A4h]
	call    CPHMovementControl__DestroyCharacter

	mov     ax, [edi+0A4h]
	mov     [esi+4C8h], ax
	
	movzx   eax, INV_STATE_CAR
	push    1
	push    eax
	mov     ecx, esi
	call CActor__SetWeaponHideState
	
m_end:
	pop     edi
	pop     esi
	pop     ebx
	pop     ebp
	retn    4	
CActor__attach_Vehicle endp

CActor__use_Vehicle_chunk_1 proc
	mov     dword ptr [esi+540h], 0
	mov     ebx, [esp+14h+arg_0]
	push    ebx
	mov     ecx, esi
	call    CActor__attach_Vehicle;CActor__attach_Vehicle
	jmp		loc_10278B94
CActor__use_Vehicle_chunk_1 endp

SmartDynamicCast__CSmartMatcher_CCar_CHolderCustom___smart_cast_ proc
arg_0           = dword ptr  4

	push    0
	push    offset _R0_AVCCar ; CCar `RTTI Type Descriptor'
	push    offset _R0_AVCHolderCustom ; CHolderCustom `RTTI Type Descriptor'
	push    0
	push    [esp+10h+arg_0]
	call    __RTDynamicCast
	add     esp, 14h
	retn
SmartDynamicCast__CSmartMatcher_CCar_CHolderCustom___smart_cast_ endp
