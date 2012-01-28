PERFORM_EXPORT__MATRIX__PMATR__FLOAT MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	mov     ecx, eax
	xor     eax, eax
	mov     [ebp-14h], eax
	push    [ebp-14h]
	
	mov     [ebp-10h], eax
	push    [ebp-10h]
	
	mov     [ebp-0Ch], offset fun_to_export
	lea     eax, [ebp-0Ch]
	push    eax
	
	push    offset fun_name
	push    ecx
	call    register__matrix_div_number
ENDM

; PERFORM_EXPORT_BOOL__GO MACRO registering_function:REQ, fun_to_export:REQ
	; xor     eax, eax
	; lea     edi, [ebp-0Ch]
	; stosb
	; push    [ebp-0Ch]
	; lea     edi, [ebp-10h]
	; stosb
	; push    [ebp-10h]
	; lea     eax, [ebp-14h]
	; push    eax
	; push    [ebp-08h]
	; mov     [ebp-14h], offset fun_to_export
	; call    registering_function
; ENDM

; REGISTER__MATRIX__PMATR_PMATR_strange MACRO register_fun_name:REQ, fun_name:REQ
; LOCAL script_function_name

; script_function_name db fun_name, 0

; register_fun_name proc near

; var_4C          = byte ptr -4Ch
; var_40          = dword ptr -40h
; var_3C          = dword ptr -3Ch
; var_38          = dword ptr -38h
; var_34          = dword ptr -34h
; var_30          = dword ptr -30h
; var_2C          = dword ptr -2Ch
; var_28          = dword ptr -28h
; var_24          = byte ptr -24h
; var_20          = dword ptr -20h
; var_1C          = dword ptr -1Ch
; var_18          = dword ptr -18h
; var_14          = byte ptr -14h
; var_10          = dword ptr -10h
; var_C           = dword ptr -0Ch
; var_8           = dword ptr -8
; var_4           = dword ptr -4
; arg_0           = dword ptr  8
; arg_4           = dword ptr  0Ch

	; push    ebp
	; mov     ebp, esp
	; sub     esp, 4Ch
	; push    ebx
	; push    esi
	; push    edi
	; lea     ecx, [ebp+var_4C]
	; call    ds:??0overload_rep_base@detail@luabind@@QAE@XZ ; luabind::detail::overload_rep_base::overload_rep_base(void)
	; xor     ebx, ebx
	; push    1
	; lea     ecx, [ebp+var_24]
	; mov     [ebp+var_3C], ebx
	; mov     [ebp+var_38], ebx
	; mov     [ebp+var_34], ebx
	; mov     [ebp+var_30], ebx
	; mov     [ebp+var_2C], ebx
	; mov     [ebp+var_28], ebx
	; mov     [ebp+var_20], ebx
	; mov     [ebp+var_1C], ebx
	; mov     [ebp+var_18], ebx
	; mov     [ebp+var_14], bl
	; call    sub_10002EB5
	; lea     edi, [ebp+var_4]
	; lea     ecx, [ebp+var_24]
	; mov     [ebp+var_4], offset off_1054EF78
	; call    sub_10002FA2
	; mov     edi, [ebp+arg_4]
	; mov     eax, [edi]
	; mov     [ebp+arg_4], eax
	; lea     eax, [ebp+arg_4]
	; push    eax
	; mov     [ebp+var_40], 2
	; mov     [ebp+var_10], ebx
	; mov     [ebp+var_C], ebx
	; mov     [ebp+var_8], ebx
	; call    sub_10255F80
	; test    al, al
	; pop     ecx
	; jnz     short loc_10139F56
	; push    4
	; pop     eax
	; mov     [ebp+var_8], offset sub_1013A9EF
	; mov     [ebp+var_10], offset sub_1030E428
	; call    sub_100015E0
	; cmp     eax, ebx
	; jz      short loc_10139F53
	; mov     ecx, [ebp+arg_4]
	; mov     [eax], ecx

; loc_10139F53:
	; mov     [ebp+var_C], eax

; loc_10139F56:
	; lea     eax, [ebp+var_10]
	; push    eax
	; lea     ecx, [ebp+var_4C]
	; call    ds:?set_match_fun@overload_rep_base@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z ; luabind::detail::overload_rep_base::set_match_fun(boost::function1<int,lua_State *,std::allocator<boost::function_base>> const &)
	; lea     esi, [ebp+var_10]
	; call    sub_10004260
	; mov     eax, [edi]
	; mov     [ebp+arg_4], eax
	; lea     eax, [ebp+arg_4]
	; push    eax
	; mov     [ebp+var_10], ebx
	; mov     [ebp+var_C], ebx
	; mov     [ebp+var_8], ebx
	; call    sub_10255F80
	; test    al, al
	; pop     ecx
	; jnz     short loc_10139FA9
	; push    4
	; pop     eax
	; mov     [ebp+var_8], offset sub_1013AA34
	; mov     [ebp+var_10], offset sub_1030E428
	; call    sub_100015E0
	; cmp     eax, ebx
	; jz      short loc_10139FA6
	; mov     ecx, [ebp+arg_4]
	; mov     [eax], ecx

; loc_10139FA6:
	; mov     [ebp+var_C], eax

; loc_10139FA9:
	; lea     eax, [ebp+var_10]
	; push    eax
	; lea     ecx, [ebp+var_4C]
	; call    ds:?set_fun@overload_rep@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z ; luabind::detail::overload_rep::set_fun(boost::function1<int,lua_State *,std::allocator<boost::function_base>> const &)
	; lea     esi, [ebp+var_10]
	; call    sub_10004260
	; mov     ecx, [ebp+arg_0]
	; lea     eax, [ebp+var_4C]
	; push    eax
	; push    offset script_function_name
	; call    ds:?add_method@class_base@detail@luabind@@QAEXPBDABUoverload_rep@23@@Z ; luabind::detail::class_base::add_method(char const *,luabind::detail::overload_rep const &)
	; lea     ecx, [ebp+var_4C]
	; call    ds:??1overload_rep@detail@luabind@@QAE@XZ ; luabind::detail::overload_rep::~overload_rep(void)
	; mov     eax, [ebp+arg_0]
	; pop     edi
	; pop     esi
	; pop     ebx
	; leave
	; retn    10h
; register_fun_name endp
; ENDM

PERFORM_EXPORT__MATRIX__PMATR_PMATR MACRO registering_function:REQ, fun_to_export:REQ
	mov     ecx, eax
	xor     eax, eax
	lea     edi, [ebp-14h]
	stosb
	push    [ebp-14h]
	lea     edi, [ebp-10h]
	stosb
	push    [ebp-10h]
	lea     eax, [ebp-0Ch]
	push    eax
	push    ecx
	mov     [ebp-0Ch], offset fun_to_export
	call    registering_function
ENDM

REGISTER__MATRIX__PMATR_PMATR MACRO register_fun_name:REQ, fun_name:REQ
LOCAL script_function_name

script_function_name db fun_name, 0

register_fun_name proc near

var_4C          = byte ptr -4Ch
var_40          = dword ptr -40h
var_3C          = dword ptr -3Ch
var_38          = dword ptr -38h
var_34          = dword ptr -34h
var_30          = dword ptr -30h
var_2C          = dword ptr -2Ch
var_28          = dword ptr -28h
var_24          = byte ptr -24h
var_20          = dword ptr -20h
var_1C          = dword ptr -1Ch
var_18          = dword ptr -18h
var_14          = byte ptr -14h
var_10          = dword ptr -10h
var_C           = dword ptr -0Ch
var_8           = dword ptr -8
var_4           = dword ptr -4
arg_0           = dword ptr  8
arg_4           = dword ptr  0Ch

	push    ebp
	mov     ebp, esp
	sub     esp, 4Ch
	push    ebx
	push    esi
	push    edi
	lea     ecx, [ebp+var_4C]
	call    ds:??0overload_rep_base@detail@luabind@@QAE@XZ ; luabind::detail::overload_rep_base::overload_rep_base(void)
	xor     ebx, ebx
	push    2
	lea     ecx, [ebp+var_24]
	mov     [ebp+var_3C], ebx
	mov     [ebp+var_38], ebx
	mov     [ebp+var_34], ebx
	mov     [ebp+var_30], ebx
	mov     [ebp+var_2C], ebx
	mov     [ebp+var_28], ebx
	mov     [ebp+var_20], ebx
	mov     [ebp+var_1C], ebx
	mov     [ebp+var_18], ebx
	mov     [ebp+var_14], bl
	call    sub_10002EB5
	mov     esi, offset off_1054EF78
	lea     edi, [ebp+var_4]
	lea     ecx, [ebp+var_24]
	mov     [ebp+var_4], esi
	call    sub_10002FA2
	lea     edi, [ebp+var_4]
	lea     ecx, [ebp+var_24]
	mov     [ebp+var_4], esi
	call    sub_10002FA2
	mov     edi, [ebp+arg_4]
	mov     eax, [edi]
	mov     [ebp+arg_4], eax
	lea     eax, [ebp+arg_4]
	push    eax
	mov     [ebp+var_40], 3
	mov     [ebp+var_10], ebx
	mov     [ebp+var_C], ebx
	mov     [ebp+var_8], ebx
	call    sub_10255F80
	test    al, al
	pop     ecx
	jnz     short loc_1013A3AC
	push    4
	pop     eax
	mov     [ebp+var_8], offset sub_1013AB16
	mov     [ebp+var_10], offset sub_1030E428
	call    sub_100015E0
	cmp     eax, ebx
	jz      short loc_1013A3A9
	mov     ecx, [ebp+arg_4]
	mov     [eax], ecx

loc_1013A3A9:                           ; CODE XREF: register__mul_matrix+9Bj
	mov     [ebp+var_C], eax

loc_1013A3AC:                           ; CODE XREF: register__mul_matrix+81j
	lea     eax, [ebp+var_10]
	push    eax
	lea     ecx, [ebp+var_4C]
	call    ds:?set_match_fun@overload_rep_base@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z ; luabind::detail::overload_rep_base::set_match_fun(boost::function1<int,lua_State *,std::allocator<boost::function_base>> const &)
	lea     esi, [ebp+var_10]
	call    sub_10004260
	mov     edi, [edi]
	lea     eax, [ebp+arg_4]
	push    eax
	mov     [ebp+var_10], ebx
	mov     [ebp+var_C], ebx
	mov     [ebp+var_8], ebx
	mov     [ebp+arg_4], edi
	call    sub_10255F80
	test    al, al
	pop     ecx
	jnz     short loc_1013A3FF
	push    4
	pop     eax
	mov     [ebp+var_8], offset sub_1013AB7D
	mov     [ebp+var_10], offset sub_1030E428
	call    sub_100015E0
	cmp     eax, ebx
	jz      short loc_1013A3FC
	mov     ecx, [ebp+arg_4]
	mov     [eax], ecx

loc_1013A3FC:                           ; CODE XREF: register__mul_matrix+EEj
	mov     [ebp+var_C], eax

loc_1013A3FF:                           ; CODE XREF: register__mul_matrix+D4j
	lea     eax, [ebp+var_10]
	push    eax
	lea     ecx, [ebp+var_4C]
	call    ds:?set_fun@overload_rep@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z ; luabind::detail::overload_rep::set_fun(boost::function1<int,lua_State *,std::allocator<boost::function_base>> const &)
	lea     esi, [ebp+var_10]
	call    sub_10004260
	mov     ecx, [ebp+arg_0]
	lea     eax, [ebp+var_4C]
	push    eax
	push    offset script_function_name
	call    ds:?add_method@class_base@detail@luabind@@QAEXPBDABUoverload_rep@23@@Z ; luabind::detail::class_base::add_method(char const *,luabind::detail::overload_rep const &)
	lea     ecx, [ebp+var_4C]
	call    ds:??1overload_rep@detail@luabind@@QAE@XZ ; luabind::detail::overload_rep::~overload_rep(void)
	mov     eax, [ebp+arg_0]
	pop     edi
	pop     esi
	pop     ebx
	leave
	retn    10h
register_fun_name endp
ENDM

