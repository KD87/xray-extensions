;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************

;--------------------------
;замена обращений к 31h
;кол-во строк и столбцов в cache_pool, cache_task и cache
;--------------------------
org 1001828Ah - shift
	jmp cache_initialize_1 ; врезка с инструкцией перехода - 5 байт
org 10018293h - shift
back_to_cache_initialize_1:

org 10018295h - shift
	jmp cache_initialize_2 ; врезка с инструкцией перехода - 5 байт
org 1001829Bh - shift
back_to_cache_initialize_2:

org 10018651h - shift
	jmp cache_update_1 ; врезка с инструкцией перехода - 5 байт
org 1001865Ah - shift
back_to_cache_update_1:

org 100186A1h - shift
	jmp cache_update_2 ; врезка с инструкцией перехода - 5 байт
org 100186AAh - shift
back_to_cache_update_2:

org 10018727h - shift
	jmp cache_update_3 ; врезка с инструкцией перехода - 5 байт
org 1001872Dh - shift
back_to_cache_update_3:

org 10018775h - shift
	jmp cache_update_4 ; врезка с инструкцией перехода - 5 байт
org 1001877Bh - shift
back_to_cache_update_4:

;----------------------
;замена обращений к 30h
; то же, что и 31h, просто используется в циклах с другим условием
;----------------------

org 10018626h - shift
	jmp update_30h_1
org 1001862Bh - shift
back_to_update_30h_1:

org 1001863Ah - shift
	jmp update_30h_2
org 10018645h - shift
back_to_update_30h_2:

org 10018675h - shift
	jmp update_30h_3
org 1001867Ah - shift
back_to_update_30h_3:

org 100186EFh - shift
	jmp update_30h_4
org 100186F4h - shift
back_to_update_30h_4:

org 10018746h - shift
	jmp update_30h_5
org 1001874Bh - shift
back_to_update_30h_5:

org 10018762h - shift
	jmp update_30h_6
org 1001876Dh - shift
back_to_update_30h_6:

org 1001890Eh - shift
	jmp cache_update_6 ; врезка с инструкцией перехода - 5 байт
org 10018926h - shift
back_to_cache_update_6:

org 10018938h - shift
	jmp cache_update_7 ; врезка с инструкцией перехода - 5 байт
org 10018942h - shift
back_to_cache_update_7:

;----------------------
;замена обращений к 0Сh
; кол-во строк и столбцов в cache_level1
;----------------------

org 100171BEh - shift
	jmp cache_upvism_1 ; врезка с инструкцией перехода - 5 байт
org 100171C4h - shift
back_to_cache_upvism_1:

org 100171CEh - shift
	jmp cache_upvism_2 ; врезка с инструкцией перехода - 5 байт
org 100171D4h - shift
back_to_cache_upvism_2:

org 10016CE3h - shift
	jmp cache_upvism_3 ; врезка с инструкцией перехода - 5 байт
org 10016CECh - shift
back_to_cache_upvism_3:

org 1001829Dh - shift
	jmp cache_init_4
org 100182B5h - shift
back_to_cache_init_4:

org 100182B5h - shift
	jmp cache_init_5
org 100182BAh - shift
back_to_cache_init_5:

;----------------------
;замена обращений к 0С4h
; длина строки в cache
;----------------------

org 100182E4h - shift
	jmp cache_init_C4_1
org 100182E9h - shift
back_to_cache_init_C4_1:

org 10018700h - shift
	jmp cache_upd_C4_2
org 10018710h - shift
back_to_cache_upd_C4_2:

org 10018750h - shift
	jmp cache_upd_C4_3
org 1001875Dh - shift
back_to_cache_upd_C4_3:

;----------------------
;замена обращений к 960h
; кол-во элементов в cache_pool, cache_task и cache - 1
;----------------------

org 1001645Eh - shift
	jmp const_960_1
org 1001646Fh - shift
back_to_const_960_1:

org 100166A1h - shift
	jmp const_960_2
org 100166ACh - shift
back_to_const_960_2:

;----------------------
;разное
;----------------------

org 1001833Ah - shift
	jmp cache_task_1 ; 
org 10018341h - shift
back_to_cache_task_1:

org 100163FFh - shift
	jmp cache_level1_length
org 1001640Ah - shift
back_to_cache_level1_length:

org 10018693h - shift
	jmp red_cl1_line_size_minus
org 10018699h - shift
back_to_red_cl1_line_size_minus:

org 1001878Dh - shift
	jmp cache_length
org 1001879Ah - shift
back_to_cache_length:

org 10018719h - shift
	jmp cache_size_w_o_last_line_minus
org 1001871Fh - shift
back_to_cache_size_w_o_last_line_minus:

org 10018300h - shift
	jmp four_lines_length
org 10018306h - shift
back_to_four_lines_length:

; float - константы
org 10016E57h - shift
	jmp vis
org 10016E5Eh - shift
back_to_vis:

org 10016E7Dh - shift
	jmp circle
org 10016E85h - shift
back_to_circle:


;----------------------
;патч смещений членов класса
;----------------------
org 10018267h - shift
	jmp offset_1
org 10018273h - shift
back_to_offset_1:

org 10018587h - shift
	jmp offset_2
org 1001859Ah - shift
back_to_offset_2:

org 1001861Eh - shift
	jmp offset_3
org 10018624h - shift
back_to_offset_3:

org 1001866Dh - shift
	jmp offset_4
org 10018673h - shift
back_to_offset_4:

org 100186E7h - shift
	jmp offset_5
org 100186EDh - shift
back_to_offset_5:

org 1001873Ch - shift
	jmp offset_6
org 10018742h - shift
back_to_offset_6:

org 100187E6h - shift
	jmp offset_7
org 100187ECh - shift
back_to_offset_7:

org 100187F6h - shift
	jmp offset_8
org 100187FCh - shift
back_to_offset_8:

org 10018810h - shift
	jmp offset_9
org 10018822h - shift
back_to_offset_9:

org 100188ADh - shift
	jmp offset_10
org 100188B4h - shift
back_to_offset_10:

org 100188BBh - shift
	jmp offset_11
org 100188C8h - shift
back_to_offset_11:

org 100188D0h - shift
	jmp offset_12
org 100188E7h - shift
back_to_offset_12:

org 100188EEh - shift
	jmp offset_13
org 100188F5h - shift
back_to_offset_13:

org 10016D06h - shift
	jmp offset_14
org 10016D15h - shift
back_to_offset_14:


;===========================================
; КОНСОЛЬНАЯ КОМАНДА
;===========================================

org 10002D52h - shift
	jmp con_comm
org 10002D59h - shift
back_to_con_comm:
	
org 10051A7Fh - shift	
_atexit:

; imported functions
org 10054278h - shift
CCC_Integer__CCC_Integer      dword ?
org 10054254h - shift
CCC_Integer___CCC_Integer     dword ?
org 10054250h - shift
CCC_Mask__CCC_Mask      dword ?
org 1005424Ch - shift
CCC_Mask___CCC_Mask     dword ?
org 10054224h - shift
CCC_Float__CCC_Float      dword ?
org 10054288h - shift
CCC_Float___CCC_Float     dword ?
org 10054244h - shift
CCC_Token__CCC_Token      dword ?
org 10054228h - shift
CCC_Token___CCC_Token     dword ?
org 10054274h - shift
CConsole__AddCommand     	  dword ?
org 1005422Ch - shift
Console dword ?

;===========================================
; ПЛОТНОСТЬ ТРАВЫ.
;===========================================

CCC_Float       struct ; (sizeof=0x18, standard type)
	baseclass_0     dd ?
	value           dd ?                    ; offset
	min             dd ?
	max             dd ?
CCC_Float       ends

org 10001762h - shift
	jmp det_density
org 10001771h - shift
back_to_det_density:

org 100723ECh - shift
xCCC_Float_42 CCC_Float <?>


;===========================================
; ОБРАБОТЧИК КОНСОЛЬНОЙ КОМАНДЫ.
; вызывается из CRender::level_Load
; врезка тут:
; .text:10007441                 push    0D0BB8h
; как раз пять байт
;===========================================

org 10007441h - shift
	jmp calculate_stuff
org 10007446h - shift
back_to_calculate_stuff:

; параметры
org 1007248Ch - shift
rad	dd ?					; 31h
org 10072490h - shift
rad_dec	dd ?				; rad-1						30h
org 10072494h - shift
sq_rad	dd ?				; rad*rad					961h
org 10072498h - shift
sq_rad_dec	dd ?			; rad*rad - 1				960h
org 1007249Ch - shift
det_lev1_size	dd ?		; rad_dec/4					0Ch
org 10072500h - shift
sq_det_lev1_size_dec	dd ?	; det_lev1_size * det_lev1_size - 1				08Fh
org 10072504h - shift
lev1_size_line	dd ?		; rad * 4					0C4h
org 10072508h - shift
lev1_size_line_dec	dd ?	; rad_dec * 4				0C0h
org 1007250Ch - shift
act_pos	dd ?				; rad_dec / 2				018h
org 10072510h - shift
cache_size_w_o_last_line	dd ?				; 4 * rad * (rad - 1)		24C0h
org 10072514h - shift
four_lines_length_in_cache	dd ?				; 4 * lev1_size_line		0310h
org 10072518h - shift
class_mem	dd ?
org 1007251Ch - shift	
cache_level1_size	dd ?
org 10072520h - shift	
cache_size	dd ?
org 10072524h - shift	
c_task_size	dd ?
org 10072528h - shift	
c_pool_size	dd ?

org 1007252Ch - shift	
cache_level1_offset	dd ?
org 10072530h - shift	
cache_first_el_offset	dd ?
org 10072534h - shift	
cache_third_el_offset	dd ?
org 10072538h - shift	
cache_last_el_first_line_offset	dd ?
org 1007253Ch - shift	
cache_first_el_last_line_offset	dd ?	
org 10072540h - shift	
cache_task_first_offset	dd ?	
org 10072544h - shift	
cache_task_second_offset	dd ?	
org 10072548h - shift	
cache_task_last_offset	dd ?
org 1007254Ch - shift	
cache_pool_offset	dd ?	

org 10072550h - shift	
visibility	REAL4 ?
org 10072554h - shift	
smooth_circle	REAL4 ?

;===========================================
; r__geometry_lod
;===========================================	
org 100586F8h - shift
	dd 3.0
	
;===========================================
; MIPBIAS.
;===========================================
org 10001911h - shift
	jmp mip_bias
org 10001920h - shift
back_to_mip_bias:

org 1007238Ch - shift
mipbias_obj dd ?