actor_torch_light proc
	mov		edi, [esi+2ACh]
;	mov		edi, [edi]
	mov		bl, byte ptr [esi+2A8h]
	test	bl, 1
	jz		torch_off
	mov		esi, yes
	jmp		torch_exit
	
torch_off:
	mov		esi, no
	
torch_exit:	
	mov		dword ptr [edi+290h], esi
	pop     edi
	pop     esi
	pop     ebx
	mov     esp, ebp
	jmp back_from_actor_torch_light
actor_torch_light endp

yes dd 1
no dd 0
