new_smap_sizes:
	
	REGISTER_SMAP_SIZE "-smap8192", 200000h
;	REGISTER_SMAP_SIZE "-smap16384", 400000h
	
	mov     eax, ds:Core
	add     eax, 4D0h

	jmp back_from_new_smap_sizes