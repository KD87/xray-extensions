CSE_ABSTRACT_REGISTER_FVECTOR_RW_PROP MACRO register_fun_name:REQ, prop_name:REQ, prop_offs:REQ ;, prop_get_fun:REQ, prop_set_fun:REQ
LOCAL script_property_name
register_fun_name proc near

var_24          = dword ptr -24h
var_20          = dword ptr -20h
var_1C          = dword ptr -1Ch
var_18          = dword ptr -18h
var_14          = dword ptr -14h
var_10          = dword ptr -10h
var_C           = dword ptr -0Ch
var_8           = dword ptr -8
var_4           = dword ptr -4
arg_0           = dword ptr  8

                push    ebp
                mov     ebp, esp
                sub     esp, 24h
                mov     ecx, [ebp+var_8]
                push    ebx
                push    esi
                push    edi
                push    prop_offs
                pop     eax
                mov     [ebp+var_10], eax
                mov     [ebp+var_14], ecx
                lea     esi, [ebp+var_18]
                lea     edi, [ebp+var_24]
                movsd
                movsd
                xor     ebx, ebx
                lea     eax, [ebp+var_24]
                push    eax
                mov     [ebp+var_C], ebx
                mov     [ebp+var_8], ebx
                mov     [ebp+var_4], ebx
                movsd
                call    just_return_false5
                test    al, al
                pop     ecx
                jnz     short loc_102EB0BD
                push    0Ch
                pop     eax
                mov     [ebp+var_4], offset sub_101739BE
                mov     [ebp+var_C], offset sub_100072F3
                call    sub_100015E0
                cmp     eax, ebx
                jz      short loc_102EB0BA
                lea     esi, [ebp+var_24]
                mov     edi, eax
                movsd
                movsd
                movsd
loc_102EB0BA:
                mov     [ebp+var_8], eax
loc_102EB0BD:
                mov     ecx, [ebp+arg_0]
                lea     eax, [ebp+var_C]
                push    eax
                push    offset script_property_name
                call    ds:?add_getter@class_base@detail@luabind@@QAEXPBDABV?$function2@HPAUlua_State@@HV?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z 
                lea     esi, [ebp+var_C]
                call    sub_10001F8C
                mov     ecx, [ebp+var_8]
                push    prop_offs
                pop     eax
                mov     [ebp+var_1C], eax
                mov     [ebp+var_20], ecx
                lea     esi, [ebp+var_24]
                lea     edi, [ebp+var_18]
                movsd
                movsd
                lea     eax, [ebp+var_18]
                push    eax
                mov     [ebp+var_C], ebx
                mov     [ebp+var_8], ebx
                mov     [ebp+var_4], ebx
                movsd
                call    just_return_false5
                test    al, al
                pop     ecx
                jnz     short loc_102EB128
                push    0Ch
                pop     eax
                mov     [ebp+var_4], offset sub_1013A984
                mov     [ebp+var_C], offset sub_100072F3
                call    sub_100015E0
                cmp     eax, ebx
                jz      short loc_102EB125
                lea     esi, [ebp+var_18]
                mov     edi, eax
                movsd
                movsd
                movsd
loc_102EB125:
                mov     [ebp+var_8], eax
loc_102EB128:
                mov     ecx, [ebp+arg_0]
                lea     eax, [ebp+var_C]
                push    eax
                push    offset script_property_name
                call    ds:?add_setter@class_base@detail@luabind@@QAEXPBDABV?$function2@HPAUlua_State@@HV?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z 
                lea     esi, [ebp+var_C]
                call    sub_10001F8C
                mov     eax, [ebp+arg_0]
                pop     edi
                pop     esi
                pop     ebx
                leave
                retn    4
script_property_name db prop_name, 0
register_fun_name endp
ENDM

CSE_ABSTRACT_REGISTER_U16_RW_PROP MACRO prop_name:REQ, prop_offs:REQ
LOCAL lab1
LOCAL script_property_name
	jmp lab1
script_property_name db prop_name, 0
lab1:
	push eax
	push    prop_offs
	push    offset script_property_name
	lea     eax, [ebp-34h]
	push    eax
	call    register_cse_abstract_u16_rw_prop
	pop eax
ENDM

CSE_ABSTRACT_REGISTER_STRING__VOID MACRO fun_name:REQ, fun:REQ
LOCAL lab1
LOCAL script_property_name
	jmp lab1
script_function_name db fun_name, 0
lab1:
	push eax
	push    offset fun
	push    offset script_function_name

	lea     eax, [ebp-34h]
	push    eax
	call    cse_abstract__register_string__void
	pop eax
ENDM

CSE_ABSTRACT_REGISTER_INT__VOID MACRO registration_function:REQ, fun_name:REQ
LOCAL script_function_name
register_fun_name proc near

var_54          = byte ptr -54h
var_48          = dword ptr -48h
var_44          = dword ptr -44h
var_40          = dword ptr -40h
var_3C          = dword ptr -3Ch
var_38          = dword ptr -38h
var_34          = dword ptr -34h
var_30          = dword ptr -30h
var_2C          = byte ptr -2Ch
var_28          = dword ptr -28h
var_24          = dword ptr -24h
var_20          = dword ptr -20h
var_1C          = byte ptr -1Ch
var_18          = dword ptr -18h
var_14          = dword ptr -14h
var_10          = dword ptr -10h
var_C           = dword ptr -0Ch
var_8           = dword ptr -8
arg_0           = dword ptr  8

                push    ebp
                mov     ebp, esp
                sub     esp, 54h
                push    esi
                push    edi
                lea     ecx, [ebp+var_54]
                call    ds:??0overload_rep_base@detail@luabind@@QAE@XZ ; luabind::detail::overload_rep_base::overload_rep_base(void)
                xor     edi, edi
                push    edi
                lea     ecx, [ebp+var_2C]
                mov     [ebp+var_44], edi
                mov     [ebp+var_40], edi
                mov     [ebp+var_3C], edi
                mov     [ebp+var_38], edi
                mov     [ebp+var_34], edi
                mov     [ebp+var_30], edi
                mov     [ebp+var_28], edi
                mov     [ebp+var_24], edi
                mov     [ebp+var_20], edi
                mov     [ebp+var_1C], 1
                call    sub_10002EB5
                mov     eax, [ebx]
                mov     [ebp+var_C], eax
                mov     eax, [ebx+4]
                mov     [ebp+var_8], eax
                lea     eax, [ebp+var_C]
                push    eax
                mov     [ebp+var_48], 1
                mov     [ebp+var_18], edi
                mov     [ebp+var_14], edi
                mov     [ebp+var_10], edi
                call    just_return_false5
                test    al, al
                pop     ecx
                jnz     short loc_102EB504
                push    8
                pop     eax
                mov     [ebp+var_10], offset sub_102EC857
                mov     [ebp+var_18], offset sub_103ED2D9
                call    sub_100015E0
                cmp     eax, edi
                jz      short loc_102EB501
                mov     ecx, [ebp+var_C]
                mov     [eax], ecx
                mov     ecx, [ebp+var_8]
                mov     [eax+4], ecx

loc_102EB501:                           ; CODE XREF: sub_102EB478+7Cj
                mov     [ebp+var_14], eax

loc_102EB504:                           ; CODE XREF: sub_102EB478+62j
                lea     eax, [ebp+var_18]
                push    eax
                lea     ecx, [ebp+var_54]
                call    ds:?set_match_fun@overload_rep_base@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z ; luabind::detail::overload_rep_base::set_match_fun(boost::function1<int,lua_State *,std::allocator<boost::function_base>> const &)
                lea     esi, [ebp+var_18]
                call    sub_10004260
                mov     eax, [ebx]
                mov     [ebp+var_C], eax
                mov     eax, [ebx+4]
                mov     [ebp+var_8], eax
                lea     eax, [ebp+var_C]
                push    eax
                mov     [ebp+var_18], edi
                mov     [ebp+var_14], edi
                mov     [ebp+var_10], edi
                call    just_return_false5
                test    al, al
                pop     ecx
                jnz     short loc_102EB563
                push    8
                pop     eax
                mov     [ebp+var_10], offset sub_102EC871
                mov     [ebp+var_18], offset sub_103ED2D9
                call    sub_100015E0
                cmp     eax, edi
                jz      short loc_102EB560
                mov     ecx, [ebp+var_C]
                mov     [eax], ecx
                mov     ecx, [ebp+var_8]
                mov     [eax+4], ecx

loc_102EB560:                           ; CODE XREF: sub_102EB478+DBj
                mov     [ebp+var_14], eax

loc_102EB563:                           ; CODE XREF: sub_102EB478+C1j
                lea     eax, [ebp+var_18]
                push    eax
                lea     ecx, [ebp+var_54]
                call    ds:?set_fun@overload_rep@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z ; luabind::detail::overload_rep::set_fun(boost::function1<int,lua_State *,std::allocator<boost::function_base>> const &)
                lea     esi, [ebp+var_18]
                call    sub_10004260
                mov     ecx, [ebp+arg_0]
                lea     eax, [ebp+var_54]
                push    eax
                push    offset script_function_name
                call    ds:?add_method@class_base@detail@luabind@@QAEXPBDABUoverload_rep@23@@Z ; luabind::detail::class_base::add_method(char const *,luabind::detail::overload_rep const &)
                lea     ecx, [ebp+var_54]
                call    ds:??1overload_rep@detail@luabind@@QAE@XZ ; luabind::detail::overload_rep::~overload_rep(void)
                mov     eax, [ebp+arg_0]
                pop     edi
                pop     esi
                leave
                retn    0Ch
sub_102EB478    endp

script_function_name db fun_name, 0
register_fun_name endp
ENDM

CSE_ABSTRACT_REGISTER_U32_RO_PROP MACRO prop_name:REQ, prop_offs:REQ
LOCAL lab1
LOCAL script_property_name
	jmp lab1
script_property_name db prop_name, 0
lab1:
	push eax
	push    prop_offs
	push    offset script_property_name
	lea     eax, [ebp-34h]
	push    eax
	call    cse_alife_object__register_readonly_u32
	pop eax
ENDM
