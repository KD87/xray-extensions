CALL_SUBSTITUTE MACRO subst_addr:REQ
LOCAL       is_loaded
LOCAL       not_loaded
LOCAL       err_msg
LOCAL       fail
	; assuming EAX is not used which is true for most standard calling conventions
	mov     eax, [subst_addr]
	test    eax, eax
	jz      not_loaded
	; after first run will be no more jumps
is_loaded:
	jmp     eax
not_loaded:
	; try load
	push    ecx
	call    init_external_libs
	pop     ecx
	; test again
	mov     eax, [subst_addr]
	test    eax, eax
	jnz     is_loaded
fail:
	push  offset err_msg
	call    msg_and_fail
	; doesn't matter anymore, just need to jump somewere. So make endless loop.
	jmp     fail
err_msg db "cannot call substitute function", 0
ENDM

CEnvDescriptor__load_fix proc
	CALL_SUBSTITUTE g_CEnvDescriptor__load
	; skip this
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	;
	jmp back_from_CEnvDescriptor__load_fix
err_msg db "cannot call CEnvDescriptor__load", 0
CEnvDescriptor__load_fix endp

CEnvDescriptor__CEnvDescriptor_fix proc
	CALL_SUBSTITUTE g_CEnvDescriptor__CEnvDescriptor
	; skip this
	mov     eax, ecx
	xorps   xmm0, xmm0
	;
	jmp back_from_CEnvDescriptor__CEnvDescriptor_fix
CEnvDescriptor__CEnvDescriptor_fix endp

CEnvDescriptor__CEnvDescriptor_destr_fix proc
	PRINT "CEnvDescriptor__CEnvDescriptor_destr_fix"
	CALL_SUBSTITUTE g_CEnvDescriptor__CEnvDescriptor_destr
	; skip this
	push    ebx
	push    ebp
	mov     ebp, ds:xrMemory__mem_free
	push    esi
	mov     esi, ecx
	mov     eax, [esi+1Ch]
	;
	jmp back_from_CEnvDescriptor__CEnvDescriptor_destr_fix
CEnvDescriptor__CEnvDescriptor_destr_fix endp

CEnvDescriptorMixer__lerp_fix proc
	CALL_SUBSTITUTE g_CEnvDescriptorMixer__lerp
	; skip this
	;push    ebp
	;mov     ebp, esp
	;and     esp, 0FFFFFFF8h
	;
	;jmp back_from_CEnvDescriptorMixer__lerp_fix
CEnvDescriptorMixer__lerp_fix endp

CEnvDescriptor__assign_operator_fix proc
	CALL_SUBSTITUTE g_CEnvDescriptor__operator_
CEnvDescriptor__assign_operator_fix endp

CEffect_Rain__Born_fix proc
	CALL_SUBSTITUTE g_CEffect_Rain__Born
CEffect_Rain__Born_fix endp

CLensFlare__Render_fix proc
	CALL_SUBSTITUTE g_CLensFlare__Render
CLensFlare__Render_fix endp

CLensFlare__OnFrame_fix proc
	CALL_SUBSTITUTE g_CLensFlare__OnFrame
CLensFlare__OnFrame_fix endp

CEnvironment__Invalidate_fix proc
	CALL_SUBSTITUTE g_CEnvironment__Invalidate
CEnvironment__Invalidate_fix endp


CEnvironment__SetWeather_fix proc
	PRINT "CEnvironment__SetWeather_fix"
	;
	sub     esp, 8
	push    ebx
	push    ebp
	;
	jmp back_from_CEnvironment__SetWeather_fix
CEnvironment__SetWeather_fix endp

CLensFlareDescriptor__load_fix proc
	CALL_SUBSTITUTE g_CLensFlareDescriptor__load
CLensFlareDescriptor__load_fix endp
