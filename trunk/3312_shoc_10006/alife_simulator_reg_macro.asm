ALIFE_SIM_PERFORM_EXPORT__TELEPORT MACRO registering_function:REQ, fun_to_export:REQ
	mov     ecx, eax
	xor     eax, eax
	lea     edi, [ebp-10h]
	stosb
	push    [ebp-10h]
	lea     edi, [ebp-0Ch]
	stosb
	push    [ebp-0Ch]
	lea     eax, [ebp-08h]
	push    ecx
	mov     [ebp-08h], offset fun_to_export
	call    registering_function
ENDM

ALIFE_SIM_REGISTER_TELEPORT MACRO register_fun_name:REQ, fun_name:REQ
LOCAL script_function_name
register_fun_name proc near

var_4C          = byte ptr -4Ch
var_10          = dword ptr -10h
var_C           = dword ptr -0Ch
var_8           = dword ptr -8
var_4           = dword ptr -4
arg_0           = dword ptr  8

                push    ebp
                mov     ebp, esp
                sub     esp, 50h
                push    ebx
                push    esi
                push    edi
                lea     esi, [ebp+var_4C]
                mov     ebx, eax
                call    sub_1004F0C3
                mov     eax, [ebx]
                mov     [ebp+var_4], eax
                xor     edi, edi
                lea     eax, [ebp+var_4]
                push    eax
                mov     [ebp+var_10], edi
                mov     [ebp+var_C], edi
                mov     [ebp+var_8], edi
                call    sub_10255F80
                test    al, al
                pop     ecx
                jnz     short loc_1004E655
                push    4
                pop     eax
                mov     [ebp+var_8], offset sub_1004F90E
                mov     [ebp+var_10], offset sub_1030E428
                call    sub_100015E0
                cmp     eax, edi
                jz      short loc_1004E652
                mov     ecx, [ebp+var_4]
                mov     [eax], ecx
loc_1004E652:
                mov     [ebp+var_C], eax
loc_1004E655:
                lea     eax, [ebp+var_10]
                push    eax
                lea     ecx, [ebp+var_4C]
                call    ds:?set_match_fun@overload_rep_base@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z ; luabind::detail::overload_rep_base::set_match_fun(boost::function1<int,lua_State *,std::allocator<boost::function_base>> const &)
                lea     esi, [ebp+var_10]
                call    sub_10004260
                mov     ebx, [ebx]
                lea     eax, [ebp+var_4]
                push    eax
                mov     [ebp+var_10], edi
                mov     [ebp+var_C], edi
                mov     [ebp+var_8], edi
                mov     [ebp+var_4], ebx
                call    sub_10255F80
                test    al, al
                pop     ecx
                jnz     short loc_1004E6A8
                push    4
                pop     eax
                mov     [ebp+var_8], offset sub_1004F91A
                mov     [ebp+var_10], offset sub_1030E428
                call    sub_100015E0
                cmp     eax, edi
                jz      short loc_1004E6A5
                mov     ecx, [ebp+var_4]
                mov     [eax], ecx
loc_1004E6A5:
                mov     [ebp+var_C], eax
loc_1004E6A8:
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
                retn    0Ch
script_function_name db fun_name, 0
register_fun_name endp
ENDM
