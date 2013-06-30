detail_blink_fix:
	; restore cut useful code
	mov     [esp+148h-100h], ecx
	mov     [esp+148h-104h], edx
	; get viewbase fructum
	lea		esi, ds:RImplementation
	add		esi, 8
	; copy viewbase into current frustum
	mov		ecx, 3Dh
	lea     edi, [esp+14Ch-0F8h]
	rep movsd
	jmp back_from_detail_blink_fix