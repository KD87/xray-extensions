
;=====================================================
;== Поправим все указатели на наши переменные ========
;=====================================================

;----------------------
;замена обращений к 31h
;----------------------

cache_initialize_1: 
	add edi, 154h
	cmp esi, ds:[rad]
	jmp back_to_cache_initialize_1
	
cache_initialize_2: 
	add ebp, 1
	cmp ebp, ds:[rad]
	jmp back_to_cache_initialize_2
	
cache_update_1: 
	add ebx, ds:[lev1_size_line]
	cmp eax, ds:[rad]
	jmp back_to_cache_update_1		
	
cache_update_2: 
	add esi, ds:[lev1_size_line]
	cmp ebx, ds:[rad]
	jmp back_to_cache_update_2	
	
cache_update_3: 
	add esi, 4
	cmp ebx, ds:[rad]
	jmp back_to_cache_update_3	
	
cache_update_4: 
	add esi, 4
	cmp ebx, ds:[rad]
	jmp back_to_cache_update_4

;----------------------
;замена обращений к 30h
;----------------------
	
update_30h_1:
	mov ecx, ds:[rad_dec]
	jmp back_to_update_30h_1	
		
update_30h_2:
	mov ecx, ds:[rad_dec]
	push ebx
	add ebx, ds:[lev1_size_line_dec]
	mov [ebx], eax
	pop ebx
	jmp back_to_update_30h_2
		
update_30h_3:
	mov ecx, ds:[rad_dec]
	jmp back_to_update_30h_3
		
update_30h_4:
	mov ecx, ds:[rad_dec]
	jmp back_to_update_30h_4
		
update_30h_5:
	mov ecx, ds:[rad_dec]
	jmp back_to_update_30h_5
	
update_30h_6: 
	push ds:[rad_dec]
	push ebp
	mov ecx, ebx
	add	esi, [cache_size_w_o_last_line]
	mov [esi], edi
	sub esi, [cache_size_w_o_last_line]
	jmp back_to_update_30h_6	

;----------------------
;замена обращений к 0Bh
;----------------------

;.text:1001890E                 lea     esi, [ebp+5E8h]
;.text:10018914                 mov     ebp, 0Ch
;.text:10018919                 mov     [esp+1Ch+iteration], 0Ch
;.text:10018921                 xor     edi, edi
;.text:10018923                 lea     ebx, [ebp-0Bh]
cache_update_6: 
	add ebp, ds:[cache_level1_offset]
	lea esi, [ebp+28h]
	mov ebp, ds:[det_lev1_size]
	mov dword ptr [esp+1Ch+iteration], ebp
	xor edi, edi
	mov ebx, 1
	jmp back_to_cache_update_6	

;.text:10018938                 mov     ebp, 0Ch
;.text:1001893D                 xor     edi, edi
;.text:1001893F                 lea     ebx, [ebp-0Bh]	
cache_update_7: 
	mov ebp, ds:[det_lev1_size]	
	xor edi, edi
	mov ebx, 1
	jmp back_to_cache_update_7
	
;----------------------
;замена обращений к 0Сh
;----------------------	
	
cache_upvism_1: 
	add esi, 1
	cmp esi, ds:[det_lev1_size]
	jmp back_to_cache_upvism_1	
	
cache_upvism_2: 
	add ebx, 1
	cmp ebx, ds:[det_lev1_size]
	jmp back_to_cache_upvism_2			
	
; в оригинале этот кусок высчитывает смещение указателя при переходе к новой строке в cache_level1.
; умножает номер строки на сторону квадрата cache_level1, в оригинале релизуется такой конструкцией:
; lea edi, [ebx+ebx*2]
; add edi, edi
; add edi, edi
; так как мы будем менять сторону квадрата cache_level1, перепиливаем.

cache_upvism_3:
	lea edi, [ebx]
	xor esi, esi
	imul edi, ds:[det_lev1_size]
	jmp back_to_cache_upvism_3	
	
;.text:1001829D                 lea     edi, [eax+4B88h]
;.text:100182A3                 lea     esi, [eax+600h]
;.text:100182A9                 mov     [esp+14h+this], edi
;.text:100182AD                 mov     [esp+14h+var_4], 0Ch
cache_init_4: 
	push eax
	add eax, ds:[cache_third_el_offset]
	lea edi, [eax]
	pop eax
	push eax
	add eax, ds:[cache_level1_offset]
	lea esi, [eax+40h]
	mov dword ptr [esp+18h+4h], edi
	mov eax, ds:[det_lev1_size]
	mov dword ptr [esp+18h+var_4], eax
	pop eax
	jmp back_to_cache_init_4
	
cache_init_5: 
	mov ebx, ds:[det_lev1_size]
	jmp back_to_cache_init_5
	
;----------------------
;замена обращений к 0С4h
;----------------------	
	
cache_init_C4_1: 
	add eax, ds:[lev1_size_line]
	jmp back_to_cache_init_C4_1	
	
;.text:10018700                 mov     edx, [eax-0C4h]
;.text:10018706                 mov     [eax], edx
;.text:10018708                 sub     ecx, 1
;.text:1001870B                 sub     eax, 0C4h
cache_upd_C4_2: 
	sub eax, ds:[lev1_size_line]
	mov edx, [eax]
	add eax, ds:[lev1_size_line]
	mov [eax], edx
	sub ecx, 1
	sub eax, ds:[lev1_size_line]
	jmp back_to_cache_upd_C4_2		
	
;.text:10018750                 mov     edx, [eax+0C4h]
;.text:10018756                 mov     [eax], edx
;.text:10018758                 add     eax, 0C4h	
cache_upd_C4_3: 
	add eax, ds:[lev1_size_line]
	mov edx, [eax]
	sub eax, ds:[lev1_size_line]
	mov [eax], edx
	add eax, ds:[lev1_size_line]
	jmp back_to_cache_upd_C4_3			
	
;----------------------
;замена обращений к 960h
;----------------------	
;.text:1001645E                 mov     [this+9688h], edi		this = esi
;.text:10016464                 lea     ebx, [this+968Ch]
;.text:1001646A                 mov     ebp, 960h
const_960_1: 
	push esi
	add esi, ds:[cache_task_last_offset]			;раз уж прыгнули к 960h, поправим заодно и смещения cache_pool и cache_task.count
	mov [esi], edi
	lea ebx, [esi+4]
	pop esi
	mov ebp, ds:[sq_rad_dec]
	jmp back_to_const_960_1		
	
;.text:100166A1                 mov     ebp, 960h
;.text:100166A6                 lea     edi, [esi+0D0BA4h]
const_960_2: 
	mov ebp, ds:[sq_rad_dec]
	push esi
	add esi, ds:[class_mem]
	lea edi, [esi+44h]
	pop esi
	jmp back_to_const_960_2		
	
;----------------------
;замена обращений к 18h
;----------------------	

cache_task_1: 
	add ebx, ds:[act_pos]
	add eax, ecx
	sub eax, ds:[act_pos]
	lea ebp, [eax]
	jmp back_to_cache_task_1


var_4      	 = dword ptr  -4h
iteration       = dword ptr  0Ch

;----------------------
;разное
;----------------------
		
;.text:100163FF                 lea     ecx, [this+5C0h]		this = esi
;.text:10016405                 mov     edx, 8Fh
cache_level1_length: 
	push esi
	add esi, ds:[cache_level1_offset]
	lea ecx, [esi]
	pop esi
	mov edx, ds:[sq_det_lev1_size_dec]
	jmp back_to_cache_level1_length		
		
red_cl1_line_size_minus: 
	sub esi, lev1_size_line_dec
	mov [esi], edi
	add esi, lev1_size_line_dec
	jmp back_to_red_cl1_line_size_minus					
		
;.text:1001878D                 mov     eax, [ebp+9688h]
;.text:10018793                 xor     ecx, ecx
;.text:10018795                 cmp     eax, 961h
cache_length: 
	push ebp
	add ebp, ds:[cache_task_last_offset]
	mov eax, [ebp]
	pop ebp
	xor ecx, ecx
	cmp eax, ds:[sq_rad]
	jmp back_to_cache_length

cache_size_w_o_last_line_minus: 
	sub esi, cache_size_w_o_last_line
	mov [esi], edi
	add esi, cache_size_w_o_last_line
	jmp back_to_cache_size_w_o_last_line_minus		
	
four_lines_length: 
	add edi, ds:[four_lines_length_in_cache]
	jmp back_to_four_lines_length	

vis: 
	comiss xmm0, ds:[visibility]
	jmp back_to_vis	

circle: 
	mulss xmm1, ds:[smooth_circle]
	jmp back_to_circle	
	
;----------------------
;патч смещений членов класса
;----------------------
;.text:10018267                 lea     edi, [eax+968Ch] ; D
;.text:1001826D                 lea     ebx, [eax+4B80h]
offset_1:
	push eax
	add eax, ds:[cache_pool_offset]
	lea edi, [eax]
	pop eax
	push eax
	add eax, ds:[cache_first_el_offset]
	lea ebx, [eax]	
	pop eax
	jmp back_to_offset_1	

;.text:10018587                 mov     gx, [esi+9688h]			gx=ecx, D=edi
;.text:1001858D                 mov     [esi+gx*4+7104h], D
;.text:10018594                 add     [esi+9688h], eax
offset_2:
	push ebx
	push esi
	mov ebx, esi
	add esi, ds:[cache_task_last_offset]
	add ebx, ds:[cache_task_first_offset]
	mov ecx, [esi]
	mov [ebx+ecx*4], edi
	add [esi], eax
	pop esi
	pop ebx
	jmp back_to_offset_2
	
;.text:1001861E                 lea     ebx, [ebp+4B80h]
offset_3:
	push ebp
	add ebp, ds:[cache_first_el_offset]
	lea ebx, [ebp]
	pop ebp
	jmp back_to_offset_3	
	
;.text:1001866D                 lea     esi, [ebp+4C40h]
offset_4:
	push ebp
	add ebp, ds:[cache_last_el_first_line_offset]
	lea esi, [ebp]
	pop ebp
	jmp back_to_offset_4	
	
;.text:100186E7                 lea     esi, [ebp+7040h]
offset_5:
	push ebp
	add ebp, ds:[cache_first_el_last_line_offset]
	lea esi, [ebp]
	pop ebp
	jmp back_to_offset_5
	
;.text:1001873C                 lea     esi, [ebp+4B80h]
offset_6:
	push ebp
	add ebp, ds:[cache_first_el_offset]
	lea esi, [ebp]
	pop ebp
	jmp back_to_offset_6
	
;.text:100187E6                 mov     esi, [ebp+9688h]
offset_7:
	push ebp
	add ebp, ds:[cache_task_last_offset]
	mov esi, [ebp]
	pop ebp
	jmp back_to_offset_7
	
;.text:100187F6                 cmp     [ebp+9688h], ecx
offset_8:
	push ebp
	add ebp, ds:[cache_task_last_offset]
	cmp [ebp], ecx
	pop ebp
	jmp back_to_offset_8

;.text:10018810                 mov     edi, [ebp+9688h]
;.text:10018816                 movss   [esp+1Ch+view], xmm0
;.text:1001881C                 lea     edx, [ebp+7104h]
offset_9:
	push ebp
	add ebp, ds:[cache_task_last_offset]
	mov edi, [ebp]
	pop ebp
	movss   dword ptr [esp+1Ch+view], xmm0
	push ebp
	add ebp, ds:[cache_task_first_offset]
	lea edx, [ebp]
	pop ebp	
	jmp back_to_offset_9
	
view = dword ptr 10h
	
;.text:100188AD                 mov     edx, [ebp+esi*4+7104h]
offset_10:
	push ebp
	add ebp, ds:[cache_task_first_offset]
	mov edx, [ebp+esi*4]
	pop ebp
	jmp back_to_offset_10
	
;.text:100188BB                 add     dword ptr [ebp+9688h], 0FFFFFFFFh
;.text:100188C2                 mov     ecx, [ebp+9688h]
offset_11:
	push ebp
	add ebp, ds:[cache_task_last_offset]
	add dword ptr [ebp], 0FFFFFFFFh
	mov ecx, [ebp]
	pop ebp
	jmp back_to_offset_11
	
;.text:100188D0                 mov     ecx, [ebp+eax*4+7108h]
;.text:100188D7                 mov     [ebp+eax*4+7104h], ecx
;.text:100188DE                 add     eax, 1
;.text:100188E1                 cmp     eax, [ebp+9688h]
offset_12:
	push ebp
	add ebp, ds:[cache_task_second_offset]
	mov	ecx, [ebp+eax*4]
	mov [ebp+eax*4-4], ecx
	add eax, 1
	pop ebp
	push ebp
	add ebp, ds:[cache_task_last_offset]
	cmp eax, [ebp]
	pop ebp
	jmp back_to_offset_12
	
;.text:100188EE                 cmp     dword ptr [ebp+9688h], 0
offset_13:
	push ebp
	add ebp, ds:[cache_task_last_offset]
	cmp dword ptr [ebp], 0
	pop ebp
	jmp back_to_offset_13
	
;.text:10016D06                 cmp     dword ptr [ecx+ebp+5C0h], 0
;.text:10016D0E                 lea     eax, [ecx+ebp+5C0h]
offset_14:
	push ecx
	add ecx, ds:[cache_level1_offset]
	cmp dword ptr [ecx+ebp], 0
	lea eax, [ecx+ebp]
	pop ecx
	jmp back_to_offset_14
		
;=====================================================
;== Рассчитаем необходимые константы =================
;=====================================================
calculate_stuff:
	push	eax
	push	ebx
	push	edi
	push	esi
	mov		eax, det_rad_value
	sub		eax, 1
	shr		eax, 2
	shl		eax, 2
	add		eax, 1
	
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
	fsub	ST(1),ST			;st0 = 1, st1 = 2255.25
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
