carbody_scroll_fix proc
	push    esi
	push	edi
	mov     esi, ecx
	cmp     byte ptr [esi+64h], 0
	jnz     short loc_103CC12E
	mov     eax, ds:Device
	mov     ecx, [eax+0F4h]
	mov     edx, [esi+68h]
	mov     eax, [edx+24h]
	cmp     [eax+78h], ecx
	jz      short loc_103CC12E
	mov     eax, [esi+6Ch]
	test    eax, eax
	jz      loc_103CC133
	mov     edx, [eax+24h]
	cmp     [edx+78h], ecx
	jnz     loc_103CC133

loc_103CC12E:
	mov     eax, [esi+74h]
	mov     eax, [eax+84h]
	mov     ecx, [eax+6Ch]
	mov     edx, [esi+78h]
	push    ebx
	mov     ebx, [eax+74h]
	mov     eax, [edx+84h]
	mov     edx, [eax+6Ch]
	mov     eax, [eax+74h]
	mov     our_scroll, ecx
	mov     ecx, eax
	sub     ecx, edx       ; ecx
	mov     edx, ecx
	sar     edx, 1Fh
	and     edx, ecx
	sub     eax, edx
	push    ebp
	mov     other_scroll, eax
	call    CUICarBodyWnd__UpdateLists
	mov     ebp, [esi+74h]
	mov     edi, [ebp+84h]
	mov     eax, ebx
	sub     eax, our_scroll
	mov     ecx, eax
	sar     ecx, 1Fh
	and     ecx, eax
	mov     eax, [edi+78h]
	sub     eax, [edi+7Ch]
	sub     ebx, ecx
	mov     [edi+6Ch], ebx
	mov     edx, [edi+74h]
	mov     ecx, ebx       ; ecx
	inc     eax
	cmp     ecx, edx
	jge     short loc_102630E4
	mov     [edi+6Ch], edx
	jmp     short loc_102630EB

loc_102630E4:                           ; CODE XREF: CUICarBodyWnd::Update(void)+9Dj
	cmp     ecx, eax
	jle     short loc_102630EB
	mov     [edi+6Ch], eax

loc_102630EB:                           ; CODE XREF: CUICarBodyWnd::Update(void)+A2j
	push	esi
	mov		esi, edi
	call    CUIScrollBar__UpdateScrollBar ; CUIScrollBar::UpdateScrollBar(void)
	pop		esi
	mov     ecx, [ebp+84h]
	mov     edx, [ecx]
	mov     eax, [ecx+64h]
	mov     edx, [edx+70h]
	push    0
	push    1Bh
	push    eax
	call    edx
	mov     ebx, [esi+78h]
	mov     edi, [ebx+84h]
	mov     eax, other_scroll
	mov     [edi+6Ch], eax
	mov     eax, [edi+78h]
	sub     eax, [edi+7Ch]
	mov     ecx, [edi+6Ch] ; ecx
	mov     edx, [edi+74h]
	inc     eax
	cmp     ecx, edx
	jge     short loc_1026312B
	mov     [edi+6Ch], edx
	jmp     short loc_10263132

loc_1026312B:                           ; CODE XREF: CUICarBodyWnd::Update(void)+E4j
	cmp     ecx, eax
	jle     short loc_10263132
	mov     [edi+6Ch], eax

loc_10263132:                           ; CODE XREF: CUICarBodyWnd::Update(void)+E9j
	push	esi
	mov		esi, edi
	call    CUIScrollBar__UpdateScrollBar ; CUIScrollBar::UpdateScrollBar(void)
	pop		esi
	mov     ebx, [ebx+84h]
	mov     edx, [ebx]
	mov     eax, [ebx+64h]
	mov     edx, [edx+70h]
	push    0
	push    1Bh
	push    eax
	mov     ecx, ebx
	call    edx
	pop     ebp
	pop     ebx

loc_103CC133:
	pop		edi
	jmp back_from_carbody_scroll_fix
carbody_scroll_fix endp

our_scroll dd 0
other_scroll dd 0