rt_position_clear:
	; новое
	push	esi
	push	edi
	push	eax
	mov     ecx, ds:HW
	mov     edx, ds:Device
	mov     esi, [ecx+10h]
	mov     ecx, [eax+3Ch]
	mov     ecx, [ecx+10h]
	mov     edi, [edx+104h]
	mov     edx, [edx+100h]
	mov     [eax+4], edx
	mov     [eax+8], edi
;	mov     edx, [eax+40h]
;	mov     edx, [edx+10h]	
	push    0
	push    ecx
	mov     ecx, ds:RCache
	call    ds:CBackend__set_RT
	push    1
	push	0
;	push    edx
	mov     ecx, ds:RCache
	call    ds:CBackend__set_RT
	mov     ecx, ds:RCache
	push    2
	push    0
	call    ds:CBackend__set_RT
	mov     ecx, ds:RCache
	push    esi
	call    ds:CBackend__set_ZB
	fld1
	mov     eax, ds:HW
	mov     eax, [eax+8]
	mov     ecx, [eax]
	mov     edx, [ecx+0ACh]
	push    0
	push    ecx
	fstp    dword ptr [esp]
	push    0
	push    1
	push    0
	push    0
	push    eax
	call    edx
	pop		eax
	; вырезанное
	mov     ecx, ds:HW
	mov     edx, ds:Device
	mov     esi, [ecx+10h]
	mov     ecx, [ecx+0Ch]
	mov     edi, [edx+104h]
	mov     edx, [edx+100h]
	push    0
	mov     [eax+4], edx
	mov     [eax+8], edi
	push    ecx
	mov     ecx, ds:RCache
	call    ds:CBackend__set_RT
	mov     ecx, ds:RCache
	push    1
	push    0
	call    ds:CBackend__set_RT
	mov     ecx, ds:RCache
	push    2
	push    0
	call    ds:CBackend__set_RT
	mov     ecx, ds:RCache
	push    esi
	call    ds:CBackend__set_ZB
	fld1
	mov     eax, ds:HW
	mov     eax, [eax+8]
	mov     ecx, [eax]
	mov     edx, [ecx+0ACh]
	push    0
	push    ecx
	fstp    dword ptr [esp]
	push    0
	push    6
	push    0
	push    0
	push    eax
	call    edx
	pop     edi
	pop     esi
	retn
	