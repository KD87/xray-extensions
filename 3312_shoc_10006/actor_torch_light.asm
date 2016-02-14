;actor_torch_light proc
;	mov		edi, [esi+2ACh]
;	mov		edi, [edi]
;	mov		bl, byte ptr [esi+2A8h]
;	test	bl, 1
;	jz		torch_off
;	mov		esi, yes
;	jmp		torch_exit
	
;torch_off:
;	mov		esi, no
	
;torch_exit:	
;	mov		dword ptr [edi+290h], esi
;	pop     edi
;	pop     esi
;	pop     ebx
;	mov     esp, ebp
;	jmp back_from_actor_torch_light
;actor_torch_light endp

actor_torch_light proc
; делаем свое.
	push	edi
	mov		edi, [esi+18Ch]
	test	edi, edi
	jz		short torch_full_exit
	movzx	edi, word ptr [edi+0A4h]
;	PRINT_UINT "TESTING OBJECT %d", edi
	test	edi, edi
	jnz		short torch_full_exit		
	mov		edi, [esi+2ACh]
	mov		al, byte ptr [esi+2A8h]
	test	al, 1
	jz		short torch_off
	mov		edx, yes
	jmp		short torch_exit
	
torch_off:
	mov		edx, no
	
torch_exit:	
;	PRINT_UINT "TORCH FLAG IS %d", edx
	mov		dword ptr [edi+290h], edx
torch_full_exit:
	pop		edi
; делаем затертое
	mov		ecx, [esi+2B4h]
	jmp back_from_actor_torch_light
actor_torch_light endp

yes dd 1
no dd 0
