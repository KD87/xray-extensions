;.text:0048D0E1                 mov     eax, [eax+10h]
;.text:0048D0E4                 cmp     eax, ebp
;.text:0048D0E6                 jz      short loc_48D0FC
;.text:0048D0E8                 movzx   eax, byte ptr [eax+8]
;.text:0048D0EC                 mov     ecx, eax
;.text:0048D0EE                 and     ecx, 1
;.text:0048D0F1                 shr     eax, 1
;.text:0048D0F3                 and     eax, 3
;.text:0048D0F6                 mov     [edi+40h], ecx
;.text:0048D0F9                 mov     [edi+44h], eax

cblender_cpp_compile_hack:
	mov     edx, [eax+10h]
	cmp     edx, ebp
	jz      short check_texture_spec_for_parallax
	; common check for texture assoc
	movzx   edx, byte ptr [edx+8]
	mov     ecx, edx
	and     ecx, 1
	shr     edx, 1
	and     edx, 1
	mov     [edi+40h], ecx
	mov     [edi+44h], edx	
	
check_texture_spec_for_parallax:
	mov     eax, [eax+14h]
	cmp     eax, ebp				; ebp = 0
	jz		no_parallax
	movzx   eax, byte ptr [eax+8]	
	and     eax, 1
	shl		eax, 1
	or		[edi+44h], eax
	
no_parallax:
	jmp back_from_cblender_cpp_compile_hack
	 
	 