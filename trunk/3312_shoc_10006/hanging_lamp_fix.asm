CHangingLamp__net_Spawn_fix proc
; edi - cse_hanging_lamp
; esi - lamp
	; добавл€ем сохранение virtual size в незан€тую €чейку старшего байта флагов
	push    eax
	; провер€ем тип рендера
	call get_render_generation
	;PRINT_UINT "render_generation: %d", eax
	cmp     eax, 90
	jnz not_r2_render
	;PRINT "is_r2"
	;--
	;mov     eax, [edi + 336]
	fld     dword ptr [edi + 336]
	;mov eax, [some_vs]
	mov     ecx, [esi]	
	fst     dword ptr [ecx + 270h]
	fchs
	fstp    dword ptr [ecx + 274h]
	;mov     [ecx + 270h], eax
	;mov eax, [ecx + 270h]
	;PRINT_FLOAT "virtual_size: %f", eax
	;fld     dword ptr [edi + 336] ; virtual_size
	;fdiv    dword ptr [fld_0_01] ; virtual_size / 0.01
	
	;fist    dword ptr [rounded_virtual_size] ; round(virtual_size / 0.01)
	;movzx   eax, byte ptr [rounded_virtual_size]
	;PRINT_UINT "rounded_virtual_size: %d", eax
	;mov     ecx, [esi]
	;mov     byte ptr [ecx + 3Ch + 3], al
	;--
not_r2_render:
	pop     eax
	; делаем вырезанное
	mov     ecx, [esi]
	mov     edx, [ecx]
	mov     edx, [edx+30h]
	; идЄм обратно
	jmp back_from_CHangingLamp__net_Spawn_fix
CHangingLamp__net_Spawn_fix endp

fld_0_01 dd 0.01
fpu_cr dw ?
rounded_virtual_size dd ?
vs dd ?
some_vs dd 0.34

;FLDCW instruction loads the control register from the specified memory location, 
;FSTCW stores the control register into the specified memory location.

get_render_generation proc
	push    ecx
	;
	mov     eax, ds:Render
	mov     ecx, [eax]
	mov     eax, [ecx]
	mov     eax, [eax]
	call    eax
	; 
	pop     ecx
	retn
get_render_generation endp

