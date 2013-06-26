load_table_address:
	call    edi
	mov     [esi+4], eax
	test	eax, eax
	jz		exit
	call	init_external_libs
	mov		eax, offset g_RenderImportsTable
	
exit:
	jmp 	back_to_load_table_address