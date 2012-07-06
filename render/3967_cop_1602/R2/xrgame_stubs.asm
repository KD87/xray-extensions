;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************

;===========================================
; ƒ¿À‹ÕŒ—“‹ Œ“–»—Œ¬ » “–¿¬€
;===========================================
org 10028D89h - shift
	nop
	nop
	nop
	nop
	jmp cache_initialize_1
org 10028D92h - shift
back_to_cache_initialize_1:

org 10028D94h - shift
	nop
	jmp cache_initialize_2 
org 10028D9Ah - shift
back_to_cache_initialize_2:

org 1002913Eh - shift
	nop
	jmp cache_update_1
org 10029144h - shift
back_to_cache_update_1:

org 1002919Ah - shift
	nop
	nop
	nop
	nop
	jmp cache_update_2
org 100291A3h - shift
back_to_cache_update_2:

org 10029220h - shift
	nop
	jmp cache_update_3 
org 10029226h - shift
back_to_cache_update_3:

org 1002927Ch - shift
	nop
	jmp cache_update_4 
org 10029282h - shift
back_to_cache_update_4:

org 10029266h - shift
	nop
	nop
	nop
	nop
	nop
	jmp cache_update_5
org 10029270h - shift
back_to_cache_update_5:

org 10028E38h - shift
	nop
	nop
	jmp cache_task_1 
org 10028E3Fh - shift
back_to_cache_task_1:


org 100283E3h - shift
	nop
	jmp cache_upvism_1 
org 100283E9h - shift
back_to_cache_upvism_1:

org 100283F3h - shift
	nop
	jmp cache_upvism_2
org 100283F9h - shift
back_to_cache_upvism_2:

org 10027DC0h - shift
	nop
	nop
	nop
	nop
	jmp cache_upvism_3
org 10027DC9h - shift
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

org 10001F75h - shift
	jmp det_density
org 10001F84h - shift
back_to_det_density:

org 100E071Ch - shift
xCCC_Float_42 CCC_Float <?>