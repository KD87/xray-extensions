cobject_check:
	mov		eax, [esi+0A4h]	; Props.storage
	and		eax, 0FFFFh		; ID
	cmp		eax, 0			; актор ли
	jnz		cobject_exit
	mov		eax, [esi+5C8h]	; m_bZoomAimingMode
	and		eax, 1
	mov		zoom_mode, eax
cobject_exit:
	; то, что вырезал
	mov     eax, [esi+0B4h]
	jmp back_to_cobject_check
	
text db "zoom mode is %d", 0