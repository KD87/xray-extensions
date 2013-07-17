;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************

;===========================================
; ДАЛЬНОСТЬ ОТРИСОВКИ ТРАВЫ
;===========================================
org 10023459h - shift
	jmp cache_initialize_1
org 10023462h - shift
back_to_cache_initialize_1:

org 10023464h - shift
	jmp cache_initialize_2 
org 1002346Ah - shift
back_to_cache_initialize_2:

org 10023805h - shift
	jmp cache_update_1
org 10023813h - shift
back_to_cache_update_1:

org 1002386Ah - shift
	jmp cache_update_2
org 10023873h - shift
back_to_cache_update_2:

org 100238F0h - shift
	jmp cache_update_3 
org 100238F6h - shift
back_to_cache_update_3:

org 1002394Ch - shift
	jmp cache_update_4 
org 10023952h - shift
back_to_cache_update_4:

org 10023508h - shift
	jmp cache_task_1 
org 1002350Fh - shift
back_to_cache_task_1:

org 100229D3h - shift
	jmp cache_upvism_1 
org 100229D9h - shift
back_to_cache_upvism_1:

org 100229E3h - shift
	jmp cache_upvism_2
org 100229E9h - shift
back_to_cache_upvism_2:

org 100223A0h - shift
	jmp cache_upvism_3
org 100223A9h - shift
back_to_cache_upvism_3:

;----------------------
;замена обращений к 30h
; то же, что и 31h, просто используется в циклах с другим условием
;----------------------

org 100237E1h - shift
	jmp update_30h_1
org 100237FAh - shift
back_to_update_30h_1:

org 10023834h - shift
	jmp update_30h_3
org 10023839h - shift
back_to_update_30h_3:

org 100238BBh - shift
	jmp update_30h_4
org 100238C0h - shift
back_to_update_30h_4:

org 10023914h - shift
	jmp update_30h_5
org 10023919h - shift
back_to_update_30h_5:

org 10023936h - shift
	jmp update_30h_6
org 10023940h - shift
back_to_update_30h_6:

;----------------------
;замена обращений к 0Сh
; кол-во строк и столбцов в cache_level1
;----------------------

org 1002346Ch - shift
	jmp cache_init_4
org 10023484h - shift
back_to_cache_init_4:

org 10023484h - shift
	jmp cache_init_5
org 10023489h - shift
back_to_cache_init_5:

org 10023AE0h - shift
	jmp cache_upd_6
org 10023AF6h - shift
back_to_cache_upd_6:

org 10023B0Ah - shift
	jmp cache_upd_7
org 10023B12h - shift
back_to_cache_upd_7:
	
;----------------------
;замена обращений к 0С4h
; длина строки в cache
;----------------------

org 100234B4h - shift
	jmp cache_init_C4_1
org 100234B9h - shift
back_to_cache_init_C4_1:

org 100238C2h - shift
	jmp cache_upd_C4_2
org 100238D2h - shift
back_to_cache_upd_C4_2:

org 10023920h - shift
	jmp cache_upd_C4_3
org 1002392Dh - shift
back_to_cache_upd_C4_3:

;----------------------
;замена обращений к 960h
; кол-во элементов в cache_pool, cache_task и cache - 1
;----------------------

org 10021B5Eh - shift
	jmp const_960_1
org 10021B6Fh - shift
back_to_const_960_1:

org 10021E97h - shift
	jmp const_960_2
org 10021EA2h - shift
back_to_const_960_2:

;----------------------
;разное
;----------------------

org 10021AFFh - shift
	jmp cache_level1_length
org 10021B0Ah - shift
back_to_cache_level1_length:

org 10023858h - shift
	jmp red_cl1_line_size_minus
org 1002385Eh - shift
back_to_red_cl1_line_size_minus:

org 100238DEh - shift
	jmp cache_size_w_o_last_line_minus
org 100238E4h - shift
back_to_cache_size_w_o_last_line_minus:

org 10023967h - shift
	jmp cache_length
org 10023974h - shift
back_to_cache_length:

org 100234D0h - shift
	jmp four_lines_length
org 100234D6h - shift
back_to_four_lines_length:

; float - константы
org 10022508h - shift
	jmp vis
org 1002250Fh - shift
back_to_vis:

org 1002252Eh - shift
	jmp circle
org 10022536h - shift
back_to_circle:

;----------------------
;патч смещений членов класса
;----------------------
org 10023437h - shift
	jmp offset_1
org 10023443h - shift
back_to_offset_1:

org 1002373Bh - shift
	jmp offset_3
org 1002374Eh - shift
back_to_offset_3:

org 100237BEh - shift
	jmp offset_4
org 100237C4h - shift
back_to_offset_4:

org 1002382Ch - shift
	jmp offset_5
org 10023832h - shift
back_to_offset_5:

org 100238B3h - shift
	jmp offset_6
org 100238B9h - shift
back_to_offset_6:

org 10023907h - shift
	jmp offset_7
org 1002390Dh - shift
back_to_offset_7:

org 100239B6h - shift
	jmp offset_8
org 100239BCh - shift
back_to_offset_8:

org 100239C6h - shift
	jmp offset_9
org 100239CCh - shift
back_to_offset_9:

org 100239E3h - shift
	jmp offset_10
org 100239F5h - shift
back_to_offset_10:

org 10023A7Dh - shift
	jmp offset_11
org 10023A84h - shift
back_to_offset_11:

org 10023A8Bh - shift
	jmp offset_12
org 10023A98h - shift
back_to_offset_12:

org 10023AA0h - shift
	jmp offset_13
org 10023AB7h - shift
back_to_offset_13:

org 10023ABEh - shift
	jmp offset_14
org 10023AC5h - shift
back_to_offset_14:

org 100223BEh - shift
	jmp offset_15
org 100223CDh - shift
back_to_offset_15:

;===========================================
; РАСЧЕТ ДИНАМИЧЕСКИХ ПАРАМЕТРОВ ДЛЯ ДАЛЬНОСТИ ТРАВЫ
;===========================================

org 100086C5h - shift
	jmp calculate_stuff
org 100086CAh - shift
back_to_calculate_stuff:

;===========================================
; КОНСОЛЬНЫЕ ПАРАМЕТРЫ
;===========================================

org 10003CADh - shift
	jmp con_comm

org 100A99D9h - shift	
_atexit:

; imported functions
org 100AC6FCh - shift
CCC_Integer__CCC_Integer      dd ?
org 100AC720h - shift
CCC_Integer___CCC_Integer     dd ?
org 100AC758h - shift
Console dd ?
org 100AC760h - shift
CConsole__AddCommand dd ?

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

org 100D5D94h - shift
xCCC_Float_42 CCC_Float <?>

;===========================================
; r__geometry_lod
;===========================================	
org 100B5D48h - shift
    dd 3.0
	
;===========================================
; MIPBIAS.
;===========================================
org 100021BFh - shift
	jmp mip_bias
org 100021CEh - shift
back_to_mip_bias:

org 100D5C34h - shift
dword_100D5C34 dd ?

;===========================================
; Дополнительные разрешения карты теней
;===========================================
org 10005309h - shift
	jmp	new_smap_sizes
org 1000530Eh - shift
back_from_new_smap_sizes:
org 100AC41Ch - shift
Core dd ?

;===========================================
; Расширенная регулировка r2_sun_near
;===========================================
org 10002AB6h - shift
	jmp	sun_near_fix_label
org 10002ABDh - shift
back_from_sun_near_fix_label:
	
;===========================================
; ФИКС ДВИЖЕНИЯ СОЛНЦА.
;===========================================
org 10007690h - shift
movement_fix proc
	mov     ecx, [esp]
	xor     eax, eax
	cmp     ecx, 41FB54h
	setz    al
	retn
movement_fix endp