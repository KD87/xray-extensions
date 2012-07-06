;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************

org 10025219h - shift
	nop
	nop
	nop
	nop
	jmp cache_initialize_1
org 10025222h - shift
back_to_cache_initialize_1:

org 10025224h - shift
	nop
	jmp cache_initialize_2 
org 1002522Ah - shift
back_to_cache_initialize_2:

org 100255CDh - shift
	nop
	jmp cache_update_1
org 100255D3h - shift
back_to_cache_update_1:

org 1002562Ah - shift
	nop
	nop
	nop
	nop
	jmp cache_update_2
org 10025633h - shift
back_to_cache_update_2:

org 100256B0h - shift
	nop
	jmp cache_update_3 
org 100256B6h - shift
back_to_cache_update_3:

org 1002570Ch - shift
	nop
	jmp cache_update_4 
org 10025712h - shift
back_to_cache_update_4:

org 100256F6h - shift
	nop
	nop
	nop
	nop
	nop
	jmp cache_update_5
org 10025700h - shift
back_to_cache_update_5:

org 100252C8h - shift
	nop
	nop
	jmp cache_task_1 
org 100252CFh - shift
back_to_cache_task_1:


org 10024793h - shift
	nop
	jmp cache_upvism_1 
org 10024799h - shift
back_to_cache_upvism_1:

org 100247A3h - shift
	nop
	jmp cache_upvism_2
org 100247A9h - shift
back_to_cache_upvism_2:

org 10024160h - shift
	nop
	nop
	nop
	nop
	jmp cache_upvism_3
org 10024169h - shift
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

org 10001BD2h - shift
	jmp det_density
org 10001BE1h - shift
back_to_det_density:

org 100F4FACh - shift
xCCC_Float_42 CCC_Float <?>