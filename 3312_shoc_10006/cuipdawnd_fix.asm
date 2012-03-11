; ----------------------- колбек на нажатие ----------------------------
ALIGN_8
cui_pda_fix_map proc

	push    offset aUi_pda_map ; "ui_pda_map_global"
	call    SendInfoToActor
	add     esp, 4

	jmp back_from_cui_pda_fix
cui_pda_fix_map endp

aUi_pda_map db "ui_pda_map_global", 0