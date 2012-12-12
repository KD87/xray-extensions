REGISTER_CONSTANT_VECTOR MACRO 
LOCAL loc_48EB10
LOCAL loc_48EB1E
LOCAL loc_48EB28
LOCAL loc_48EB61
LOCAL loc_48EB6F
LOCAL locret_48EB79
	test    byte ptr [ecx+0Ah], 1
	jz      short loc_48EB28
	movzx   eax, word ptr [ecx+0Ch]
	shl     eax, 4
	add     eax, offset RCache_constants_a_pixel
	movss   dword ptr [eax], xmm0
	movss   dword ptr [eax+4], xmm1
	movss   dword ptr [eax+8], xmm2
	movss   dword ptr [eax+0Ch], xmm3
	movzx   eax, word ptr [ecx+0Ch]
	cmp     eax, dword_50D3D4
	lea     edx, [eax+1]
	jnb     short loc_48EB10
	mov     dword_50D3D4, eax
loc_48EB10:                             ; CODE XREF: sub_48EAB0+59j
	cmp     edx, dword_50D3D8
	jbe     short loc_48EB1E
	mov     dword_50D3D8, edx
loc_48EB1E:                             ; CODE XREF: sub_48EAB0+66j
	mov     RCache_constants_a_pixel_b_dirty, 1
loc_48EB28:                             ; CODE XREF: sub_48EAB0+2Bj
	test    byte ptr [ecx+0Ah], 2
	jz      short locret_48EB79
	movzx   eax, word ptr [ecx+10h]
	shl     eax, 4
	add     eax, offset RCache_constants_a_vertex
	movss   dword ptr [eax], xmm0
	movss   dword ptr [eax+4], xmm1
	movss   dword ptr [eax+8], xmm2
	movss   dword ptr [eax+0Ch], xmm3
	movzx   eax, word ptr [ecx+10h]
	cmp     eax, dword_50E3F4
	lea     ecx, [eax+1]
	jnb     short loc_48EB61
	mov     dword_50E3F4, eax
loc_48EB61:                             ; CODE XREF: sub_48EAB0+AAj
	cmp     ecx, dword_50E3F8
	jbe     short loc_48EB6F
	mov     dword_50E3F8, ecx
loc_48EB6F:                             ; CODE XREF: sub_48EAB0+B7j
	mov     RCache_constants_a_vertex_b_dirty, 1
locret_48EB79:
ENDM

REGISTER_CONSTANT_MATRIX MACRO 
LOCAL loc_407036
LOCAL loc_407055
LOCAL loc_407056
	push    ebp
	push    edi
	mov     edi, [esp+0Ch]
	test    edi, edi
;	mov     [ecx+194h], edi
	lea     ebp, [ecx]
	jz      short loc_407056
	test    byte ptr [edi+0Ah], 1
	push    esi
	jz      short loc_407036
	lea     eax, [edi+0Ch]
	mov     ecx, ebp
	mov     esi, offset RCache_constants_a_pixel
	call    R_constant_array__set
	mov     RCache_constants_a_pixel_b_dirty, 1
loc_407036:    
	test    byte ptr [edi+0Ah], 2
	jz      short loc_407055
	lea     eax, [edi+10h]
	mov     ecx, ebp
	mov     esi, offset RCache_constants_a_vertex
	call    R_constant_array__set
	mov     RCache_constants_a_vertex_b_dirty, 1
loc_407055:       
	pop     esi
loc_407056:      
	pop     edi
	pop     ebp
	retn    4
ENDM
