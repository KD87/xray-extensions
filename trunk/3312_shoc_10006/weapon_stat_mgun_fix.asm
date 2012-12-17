wpn_stat_mgun__upatecl_fix0 proc
;.text:1023CBD0                 push    ebx
;.text:1023CBD1                 push    esi
;.text:1023CBD2                 mov     ebx, ecx
;.text:1023CBD4                 call    ds:__imp_?UpdateCL@CObject@@UAEXXZ ; CObject::UpdateCL(void)
	pop esi
	pop ebx
	retn
wpn_stat_mgun__upatecl_fix0 endp


wpn_stat_mgun__upatecl_fix proc
	push    edx
	push    edi
	;
	;PRINT_UINT "wpn_stat_mgun_fix: ebx=%d", ebx
	;mov     ecx, [ebx-118h]
	mov     ecx, [ebx+90h]
	mov     eax, [ecx]
	mov     edx, [eax+18h]
	call    edx
	mov     edi, eax
	mov     ecx, edi
	call    ds:CKinematics__CalculateBones_Invalidate
	mov     eax, [edi]
	mov     edx, [eax+40h]
	push    0
	mov     ecx, edi
	call    edx
	;
	pop     edi
	pop     edx

	; делаем то, что вырезали
	pop     esi
	pop     ebx
	retn
wpn_stat_mgun__upatecl_fix endp



wpn_stat_mgun__cam_update_fix proc
	PRINT_UINT "cam update: ecx=%d", ecx
	;
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	sub     esp, 38h
	;
	jmp back_from_wpn_stat_mgun__cam_update_fix
wpn_stat_mgun__cam_update_fix endp


;cam update:        ecx=410029272
;wpn_stat_mgun_fix: ebx=410028848 + 424

;410029272
;410028848
