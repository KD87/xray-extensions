hemi_update_fix proc
update_hemi:
	mov     eax, [edi+28Ch]
	mov     ecx, [esp+10h]
	lea     eax, [eax+ecx*4]
	mov     ecx, [eax]
	mov     edx, [ecx]
	mov     eax, [edx+18h]
	call    eax
	mov     ebx, eax
	test    ebx, ebx
	jz      short next_entity
	mov     ecx, ebx
	call    ds:IRenderable__renderable_ROS
	test    eax, eax
	jz      short next_entity
	push    eax             ; this
	mov     eax, ebx        ; O
	call    CROS_impl__update
	jmp		hemi_updated
	
next_entity:
	xor		ebx, ebx
	add		ebx, 1
	add     [edi+320h], ebx
	mov     ecx, [esi+4]
	test    ecx, ecx
	mov     eax, [edi+320h]
	jz      short hemi_updated
	mov     edx, [esi+8]
	sub     edx, ecx
	sar     edx, 2
	jz      short hemi_updated
	mov		eax, [edi+320h]
	cmp		eax, edx
	jz		short zero_update_counter
	mov     edx, ecx
	test    edx, edx
	jz      short loc_1000BA48
	mov     ecx, [esi+8]
	sub     ecx, edx
	sar     ecx, 2

loc_1000BA48:
	xor     edx, edx
	div     ecx
	mov     [esp+10h], edx
	jmp		update_hemi

hemi_updated:
	jmp back_from_hemi_update_fix
	
zero_update_counter:
	xor		ebx, ebx
	mov		[edi+320h], ebx
	jz		short hemi_updated
hemi_update_fix endp

hemi_smooth_fix proc
	movss	xmm0, dword ptr [ecx+1F8h]
	movss	xmm2, hemi_smooth_modifier
	mulss	xmm0, xmm2
	jmp	back_from_hemi_smooth_fix
hemi_smooth_fix endp

hemi_smooth_modifier dd 10.0