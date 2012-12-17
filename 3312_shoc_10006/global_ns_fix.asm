include global_ns_reg_macro.asm
;===============| расширение регистрации глобального пространства имён |=======
global_space_ext: ; вставка, дополняющая функцию экспорта глобальных функций
	; здесь делаем то, что вырезали
	call    error_log_register
	; добавляем свой код
	; регистрация функции вывода в лог, вместо нерабочей "log"
	GLOBAL_NS_PERFORM_EXPORT__VOID__PCHAR my_log_fun, "log1"
	;add     esp, 0Ch
    ;push    offset my_log_fun
    ;push    offset alog1 ; "log1"
	;push    [ebp+8h]
    ;call    error_log_register
	; регистрация функции крэша игры с выводом причины в лог
	GLOBAL_NS_PERFORM_EXPORT__VOID__PCHAR msg_and_fail, "fail"
	;add     esp, 0Ch
    ;push    offset msg_and_fail
    ;push    offset aFail ; "fail"
	;push    [ebp+8h]
    ;call    error_log_register
	; регистрация функции "bind_to_dik"
	GLOBAL_NS_PERFORM_EXPORT__INT__INT_INT bind_to_dik, "bind_to_dik"
	;push    offset bind_to_dik
	;push    offset aBind_to_dik  ; "bind_to_dik"
	;push    [ebp+8h]
	;call    bit_and_register
	;add     esp, 0Ch
	; регистрация функции "set_extensions_flags"
	GLOBAL_NS_PERFORM_EXPORT__INT__INT_INT set_extensions_flags, "set_extensions_flags"
	;push    offset set_extensions_flags
	;push    offset aSet_extensions_flags  ; "set_extensions_flags"
	;push    [ebp+8h]
	;call    bit_and_register
	;add     esp, 0Ch
	; функция установки глобальных флагов актора
	GLOBAL_NS_PERFORM_EXPORT__INT__INT_INT set_actor_flags, "set_actor_flags"
	;push    offset set_actor_flags
	;push    offset aSet_actor_flags  ; "set_actor_flags"
	;push    [ebp+8h]
	;call    bit_and_register
	;add     esp, 0Ch
	; функция получения глобальных флагов актора
	GLOBAL_NS_PERFORM_EXPORT__INT__INT_INT get_actor_flags, "get_actor_flags"
	;push    offset get_actor_flags
	;push    offset aGet_actor_flags  ; "get_actor_flags"
	;push    [ebp+8h]
	;call    bit_and_register
	;add     esp, 0Ch
	; регистрация функции "get_extensions_flags"
	GLOBAL_NS_PERFORM_EXPORT__INT__INT_INT get_extensions_flags, "get_extensions_flags"
	;push    offset get_extensions_flags
	;push    offset aGet_extensions_flags  ; "get_extensions_flags"
	;push    [ebp+8h]
	;call    bit_and_register
	;add     esp, 0Ch
	GLOBAL_NS_PERFORM_EXPORT__INT__INT_INT SetIntArg0, "set_int_arg0"
	GLOBAL_NS_PERFORM_EXPORT__INT__INT_INT SetIntArg1, "set_int_arg1"
	GLOBAL_NS_PERFORM_EXPORT__INT__INT_INT SetIntArg2, "set_int_arg2"
	GLOBAL_NS_PERFORM_EXPORT__INT__INT_INT SetIntArg3, "set_int_arg3"
	GLOBAL_NS_PERFORM_EXPORT__INT__INT_INT SetIntArg4, "set_int_arg4"
	GLOBAL_NS_PERFORM_EXPORT__INT__INT_INT SetIntArg5, "set_int_arg5"
	GLOBAL_NS_PERFORM_EXPORT__INT__INT_INT SetIntArg6, "set_int_arg6"
	;GLOBAL_NS_PERFORM_EXPORT__BOOL__VOID IsPdaMenuShown, "is_pda_shown"
	; ; регистрация функции "flush1", вместо нерабочей "flush"
     ; lea     eax, [ebp-1]
     ; push    eax
     ; push    offset my_flush
     ; push    offset aFlush1   ; "flush1"
     ; push    esi
     ; call    flush_register
	; ; регистрация тестовой функции "log2"
     ; lea     eax, [ebp-1]
     ; push    eax
     ; push    offset my_log2
     ; push    offset alog2   ; "log2"
     ; push    esi
     ; call    flush_register
	GLOBAL_NS_PERFORM_EXPORT__INT__INT_INT SetTradeFiltrationOn, "set_trade_filtration_on"
	GLOBAL_NS_PERFORM_EXPORT__INT__INT_INT SetTradeFiltrationOff, "set_trade_filtration_off"
	GLOBAL_NS_PERFORM_EXPORT__INT__INT_INT SumArgs, "sum_args"
	GLOBAL_NS_PERFORM_EXPORT__INT__INT_INT SubArgs, "sub_args"
	
	GLOBAL_NS_PERFORM_EXPORT__INT__INT_INT GetGoodwill, "GetGoodwill"
	
	GLOBAL_NS_PERFORM_EXPORT__INT__INT_INT DelayedInventoryUpdate, "update_inventory_window"
	
	GLOBAL_NS_PERFORM_EXPORT__VOID__PCHAR init_external_libs, "init_external_libs"
	
	; идём обратно
	jmp back_from_global_space_ext

aFail   db "fail", 0
alog1   db "log1", 0
alog2   db "log2", 0
aFlush1 db "flush1", 0
aBind_to_dik db "bind_to_dik", 0
aSet_extensions_flags  db "set_extensions_flags", 0
aGet_extensions_flags  db "get_extensions_flags", 0
aSet_actor_flags  db "set_actor_flags",0
aGet_actor_flags  db "get_actor_flags",0

my_flush proc near
	call    ds:[FlushLog]
	retn
my_flush endp

my_log2 proc near
	sub   esp, 8
	fld     cs:[value1]
	fstp   QWORD  ptr [esp]
	push    offset format_str
	call ds:[Msg] 
	add     esp, 0Ch
	retn
my_log2 endp

format_str db "qwerty %e", 0
value1 REAL4  1.23456e12
value2   dd 12345678h

my_log_fun      proc near
	push    ebp
	mov     ebp, esp
	mov     eax, [ebp+8]
	push    eax
	push    offset aS_4     ; "%s"
	call    ds:[Msg] 
	add     esp, 8
	pop     ebp
	retn
my_log_fun      endp

aF_4 db "%f", 0
aS_4 db "%s", 0


bind_to_dik proc near

_action_id      = dword ptr  4
;stub = dword ptr 4

	mov     eax, [esp+_action_id]         ; 
	cmp     eax, 76
	jg      arg_out_of_range
	cmp     eax, 0
	jl      arg_out_of_range
; аргумент в пределах допустимого диапазона
	imul    eax, 0Ch                      ; 
	add     eax, offset g_key_bindings    ; g_key_bindings[cmd]
	mov     ecx, [eax+4]                  ; ecx = g_key_bindings[cmd].m_keyboard[0]
	test    ecx, ecx                      ; if (ecx != 0)
	jz      short lab1
	mov     eax, [ecx+4]
	retn
lab1:
	mov     eax, [eax+8]
	test    eax, eax
	jz      short not_binded
	mov     eax, [eax+4]
	retn
not_binded:
	xor     eax, eax
	retn
arg_out_of_range: ; аргумент вне допустимого диапазона
	mov     eax, 100000
	retn
bind_to_dik endp

extensions_flags dd 0

set_extensions_flags proc near
_flags      = dword ptr  4
	mov     eax, [esp+_flags]
	mov     extensions_flags, eax
	retn
set_extensions_flags endp

get_extensions_flags proc near
_flags      = dword ptr  4
	mov     eax, [extensions_flags]
	retn
get_extensions_flags endp

;g_int_argument_0 dword 0
;g_int_argument_1 dword 0
;g_int_argument_2 dword 0
;g_int_argument_3 dword 0
;g_int_argument_4 dword 0
;g_int_argument_5 dword 0

;SetIntArg0 proc
;int_arg = dword ptr  4
;	mov     eax, [esp+int_arg]
;	mov     g_int_argument_0, eax
;	retn
;SetIntArg0 endp


SET_INT_ARG_N 0
SET_INT_ARG_N 1
SET_INT_ARG_N 2
SET_INT_ARG_N 3
SET_INT_ARG_N 4
SET_INT_ARG_N 5
SET_INT_ARG_N 6

IsPdaMenuShown proc
	mov eax, 1
	retn
IsPdaMenuShown endp

msg_and_fail proc near
	push    ebp
	mov     ebp, esp
	
	mov     eax, [ebp+8]
	push    eax
	;push    offset aS_4     ; "%s"
	;call    ds:[Msg] 
	;add     esp, 8
	mov     ecx, ds:Debug ; this
	push    offset ignore_always
	push    offset aEmpty ; "xrServer::Process_event_ownership"
	push    0h             ; line
	push    offset aEmpty ; "E:\\stalker\\sources\\trunk\\xr_3da\\xrGame\\"...
	push    eax ; "e_parent"
	call    ds:xrDebug__fail

	pop     ebp
	retn
msg_and_fail endp
ignore_always db 1
aEmpty db 0

set_actor_flags proc near
_flags      = dword ptr  4
	mov     eax, [esp+_flags]
	mov     psActorFlags, eax
	retn
set_actor_flags endp

get_actor_flags proc near
_flags      = dword ptr  4
	mov     eax, [psActorFlags]
	retn
get_actor_flags endp

ALIGN 8
g_trade_filtration_active dd 0

SetTradeFiltrationOn proc
	mov [g_trade_filtration_active], 1
	retn
SetTradeFiltrationOn endp

SetTradeFiltrationOff proc
	mov [g_trade_filtration_active], 0
	retn
SetTradeFiltrationOff endp

SumArgs proc
arg2 = dword ptr 8
arg1 = dword ptr 4
	mov     eax, [esp+arg1]
	add     eax, [esp+arg2]
	retn
SumArgs endp

SubArgs proc
arg2 = dword ptr 8
arg1 = dword ptr 4
	mov     eax, [esp+arg1]
	sub     eax, [esp+arg2]
	retn
SubArgs endp


GetGoodwill proc
for_who  = dword ptr 08h
to_who   = dword ptr 0Ch

	push    ebp
	mov     ebp, esp
	push    edx
	;---
	mov     eax, [ebp + to_who]
	push    eax
	mov     eax, [ebp + for_who]
	push    eax
	call    RELATION_REGISTRY__GetGoodwill
	;---
	pop     edx
	mov     esp, ebp
	pop     ebp
	retn
GetGoodwill endp

DelayedInventoryUpdate proc
	pusha
	call    GetGameSP
	test    eax, eax
	jz      exit
	mov     eax,[eax+3Ch] ; InventoryMenu
	test    eax, eax
	jz      exit
	mov     byte ptr [eax+64h], 1 ; m_b_need_reinit = true
exit:	
	popa
	retn
DelayedInventoryUpdate endp

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
g_CEffectorZoomInertion__Process dd ?
	
init_external_libs proc
	LOAD_DLL "extensions\ogse.dll", g_ogse_lib_hinst
	GET_PROC_ADDR g_ogse_lib_hinst, "CEffectorZoomInertion__Process", g_CEffectorZoomInertion__Process
	;
	retn
init_external_libs endp

