; суть правок - перенос констант из 8ми в 32хбитные хранилища
cache_initialize_1: 
	add edi, 154h
	cmp esi, ds:[det_size]
	jmp back_to_cache_initialize_1
	
cache_initialize_2: 
	add ebp, 1
	cmp ebp, ds:[det_size]
	jmp back_to_cache_initialize_2

cache_update_1: 
	add eax, 1
	cmp eax, ds:[det_size]
	jmp back_to_cache_update_1	
	
cache_update_2: 
	add esi, 0C4h
	cmp eax, ds:[det_size]
	jmp back_to_cache_update_2	
	
cache_update_3: 
	add esi, 4
	cmp eax, ds:[det_size]
	jmp back_to_cache_update_3	
	
cache_update_4: 
	add esi, 4
	cmp eax, ds:[det_size]
	jmp back_to_cache_update_4
	
cache_update_5: 
	push ds:[dec_det_size]
	push ebx
	mov [esi+24C0h], edi
	jmp back_to_cache_update_5
	
cache_task_1: 
	add ebx, ds:[act_pos]
	add eax, ecx
	sub eax, ds:[act_pos]
	lea ebp, [eax]
	jmp back_to_cache_task_1
	
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

; константы	
det_size dd 31h					; радиус видимости
det_lev1_size dd 0Ch			; сторона квадрата cache_level1 [(радиус видимости - 1) / 4]
act_pos dd 18h					; оффсет позиции актора относительно угла квадрата травы [[(радиус видимости - 1) / 2]]
dec_det_size dd 30h				; радиус видимости - 1. Используется как счетчик в циклах do-while