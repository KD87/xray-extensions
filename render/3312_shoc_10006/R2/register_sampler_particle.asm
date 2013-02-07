particle_sampler_register:
	jz      short loc_1003CE2B
	add     dword ptr [edx], 0FFFFFFFFh
	mov     edx, [eax]
	cmp     dword ptr [edx], 0
	jnz     short loc_1003CE2B
	mov     dword ptr [eax], 0

loc_1003CE2B:
	mov     [eax], ecx
	push    offset aS_base  ; "s_base"
	mov     ecx, esi
	call    ds:CBlender_Compile__r_Sampler1 ; CBlender_Compile::r_Sampler(char const *,shared_str,bool,uint,uint,uint,uint)

REGISTER_SAMPLER_CUSTOM "$user$position", "s_position", 0, 1, 2, 2, 2

	jmp back_to_particle_sampler_register

aS_base db "s_base", 0