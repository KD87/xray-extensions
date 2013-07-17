;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************
;===========================================
; ДАЛЬНОСТЬ ОТРИСОВКИ ТРАВЫ
;===========================================
org 1002B8A9h - shift
	jmp cache_initialize_1
org 1002B8B2h - shift
back_to_cache_initialize_1:

org 1002B8B4h - shift
	jmp cache_initialize_2 
org 1002B8BAh - shift
back_to_cache_initialize_2:

org 1002BC56h - shift
	jmp cache_update_1
org 1002BC64h - shift
back_to_cache_update_1:

org 1002BCBAh - shift
	jmp cache_update_2
org 1002BCC3h - shift
back_to_cache_update_2:

org 1002BD40h - shift
	jmp cache_update_3 
org 1002BD46h - shift
back_to_cache_update_3:

org 1002BD9Ch - shift
	jmp cache_update_4 
org 1002BDA2h - shift
back_to_cache_update_4:

org 1002B958h - shift
	jmp cache_task_1 
org 1002B95Fh - shift
back_to_cache_task_1:

org 1002AE33h - shift
	jmp cache_upvism_1 
org 1002AE39h - shift
back_to_cache_upvism_1:

org 1002AE43h - shift
	jmp cache_upvism_2
org 1002AE49h - shift
back_to_cache_upvism_2:

org 1002A810h - shift
	jmp cache_upvism_3
org 1002A819h - shift
back_to_cache_upvism_3:

;----------------------
;замена обращений к 30h
; то же, что и 31h, просто используется в циклах с другим условием
;----------------------

org 1002BC32h - shift
	jmp update_30h_1
org 1002BC4Bh - shift
back_to_update_30h_1:

org 1002BC85h - shift
	jmp update_30h_3
org 1002BC8Ah - shift
back_to_update_30h_3:

org 1002BD0Bh - shift
	jmp update_30h_4
org 1002BD10h - shift
back_to_update_30h_4:

org 1002BD64h - shift
	jmp update_30h_5
org 1002BD69h - shift
back_to_update_30h_5:

org 1002BD86h - shift
	jmp update_30h_6
org 1002BD90h - shift
back_to_update_30h_6:

;----------------------
;замена обращений к 0Сh
; кол-во строк и столбцов в cache_level1
;----------------------

org 1002B8BCh - shift
	jmp cache_init_4
org 1002B8D4h - shift
back_to_cache_init_4:

org 1002B8D4h - shift
	jmp cache_init_5
org 1002B8D9h - shift
back_to_cache_init_5:

org 1002BF30h - shift
	jmp cache_upd_6
org 1002BF46h - shift
back_to_cache_upd_6:

org 1002BF5Ah - shift
	jmp cache_upd_7
org 1002BF62h - shift
back_to_cache_upd_7:

;----------------------
;замена обращений к 0С4h
; длина строки в cache
;----------------------

org 1002B904h - shift
	jmp cache_init_C4_1
org 1002B909h - shift
back_to_cache_init_C4_1:

org 1002BD12h - shift
	jmp cache_upd_C4_2
org 1002BD22h - shift
back_to_cache_upd_C4_2:

org 1002BD70h - shift
	jmp cache_upd_C4_3
org 1002BD7Dh - shift
back_to_cache_upd_C4_3:

;----------------------
;замена обращений к 960h
; кол-во элементов в cache_pool, cache_task и cache - 1
;----------------------

org 10029F8Eh - shift
	jmp const_960_1
org 10029F9Fh - shift
back_to_const_960_1:

org 1002A2C7h - shift
	jmp const_960_2
org 1002A2D2h - shift
back_to_const_960_2:

;----------------------
;разное
;----------------------
	
org 10029F2Fh - shift
	jmp cache_level1_length
org 10029F3Ah - shift
back_to_cache_level1_length:

org 1002BCA8h - shift
	jmp red_cl1_line_size_minus
org 1002BCAEh - shift
back_to_red_cl1_line_size_minus:

org 1002BD2Eh - shift
	jmp cache_size_w_o_last_line_minus
org 1002BD34h - shift
back_to_cache_size_w_o_last_line_minus:

org 1002BDB7h - shift
	jmp cache_length
org 1002BDC4h - shift
back_to_cache_length:

org 1002B920h - shift
	jmp four_lines_length
org 1002B926h - shift
back_to_four_lines_length:

; float - константы
org 1002A979h - shift
	jmp vis
org 1002A980h - shift
back_to_vis:

org 1002A99Fh - shift
	jmp circle
org 1002A9A7h - shift
back_to_circle:

;----------------------
;патч смещений членов класса
;----------------------

org 1002B887h - shift
	jmp offset_1
org 1002B893h - shift
back_to_offset_1:

org 1002BB8Bh - shift
	jmp offset_3
org 1002BB9Eh - shift
back_to_offset_3:

org 1002BC0Fh - shift
	jmp offset_4
org 1002BC15h - shift
back_to_offset_4:

org 1002BC7Dh - shift
	jmp offset_5
org 1002BC83h - shift
back_to_offset_5:

org 1002BD03h - shift
	jmp offset_6
org 1002BD09h - shift
back_to_offset_6:

org 1002BD57h - shift
	jmp offset_7
org 1002BD5Dh - shift
back_to_offset_7:

org 1002BE06h - shift
	jmp offset_8
org 1002BE0Ch - shift
back_to_offset_8:

org 1002BE16h - shift
	jmp offset_9
org 1002BE1Ch - shift
back_to_offset_9:

org 1002BE33h - shift
	jmp offset_10
org 1002BE45h - shift
back_to_offset_10:

org 1002BECDh - shift
	jmp offset_11
org 1002BED4h - shift
back_to_offset_11:

org 1002BEDBh - shift
	jmp offset_12
org 1002BEE8h - shift
back_to_offset_12:

org 1002BEF0h - shift
	jmp offset_13
org 1002BF07h - shift
back_to_offset_13:

org 1002BF0Eh - shift
	jmp offset_14
org 1002BF15h - shift
back_to_offset_14:

org 1002A82Ah - shift
	jmp offset_15
org 1002A839h - shift
back_to_offset_15:

;===========================================
; РАСЧЕТ ДИНАМИЧЕСКИХ ПАРАМЕТРОВ ДЛЯ ДАЛЬНОСТИ ТРАВЫ
;===========================================

org 1001A9EBh - shift
	jmp calculate_stuff
org 1001A9F0h - shift
back_to_calculate_stuff:

;===========================================
; КОНСОЛЬНЫЕ ПАРАМЕТРЫ
;===========================================

org 1000412Ah - shift
	jmp con_comm

org 100D8B70h - shift	
_atexit:

; imported functions
org 100DC7C8h - shift
CCC_Integer__CCC_Integer      dd ?
org 100DC7F4h - shift
CCC_Integer___CCC_Integer     dd ?
org 100DC7CCh - shift
Console dd ?
org 100DC7C0h - shift
CConsole__AddCommand dd ?

;===========================================
; ПЛОТНОСТЬ ТРАВЫ.
;===========================================

org 10001EF5h - shift
	jmp det_density
org 10001F04h - shift
back_to_det_density:

org 10108C98h - shift
xCCC_Float_42 dd ?

;===========================================
; r__geometry_lod
;===========================================	
org 100E7754h - shift
	dd 3.0
	
;===========================================
; ФИКС ДВИЖЕНИЯ СОЛНЦА.
;===========================================
org 100198D0h - shift
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
org 100F2464h - shift
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

org 100DC0CCh - shift
memmove dd ?
org 100F4C54h - shift
ps_r2_ls_flags    dd ?
org 100CD680h - shift
sub_100CD680:

org 1001FF0Ah - shift
	jmp sun_check
org 1001FF0Fh - shift
back_to_sun_check:
org 1003056Fh - shift
	nop
	jmp	sun_details_1_fix
org 10030593h - shift
back_to_sun_details_1_fix:

;===========================================
; Дополнительные разрешения карты теней
;===========================================
org 10015883h - shift
	jmp	new_smap_sizes
org 10015888h - shift
back_from_new_smap_sizes:
org 100DC54Ch - shift
Core dd ?

;===========================================
; Расширенная регулировка r2_sun_near
;===========================================
org 10002D6Ah - shift
	jmp	sun_near_fix_label
org 10002D71h - shift
back_from_sun_near_fix_label:
