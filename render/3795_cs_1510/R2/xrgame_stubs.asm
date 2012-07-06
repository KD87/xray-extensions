;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************

org 10023459h - shift
	nop
	nop
	nop
	nop
	jmp cache_initialize_1
org 10023462h - shift
back_to_cache_initialize_1:

org 10023464h - shift
	nop
	jmp cache_initialize_2 
org 1002346Ah - shift
back_to_cache_initialize_2:

org 1002380Dh - shift
	nop
	jmp cache_update_1
org 10023813h - shift
back_to_cache_update_1:

org 1002386Ah - shift
	nop
	nop
	nop
	nop
	jmp cache_update_2
org 10023873h - shift
back_to_cache_update_2:

org 100238F0h - shift
	nop
	jmp cache_update_3 
org 100238F6h - shift
back_to_cache_update_3:

org 1002394Ch - shift
	nop
	jmp cache_update_4 
org 10023952h - shift
back_to_cache_update_4:

org 10023936h - shift
	nop
	nop
	nop
	nop
	nop
	jmp cache_update_5
org 10023940h - shift
back_to_cache_update_5:

org 10023508h - shift
	nop
	nop
	jmp cache_task_1 
org 1002350Fh - shift
back_to_cache_task_1:


org 100229D3h - shift
	nop
	jmp cache_upvism_1 
org 100229D9h - shift
back_to_cache_upvism_1:

org 100229E3h - shift
	nop
	jmp cache_upvism_2
org 100229E9h - shift
back_to_cache_upvism_2:

org 100223A0h - shift
	nop
	nop
	nop
	nop
	jmp cache_upvism_3
org 100223A9h - shift
back_to_cache_upvism_3:


;===========================================
; œÀŒ“ÕŒ—“‹ “–¿¬€.
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

org 100D5D94h - shift
xCCC_Float_42 CCC_Float <?>