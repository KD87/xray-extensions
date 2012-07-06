;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************

org 10017DE9h - shift
	nop
	nop
	nop
	nop
	jmp cache_initialize_1 ; врезка с инструкцией перехода - 5 байт
org 10017DF2h - shift
back_to_cache_initialize_1:

org 10017DF4h - shift
	nop
	jmp cache_initialize_2 ; врезка с инструкцией перехода - 5 байт
org 10017DFAh - shift
back_to_cache_initialize_2:

org 10018192h - shift
	nop
	nop
	nop
	nop
	jmp cache_update_1 ; врезка с инструкцией перехода - 5 байт
org 1001819Bh - shift
back_to_cache_update_1:

org 100181E2h - shift
	nop
	nop
	nop
	nop
	jmp cache_update_2 ; врезка с инструкцией перехода - 5 байт
org 100181EBh - shift
back_to_cache_update_2:


org 10018268h - shift
	nop
	jmp cache_update_3 ; врезка с инструкцией перехода - 5 байт
org 1001826Eh - shift
back_to_cache_update_3:

org 100182B6h - shift
	nop
	jmp cache_update_4 ; врезка с инструкцией перехода - 5 байт
org 100182BCh - shift
back_to_cache_update_4:

org 100182A2h - shift
	nop
	jmp cache_update_5 ; врезка с инструкцией перехода - 5 байт
org 100182A8h - shift
back_to_cache_update_5:



org 10018461h - shift
	jmp cache_update_6 ; врезка с инструкцией перехода - 5 байт
org 10018466h - shift
back_to_cache_update_6:

org 1001847Dh - shift
	jmp cache_update_7 ; врезка с инструкцией перехода - 5 байт
org 10018482h - shift
back_to_cache_update_7:

org 10017E98h - shift
	nop
	nop
	jmp cache_task_1 ; 
org 10017E9Fh - shift
back_to_cache_task_1:



org 10017523h - shift
	nop
	jmp cache_upvism_1 ; врезка с инструкцией перехода - 5 байт
org 10017529h - shift
back_to_cache_upvism_1:

org 10017533h - shift
	nop
	jmp cache_upvism_2 ; врезка с инструкцией перехода - 5 байт
org 10017539h - shift
back_to_cache_upvism_2:

org 10016EF0h - shift
	nop
	nop
	nop
	nop
	jmp cache_upvism_3 ; врезка с инструкцией перехода - 5 байт
org 10016EF9h - shift
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

org 10001C62h - shift
	jmp det_density
org 10001C71h - shift
back_to_det_density:

org 100B7930h - shift
xCCC_Float_42 CCC_Float <?>