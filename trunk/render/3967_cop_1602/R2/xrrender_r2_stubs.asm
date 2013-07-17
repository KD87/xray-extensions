;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************

;===========================================
; ДАЛЬНОСТЬ ОТРИСОВКИ ТРАВЫ
;===========================================
org 10028D89h - shift
	jmp cache_initialize_1
org 10028D92h - shift
back_to_cache_initialize_1:

org 10028D94h - shift
	jmp cache_initialize_2 
org 10028D9Ah - shift
back_to_cache_initialize_2:

org 10029136h - shift
	jmp cache_update_1
org 10029144h - shift
back_to_cache_update_1:

org 1002919Ah - shift
	jmp cache_update_2
org 100291A3h - shift
back_to_cache_update_2:

org 10029220h - shift
	jmp cache_update_3 
org 10029226h - shift
back_to_cache_update_3:

org 1002927Ch - shift
	jmp cache_update_4 
org 10029282h - shift
back_to_cache_update_4:

org 10028E38h - shift
	jmp cache_task_1 
org 10028E3Fh - shift
back_to_cache_task_1:

org 100283E3h - shift
	jmp cache_upvism_1 
org 100283E9h - shift
back_to_cache_upvism_1:

org 100283F3h - shift
	jmp cache_upvism_2
org 100283F9h - shift
back_to_cache_upvism_2:

org 10027DC0h - shift
	jmp cache_upvism_3
org 10027DC9h - shift
back_to_cache_upvism_3:

;----------------------
;замена обращений к 30h
; то же, что и 31h, просто используется в циклах с другим условием
;----------------------

org 10029112h - shift
	jmp update_30h_1
org 1002912Bh - shift
back_to_update_30h_1:

org 10029165h - shift
	jmp update_30h_3
org 1002916Ah - shift
back_to_update_30h_3:

org 100291EBh - shift
	jmp update_30h_4
org 100291F0h - shift
back_to_update_30h_4:

org 10029244h - shift
	jmp update_30h_5
org 10029249h - shift
back_to_update_30h_5:

org 10029266h - shift
	jmp update_30h_6
org 10029270h - shift
back_to_update_30h_6:

;----------------------
;замена обращений к 0Сh
; кол-во строк и столбцов в cache_level1
;----------------------

org 10028D9Ch - shift
	jmp cache_init_4
org 10028DB4h - shift
back_to_cache_init_4:

org 10028DB4h - shift
	jmp cache_init_5
org 10028DB9h - shift
back_to_cache_init_5:

org 10029410h - shift
	jmp cache_upd_6
org 10029426h - shift
back_to_cache_upd_6:

org 1002943Ah - shift
	jmp cache_upd_7
org 10029442h - shift
back_to_cache_upd_7:

;----------------------
;замена обращений к 0С4h
; длина строки в cache
;----------------------

org 10028DE4h - shift
	jmp cache_init_C4_1
org 10028DE9h - shift
back_to_cache_init_C4_1:

org 100291F2h - shift
	jmp cache_upd_C4_2
org 10029202h - shift
back_to_cache_upd_C4_2:

org 10029250h - shift
	jmp cache_upd_C4_3
org 1002925Dh - shift
back_to_cache_upd_C4_3:

;----------------------
;замена обращений к 960h
; кол-во элементов в cache_pool, cache_task и cache - 1
;----------------------

org 1002753Eh - shift
	jmp const_960_1
org 1002754Fh - shift
back_to_const_960_1:

org 10027877h - shift
	jmp const_960_2
org 10027882h - shift
back_to_const_960_2:

;----------------------
;разное
;----------------------

org 100274DFh - shift
	jmp cache_level1_length
org 100274EAh - shift
back_to_cache_level1_length:

org 10029188h - shift
	jmp red_cl1_line_size_minus
org 1002918Eh - shift
back_to_red_cl1_line_size_minus:

org 1002920Eh - shift
	jmp cache_size_w_o_last_line_minus
org 10029214h - shift
back_to_cache_size_w_o_last_line_minus:

org 10029297h - shift
	jmp cache_length
org 100292A4h - shift
back_to_cache_length:

org 10028E00h - shift
	jmp four_lines_length
org 10028E06h - shift
back_to_four_lines_length:

; float - константы
org 10027F29h - shift
	jmp vis
org 10027F30h - shift
back_to_vis:

org 10027F4Fh - shift
	jmp circle
org 10027F57h - shift
back_to_circle:

;----------------------
;патч смещений членов класса
;----------------------
org 10028D67h - shift
	jmp offset_1
org 10028D73h - shift
back_to_offset_1:

org 1002906Bh - shift
	jmp offset_3
org 1002907Eh - shift
back_to_offset_3:

org 100290EFh - shift
	jmp offset_4
org 100290F5h - shift
back_to_offset_4:

org 1002915Dh - shift
	jmp offset_5
org 10029163h - shift
back_to_offset_5:

org 100291E3h - shift
	jmp offset_6
org 100291E9h - shift
back_to_offset_6:

org 10029237h - shift
	jmp offset_7
org 1002923Dh - shift
back_to_offset_7:

org 100292E6h - shift
	jmp offset_8
org 100292ECh - shift
back_to_offset_8:

org 100292F6h - shift
	jmp offset_9
org 100292FCh - shift
back_to_offset_9:

org 10029313h - shift
	jmp offset_10
org 10029325h - shift
back_to_offset_10:

org 100293ADh - shift
	jmp offset_11
org 100293B4h - shift
back_to_offset_11:

org 100293BBh - shift
	jmp offset_12
org 100293C8h - shift
back_to_offset_12:

org 100293D0h - shift
	jmp offset_13
org 100293E7h - shift
back_to_offset_13:

org 100293EEh - shift
	jmp offset_14
org 100293F5h - shift
back_to_offset_14:

org 10027DDAh - shift
	jmp offset_15
org 10027DE9h - shift
back_to_offset_15:

;===========================================
; КОНСОЛЬНЫЕ ПАРАМЕТРЫ
;===========================================

org 100041AAh - shift
	jmp con_comm

org 100B2EE7h - shift	
_atexit:

; imported functions
org 100B5778h - shift
CCC_Integer__CCC_Integer      dd ?
org 100B57A0h - shift
CCC_Integer___CCC_Integer     dd ?
org 100B5798h - shift
Console dd ?
org 100B578Ch - shift
CConsole__AddCommand dd ?
	
;===========================================
; РАСЧЕТ ДИНАМИЧЕСКИХ ПАРАМЕТРОВ ДЛЯ ДАЛЬНОСТИ ТРАВЫ
;===========================================

org 1000A311h - shift
	jmp calculate_stuff
org 1000A316h - shift
back_to_calculate_stuff:

;===========================================
; ПЛОТНОСТЬ ТРАВЫ.
;===========================================
org 10001F75h - shift
	jmp det_density
org 10001F84h - shift
back_to_det_density:

org 100E071Ch - shift
xCCC_Float_42 dd ?

;===========================================
; MIPBIAS.
;===========================================
org 100024C0h - shift
	jmp mip_bias
org 100024CFh - shift
back_to_mip_bias:

org 100E0508h - shift
dword_100E0508 dd ?

;===========================================
; r__geometry_lod
;===========================================	
org 100BF64Ch - shift
	dd 3.0
	
;===========================================
; ФИКС ДВИЖЕНИЯ СОЛНЦА.
;===========================================
org 10008D30h - shift
movement_fix proc
	mov     ecx, [esp]
	xor     eax, eax
	cmp     ecx, 41EDF4h
	setz    al
	retn
movement_fix endp
	
;=====================================
;========ФИКС ОТРИСОВКИ НЕБА==========
;=====================================
org 100C923Ch - shift
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

;===========================================
; ФИКС ТЕНЕЙ ОТ СОЛНЦА.
;===========================================

org 100B5110h - shift
memmove dd ?
org 100CB9C8h - shift
ps_r2_ls_flags    dd ?

org 1000F4F2h - shift
	jmp sun_check
org 1000F4F7h - shift
back_to_sun_check:
org 1002C8E4h - shift
	nop
	jmp	sun_details_1_fix
org 1002C904h - shift
back_to_sun_details_1_fix:

;===========================================
; Дополнительные разрешения карты теней
;===========================================
org 1000584Ah - shift
	jmp	new_smap_sizes
org 1000584Fh - shift
back_from_new_smap_sizes:
org 100B5450h - shift
Core dd ?

;===========================================
; Расширенная регулировка r2_sun_near
;===========================================
org 10002DEAh - shift
	jmp	sun_near_fix_label
org 10002DF1h - shift
back_from_sun_near_fix_label: