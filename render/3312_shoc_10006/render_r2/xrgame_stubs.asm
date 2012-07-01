;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************

org 10023D7Ah - shift
	nop
	nop
	nop
	nop
	jmp cache_initialize_1
org 10023D83h - shift
back_to_cache_initialize_1:

org 10023D85h - shift
	nop
	jmp cache_initialize_2 
org 10023D8Bh - shift
back_to_cache_initialize_2:

org 1002414Ch - shift
	nop
	jmp cache_update_1
org 10024152h - shift
back_to_cache_update_1:

org 100241A9h - shift
	nop
	nop
	nop
	nop
	jmp cache_update_2
org 100241B2h - shift
back_to_cache_update_2:

org 1002422Eh - shift
	nop
	jmp cache_update_3 
org 10024234h - shift
back_to_cache_update_3:

org 1002428Bh - shift
	nop
	jmp cache_update_4 
org 10024291h - shift
back_to_cache_update_4:

org 10024276h - shift
	nop
	nop
	nop
	nop
	jmp cache_update_5
org 1002427Fh - shift
back_to_cache_update_5:

org 10023E2Ah - shift
	nop
	nop
	jmp cache_task_1 
org 10023E31h - shift
back_to_cache_task_1:


org 10022F2Eh - shift
	nop
	jmp cache_upvism_1 
org 10022F34h - shift
back_to_cache_upvism_1:

org 10022F3Eh - shift
	nop
	jmp cache_upvism_2
org 10022F44h - shift
back_to_cache_upvism_2:

org 10022A53h - shift
	nop
	nop
	nop
	nop
	jmp cache_upvism_3
org 10022A5Ch - shift
back_to_cache_upvism_3:

org 100690ECh - shift
memmove_s dword ?

org 10079774h - shift
ps_r2_ls_flags    dd ?

org 10027997h - shift
	nop
	jmp	sun_details_1_fix

org 100279C6h - shift
back_to_sun_details_1_fix: