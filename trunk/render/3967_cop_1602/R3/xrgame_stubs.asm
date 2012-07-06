;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************

org 1002AA09h - shift
	nop
	nop
	nop
	nop
	jmp cache_initialize_1
org 1002AA12h - shift
back_to_cache_initialize_1:

org 1002AA14h - shift
	nop
	jmp cache_initialize_2 
org 1002AA1Ah - shift
back_to_cache_initialize_2:

org 1002ADBEh - shift
	nop
	jmp cache_update_1
org 1002ADC4h - shift
back_to_cache_update_1:

org 1002AE1Ah - shift
	nop
	nop
	nop
	nop
	jmp cache_update_2
org 1002AE23h - shift
back_to_cache_update_2:

org 1002AEA0h - shift
	nop
	jmp cache_update_3 
org 1002AEA6h - shift
back_to_cache_update_3:

org 1002AEFCh - shift
	nop
	jmp cache_update_4 
org 1002AF02h - shift
back_to_cache_update_4:

org 1002AEE6h - shift
	nop
	nop
	nop
	nop
	nop
	jmp cache_update_5
org 1002AEF0h - shift
back_to_cache_update_5:

org 1002AAB8h - shift
	nop
	nop
	jmp cache_task_1 
org 1002AABFh - shift
back_to_cache_task_1:


org 10029FF3h - shift
	nop
	jmp cache_upvism_1 
org 10029FF9h - shift
back_to_cache_upvism_1:

org 1002A003h - shift
	nop
	jmp cache_upvism_2
org 1002A009h - shift
back_to_cache_upvism_2:

org 100299D0h - shift
	nop
	nop
	nop
	nop
	jmp cache_upvism_3
org 100299D9h - shift
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

org 10001EE5h - shift
	jmp det_density
org 10001EF4h - shift
back_to_det_density:

org 100FB828h - shift
xCCC_Float_42 CCC_Float <?>