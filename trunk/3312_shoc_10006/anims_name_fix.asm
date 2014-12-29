anims_name_fix_1 proc
	lea		eax, [esp+18h]
	PRINT_UINT "** Loaded animation %s", eax
	add     dword ptr [esp+10h], 1
	jmp back_from_anims_name_fix_1
anims_name_fix_1 endp

anims_name_fix_2 proc
	lea		eax, [esp+18h]
	PRINT_UINT "** Loaded animation fx %s", eax
	add     dword ptr [esp+10h], 1
	jmp back_from_anims_name_fix_2
anims_name_fix_2 endp

anims_name_fix_3 proc
	lea		eax, [esp+18h]
	PRINT_UINT "*** CANNOT FIND ANIMATION %s", eax
	add     dword ptr [esp+10h], 1
	jmp back_from_anims_name_fix_3
anims_name_fix_3 endp

anims_name_fix_4 proc
	mov		eax, [ebx+0B0h]
	lea		eax, [eax+0Ch]
	PRINT_UINT "* Loading animations for stalker with visual %s", eax
	mov     ecx, [ebx+5A4h]
	jmp back_from_anims_name_fix_4
anims_name_fix_4 endp
