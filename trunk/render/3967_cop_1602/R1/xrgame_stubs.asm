;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************

org 100183A9h - shift
	nop
	nop
	nop
	nop
	jmp cache_initialize_1 ; врезка с инструкцией перехода - 5 байт
org 100183B2h - shift
back_to_cache_initialize_1:

org 100183B4h - shift
	nop
	jmp cache_initialize_2 ; врезка с инструкцией перехода - 5 байт
org 100183BAh - shift
back_to_cache_initialize_2:

org 10018752h - shift
	nop
	nop
	nop
	nop
	jmp cache_update_1 ; врезка с инструкцией перехода - 5 байт
org 1001875Bh - shift
back_to_cache_update_1:

org 100187A2h - shift
	nop
	nop
	nop
	nop
	jmp cache_update_2 ; врезка с инструкцией перехода - 5 байт
org 100187ABh - shift
back_to_cache_update_2:


org 10018828h - shift
	nop
	jmp cache_update_3 ; врезка с инструкцией перехода - 5 байт
org 1001882Eh - shift
back_to_cache_update_3:

org 10018876h - shift
	nop
	jmp cache_update_4 ; врезка с инструкцией перехода - 5 байт
org 1001887Ch - shift
back_to_cache_update_4:

org 10018862h - shift
	nop
	jmp cache_update_5 ; врезка с инструкцией перехода - 5 байт
org 10018868h - shift
back_to_cache_update_5:



org 10018A21h - shift
	jmp cache_update_6 ; врезка с инструкцией перехода - 5 байт
org 10018A26h - shift
back_to_cache_update_6:

org 10018A3Dh - shift
	jmp cache_update_7 ; врезка с инструкцией перехода - 5 байт
org 10018A42h - shift
back_to_cache_update_7:

org 10018458h - shift
	nop
	nop
	jmp cache_task_1 ; 
org 1001845Fh - shift
back_to_cache_task_1:



org 1001793Dh - shift
	nop
	jmp cache_upvism_1 ; врезка с инструкцией перехода - 5 байт
org 10017943h - shift
back_to_cache_upvism_1:

org 10017951h - shift
	nop
	jmp cache_upvism_2 ; врезка с инструкцией перехода - 5 байт
org 10017957h - shift
back_to_cache_upvism_2:

org 10017314h - shift
	jmp cache_upvism_3 ; врезка с инструкцией перехода - 5 байт
org 10017319h - shift
back_to_cache_upvism_3:

org 10017325h - shift
	nop
	nop
	


;===========================================
; ПЛОТНОСТЬ ТРАВЫ.
;===========================================

CCC_Float       struct ; (sizeof=0x18, standard type)
	baseclass_0     dd ?
	value           dd ?                    ; offset
	min             dd ?
	max             dd ?
CCC_Float       ends

org 10001F75h - shift
	jmp det_density
org 10001F84h - shift
back_to_det_density:

org 100B91D0h - shift
xCCC_Float_42 CCC_Float <?>