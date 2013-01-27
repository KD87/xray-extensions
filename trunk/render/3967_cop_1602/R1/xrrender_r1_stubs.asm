;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************
;===========================================
; ДАЛЬНОСТЬ ОТРИСОВКИ ТРАВЫ
;===========================================
org 100183A9h - shift
	jmp cache_initialize_1
org 100183B2h - shift
back_to_cache_initialize_1:

org 100183B4h - shift
	jmp cache_initialize_2 
org 100183BAh - shift
back_to_cache_initialize_2:

org 10018752h - shift
	jmp cache_update_1
org 1001875Bh - shift
back_to_cache_update_1:

org 100187A2h - shift
	jmp cache_update_2
org 100187ABh - shift
back_to_cache_update_2:

org 10018828h - shift
	jmp cache_update_3 
org 1001882Eh - shift
back_to_cache_update_3:

org 10018876h - shift
	jmp cache_update_4 
org 1001887Ch - shift
back_to_cache_update_4:

org 10018458h - shift
	jmp cache_task_1 
org 1001845Fh - shift
back_to_cache_task_1:

org 1001793Dh - shift
	jmp cache_upvism_1
org 10017943h - shift
back_to_cache_upvism_1:

org 10017951h - shift
	jmp cache_upvism_2
org 10017957h - shift
back_to_cache_upvism_2:

org 10017314h - shift
	jmp cache_upvism_3
org 10017327h - shift
back_to_cache_upvism_3:

;----------------------
;замена обращений к 30h
; то же, что и 31h, просто используется в циклах с другим условием
;----------------------
org 10018726h - shift
	jmp update_30h_1
org 10018746h - shift
back_to_update_30h_1:

org 10018776h - shift
	jmp update_30h_3
org 1001877Bh - shift
back_to_update_30h_3:

org 100187EFh - shift
	jmp update_30h_4
org 100187F4h - shift
back_to_update_30h_4:

org 10018847h - shift
	jmp update_30h_5
org 1001884Ch - shift
back_to_update_30h_5:

org 10018862h - shift
	jmp update_30h_6
org 1001886Eh - shift
back_to_update_30h_6:

;----------------------
;замена обращений к 0Сh
; кол-во строк и столбцов в cache_level1
;----------------------

org 100183BCh - shift
	jmp cache_init_4
org 100183D4h - shift
back_to_cache_init_4:

org 100183D4h - shift
	jmp cache_init_5
org 100183D9h - shift
back_to_cache_init_5:

org 10018A0Eh - shift
	jmp cache_upd_6
org 10018A26h - shift
back_to_cache_upd_6:

org 10018A38h - shift
	jmp cache_upd_7
org 10018A42h - shift
back_to_cache_upd_7:

;----------------------
;замена обращений к 0С4h
; длина строки в cache
;----------------------

org 10018404h - shift
	jmp cache_init_C4_1
org 10018409h - shift
back_to_cache_init_C4_1:

org 10018800h - shift
	jmp cache_upd_C4_2
org 10018810h - shift
back_to_cache_upd_C4_2:

org 10018850h - shift
	jmp cache_upd_C4_3
org 1001885Dh - shift
back_to_cache_upd_C4_3:

;----------------------
;замена обращений к 960h
; кол-во элементов в cache_pool, cache_task и cache - 1
;----------------------

org 10016A8Eh - shift
	jmp const_960_1
org 10016A9Fh - shift
back_to_const_960_1:

org 10016DC7h - shift
	jmp const_960_2
org 10016DD2h - shift
back_to_const_960_2:

;----------------------
;разное
;----------------------

org 10016A2Fh - shift
	jmp cache_level1_length
org 10016A3Ah - shift
back_to_cache_level1_length:

org 10018794h - shift
	jmp red_cl1_line_size_minus
org 1001879Ah - shift
back_to_red_cl1_line_size_minus:

org 1001881Ah - shift
	jmp cache_size_w_o_last_line_minus
org 10018820h - shift
back_to_cache_size_w_o_last_line_minus:

org 1001888Eh - shift
	jmp cache_length
org 1001889Bh - shift
back_to_cache_length:

org 10018420h - shift
	jmp four_lines_length
org 10018426h - shift
back_to_four_lines_length:

; float - константы
org 1001748Bh - shift
	jmp vis
org 10017492h - shift
back_to_vis:

org 100174B1h - shift
	jmp circle
org 100174B9h - shift
back_to_circle:

;----------------------
;патч смещений членов класса
;----------------------

org 10018387h - shift
	jmp offset_1
org 10018393h - shift
back_to_offset_1:

org 1001868Bh - shift
	jmp offset_3
org 1001869Eh - shift
back_to_offset_3:

org 1001871Eh - shift
	jmp offset_4
org 10018724h - shift
back_to_offset_4:

org 1001876Eh - shift
	jmp offset_5
org 10018774h - shift
back_to_offset_5:

org 100187E7h - shift
	jmp offset_6
org 100187EDh - shift
back_to_offset_6:

org 1001883Dh - shift
	jmp offset_7
org 10018843h - shift
back_to_offset_7:

org 100188E6h - shift
	jmp offset_8
org 100188ECh - shift
back_to_offset_8:

org 100188F6h - shift
	jmp offset_9
org 100188FCh - shift
back_to_offset_9:

org 10018910h - shift
	jmp offset_10
org 10018922h - shift
back_to_offset_10:

org 100189ADh - shift
	jmp offset_11
org 100189B4h - shift
back_to_offset_11:

org 100189BBh - shift
	jmp offset_12
org 100189C8h - shift
back_to_offset_12:

org 100189D0h - shift
	jmp offset_13
org 100189E7h - shift
back_to_offset_13:

org 100189EEh - shift
	jmp offset_14
org 100189F5h - shift
back_to_offset_14:

org 10017340h - shift
	jmp offset_15
org 1001734Fh - shift
back_to_offset_15:

;===========================================
; РАСЧЕТ ДИНАМИЧЕСКИХ ПАРАМЕТРОВ ДЛЯ ДАЛЬНОСТИ ТРАВЫ
;===========================================

org 10009033h - shift
	jmp calculate_stuff
org 10009038h - shift
back_to_calculate_stuff:
	
;===========================================
; КОНСОЛЬНЫЕ ПАРАМЕТРЫ
;===========================================

org 10004117h - shift
	jmp con_comm

org 1008DBD3h - shift	
_atexit:

; imported functions
org 10090770h - shift
CCC_Integer__CCC_Integer      dd ?
org 10090530h - shift
CCC_Integer___CCC_Integer     dd ?
org 1009076Ch - shift
Console dd ?
org 10090768h - shift
CConsole__AddCommand dd ?
	
;===========================================
; ПЛОТНОСТЬ ТРАВЫ.
;===========================================

org 10001F75h - shift
	jmp det_density
org 10001F84h - shift
back_to_det_density:

org 100B91D0h - shift
xCCC_Float_42 dd ?

;===========================================
; MIPBIAS.
;===========================================
org 1000212Eh - shift
	jmp mip_bias
org 1000213Dh - shift
back_to_mip_bias:

org 100B9140h - shift
mipbias_obj dd ?

;===========================================
; r__geometry_lod
;===========================================	
org 100995B0h - shift
	dd 3.0
	
;=====================================
;========ФИКС ОТРИСОВКИ НЕБА==========
;=====================================
org 100A43CCh - shift
	dd 1.0
	dd -1.0
	dd -1.0
	dd 1.0
	dd -1.0
	dd 1.0
	dd 1.0
	dd -1.0
	dd 1.0
	dd 1.0
	dd -1.0
	dd -1.0
	dd 1.0
	dd 1.0
	dd -1.0
	dd 1.0
	dd 1.0
	dd 1.0
	dd 1.0
