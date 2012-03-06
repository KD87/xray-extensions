include alife_smart_terrain_task_reg_macro.asm

astt_fix proc
	; делаем своё
	pusha
;MMM_PERFORM_EXPORT__BOOL__VOID CALifeMonsterMovementManager__SetPathType, "set_path_type"
	popa
	; делаем то, что вырезали
	; идём обратно
	;jmp back_from_astt_fix

astt_fix endp