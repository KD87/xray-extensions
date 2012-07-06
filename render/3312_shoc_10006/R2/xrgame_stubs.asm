;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************

;--------------------------
;замена обращений к 31h
;кол-во строк и столбцов в cache_pool, cache_task и cache
;--------------------------

org 10023D7Ah - shift
	jmp cache_initialize_1
org 10023D83h - shift
back_to_cache_initialize_1:

org 10023D85h - shift
	jmp cache_initialize_2 
org 10023D8Bh - shift
back_to_cache_initialize_2:

org 10024144h - shift
	jmp cache_update_1
org 10024152h - shift
back_to_cache_update_1:

org 100241A9h - shift
	jmp cache_update_2
org 100241B2h - shift
back_to_cache_update_2:

org 1002422Eh - shift
	jmp cache_update_3 
org 10024234h - shift
back_to_cache_update_3:

org 1002428Bh - shift
	jmp cache_update_4 
org 10024291h - shift
back_to_cache_update_4:

;----------------------
;замена обращений к 30h
; то же, что и 31h, просто используетс€ в циклах с другим условием
;----------------------

org 10024121h - shift
	jmp update_30h_1
org 10024126h - shift
back_to_update_30h_1:

org 10024130h - shift
	jmp update_30h_2
org 1002413Bh - shift
back_to_update_30h_2:

org 10024173h - shift
	jmp update_30h_3
org 10024178h - shift
back_to_update_30h_3:

org 100241FAh - shift
	jmp update_30h_4
org 100241FFh - shift
back_to_update_30h_4:

org 10024254h - shift
	jmp update_30h_5
org 10024259h - shift
back_to_update_30h_5:

org 10024276h - shift
	jmp update_30h_6
org 1002427Fh - shift
back_to_update_30h_6:

;----------------------
;замена обращений к 0—h
; кол-во строк и столбцов в cache_level1
;----------------------

org 10022F2Eh - shift
	jmp cache_upvism_1 
org 10022F34h - shift
back_to_cache_upvism_1:

org 10022F3Eh - shift
	jmp cache_upvism_2
org 10022F44h - shift
back_to_cache_upvism_2:

org 10022A53h - shift
	jmp cache_upvism_3
org 10022A5Ch - shift
back_to_cache_upvism_3:

org 10023D8Dh - shift
	jmp cache_init_4
org 10023DA5h - shift
back_to_cache_init_4:

org 10023DA5h - shift
	jmp cache_init_5
org 10023DAAh - shift
back_to_cache_init_5:

org 10024420h - shift
	jmp cache_upd_6
org 10024436h - shift
back_to_cache_upd_6:

org 1002444Ah - shift
	jmp cache_upd_7
org 10024452h - shift
back_to_cache_upd_7:

;----------------------
;замена обращений к 0—4h
; длина строки в cache
;----------------------

org 10023DD4h - shift
	jmp cache_init_C4_1
org 10023DD9h - shift
back_to_cache_init_C4_1:

org 10024201h - shift
	jmp cache_upd_C4_2
org 10024211h - shift
back_to_cache_upd_C4_2:

org 10024260h - shift
	jmp cache_upd_C4_3
org 1002426Dh - shift
back_to_cache_upd_C4_3:

;----------------------
;замена обращений к 960h
; кол-во элементов в cache_pool, cache_task и cache - 1
;----------------------

org 1002229Eh - shift
	jmp const_960_1
org 100222AFh - shift
back_to_const_960_1:

org 100224E1h - shift
	jmp const_960_2
org 100224ECh - shift
back_to_const_960_2:

;----------------------
;разное
;----------------------

org 1002223Fh - shift
	jmp cache_level1_length
org 1002224Ah - shift
back_to_cache_level1_length:

org 10024197h - shift
	jmp red_cl1_line_size_minus
org 1002419Dh - shift
back_to_red_cl1_line_size_minus:

org 1002421Ch - shift
	jmp cache_size_w_o_last_line_minus
org 10024222h - shift
back_to_cache_size_w_o_last_line_minus:

org 100242A6h - shift
	jmp cache_length
org 100242B3h - shift
back_to_cache_length:

org 10023DF0h - shift
	jmp four_lines_length
org 10023DF6h - shift
back_to_four_lines_length:

; float - константы
org 10022BC7h - shift
	jmp vis
org 10022BCEh - shift
back_to_vis:

org 10022BEDh - shift
	jmp circle
org 10022BF5h - shift
back_to_circle:

;----------------------
;патч смещений членов класса
;----------------------
org 10023D57h - shift
	jmp offset_1
org 10023D63h - shift
back_to_offset_1:

;org 10023D8Dh - shift
;	jmp offset_2
;org 10023D93h - shift
;back_to_offset_2:

org 10024077h - shift
	jmp offset_3
org 1002408Ah - shift
back_to_offset_3:

org 100240FEh - shift
	jmp offset_4
org 10024104h - shift
back_to_offset_4:

org 1002416Bh - shift
	jmp offset_5
org 10024171h - shift
back_to_offset_5:

org 100241F2h - shift
	jmp offset_6
org 100241F8h - shift
back_to_offset_6:

org 10024245h - shift
	jmp offset_7
org 1002424Bh - shift
back_to_offset_7:

org 100242F6h - shift
	jmp offset_8
org 100242FCh - shift
back_to_offset_8:

org 10024306h - shift
	jmp offset_9
org 1002430Ch - shift
back_to_offset_9:

org 10024323h - shift
	jmp offset_10
org 10024335h - shift
back_to_offset_10:

org 100243BDh - shift
	jmp offset_11
org 100243C4h - shift
back_to_offset_11:

org 100243CBh - shift
	jmp offset_12
org 100243D8h - shift
back_to_offset_12:

org 100243E0h - shift
	jmp offset_13
org 100243F7h - shift
back_to_offset_13:

org 100243FEh - shift
	jmp offset_14
org 10024405h - shift
back_to_offset_14:

org 10022A76h - shift
	jmp offset_15
org 10022A85h - shift
back_to_offset_15:
;	{	offset	=>	0x2223F	,	src_value	=>	0x5C0	,	val_format	=>	4	}	,	 offset	cache_level1
;	{	offset	=>	0x22A76	,	src_value	=>	0x5C0	,	val_format	=>	4	}	,	 offset	cache_level1
;	{	offset	=>	0x22A7E	,	src_value	=>	0x5C0	,	val_format	=>	4	}	,	 offset	cache_level1
;	{	offset	=>	0x23D93	,	src_value	=>	0x600	,	val_format	=>	4	}	,	 offset	cache_level1
;	{	offset	=>	0x24420	,	src_value	=>	0x5E8	,	val_format	=>	4	}	,	 offset	cache_level1
;	{	offset	=>	0x2229E	,	src_value	=>	0x9688	,	val_format	=>	4	}	,
;	{	offset	=>	0x222A4	,	src_value	=>	0x968C	,	val_format	=>	4	}	,
;	{	offset	=>	0x23D57	,	src_value	=>	0x968C	,	val_format	=>	4	}	,
;	{	offset	=>	0x23D5D	,	src_value	=>	0x4B80	,	val_format	=>	4	}	,
;	{	offset	=>	0x23D8D	,	src_value	=>	0x4B88	,	val_format	=>	4	}	,
;	{	offset	=>	0x24077	,	src_value	=>	0x9688	,	val_format	=>	4	}	,
;	{	offset	=>	0x2407D	,	src_value	=>	0x7104	,	val_format	=>	4	}	,
;	{	offset	=>	0x24084	,	src_value	=>	0x9688	,	val_format	=>	4	}	,
;	{	offset	=>	0x240FE	,	src_value	=>	0x4B80	,	val_format	=>	4	}	,
;	{	offset	=>	0x2416B	,	src_value	=>	0x4C40	,	val_format	=>	4	};
;	{	offset	=>	0x241F2	,	src_value	=>	0x7040	,	val_format	=>	4	};
;	{	offset	=>	0x24245	,	src_value	=>	0x4B80	,	val_format	=>	4	}	,
;	{	offset	=>	0x242A6	,	src_value	=>	0x9688	,	val_format	=>	4	}	,
;	{	offset	=>	0x242F6	,	src_value	=>	0x9688	,	val_format	=>	4	}	,
;	{	offset	=>	0x24306	,	src_value	=>	0x9688	,	val_format	=>	4	}	,
;	{	offset	=>	0x24323	,	src_value	=>	0x9688	,	val_format	=>	4	}	,
;	{	offset	=>	0x2432F	,	src_value	=>	0x7104	,	val_format	=>	4	}	,
;	{	offset	=>	0x243BD	,	src_value	=>	0x7104	,	val_format	=>	4	}	,
;	{	offset	=>	0x243CB	,	src_value	=>	0x9688	,	val_format	=>	4	}	,
;	{	offset	=>	0x243D2	,	src_value	=>	0x9688	,	val_format	=>	4	}	,
;	{	offset	=>	0x243E0	,	src_value	=>	0x7108	,	val_format	=>	4	}	,
;	{	offset	=>	0x243E7	,	src_value	=>	0x7104	,	val_format	=>	4	}	,
;	{	offset	=>	0x243F1	,	src_value	=>	0x9688	,	val_format	=>	4	}	,
;	{	offset	=>	0x243FE	,	src_value	=>	0x9688	,	val_format	=>	4	}	,


;----------------------
;замена обращений к 18h
;позици€ актора
;----------------------	

org 10023E2Ah - shift
	jmp cache_task_1 
org 10023E31h - shift
back_to_cache_task_1:

;===========================================
; ѕЋќ“Ќќ—“№ “–ј¬џ.
;===========================================

CCC_Float       struct ; (sizeof=0x18, standard type)
	baseclass_0     dd ?
	value           dd ?                    ; offset
	min             dd ?
	max             dd ?
CCC_Float       ends

org 10001752h - shift
	jmp det_density
org 10001761h - shift
back_to_det_density:

org 10089C28h - shift
xCCC_Float_42 CCC_Float <?>

;===========================================
;  ќЌ—ќЋ№Ќјя  ќћјЌƒј
;===========================================

org 10002D42h - shift
	jmp con_comm
org 10002D49h - shift
back_to_con_comm:
	
org 10067424h - shift	
_atexit:

; imported functions
org 10069268h - shift
CCC_Integer__CCC_Integer      dword ?
org 1006924Ch - shift
CCC_Integer___CCC_Integer     dword ?
org 100692B0h - shift
CConsole__AddCommand     	  dword ?

org 100896DCh - shift
console_desc	dd ?		; бинарный флаг, отвечающий за инициализацию консольных параметров
org 10089CF4h - shift
ccc_int_obj	dd ?			; объект консольной команды типа CCC_Integer


;===========================================
; ќЅ–јЅќ“„»   ќЌ—ќЋ№Ќќ…  ќћјЌƒџ.
; вызываетс€ из CRender::level_Load
; врезка тут:
; .text:10007607                 push    0D0BB8h
; как раз п€ть байт
;===========================================

org 10007607h - shift
	jmp calculate_stuff
org 1000760Ch - shift
back_to_calculate_stuff:

; параметры
org 10089D1Ch - shift
rad	dd ?					; 31h
org 10089D20h - shift
rad_dec	dd ?				; rad-1						30h
org 10089D24h - shift
sq_rad	dd ?				; rad*rad					961h
org 10089D28h - shift
sq_rad_dec	dd ?			; rad*rad - 1				960h
org 10089D2Ch - shift
det_lev1_size	dd ?		; rad_dec/4					0Ch
org 10089D30h - shift
sq_det_lev1_size_dec	dd ?	; det_lev1_size * det_lev1_size - 1				08Fh
org 10089D34h - shift
lev1_size_line	dd ?		; rad * 4					0C4h
org 10089D38h - shift
lev1_size_line_dec	dd ?	; rad_dec * 4				0C0h
org 10089D3Ch - shift
act_pos	dd ?				; rad_dec / 2				018h
org 10089D40h - shift
cache_size_w_o_last_line	dd ?				; 4 * rad * (rad - 1)		24C0h
org 10089D44h - shift
four_lines_length_in_cache	dd ?				; 4 * lev1_size_line		0310h
org 10089D48h - shift
class_mem	dd ?
org 10089D58h - shift	
cache_level1_size	dd ?
org 10089D5Ch - shift	
cache_size	dd ?
org 10089D60h - shift	
c_task_size	dd ?
org 10089D64h - shift	
c_pool_size	dd ?

org 10089D68h - shift	
cache_level1_offset	dd ?
org 10089D6Ch - shift	
cache_first_el_offset	dd ?
org 10089D70h - shift	
cache_third_el_offset	dd ?
org 10089D74h - shift	
cache_last_el_first_line_offset	dd ?
org 10089D78h - shift	
cache_first_el_last_line_offset	dd ?	
org 10089D7Ch - shift	
cache_task_first_offset	dd ?	
org 10089D80h - shift	
cache_task_second_offset	dd ?	
org 10089D84h - shift	
cache_task_last_offset	dd ?
org 10089D88h - shift	
cache_pool_offset	dd ?	


org 10089D8Ch - shift	
visibility	REAL4 ?
org 10089D90h - shift	
smooth_circle	REAL4 ?

;org 10089C28h - shift
;xCCC_Float_42 dd ?

off dd offset det_dens_max_offset


; тени травы
org 100690ECh - shift
memmove_s dword ?

org 10079774h - shift
ps_r2_ls_flags    dd ?

org 10027997h - shift
	nop
	jmp	sun_details_1_fix

org 100279C6h - shift
back_to_sun_details_1_fix: