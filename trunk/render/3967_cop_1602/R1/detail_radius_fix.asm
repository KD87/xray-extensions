cache_initialize_1: 
	add edi, 114h
	cmp esi, ds:[det_size]
	jmp back_to_cache_initialize_1
	
cache_initialize_2: 
	add ebp, 1
	cmp ebp, ds:[det_size]
	jmp back_to_cache_initialize_2
	
cache_update_1: 
	add ebx, ds:[val_2]
	cmp eax, ds:[det_size]
	jmp back_to_cache_update_1		
	
cache_update_2: 
	add esi, ds:[val_2]
	cmp ebx, ds:[det_size]
	jmp back_to_cache_update_2	
	
cache_update_3: 
	add esi, 4
	cmp ebx, ds:[det_size]
	jmp back_to_cache_update_3	
	
cache_update_4: 
	add esi, 4
	cmp ebx, ds:[det_size]
	jmp back_to_cache_update_4
	
cache_update_5: 
	push ds:[dec_det_size]
	mov ecx, ebx
	mov eax, ebp
	jmp back_to_cache_update_5
				
cache_task_1: 
	add ebx, ds:[act_pos]
	add eax, ecx
	sub eax, ds:[act_pos]
	lea ebp, [eax]
	jmp back_to_cache_task_1
	
cache_update_6: 
	xor edi, edi
	lea ebx, [ebp-10000h]
	jmp back_to_cache_update_6	

cache_update_7: 
	xor edi, edi
	lea ebx, [ebp-10000h]
	jmp back_to_cache_update_7	
	
	
	
cache_upvism_1: 
	add esi, 1
	cmp esi, ds:[det_lev1_size]
	jmp back_to_cache_upvism_1	
	
cache_upvism_2: 
	add eax, 1
	cmp eax, ds:[det_lev1_size]
	jmp back_to_cache_upvism_2	
	
; в оригинале этот кусок высчитывает смещение указателя при переходе к новой строке в cache_level1.
; умножает номер строки на сторону квадрата cache_level1, в оригинале релизуется такой конструкцией:
; lea edi, [ebx+ebx*2]
; add edi, edi
; add edi, edi
; так как мы будем менять сторону квадрата cache_level1, перепиливаем.

cache_upvism_3:
	imul eax, ds:[det_lev1_size]
	jmp back_to_cache_upvism_3		
	
	
det_size dd 31h
act_pos dd 18h
dec_det_size dd 30h
det_lev1_size dd 0Ch
val_2 dd 0C4h