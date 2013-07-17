;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************
;===========================================
; ДАЛЬНОСТЬ ОТРИСОВКИ ТРАВЫ
;===========================================
org 10017DE9h - shift
	jmp cache_initialize_1 ; врезка с инструкцией перехода - 5 байт
org 10017DF2h - shift
back_to_cache_initialize_1:

org 10017DF4h - shift
	jmp cache_initialize_2 ; врезка с инструкцией перехода - 5 байт
org 10017DFAh - shift
back_to_cache_initialize_2:

org 10018192h - shift
	jmp cache_update_1 ; врезка с инструкцией перехода - 5 байт
org 1001819Bh - shift
back_to_cache_update_1:

org 100181E2h - shift
	jmp cache_update_2 ; врезка с инструкцией перехода - 5 байт
org 100181EBh - shift
back_to_cache_update_2:

org 10018268h - shift
	jmp cache_update_3 ; врезка с инструкцией перехода - 5 байт
org 1001826Eh - shift
back_to_cache_update_3:

org 100182B6h - shift
	jmp cache_update_4 ; врезка с инструкцией перехода - 5 байт
org 100182BCh - shift
back_to_cache_update_4:

org 10017E98h - shift
	jmp cache_task_1 ; 
org 10017E9Fh - shift
back_to_cache_task_1:

org 10017523h - shift
	jmp cache_upvism_1 ; врезка с инструкцией перехода - 5 байт
org 10017529h - shift
back_to_cache_upvism_1:

org 10017533h - shift
	jmp cache_upvism_2 ; врезка с инструкцией перехода - 5 байт
org 10017539h - shift
back_to_cache_upvism_2:

org 10016EF0h - shift
	jmp cache_upvism_3 ; врезка с инструкцией перехода - 5 байт
org 10016EF9h - shift
back_to_cache_upvism_3:

;----------------------
;замена обращений к 30h
; то же, что и 31h, просто используется в циклах с другим условием
;----------------------
org 10018166h - shift
	jmp update_30h_1
org 10018186h - shift
back_to_update_30h_1:

org 100181B6h - shift
	jmp update_30h_3
org 100181BBh - shift
back_to_update_30h_3:

org 1001822Fh - shift
	jmp update_30h_4
org 10018234h - shift
back_to_update_30h_4:

org 10018287h - shift
	jmp update_30h_5
org 1001828Ch - shift
back_to_update_30h_5:

org 100182A2h - shift
	jmp update_30h_6
org 100182AEh - shift
back_to_update_30h_6:

;----------------------
;замена обращений к 0Сh
; кол-во строк и столбцов в cache_level1
;----------------------

org 10017DFCh - shift
	jmp cache_init_4
org 10017E14h - shift
back_to_cache_init_4:

org 10017E14h - shift
	jmp cache_init_5
org 10017E19h - shift
back_to_cache_init_5:

org 1001844Eh - shift
	jmp cache_upd_6
org 10018466h - shift
back_to_cache_upd_6:

org 10018478h - shift
	jmp cache_upd_7
org 10018482h - shift
back_to_cache_upd_7:

;----------------------
;замена обращений к 0С4h
; длина строки в cache
;----------------------

org 10017E44h - shift
	jmp cache_init_C4_1
org 10017E49h - shift
back_to_cache_init_C4_1:

org 10018240h - shift
	jmp cache_upd_C4_2
org 10018250h - shift
back_to_cache_upd_C4_2:

org 10018290h - shift
	jmp cache_upd_C4_3
org 1001829Dh - shift
back_to_cache_upd_C4_3:

;----------------------
;замена обращений к 960h
; кол-во элементов в cache_pool, cache_task и cache - 1
;----------------------

org 100166AEh - shift
	jmp const_960_1
org 100166BFh - shift
back_to_const_960_1:

org 100169E7h - shift
	jmp const_960_2
org 100169F2h - shift
back_to_const_960_2:

;----------------------
;разное
;----------------------

org 1001664Fh - shift
	jmp cache_level1_length
org 1001665Ah - shift
back_to_cache_level1_length:

org 100181D4h - shift
	jmp red_cl1_line_size_minus
org 100181DAh - shift
back_to_red_cl1_line_size_minus:

org 1001825Ah - shift
	jmp cache_size_w_o_last_line_minus
org 10018260h - shift
back_to_cache_size_w_o_last_line_minus:

org 100182CEh - shift
	jmp cache_length
org 100182DBh - shift
back_to_cache_length:

org 10017E60h - shift
	jmp four_lines_length
org 10017E66h - shift
back_to_four_lines_length:

; float - константы
org 10017058h - shift
	jmp vis
org 1001705Fh - shift
back_to_vis:

org 1001707Eh - shift
	jmp circle
org 10017086h - shift
back_to_circle:

;----------------------
;патч смещений членов класса
;----------------------

org 10017DC7h - shift
	jmp offset_1
org 10017DD3h - shift
back_to_offset_1:

org 100180CBh - shift
	jmp offset_3
org 100180DEh - shift
back_to_offset_3:

org 1001815Eh - shift
	jmp offset_4
org 10018164h - shift
back_to_offset_4:

org 100181AEh - shift
	jmp offset_5
org 100181B4h - shift
back_to_offset_5:

org 10018227h - shift
	jmp offset_6
org 1001822Dh - shift
back_to_offset_6:

org 1001827Dh - shift
	jmp offset_7
org 10018283h - shift
back_to_offset_7:

org 10018326h - shift
	jmp offset_8
org 1001832Ch - shift
back_to_offset_8:

org 10018336h - shift
	jmp offset_9
org 1001833Ch - shift
back_to_offset_9:

org 10018350h - shift
	jmp offset_10
org 10018362h - shift
back_to_offset_10:

org 100183EDh - shift
	jmp offset_11
org 100183F4h - shift
back_to_offset_11:

org 100183FBh - shift
	jmp offset_12
org 10018408h - shift
back_to_offset_12:

org 10018410h - shift
	jmp offset_13
org 10018427h - shift
back_to_offset_13:

org 1001842Eh - shift
	jmp offset_14
org 10018435h - shift
back_to_offset_14:

org 10016F0Eh - shift
	jmp offset_15
org 10016F1Dh - shift
back_to_offset_15:

;===========================================
; РАСЧЕТ ДИНАМИЧЕСКИХ ПАРАМЕТРОВ ДЛЯ ДАЛЬНОСТИ ТРАВЫ
;===========================================

org 10007DFFh - shift
	jmp calculate_stuff
org 10007E04h - shift
back_to_calculate_stuff:
	
;===========================================
; КОНСОЛЬНЫЕ ПАРАМЕТРЫ
;===========================================

org 10003C56h - shift
	jmp con_comm

org 1008D8B2h - shift	
_atexit:

; imported functions
org 100906BCh - shift
CCC_Integer__CCC_Integer      dd ?
org 100906E4h - shift
CCC_Integer___CCC_Integer     dd ?
org 10090720h - shift
Console dd ?
org 10090718h - shift
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

org 100B7930h - shift
xCCC_Float_42 CCC_Float <?>

;===========================================
; r__geometry_lod
;===========================================	
org 10098C10h - shift
    dd 3.0

;===========================================
; MIPBIAS.
;===========================================
org 10001E1Bh - shift
	jmp mip_bias
org 10001E2Ah - shift
back_to_mip_bias:

org 100B78D0h - shift
mipbias_obj dd ?