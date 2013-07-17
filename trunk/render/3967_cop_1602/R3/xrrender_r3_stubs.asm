;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************
;===========================================
; ДАЛЬНОСТЬ ОТРИСОВКИ ТРАВЫ
;===========================================
org 1002AA09h - shift
	jmp cache_initialize_1
org 1002AA12h - shift
back_to_cache_initialize_1:

org 1002AA14h - shift
	jmp cache_initialize_2 
org 1002AA1Ah - shift
back_to_cache_initialize_2:

org 1002ADB6h - shift
	jmp cache_update_1
org 1002ADC4h - shift
back_to_cache_update_1:

org 1002AE1Ah - shift
	jmp cache_update_2
org 1002AE23h - shift
back_to_cache_update_2:

org 1002AEA0h - shift
	jmp cache_update_3 
org 1002AEA6h - shift
back_to_cache_update_3:

org 1002AEFCh - shift
	jmp cache_update_4 
org 1002AF02h - shift
back_to_cache_update_4:

org 1002AAB8h - shift
	jmp cache_task_1 
org 1002AABFh - shift
back_to_cache_task_1:

org 10029FF3h - shift
	jmp cache_upvism_1 
org 10029FF9h - shift
back_to_cache_upvism_1:

org 1002A003h - shift
	jmp cache_upvism_2
org 1002A009h - shift
back_to_cache_upvism_2:

org 100299D0h - shift
	jmp cache_upvism_3
org 100299D9h - shift
back_to_cache_upvism_3:

;----------------------
;замена обращений к 30h
; то же, что и 31h, просто используется в циклах с другим условием
;----------------------

org 1002AD92h - shift
	jmp update_30h_1
org 1002ADABh - shift
back_to_update_30h_1:

org 1002ADE5h - shift
	jmp update_30h_3
org 1002ADEAh - shift
back_to_update_30h_3:

org 1002AE6Bh - shift
	jmp update_30h_4
org 1002AE70h - shift
back_to_update_30h_4:

org 1002AEC4h - shift
	jmp update_30h_5
org 1002AEC9h - shift
back_to_update_30h_5:

org 1002AEE6h - shift
	jmp update_30h_6
org 1002AEF0h - shift
back_to_update_30h_6:

;----------------------
;замена обращений к 0Сh
; кол-во строк и столбцов в cache_level1
;----------------------

org 1002AA1Ch - shift
	jmp cache_init_4
org 1002AA34h - shift
back_to_cache_init_4:

org 1002AA34h - shift
	jmp cache_init_5
org 1002AA39h - shift
back_to_cache_init_5:

org 1002B090h - shift
	jmp cache_upd_6
org 1002B0A6h - shift
back_to_cache_upd_6:

org 1002B0BAh - shift
	jmp cache_upd_7
org 1002B0C2h - shift
back_to_cache_upd_7:

;----------------------
;замена обращений к 0С4h
; длина строки в cache
;----------------------

org 1002AA64h - shift
	jmp cache_init_C4_1
org 1002AA69h - shift
back_to_cache_init_C4_1:

org 1002AE72h - shift
	jmp cache_upd_C4_2
org 1002AE82h - shift
back_to_cache_upd_C4_2:

org 1002AED0h - shift
	jmp cache_upd_C4_3
org 1002AEDDh - shift
back_to_cache_upd_C4_3:

;----------------------
;замена обращений к 960h
; кол-во элементов в cache_pool, cache_task и cache - 1
;----------------------

org 1002914Eh - shift
	jmp const_960_1
org 1002915Fh - shift
back_to_const_960_1:

org 10029487h - shift
	jmp const_960_2
org 10029492h - shift
back_to_const_960_2:

;----------------------
;разное
;----------------------
	
org 100290EFh - shift
	jmp cache_level1_length
org 100290FAh - shift
back_to_cache_level1_length:

org 1002AE08h - shift
	jmp red_cl1_line_size_minus
org 1002AE0Eh - shift
back_to_red_cl1_line_size_minus:

org 1002AE8Eh - shift
	jmp cache_size_w_o_last_line_minus
org 1002AE94h - shift
back_to_cache_size_w_o_last_line_minus:

org 1002AF17h - shift
	jmp cache_length
org 1002AF24h - shift
back_to_cache_length:

org 1002AA80h - shift
	jmp four_lines_length
org 1002AA86h - shift
back_to_four_lines_length:

; float - константы
org 10029B39h - shift
	jmp vis
org 10029B40h - shift
back_to_vis:

org 10029B5Fh - shift
	jmp circle
org 10029B67h - shift
back_to_circle:

;----------------------
;патч смещений членов класса
;----------------------
org 1002A9E7h - shift
	jmp offset_1
org 1002A9F3h - shift
back_to_offset_1:

org 1002ACEBh - shift
	jmp offset_3
org 1002ACFEh - shift
back_to_offset_3:

org 1002AD6Fh - shift
	jmp offset_4
org 1002AD75h - shift
back_to_offset_4:

org 1002ADDDh - shift
	jmp offset_5
org 1002ADE3h - shift
back_to_offset_5:

org 1002AE63h - shift
	jmp offset_6
org 1002AE69h - shift
back_to_offset_6:

org 1002AEB7h - shift
	jmp offset_7
org 1002AEBDh - shift
back_to_offset_7:

org 1002AF66h - shift
	jmp offset_8
org 1002AF6Ch - shift
back_to_offset_8:

org 1002AF76h - shift
	jmp offset_9
org 1002AF7Ch - shift
back_to_offset_9:

org 1002AF93h - shift
	jmp offset_10
org 1002AFA5h - shift
back_to_offset_10:

org 1002B02Dh - shift
	jmp offset_11
org 1002B034h - shift
back_to_offset_11:

org 1002B03Bh - shift
	jmp offset_12
org 1002B048h - shift
back_to_offset_12:

org 1002B050h - shift
	jmp offset_13
org 1002B067h - shift
back_to_offset_13:

org 1002B06Eh - shift
	jmp offset_14
org 1002B075h - shift
back_to_offset_14:

org 100299EAh - shift
	jmp offset_15
org 100299F9h - shift
back_to_offset_15:

;===========================================
; РАСЧЕТ ДИНАМИЧЕСКИХ ПАРАМЕТРОВ ДЛЯ ДАЛЬНОСТИ ТРАВЫ
;===========================================

org 1001A8CBh - shift
	jmp calculate_stuff
org 1001A8D0h - shift
back_to_calculate_stuff:

;===========================================
; КОНСОЛЬНЫЕ ПАРАМЕТРЫ
;===========================================

org 1000411Ah - shift
	jmp con_comm

org 100CC8C7h - shift	
_atexit:

; imported functions
org 100D0800h - shift
CCC_Integer__CCC_Integer      dd ?
org 100D07ECh - shift
CCC_Integer___CCC_Integer     dd ?
org 100D07F4h - shift
Console dd ?
org 100D07E8h - shift
CConsole__AddCommand dd ?

;===========================================
; ПЛОТНОСТЬ ТРАВЫ.
;===========================================
org 10001EE5h - shift
	jmp det_density
org 10001EF4h - shift
back_to_det_density:

org 100FB828h - shift
xCCC_Float_42 dd ?

;===========================================
; r__geometry_lod
;===========================================	
org 100DB144h - shift
	dd 3.0
	
;===========================================
; ФИКС ДВИЖЕНИЯ СОЛНЦА.
;===========================================
org 10019730h - shift
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
org 100E5464h - shift
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

org 100D0120h - shift
memmove dd ?
org 100E7C4Ch - shift
ps_r2_ls_flags    dd ?
org 100C2510h - shift
sub_100C2510:

org 1001FE17h - shift
	jmp sun_check
org 1001FE1Ch - shift
back_to_sun_check:
org 1002F67Dh - shift
	nop
	jmp	sun_details_1_fix
org 1002F69Dh - shift
back_to_sun_details_1_fix:

;===========================================
; Дополнительные разрешения карты теней
;===========================================
org 10015CB9h - shift
	jmp	new_smap_sizes
org 10015CBEh - shift
back_from_new_smap_sizes:
org 100D0510h - shift
Core dd ?

;===========================================
; Расширенная регулировка r2_sun_near
;===========================================
org 10002D5Ah - shift
	jmp	sun_near_fix_label
org 10002D61h - shift
back_from_sun_near_fix_label: