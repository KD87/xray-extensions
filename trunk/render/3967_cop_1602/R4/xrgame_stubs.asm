;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************

org 1002B8A9h - shift
	nop
	nop
	nop
	nop
	jmp cache_initialize_1
org 1002B8B2h - shift
back_to_cache_initialize_1:

org 1002B8B4h - shift
	nop
	jmp cache_initialize_2 
org 1002B8BAh - shift
back_to_cache_initialize_2:

org 1002BC5Eh - shift
	nop
	jmp cache_update_1
org 1002BC64h - shift
back_to_cache_update_1:

org 1002BCBAh - shift
	nop
	nop
	nop
	nop
	jmp cache_update_2
org 1002BCC3h - shift
back_to_cache_update_2:

org 1002BD40h - shift
	nop
	jmp cache_update_3 
org 1002BD46h - shift
back_to_cache_update_3:

org 1002BD9Ch - shift
	nop
	jmp cache_update_4 
org 1002BDA2h - shift
back_to_cache_update_4:

org 1002BD86h - shift
	nop
	nop
	nop
	nop
	nop
	jmp cache_update_5
org 1002BD90h - shift
back_to_cache_update_5:

org 1002B958h - shift
	nop
	nop
	jmp cache_task_1 
org 1002B95Fh - shift
back_to_cache_task_1:


org 1002AE33h - shift
	nop
	jmp cache_upvism_1 
org 1002AE39h - shift
back_to_cache_upvism_1:

org 1002AE43h - shift
	nop
	jmp cache_upvism_2
org 1002AE49h - shift
back_to_cache_upvism_2:

org 1002A810h - shift
	nop
	nop
	nop
	nop
	jmp cache_upvism_3
org 1002A819h - shift
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

org 10001EF5h - shift
	jmp det_density
org 10001F04h - shift
back_to_det_density:

org 10108C98h - shift
xCCC_Float_42 CCC_Float <?>