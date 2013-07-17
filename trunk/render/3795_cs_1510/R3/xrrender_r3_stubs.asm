;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************
;===========================================
; ДАЛЬНОСТЬ ОТРИСОВКИ ТРАВЫ
;===========================================
org 10025219h - shift
	jmp cache_initialize_1
org 10025222h - shift
back_to_cache_initialize_1:

org 10025224h - shift
	jmp cache_initialize_2 
org 1002522Ah - shift
back_to_cache_initialize_2:

org 100255C5h - shift
	jmp cache_update_1
org 100255D3h - shift
back_to_cache_update_1:

org 1002562Ah - shift
	jmp cache_update_2
org 10025633h - shift
back_to_cache_update_2:

org 100256B0h - shift
	jmp cache_update_3 
org 100256B6h - shift
back_to_cache_update_3:

org 1002570Ch - shift
	jmp cache_update_4 
org 10025712h - shift
back_to_cache_update_4:

org 100252C8h - shift
	jmp cache_task_1 
org 100252CFh - shift
back_to_cache_task_1:

org 10024793h - shift
	jmp cache_upvism_1 
org 10024799h - shift
back_to_cache_upvism_1:

org 100247A3h - shift
	jmp cache_upvism_2
org 100247A9h - shift
back_to_cache_upvism_2:

org 10024160h - shift
	jmp cache_upvism_3
org 10024169h - shift
back_to_cache_upvism_3:

;----------------------
;замена обращений к 30h
; то же, что и 31h, просто используется в циклах с другим условием
;----------------------

org 100255A1h - shift
	jmp update_30h_1
org 100255BAh - shift
back_to_update_30h_1:

org 100255F4h - shift
	jmp update_30h_3
org 100255F9h - shift
back_to_update_30h_3:

org 1002567Bh - shift
	jmp update_30h_4
org 10025680h - shift
back_to_update_30h_4:

org 100256D4h - shift
	jmp update_30h_5
org 100256D9h - shift
back_to_update_30h_5:

org 100256F6h - shift
	jmp update_30h_6
org 10025700h - shift
back_to_update_30h_6:

;----------------------
;замена обращений к 0Сh
; кол-во строк и столбцов в cache_level1
;----------------------

org 1002522Ch - shift
	jmp cache_init_4
org 10025244h - shift
back_to_cache_init_4:

org 10025244h - shift
	jmp cache_init_5
org 10025249h - shift
back_to_cache_init_5:

org 100258A0h - shift
	jmp cache_upd_6
org 100258B6h - shift
back_to_cache_upd_6:

org 100258CAh - shift
	jmp cache_upd_7
org 100258D2h - shift
back_to_cache_upd_7:

;----------------------
;замена обращений к 0С4h
; длина строки в cache
;----------------------

org 10025274h - shift
	jmp cache_init_C4_1
org 10025279h - shift
back_to_cache_init_C4_1:

org 10025682h - shift
	jmp cache_upd_C4_2
org 10025692h - shift
back_to_cache_upd_C4_2:

org 100256E0h - shift
	jmp cache_upd_C4_3
org 100256EDh - shift
back_to_cache_upd_C4_3:

;----------------------
;замена обращений к 960h
; кол-во элементов в cache_pool, cache_task и cache - 1
;----------------------

org 1002390Eh - shift
	jmp const_960_1
org 1002391Fh - shift
back_to_const_960_1:

org 10023C47h - shift
	jmp const_960_2
org 10023C52h - shift
back_to_const_960_2:

;----------------------
;разное
;----------------------
	
org 100238AFh - shift
	jmp cache_level1_length
org 100238BAh - shift
back_to_cache_level1_length:

org 10025618h - shift
	jmp red_cl1_line_size_minus
org 1002561Eh - shift
back_to_red_cl1_line_size_minus:

org 1002569Eh - shift
	jmp cache_size_w_o_last_line_minus
org 100256A4h - shift
back_to_cache_size_w_o_last_line_minus:

org 10025727h - shift
	jmp cache_length
org 10025734h - shift
back_to_cache_length:

org 10025290h - shift
	jmp four_lines_length
org 10025296h - shift
back_to_four_lines_length:

; float - константы
org 100242C8h - shift
	jmp vis
org 100242CFh - shift
back_to_vis:

org 100242EEh - shift
	jmp circle
org 100242F6h - shift
back_to_circle:

;----------------------
;патч смещений членов класса
;----------------------
org 100251F7h - shift
	jmp offset_1
org 10025203h - shift
back_to_offset_1:

org 100254FBh - shift
	jmp offset_3
org 1002550Eh - shift
back_to_offset_3:

org 1002557Eh - shift
	jmp offset_4
org 10025584h - shift
back_to_offset_4:

org 100255ECh - shift
	jmp offset_5
org 100255F2h - shift
back_to_offset_5:

org 10025673h - shift
	jmp offset_6
org 10025679h - shift
back_to_offset_6:

org 100256C7h - shift
	jmp offset_7
org 100256CDh - shift
back_to_offset_7:

org 10025776h - shift
	jmp offset_8
org 1002577Ch - shift
back_to_offset_8:

org 10025786h - shift
	jmp offset_9
org 1002578Ch - shift
back_to_offset_9:

org 100257A3h - shift
	jmp offset_10
org 100257B5h - shift
back_to_offset_10:

org 1002583Dh - shift
	jmp offset_11
org 10025844h - shift
back_to_offset_11:

org 1002584Bh - shift
	jmp offset_12
org 10025858h - shift
back_to_offset_12:

org 10025860h - shift
	jmp offset_13
org 10025877h - shift
back_to_offset_13:

org 1002587Eh - shift
	jmp offset_14
org 10025885h - shift
back_to_offset_14:

org 1002417Eh - shift
	jmp offset_15
org 1002418Dh - shift
back_to_offset_15:

;===========================================
; РАСЧЕТ ДИНАМИЧЕСКИХ ПАРАМЕТРОВ ДЛЯ ДАЛЬНОСТИ ТРАВЫ
;===========================================

org 100127A9h - shift
	jmp calculate_stuff
org 100127AEh - shift
back_to_calculate_stuff:

;===========================================
; КОНСОЛЬНЫЕ ПАРАМЕТРЫ
;===========================================

org 10003C1Dh - shift
	jmp con_comm

org 100C7D92h - shift	
_atexit:

; imported functions
org 100CB538h - shift
CCC_Integer__CCC_Integer      dd ?
org 100CB75Ch - shift
CCC_Integer___CCC_Integer     dd ?
org 100CB554h - shift
Console dd ?
org 100CB54Ch - shift
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

org 10001BD2h - shift
	jmp det_density
org 10001BE1h - shift
back_to_det_density:

org 100F4FACh - shift
xCCC_Float_42 CCC_Float <?>

;===========================================
; r__geometry_lod
;===========================================	
org 100D57C8h - shift
    dd 3.0
	
;===========================================
; Дополнительные разрешения карты теней
;===========================================
org 1000F3C9h - shift
	jmp	new_smap_sizes
org 1000F3CEh - shift
back_from_new_smap_sizes:
org 100CB450h - shift
Core dd ?

;===========================================
; Расширенная регулировка r2_sun_near
;===========================================
org 10002A26h - shift
	jmp	sun_near_fix_label
org 10002A2Dh - shift
back_from_sun_near_fix_label:
	
;===========================================
; ФИКС ДВИЖЕНИЯ СОЛНЦА.
;===========================================
org 10011C00h - shift
movement_fix proc
	mov     ecx, [esp]
	xor     eax, eax
	cmp     ecx, 41FB54h
	setz    al
	retn
movement_fix endp