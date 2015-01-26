critical_hit_anim_fix:
	jz      short critical_hit_anim_fix_exit_early
	shl     eax, 4
	add     eax, [ecx+38h]
	mov     ecx, [eax+4]
	test    ecx, ecx
	jnz		short critical_hit_anim_fix_exit
	
critical_hit_anim_fix_exit_early:
	xor		eax, eax
	pop		esi
	pop		edi
	retn
	
critical_hit_anim_fix_exit:
	jmp back_from_critical_hit_anim_fix