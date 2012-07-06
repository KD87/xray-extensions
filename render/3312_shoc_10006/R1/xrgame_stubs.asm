;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************

org 1001828Ah - shift
	nop
	nop
	nop
	nop
	jmp cache_initialize_1 ; врезка с инструкцией перехода - 5 байт
org 10018293h - shift
back_to_cache_initialize_1:

org 10018295h - shift
	nop
	jmp cache_initialize_2 ; врезка с инструкцией перехода - 5 байт
org 1001829Bh - shift
back_to_cache_initialize_2:

org 10018651h - shift
	nop
	nop
	nop
	nop
	jmp cache_update_1 ; врезка с инструкцией перехода - 5 байт
org 1001865Ah - shift
back_to_cache_update_1:

org 100186A1h - shift
	nop
	nop
	nop
	nop
	jmp cache_update_2 ; врезка с инструкцией перехода - 5 байт
org 100186AAh - shift
back_to_cache_update_2:


org 10018727h - shift
	nop
	jmp cache_update_3 ; врезка с инструкцией перехода - 5 байт
org 1001872Dh - shift
back_to_cache_update_3:

org 10018775h - shift
	nop
	jmp cache_update_4 ; врезка с инструкцией перехода - 5 байт
org 1001877Bh - shift
back_to_cache_update_4:

org 10018762h - shift
	jmp cache_update_5 ; врезка с инструкцией перехода - 5 байт
org 10018767h - shift
back_to_cache_update_5:



org 10018921h - shift
	jmp cache_update_6 ; врезка с инструкцией перехода - 5 байт
org 10018926h - shift
back_to_cache_update_6:

org 1001893Dh - shift
	jmp cache_update_7 ; врезка с инструкцией перехода - 5 байт
org 10018942h - shift
back_to_cache_update_7:

org 1001833Ah - shift
	nop
	nop
	jmp cache_task_1 ; 
org 10018341h - shift
back_to_cache_task_1:



org 100171BEh - shift
	nop
	jmp cache_upvism_1 ; врезка с инструкцией перехода - 5 байт
org 100171C4h - shift
back_to_cache_upvism_1:

org 100171CEh - shift
	nop
	jmp cache_upvism_2 ; врезка с инструкцией перехода - 5 байт
org 100171D4h - shift
back_to_cache_upvism_2:

org 10016CE3h - shift
	nop
	nop
	nop
	nop
	jmp cache_upvism_3 ; врезка с инструкцией перехода - 5 байт
org 10016CECh - shift
back_to_cache_upvism_3:


;===========================================
; ПЛОТНОСТЬ ТРАВЫ.
;===========================================

CCC_Float       struct ; (sizeof=0x18, standard type)
	baseclass_0     dd ?
	value           dd ?                    ; offset
	min             dd ?
	max             dd ?
CCC_Float       ends

org 10001762h - shift
	jmp det_density
org 10001771h - shift
back_to_det_density:

org 100723ECh - shift
xCCC_Float_42 CCC_Float <?>