calculate_stuff:
	push	eax
	push	ebx
	push	edi
	push	esi
	mov		eax, [ccc_int_obj + 0Ch]
	mov		eax, [eax]
;rad
	mov		rad, eax		; eax = 49, ebx = ???, edi = ???, esi = ???, 
	mov 	ebx, eax		; eax = 49, ebx = 49, edi = ???, esi = ???, 
;rad_dec
	sub 	ebx, 1			; eax = 49, ebx = 48, edi = ???, esi = ???, 
	mov 	rad_dec, ebx
;sq_rad
	mov		edi, eax		; eax = 49, ebx = 48, edi = 49, esi = ???, 
	imul	eax, edi		; eax = 2401, ebx = 48, edi = 49, esi = ???, 
	mov		sq_rad, eax
;sq_rad_dec
	sub		eax, 1			; eax = 2400, ebx = 48, edi = 49, esi = ???, 
	mov		sq_rad_dec, eax
;det_lev1_size
	mov		esi, ebx		; eax = 2400, ebx = 48, edi = 49, esi = 48, 
	shr		ebx, 2			; eax = 2400, ebx = 12, edi = 49, esi = 48, 
	mov		det_lev1_size, ebx
;sq_det_lev1_size_dec
	mov 	eax, ebx		; eax = 12, ebx = 12, edi = 49, esi = 48, 
	imul	eax, ebx		; eax = 144, ebx = 12, edi = 49, esi = 48, 
	sub		eax, 1			; eax = 143, ebx = 12, edi = 49, esi = 48, 
	mov		sq_det_lev1_size_dec, eax
;lev1_size_line
	mov		eax, edi		; eax = 49, ebx = 12, edi = 49, esi = 48, 
	imul	eax, 4			; eax = 196, ebx = 12, edi = 49, esi = 48, 
	mov		lev1_size_line, eax
;lev1_size_line_dec
	sub		eax, 4			; eax = 192, ebx = 12, edi = 49, esi = 48, 
	mov		lev1_size_line_dec, eax
;act_pos	
	shl		ebx, 1			; eax = 192, ebx = 24, edi = 49, esi = 48, 
	mov		act_pos, ebx
;four_lines_length_in_cache
	add		eax, 4			; eax = 196, ebx = 24, edi = 49, esi = 48, 
	shl		eax, 2			; eax = 784, ebx = 24, edi = 49, esi = 48, 
	mov		four_lines_length_in_cache, eax
;cache_size_w_o_last_line
	imul	edi, esi		; eax = 784, ebx = 24, edi = 2352, esi = 48, 
	shl		edi, 2			; eax = 784, ebx = 24, edi = 9408, esi = 48, 
	mov		cache_size_w_o_last_line, edi
	
;============== посчитаем константы "округления" ======	
	finit
	fild 	[rad]				;st0 = 49
	fld 	[def_vis_gist]		;st1 = 49, st0 = -1.5
	fadd						;st0 = 47.5 
	fst		[visibility]
	fld 	[visibility]		;st1 = 47.5, st0 = 47.5 
	fmul						;st0 = 2256.25
	fst 	[visibility]
	fild 	[dumb_const]		;st0 = 1, st1 = 2256.25
	fdivr						;st0 = 0.000443
	fst		[smooth_circle]		
	
; теперь надо подготовить новые смещения для членов класса
; 1) элементы cache_level1 смещаем на cache_level1_offset = def_class_mem + current_offset
; 2) элементы cache перемещаем на cache_offset = def_class_mem + 124 * det_lev1_size* det_lev1_siz;
; 3) элементы cache_task перемещаем на cache_task_offset = cache_offset + 4 * rad * rad;
; 4) элементы cache_pool перемещаем на cache_pool_offset = cache_task_offset + 4 * rad * rad;
		
;============== посчитаем новые размеры массивов ======
;cache_level1_size																				124 * det_lev1_size* det_lev1_size
	mov 	eax, ds:[det_lev1_size]		; eax = 12, ebx = 24, edi = 9408, esi = 48, 
	mov		ebx, eax					; eax = 12, ebx = 12, edi = 9408, esi = 48, 
	imul	eax, ebx					; eax = 144, ebx = 12, edi = 9408, esi = 48, 
	imul	eax, 7Ch					; eax = 4B80h, ebx = 12, edi = 9408, esi = 48,
	mov		cache_level1_size, eax
;cache_size, c_task_size																		4 * rad * rad
	mov 	eax, ds:[rad]				; eax = 49 ebx = 12, edi = 9408, esi = 48,
	mov		ebx, eax					; eax = 49 ebx = 49, edi = 9408, esi = 48,
	imul	eax, ebx					; eax = 2401 ebx = 49, edi = 9408, esi = 48,
	mov		edi, eax					; eax = 2401 ebx = 49, edi = 2401, esi = 48,
	shl		eax, 2						; eax = 2584h, ebx = 49, edi = 2401, esi = 48,
	mov		cache_size, eax
	mov		c_task_size, eax
;cache_pool_size																				340 * rad * rad
	imul	edi, 154h					; eax = 2584h, ebx = 49, edi = 0C74D4h, esi = 48,
	mov		c_pool_size, edi
	
;============== посчитаем смещения элементов ======
;0x5C0	- первый элемент cache_level1 = def_class_mem
;0x4B80 - первый элемент cache
;0x4B88 - третий элемент cache
;0x4C40 - последний элемент первой строки cache
;0x7040 - первый элемент последней строки cache
;0x7104 - первый элемент cache_task
;0x7108 - второй элемент cache_task
;0x9688 - последнее поле в cache_task (count)
;0x968C - первый элемент cache_pool

;cache_level1_offset						0x5C0
	mov		esi, [def_class_mem]		; eax = 2584h, ebx = 49, edi = 0C74D4h, esi = 0D0BB8h,
	mov		cache_level1_offset, esi	   ;0xD0BB8
;cache_first_el_offset						0x4B80h
	add		esi, [cache_level1_size]
	mov		cache_first_el_offset, esi	   ;0xD5178
;cache_third_el_offset						0x4B88
	add		esi, 8
	mov		cache_third_el_offset, esi	   ;0xD5180
;cache_last_el_first_line_offset			0x4C40
	mov		esi, [cache_first_el_offset]
	add		esi, [lev1_size_line_dec]
	mov		cache_last_el_first_line_offset, esi	   ;0xD5178+0C0h = 0xD5238
;cache_first_el_last_line_offset			0x7040
	mov		esi, [lev1_size_line]			
	imul	esi, [rad_dec]
	add		esi, [cache_first_el_offset]
	mov		cache_first_el_last_line_offset, esi		;0xD5178+0x24C0 = D7638
;cache_task_first_offset					0x7104
	mov		esi, [cache_first_el_offset]	
	add		esi, [cache_size]
	mov		cache_task_first_offset, esi	;0xD5178 + 2584h = 0xD76FC
;cache_task_second_offset					;0x7108
	add		esi, 4
	mov		cache_task_second_offset, esi	;0xD7700
;cache_task_last_offset						0x9688
	mov		esi, [cache_task_first_offset]
	add		esi, [c_task_size]
	mov		cache_task_last_offset, esi		;0xD76FC + 2584h = D9C80
;cache_pool_offset							;0x968C
	add		esi, 4	
	mov		cache_pool_offset, esi			;0xD9C84
	
;============== посчитаем память под класс ======
;class_mem
	add		esi, ds:[c_pool_size]
	mov		class_mem, esi
	pop 	esi	
	pop 	edi	
	pop 	ebx
	pop 	eax
	push 	class_mem
	jmp back_to_calculate_stuff
	
def_class_mem	dd 0D0BB8h
def_cl1_size	dd 45C0h
def_cache_size	dd 2584h
def_c_task_size	dd 2584h
def_c_pool_size	dd 0C74D4h
def_vis_gist	dd -1.5
dumb_const dd 1