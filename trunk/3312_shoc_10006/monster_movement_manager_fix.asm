include monster_movement_manager_reg_macro.asm

mmm_fix proc
	; делаем своё
	pusha
MMM_PERFORM_EXPORT__BOOL__VOID CALifeMonsterMovementManager__SetPathType, "set_path_type"
	popa
	; делаем то, что вырезали
	mov     ecx, eax
	xor     eax, eax
	lea     edi, [ebp+var_10]
	stosb
	; идём обратно
	jmp back_from_mmm_fix

mmm_fix endp

CALifeMonsterMovementManager__SetPathType proc
	mov     dword ptr [ecx+0Ch], 0
	mov     eax, 0
	retn
CALifeMonsterMovementManager__SetPathType endp
