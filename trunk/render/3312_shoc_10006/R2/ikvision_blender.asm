CRenderTarget_constructor:
	lea     ecx, [edi+148h]
	call    esi
; новый код
	xor		ebx, ebx
	mov		esi, ebx
	mov     [edi+180h], ebx
	mov     [edi+184h], ebx
	mov     ecx, ds:_Memory
	push    144h
	call    ds:xrMemory__mem_alloc
	mov     ebx, eax
	cmp     ebx, esi
	jz      short cannot_alloc_memory_for_blender
	mov     ecx, ebx
	call    ds:IBlender__IBlender
	mov     dword ptr [ebx], offset CBlender_ikvision__vfptr
	mov     [ebx+4], esi
	mov     [ebx+8], esi
	mov		esi, ebx
cannot_alloc_memory_for_blender:
	mov		[edi+180h], esi
	mov		esi, ds:resptrcode_shader__create
	push    0
	push    0
	push    0
	push    offset aR2ikvis ; "r2\ogse_ikvision"
	mov		ebx, [edi+180h]
	push	ebx
	lea     ecx, [edi+184h]
	call    esi
exit_CRenderTarget_constructor:
	mov		eax, ds:Device
	jmp back_to_CRenderTarget_constructor
	
CRenderTarget_phase_combine_add:
	lea     ecx, [eax+edx*4+8]
	test	posteffect_flags, 1
	jz		no_ikvision
	mov		ecx, [ebx+184h]
	lea		ecx, [ecx+8]
no_ikvision:
	push    ecx
	jmp back_to_CRenderTarget_phase_combine_add
	
	; создаем новый класс CBlender_ikvision
	
	; таблица виртуальных функций дл€ нового класса
CBlender_ikvision__vfptr dd offset IBlender__getName
	dd offset CBlender_ikvision__getComment
	dd offset IBlender__Save
	dd offset IBlender__Load
	dd offset CBlender_light_occq__canBeLMAPped
	dd offset CBlender_light_occq__canBeLMAPped
	dd offset CBlender_ikvision__Compile
	dd offset CBlender_ikvision___scalar_deleting_destructor

	; коммент
CBlender_ikvision__getComment proc
	mov		eax, offset aIKVisComment
	retn
CBlender_ikvision__getComment endp

	; деструктор
CBlender_ikvision___scalar_deleting_destructor proc
arg_0 = byte ptr 4
	push    esi
	mov     esi, ecx
	mov     dword ptr [esi], offset CBlender_ikvision__vfptr
	call    ds:IBlender___IBlender
	test    [esp+4+arg_0], 1
	jz      short exit
	mov     ecx, ds:_Memory
	push    esi
	call    ds:xrMemory__mem_free
exit:
	mov     eax, esi
	pop     esi
	retn    4
CBlender_ikvision___scalar_deleting_destructor endp

	; компил€ци€
CBlender_ikvision__Compile proc
	push    esi
	mov     esi, [esp+8]
	push    esi
	call    ds:IBlender__Compile
	push    0              
	push    0
	push    1
	push    2
	push    0
	push    0
	push    0
	push    0
	push    offset aIKvis ; "ogse_ikvision"
	push    offset aNull ; "null"
	mov     ecx, esi
	call    ds:CBlender_Compile__r_Pass
	
REGISTER_SAMPLER_RTF "$user$position", "s_position"
REGISTER_SAMPLER_CLF "$user$generic1", "s_distort"
REGISTER_SAMPLER_CLF "$user$generic0", "s_image"
REGISTER_SAMPLER_CUSTOM "$user$jitter_0", "s_jitter_0", 0, 1, 2, 0, 2
REGISTER_SAMPLER_CUSTOM "$user$jitter_1", "s_jitter_1", 0, 1, 2, 0, 2
REGISTER_SAMPLER_CUSTOM "$user$jitter_5", "s_jitter_5", 0, 1, 2, 0, 2

	mov     ecx, esi
	call    ds:CBlender_Compile__r_End
	pop     esi
	retn    4
CBlender_ikvision__Compile endp

aR2ikvis db "r2\\ogse_ikvision", 0
aIKVisComment db "INTERNAL:ikvision", 0
aIKvis db "ogse_ikvision", 0
aNull db "null", 0