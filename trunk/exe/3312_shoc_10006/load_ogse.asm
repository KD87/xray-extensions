LOAD_DLL MACRO module_name_str:REQ, g_lib_hinst:REQ
LOCAL lab1
LOCAL loaded
LOCAL module_name
	jmp     lab1
module_name db module_name_str, 0
lab1:
	mov     eax, [g_lib_hinst]
	test    eax, eax
	jnz     loaded
	push    offset module_name
	call    [LoadLibraryA]
	test    eax, eax
	jnz     loaded
	; failed to load lib
	mov     eax, offset module_name
	PRINT_UINT "Failed to load library '%s'", eax
	push    offset module_name
	call    msg_and_fail
	add     esp, 4
	retn
loaded:
	mov     [g_lib_hinst], eax
	mov     edx, offset module_name
	PRINT_UINT "Loaded: %s", edx
ENDM

GET_PROC_ADDR MACRO g_lib_hinst:REQ, fun_name_str:REQ, g_fun_addr:REQ
LOCAL lab1
LOCAL success
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	push    offset fun_name
	push    [g_lib_hinst]
	call    [GetProcAddress]
	test    eax, eax
	jnz     success
	; can't get address
	mov     eax, offset fun_name
	PRINT_UINT   "can't get address of '%s'", eax
	push    offset fun_name
	call    msg_and_fail
	add     esp, 4
	retn
success:
	mov [g_fun_addr], eax
ENDM

g_ogse_lib_hinst dd 0
g_CEnvDescriptor__load dd 0
g_CEnvDescriptor__CEnvDescriptor dd 0
g_CEnvDescriptor__CEnvDescriptor_destr dd 0
g_CEnvDescriptorMixer__lerp dd 0
g_CEnvDescriptor__operator_ dd 0
g_CEffect_Rain__Born dd 0
g_CLensFlare__Render dd 0
g_CLensFlare__OnFrame dd 0
g_CEnvironment__Invalidate dd 0
g_CLensFlareDescriptor__load dd 0

init_external_libs proc
	LOAD_DLL "extensions\ogse.dll", g_ogse_lib_hinst
	GET_PROC_ADDR g_ogse_lib_hinst, "CEnvDescriptor__load", g_CEnvDescriptor__load
	GET_PROC_ADDR g_ogse_lib_hinst, "CEnvDescriptor__CEnvDescriptor", g_CEnvDescriptor__CEnvDescriptor
	GET_PROC_ADDR g_ogse_lib_hinst, "CEnvDescriptor___CEnvDescriptor", g_CEnvDescriptor__CEnvDescriptor_destr
	GET_PROC_ADDR g_ogse_lib_hinst, "CEnvDescriptorMixer__lerp", g_CEnvDescriptorMixer__lerp
	GET_PROC_ADDR g_ogse_lib_hinst, "CEnvDescriptor__operator_", g_CEnvDescriptor__operator_
	GET_PROC_ADDR g_ogse_lib_hinst, "CEffect_Rain__Born", g_CEffect_Rain__Born
	GET_PROC_ADDR g_ogse_lib_hinst, "CLensFlare__Render", g_CLensFlare__Render
	GET_PROC_ADDR g_ogse_lib_hinst, "CLensFlare__OnFrame", g_CLensFlare__OnFrame
	GET_PROC_ADDR g_ogse_lib_hinst, "CEnvironment__Invalidate", g_CEnvironment__Invalidate
	GET_PROC_ADDR g_ogse_lib_hinst, "CLensFlareDescriptor__load", g_CLensFlareDescriptor__load
	
	;
	retn
init_external_libs endp
