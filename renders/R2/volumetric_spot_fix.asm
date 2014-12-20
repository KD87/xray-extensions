volumetric_spot proc
	
start_spot: 
	cmp     edi, eax
	jnb     short start_volumetric
	mov     ecx, [ebx+edi*4] ; this
	mov     edx, [esi+504h]
	push    ecx
	push    edx             ; L
	call    CRenderTarget__accum_spot
	mov     eax, [ebx+edi*4]
	push    eax
	push    esi             ; L
	call    CRender__render_indirect
	mov     eax, [esp+18h]
	add     edi, 1
	jmp     short start_spot
	
start_volumetric:
	xor		edi, edi
	test	ps_r2_ls_flags, 1000h
	jz		short exit_volumetric
	
continue_volumetric:
	cmp     edi, eax
	jnb     short exit_volumetric
	mov     ecx, [ebx+edi*4] ; this
	push    ecx
	mov     ecx, [esi+504h]
	call    g_CRenderTarget__accum_volumetric_spot
;	mov     eax, [ebx+edi*4]
;	push    eax
;	push    esi             ; L
;	call    CRender__render_indirect
	mov     eax, [esp+18h]
	add     edi, 1
	jmp     short continue_volumetric

exit_volumetric:
	jmp back_from_volumetric_spot
volumetric_spot endp
