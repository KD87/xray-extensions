include global_ns_reg_macro2.asm

global_space_ext2: ; вставка, дополн€юща€ функцию экспорта глобальных функций
	; здесь делаем то, что вырезали
	call    register__gs_sell_condition__fl_fl
	pop     ecx
	pop     ecx
	; добавл€ем свой код
	;GLOBAL_NS_PERFORM_EXPORT__VOID__FLOAT_FLOAT SetGameTime, "set_game_time" ; not works
	GLOBAL_NS_PERFORM_EXPORT__VOID__FLOAT_FLOAT SetFloatArgs12, "set_float_args_12"
	GLOBAL_NS_PERFORM_EXPORT__VOID__FLOAT_FLOAT SetFloatArgs34, "set_float_args_34"
	;
	GLOBAL_NS_PERFORM_EXPORT__VOID__FLOAT_FLOAT SetHudInertia, "set_hud_inertia"
	GLOBAL_NS_PERFORM_EXPORT__VOID__FLOAT_FLOAT SetHudInertiaParam2, "set_hud_inertia_param2"
	;
	GLOBAL_NS_PERFORM_EXPORT__VOID__FLOAT_FLOAT SetStaticRescalefactor, "set_static_rescale_factor"
	GLOBAL_NS_PERFORM_EXPORT__FLOAT__VOID GetStaticRescalefactor, "get_static_rescale_factor"
	; идЄм обратно
	jmp back_from_global_space_ext2
;

global_space_ext2_additional:
	; здесь делаем то, что вырезали
	GLOBAL_NS_SCOPE_ADD
	GLOBAL_NS_SCOPE_ADD
	; добавл€ем свой код
	;GLOBAL_NS_SCOPE_ADD
	GLOBAL_NS_SCOPE_ADD
	GLOBAL_NS_SCOPE_ADD
	;
	GLOBAL_NS_SCOPE_ADD
	GLOBAL_NS_SCOPE_ADD
	;
	GLOBAL_NS_SCOPE_ADD
	GLOBAL_NS_SCOPE_ADD
	; идЄм обратно
	jmp back_from_global_space_ext2_additional



SetGameTime proc
time        = dword ptr 8
time_factor = dword ptr 0Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    eax
	push    ecx
	
	mov     ecx, ds:g_pGamePersistent
	mov     ecx, [ecx]
	mov     ecx, [ecx+46Ch] ; _DWORD
	
	mov     eax, [ebp+time]
	push    eax
	mov     eax, [ebp+time_factor]
	push    eax
	call    ds:CEnvironment__SetGameTime
	
	pop     ecx
	pop     eax
	mov     esp, ebp
	pop     ebp
	retn
SetGameTime endp

g_float_arg1 dd 0.0
g_float_arg2 dd 0.0
g_float_arg3 dd 0.0
g_float_arg4 dd 0.0

stub_test dd 9 dup(0)

SetFloatArgs12 proc
arg1 = dword ptr 4h
arg2 = dword ptr 8h
	mov eax, [esp+arg1]
;PRINT_FLOAT "arg1=%f", eax
	mov [g_float_arg1], eax
	mov eax, [esp+arg2]
;PRINT_FLOAT "arg2=%f", eax
	mov [g_float_arg2], eax
	retn
SetFloatArgs12 endp

SetFloatArgs34 proc
arg3 = dword ptr 4h
arg4 = dword ptr 8h
	mov eax, [esp+arg3]
;PRINT_FLOAT "arg3=%f", eax
	mov [g_float_arg3], eax
	mov eax, [esp+arg4]
;PRINT_FLOAT "arg4=%f", eax
	mov [g_float_arg4], eax
	retn
SetFloatArgs34 endp

ifdef PZ_BUILD
	; PZ settings
	g_hud_inertia_factor dd 5.0
	g_hud_inertia_param_2 dd 0.07
else
	; default settings
	g_hud_inertia_factor dd 5.0 ; TENDTO_SPEED
	g_hud_inertia_param_2 dd 0.050000001 ; CHWON_CALL_UP_SHIFT
endif

SetHudInertia proc
hud_inertia = dword ptr 4h
arg2        = dword ptr 8h
	mov eax, [esp+hud_inertia]
	;PRINT_FLOAT "hud_inertia = %f", eax
	mov [g_hud_inertia_factor], eax
	retn
SetHudInertia endp

SetHudInertiaParam2 proc
hud_inertia = dword ptr 4h
arg2        = dword ptr 8h
	mov eax, [esp+hud_inertia]
	;PRINT_FLOAT "hud_inertia = %f", eax
	mov [g_hud_inertia_param_2], eax
	retn
SetHudInertiaParam2 endp

g_static_rescale_correction dd 0.83333333f

SetStaticRescalefactor proc
rescale_factor = dword ptr 4h
arg2           = dword ptr 8h
	mov eax, [esp+rescale_factor]
	mov [g_static_rescale_correction], eax
	retn
SetStaticRescalefactor endp


GetStaticRescalefactor proc
	fld     dword ptr [g_static_rescale_correction]
	retn
GetStaticRescalefactor endp
