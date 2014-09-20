armor_piercing_fix:
AP = dword ptr 8
; схитрим, там xmm2 дальше перезаписывается
	movss   xmm1, [_one]
	movss   xmm2, [esp+10h+AP]
	divss	xmm2, [_two]
	subss	xmm1, xmm2
	jmp	back_from_armor_piercing_fix
	
_one dd 1.0
_two dd 2.0