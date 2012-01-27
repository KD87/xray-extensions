PERFORM_EXPORT_BOOL__VOID MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	xor     bl, bl
	mov     byte ptr [esp+88h-64h], bl
	mov     ecx, [esp+88h-64h]
	push    ecx
	mov     byte ptr [esp+8Ch-6Ch], bl
	mov     edx, [esp+8Ch-6Ch]
	push    edx
	push    offset fun_name
	push    eax
	lea     eax, [esp+98h-74h]
	mov     [esp+98h-74h], offset fun_to_export
	call    register__critically_wounded
ENDM


PERFORM_EXPORT_VOID__BOOL MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	mov     ecx, eax
	mov     byte ptr [esp+58h-38h], bl
	mov     eax, [esp+58h-38h]
	push    eax
	mov     byte ptr [esp+5Ch-40h], bl
	mov     edx, [esp+5Ch-40h]
	push    edx
	push    offset fun_name
	lea     eax, [esp+64h-48h]
	mov     ebx, ecx
	mov     [esp+64h-48h], offset fun_to_export
	call    enable_vision_register
ENDM

PERFORM_EXPORT_STRING__VOID MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	mov     byte ptr [esp+88h-64h], bl
	mov     edx, [esp+88h-64h]
	push    edx
	mov     byte ptr [esp+8Ch-6Ch], bl
	mov     ecx, [esp+8Ch-6Ch]
	push    ecx
	push    offset fun_name
	push    eax
	lea     eax, [esp+98h-74h]
	mov     [esp+98h-74h], offset fun_to_export
	call    register__string_void
ENDM

PERFORM_EXPORT_VOID__STRING MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:

	mov     ebx, eax
	xor     al, al
	mov     byte ptr [esp+88h-6Ch], al
	mov     ecx, [esp+88h-6Ch]
	mov     byte ptr [esp+88h-64h], al
	mov     eax, [esp+88h-64h]
	push    eax
	push    ecx
	push    offset fun_name
	lea     eax, [esp+94h-74h]
	mov     [esp+94h-74h], offset fun_to_export
	call    register__set_tip_text
ENDM

PERFORM_EXPORT_INT__VOID MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	mov     ecx, eax
	mov     byte ptr [esp+58h-38h], bl
	mov     eax, [esp+58h-38h]
	push    eax
	mov     byte ptr [esp+5Ch-40h], bl
	mov     edx, [esp+5Ch-40h]
	push    edx
	push    offset fun_name
	lea     eax, [esp+64h-48h]
	mov     ebx, ecx
	mov     [esp+64h-48h], offset fun_to_export
	call    register_general_goodwill
ENDM

PERFORM_EXPORT_UINT__VOID MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	xor     bl, bl
	mov     byte ptr [esp+88h-64h], bl
	mov     ecx, [esp+88h-64h]
	push    ecx
	mov     byte ptr [esp+8Ch-6Ch], bl
	mov     edx, [esp+8Ch-6Ch]
	push    edx
	lea     ecx, [esp+90h-74h]
	push    ecx
	push    offset fun_name
	push    eax
	mov     [esp+9Ch-74h], offset fun_to_export
	call    register_object_count
ENDM

PERFORM_EXPORT_FLOAT__VOID MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	xor ebx, ebx
	mov     byte ptr [esp+88h-74h], bl
	mov     ecx, [esp+88h-74h]
	push    ecx
	mov     byte ptr [esp+8Ch-6Ch], bl
	mov     edx, [esp+8Ch-6Ch]
	push    edx
	lea     ecx, [esp+90h-64h]
	push    ecx
	push    offset fun_name
	push    eax
	mov     [esp+9Ch-64h], offset fun_to_export
	call    register_get_bleeding
ENDM

PERFORM_EXPORT_VOID__FLOAT MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	mov     ebx, eax
	xor     al, al
	mov     byte ptr [esp+88h-6Ch], al
	mov     ecx, [esp+88h-6Ch]
	mov     byte ptr [esp+88h-64h], al
	mov     eax, [esp+88h-64h]
	push    eax
	push    ecx
	push    offset fun_name
	lea     eax, [esp+94h-74h]
	mov     [esp+94h-74h], offset fun_to_export
	call    register_set_actor_direction
ENDM


PERFORM_EXPORT_BOOL__GO MACRO registering_function:REQ, fun_to_export:REQ
	mov     ebx, eax
	xor     al, al
	mov     byte ptr [esp+58h-40h], al
	mov     ecx, [esp+58h-40h]
	mov     byte ptr [esp+58h-38h], al
	mov     eax, [esp+58h-38h]
	push    eax
	push    ecx
	lea     eax, [esp+60h-48h]
	mov     [esp+60h-48h], offset fun_to_export
	call    registering_function
ENDM

REGISTER_BOOL__GO MACRO register_fun_name:REQ, fun_name:REQ
LOCAL script_function_name
ALIGN_8
register_fun_name proc near

var_48 = dword ptr -48h
var_44 = dword ptr -44h
var_3C = byte ptr -3Ch

	sub     esp, 4Ch
	push    esi
	push    edi
	lea     esi, [esp+54h+var_3C]
	mov     edi, eax
	call    sub_1015DEF0
	mov     eax, [edi]
	push    eax
	lea     esi, [esp+58h+var_48]
	call    sub_1014F020
	mov     eax, esi
	push    eax
	lea     ecx, [esp+58h+var_3C]
	call    ds:?set_match_fun@overload_rep_base@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z
	mov     eax, [esp+54h+var_48]
	test    eax, eax
	jz      short lab1
	mov     ecx, [esp+54h+var_44]
	push    1
	push    ecx
	call    eax
	add     esp, 8

lab1:
	mov     edi, [edi]
	push    edi
	lea     esi, [esp+58h+var_48]
	call    sub_1014F450
	mov     edx, esi
	push    edx
	lea     ecx, [esp+58h+var_3C]
	call    ds:?set_fun@overload_rep@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z ; luabind::detail::overload_rep::set_fun(boost::function1<int,lua_State *,std::allocator<boost::function_base>> const &)
	mov     eax, [esp+54h+var_48]
	test    eax, eax
	jz      short lab2
	mov     ecx, [esp+54h+var_44]
	push    1
	push    ecx
	call    eax
	add     esp, 8

lab2:
	lea     edx, [esp+54h+var_3C]
	push    edx
	push    offset script_function_name
	mov     ecx, ebx
	call    ds:?add_method@class_base@detail@luabind@@QAEXPBDABUoverload_rep@23@@Z
	lea     ecx, [esp+54h+var_3C]
	call    ds:??1overload_rep@detail@luabind@@QAE@XZ
	pop     edi
	mov     eax, ebx
	pop     esi
	add     esp, 4Ch
	retn    8
script_function_name db fun_name, 0
register_fun_name endp
ENDM

PERFORM_EXPORT_GO__INT MACRO registering_function:REQ, fun_to_export:REQ
	xor     bl, bl
	mov     ecx, eax
	mov     byte ptr [esp+88h-64h], bl
	mov     edx, [esp+88h-64h]
	mov     byte ptr [esp+88h-6Ch], bl
	mov     eax, [esp+88h-6Ch]
	push    edx
	push    eax
	lea     eax, [esp+90h-74h]
	mov     ebx, ecx
	mov     [esp+90h-74h], offset fun_to_export
	call    registering_function
ENDM

REGISTER_GO__INT MACRO register_fun_name:REQ, fun_name:REQ
LOCAL script_function_name
ALIGN_8
register_fun_name proc near

var_48          = dword ptr -48h
var_44          = dword ptr -44h
var_3C          = byte ptr -3Ch

                sub     esp, 4Ch
                push    esi
                push    edi
                lea     esi, [esp+54h+var_3C]
                mov     edi, eax
                call    sub_10151320
                mov     eax, [edi]
                push    eax
                lea     esi, [esp+58h+var_48]
                call    sub_10151A80
                mov     eax, esi
                push    eax
                lea     ecx, [esp+58h+var_3C]
                call    ds:?set_match_fun@overload_rep_base@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z ; luabind::detail::overload_rep_base::set_match_fun(boost::function1<int,lua_State *,std::allocator<boost::function_base>> const &)
                mov     eax, [esp+54h+var_48]
                test    eax, eax
                jz      short lab2
                mov     ecx, [esp+54h+var_44]
                push    1
                push    ecx
                call    eax
                add     esp, 8

lab2:
                mov     edi, [edi]
                push    edi
                lea     esi, [esp+58h+var_48]
                call    sub_10151AE0
                mov     edx, esi
                push    edx
                lea     ecx, [esp+58h+var_3C]
                call    ds:?set_fun@overload_rep@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z ; luabind::detail::overload_rep::set_fun(boost::function1<int,lua_State *,std::allocator<boost::function_base>> const &)
                mov     eax, [esp+54h+var_48]
                test    eax, eax
                jz      short lab1
                mov     ecx, [esp+54h+var_44]
                push    1
                push    ecx
                call    eax
                add     esp, 8

lab1:
                lea     edx, [esp+54h+var_3C]
                push    edx
                push    offset script_function_name
                mov     ecx, ebx
                call    ds:?add_method@class_base@detail@luabind@@QAEXPBDABUoverload_rep@23@@Z ; luabind::detail::class_base::add_method(char const *,luabind::detail::overload_rep const &)
                lea     ecx, [esp+54h+var_3C]
                call    ds:??1overload_rep@detail@luabind@@QAE@XZ ; luabind::detail::overload_rep::~overload_rep(void)
                pop     edi
                mov     eax, ebx
                pop     esi
                add     esp, 4Ch
                retn    8
script_function_name db fun_name, 0
register_fun_name endp
ENDM

PERFORM_EXPORT_FLOAT__INT__WRONG MACRO registering_function:REQ, fun_to_export:REQ
	mov     ecx, eax
	mov     byte ptr [esp+88h-64h], bl
	mov     edx, [esp+88h-64h]
	mov     byte ptr [esp+88h-6Ch], bl
	mov     eax, [esp+88h-6Ch]
	push    edx
	push    eax
	lea     eax, [esp+90h-74h]
	mov     ebx, ecx
	mov     [esp+90h-74h], offset fun_to_export
	call    registering_function
ENDM

REGISTER_FLOAT__INT___WRONG MACRO register_fun_name:REQ, fun_name:REQ
LOCAL script_function_name
ALIGN_8
register_fun_name proc near

var_48          = dword ptr -48h
var_44          = dword ptr -44h
var_3C          = byte ptr -3Ch

                sub     esp, 4Ch
                push    esi
                push    edi
                lea     esi, [esp+54h+var_3C]
                mov     edi, eax
                call    sub_10151320 ; +
                mov     eax, [edi]
                push    eax
                lea     esi, [esp+58h+var_48]
                call    sub_10151A80 ; +
                mov     eax, esi
                push    eax
                lea     ecx, [esp+58h+var_3C]
				;+
                call    ds:?set_match_fun@overload_rep_base@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z ; luabind::detail::overload_rep_base::set_match_fun(boost::function1<int,lua_State *,std::allocator<boost::function_base>> const &)
                mov     eax, [esp+54h+var_48]
                test    eax, eax
                jz      short loc_1014E52D
                mov     ecx, [esp+54h+var_44]
                push    1
                push    ecx
                call    eax
                add     esp, 8

loc_1014E52D:
                mov     edi, [edi]
                push    edi
                lea     esi, [esp+58h+var_48]
                call    sub_101513C0 ;+
                mov     edx, esi
                push    edx
                lea     ecx, [esp+58h+var_3C]
                call    ds:?set_fun@overload_rep@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z 
                mov     eax, [esp+54h+var_48]
                test    eax, eax
                jz      short loc_1014E55A
                mov     ecx, [esp+54h+var_44]
                push    1
                push    ecx
                call    eax
                add     esp, 8

loc_1014E55A:
                lea     edx, [esp+54h+var_3C]
                push    edx
                push    offset script_function_name
                mov     ecx, ebx
                call    ds:?add_method@class_base@detail@luabind@@QAEXPBDABUoverload_rep@23@@Z 
                lea     ecx, [esp+54h+var_3C]
                call    ds:??1overload_rep@detail@luabind@@QAE@XZ
                pop     edi
                mov     eax, ebx
                pop     esi
                add     esp, 4Ch
                retn    8
script_function_name db fun_name, 0
register_fun_name endp
ENDM


PERFORM_EXPORT_FLOAT__INT MACRO registering_function:REQ, fun_to_export:REQ
	mov     byte ptr [esp+88h-64h], bl
	mov     edx, [esp+88h-64h]
	mov     ecx, eax
	mov     byte ptr [esp+88h-6Ch], bl
	mov     eax, [esp+88h-6Ch]
	mov     [esp+88h-74h], offset fun_to_export
	push    edx
	push    eax
	lea     eax, [esp+90h-74h]
	mov     ebx, ecx
	call    registering_function
ENDM

REGISTER_FLOAT__INT MACRO register_fun_name:REQ, fun_name:REQ
LOCAL script_function_name
ALIGN_8
register_fun_name proc near

var_48          = dword ptr -48h
var_44          = dword ptr -44h
var_3C          = byte ptr -3Ch

                sub     esp, 4Ch
                push    esi
                push    edi
                lea     esi, [esp+54h+var_3C]
                mov     edi, eax
                call    sub_1014F820
                mov     eax, [edi]
                push    eax
                lea     esi, [esp+58h+var_48]
                call    sub_10150020
                mov     eax, esi
                push    eax
                lea     ecx, [esp+58h+var_3C]
                call    ds:?set_match_fun@overload_rep_base@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z 
                mov     eax, [esp+54h+var_48]
                test    eax, eax
                jz      short loc_1014DEDD
                mov     ecx, [esp+54h+var_44]
                push    1
                push    ecx
                call    eax
                add     esp, 8

loc_1014DEDD: 
                mov     edi, [edi]
                push    edi
                lea     esi, [esp+58h+var_48]
                call    sub_10150A80
                mov     edx, esi
                push    edx
                lea     ecx, [esp+58h+var_3C]
                call    ds:?set_fun@overload_rep@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z 
                mov     eax, [esp+54h+var_48]
                test    eax, eax
                jz      short loc_1014DF0A
                mov     ecx, [esp+54h+var_44]
                push    1
                push    ecx
                call    eax
                add     esp, 8

loc_1014DF0A: 
                lea     edx, [esp+54h+var_3C]
                push    edx
                push    offset script_function_name
                mov     ecx, ebx
                call    ds:?add_method@class_base@detail@luabind@@QAEXPBDABUoverload_rep@23@@Z 
                lea     ecx, [esp+54h+var_3C]
                call    ds:??1overload_rep@detail@luabind@@QAE@XZ 
                pop     edi
                mov     eax, ebx
                pop     esi
                add     esp, 4Ch
                retn    8
script_function_name db fun_name, 0
register_fun_name endp
ENDM

PERFORM_EXPORT_VOID__VECTOR_FLOAT_INT MACRO registering_function:REQ, fun_to_export:REQ
	mov     byte ptr [esp+58h-38h], bl
	mov     ecx, [esp+58h-38h]
	push    ecx
	mov     byte ptr [esp+5Ch-40h], bl
	mov     edx, [esp+5Ch-40h]
	push    edx
	push    eax
	lea     eax, [esp+64h-48h]
	mov     [esp+64h-48h], offset fun_to_export
	call    registering_function
ENDM

REGISTER_VOID__VECTOR_FLOAT_INT MACRO register_fun_name:REQ, fun_name:REQ
LOCAL script_function_name
ALIGN_8
register_fun_name proc near

var_48          = dword ptr -48h
var_44          = dword ptr -44h
var_3C          = byte ptr -3Ch
arg_0           = dword ptr  4

                sub     esp, 48h
                push    ebx
                push    ebp
                mov     ebp, [esp+50h+arg_0]
                push    esi
                push    edi
                lea     edi, [esp+58h+var_3C]
                mov     ebx, eax
                call    sub_1015EA90
                mov     eax, [ebx]
                push    eax
                lea     esi, [esp+5Ch+var_48]
                call    sub_1015EBD0
                mov     eax, esi
                push    eax
                mov     ecx, edi
                call    ds:?set_match_fun@overload_rep_base@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z
                mov     eax, [esp+58h+var_48]
                test    eax, eax
                jz      short loc_10159751
                mov     ecx, [esp+58h+var_44]
                push    1
                push    ecx
                call    eax
                add     esp, 8

loc_10159751: 
                mov     ebx, [ebx]
                push    ebx
                lea     esi, [esp+5Ch+var_48]
                call    sub_1015EC30
                mov     edx, esi
                push    edx
                lea     ecx, [esp+5Ch+var_3C]
                call    ds:?set_fun@overload_rep@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z 
                mov     eax, [esp+58h+var_48]
                test    eax, eax
                jz      short loc_1015977E
                mov     ecx, [esp+58h+var_44]
                push    1
                push    ecx
                call    eax
                add     esp, 8

loc_1015977E:
                lea     edx, [esp+58h+var_3C]
                push    edx
                push    offset script_function_name
                mov     ecx, ebp
                call    ds:?add_method@class_base@detail@luabind@@QAEXPBDABUoverload_rep@23@@Z 
                lea     ecx, [esp+58h+var_3C]
                call    ds:??1overload_rep@detail@luabind@@QAE@XZ 
                pop     edi
                pop     esi
                mov     eax, ebp
                pop     ebp
                pop     ebx
                add     esp, 48h
                retn    0Ch
script_function_name db fun_name, 0
register_fun_name endp
ENDM

PERFORM_EXPORT_INT__STRING_INT MACRO registering_function:REQ, fun_to_export:REQ
	mov     [esp+58h-48h], offset fun_to_export
	xor     bl, bl
	mov     byte ptr [esp+58h-38h], bl
	mov     edx, [esp+58h-38h]
	push    edx
	mov     byte ptr [esp+5Ch-40h], bl
	mov     ecx, [esp+5Ch-40h]
	push    ecx
	push    eax
	lea     eax, [esp+64h-48h]
	call    registering_function
ENDM

REGISTER_INT__STRING_INT MACRO register_fun_name:REQ, fun_name:REQ
LOCAL script_function_name
ALIGN_8
register_fun_name proc near

var_48          = dword ptr -48h
var_44          = dword ptr -44h
var_3C          = byte ptr -3Ch
arg_0           = dword ptr  4

                sub     esp, 48h
                push    ebx
                push    ebp
                mov     ebp, [esp+50h+arg_0]
                push    esi
                push    edi
                lea     edi, [esp+58h+var_3C]
                mov     ebx, eax
                call    sub_1015D390
                mov     eax, [ebx]
                push    eax
                lea     esi, [esp+5Ch+var_48]
                call    sub_1015D480
                mov     eax, esi
                push    eax
                mov     ecx, edi
                call    ds:?set_match_fun@overload_rep_base@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z 
                mov     eax, [esp+58h+var_48]
                test    eax, eax
                jz      short loc_101588C1
                mov     ecx, [esp+58h+var_44]
                push    1
                push    ecx
                call    eax
                add     esp, 8

loc_101588C1: 
                mov     ebx, [ebx]
                push    ebx
                lea     esi, [esp+5Ch+var_48]
                call    sub_1015D4E0
                mov     edx, esi
                push    edx
                lea     ecx, [esp+5Ch+var_3C]
                call    ds:?set_fun@overload_rep@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z 
                mov     eax, [esp+58h+var_48]
                test    eax, eax
                jz      short loc_101588EE
                mov     ecx, [esp+58h+var_44]
                push    1
                push    ecx
                call    eax
                add     esp, 8
loc_101588EE: 
                lea     edx, [esp+58h+var_3C]
                push    edx
                push    offset script_function_name
                mov     ecx, ebp
                call    ds:?add_method@class_base@detail@luabind@@QAEXPBDABUoverload_rep@23@@Z 
                lea     ecx, [esp+58h+var_3C]
                call    ds:??1overload_rep@detail@luabind@@QAE@XZ 
                pop     edi
                pop     esi
                mov     eax, ebp
                pop     ebp
                pop     ebx
                add     esp, 48h
                retn    0Ch
script_function_name db fun_name, 0
register_fun_name endp
ENDM



PERFORM_EXPORT_VOID__INT_INT MACRO registering_function:REQ, fun_to_export:REQ
	xor     bl, bl
	mov     byte ptr [esp+58h-38h], bl
	mov     ecx, [esp+58h-38h]
	push    ecx
	mov     byte ptr [esp+5Ch-40h], bl
	mov     edx, [esp+5Ch-40h]
	push    edx
	push    eax
	lea     eax, [esp+64h-48h]
	mov     [esp+64h-48h], offset fun_to_export
	call    registering_function
ENDM

REGISTER_VOID__INT_INT MACRO register_fun_name:REQ, fun_name:REQ
LOCAL script_function_name
ALIGN_8
register_fun_name proc near

var_48          = dword ptr -48h
var_44          = dword ptr -44h
var_3C          = byte ptr -3Ch
arg_0           = dword ptr  4

                sub     esp, 48h
                push    ebx
                push    ebp
                mov     ebp, [esp+50h+arg_0]
                push    esi
                push    edi
                lea     edi, [esp+58h+var_3C]
                mov     ebx, eax
                call    sub_1015A230
                mov     eax, [ebx]
                push    eax
                lea     esi, [esp+5Ch+var_48]
                call    sub_1015F0E0
                mov     eax, esi
                push    eax
                mov     ecx, edi
                call    ds:?set_match_fun@overload_rep_base@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z 
                mov     eax, [esp+58h+var_48]
                test    eax, eax
                jz      short loc_10157301
                mov     ecx, [esp+58h+var_44]
                push    1
                push    ecx
                call    eax
                add     esp, 8

loc_10157301:
                mov     ebx, [ebx]
                push    ebx
                lea     esi, [esp+5Ch+var_48]
                call    sub_1015A320
                mov     edx, esi
                push    edx
                lea     ecx, [esp+5Ch+var_3C]
                call    ds:?set_fun@overload_rep@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z 
                mov     eax, [esp+58h+var_48]
                test    eax, eax
                jz      short loc_1015732E
                mov     ecx, [esp+58h+var_44]
                push    1
                push    ecx
                call    eax
                add     esp, 8

loc_1015732E:
                lea     edx, [esp+58h+var_3C]
                push    edx
                push    offset script_function_name
                mov     ecx, ebp
                call    ds:?add_method@class_base@detail@luabind@@QAEXPBDABUoverload_rep@23@@Z 
                lea     ecx, [esp+58h+var_3C]
                call    ds:??1overload_rep@detail@luabind@@QAE@XZ 
                pop     edi
                pop     esi
                mov     eax, ebp
                pop     ebp
                pop     ebx
                add     esp, 48h
                retn    0Ch

script_function_name db fun_name, 0
register_fun_name endp
ENDM

PERFORM_EXPORT_VOID__GO MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	mov     ecx, eax
	mov     byte ptr [esp+58h-38h], bl
	mov     eax, [esp+58h-38h]
	push    eax
	mov     byte ptr [esp+5Ch-40h], bl
	mov     edx, [esp+5Ch-40h]
	push    edx
	push    offset fun_name
	lea     eax, [esp+64h-48h]
	mov     ebx, ecx
	mov     [esp+64h-48h], offset fun_to_export
	call    register__run_talk_dialog
ENDM

PERFORM_EXPORT_GO__VOID MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	mov     byte ptr [esp+88h-64h], bl
	mov     ecx, [esp+88h-64h]
	push    ecx
	mov     byte ptr [esp+8Ch-6Ch], bl
	mov     edx, [esp+8Ch-6Ch]
	push    edx
	push    offset fun_name
	push    eax
	lea     eax, [esp+98h-74h]
	mov     [esp+98h-74h], offset fun_to_export
	call    register__get_best_item
ENDM



PERFORM_EXPORT_VECTOR__STRING MACRO registering_function:REQ, fun_to_export:REQ
	mov     ecx, eax
	mov     byte ptr [esp+58h-38], bl
	mov     eax, [esp+58h-38h]
	mov     byte ptr [esp+58h-40h], bl
	mov     edx, [esp+58h-40h]
	push    eax
	push    edx
	lea     eax, [esp+60h-48h]
	mov     ebx, ecx
	mov     [esp+60h-48h], offset fun_to_export
	call    registering_function
ENDM

REGISTER_VECTOR__STRING MACRO register_fun_name:REQ, fun_name:REQ
LOCAL script_function_name
ALIGN_8
register_fun_name proc near

var_48          = dword ptr -48h
var_44          = dword ptr -44h
var_3C          = byte ptr -3Ch

	sub     esp, 4Ch
	push    esi
	push    edi
	lea     esi, [esp+54h+var_3C]
	mov     edi, eax
	call    sub_1015C7E0
	mov     eax, [edi]
	push    eax
	lea     esi, [esp+58h+var_48]
	call    sub_1015C880
	mov     eax, esi
	push    eax
	lea     ecx, [esp+58h+var_3C]
	call    ds:?set_match_fun@overload_rep_base@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z ; luabind::detail::overload_rep_base::set_match_fun(boost::function1<int,lua_State *,std::allocator<boost::function_base>> const &)
	mov     eax, [esp+54h+var_48]
	test    eax, eax
	jz      short loc_101583FD
	mov     ecx, [esp+54h+var_44]
	push    1
	push    ecx
	call    eax
	add     esp, 8

loc_101583FD:
	mov     edi, [edi]
	push    edi
	lea     esi, [esp+58h+var_48]
	call    sub_1015C8E0
	mov     edx, esi
	push    edx
	lea     ecx, [esp+58h+var_3C]
	call    ds:?set_fun@overload_rep@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z ; luabind::detail::overload_rep::set_fun(boost::function1<int,lua_State *,std::allocator<boost::function_base>> const &)
	mov     eax, [esp+54h+var_48]
	test    eax, eax
	jz      short loc_1015842A
	mov     ecx, [esp+54h+var_44]
	push    1
	push    ecx
	call    eax
	add     esp, 8

loc_1015842A:
	lea     edx, [esp+54h+var_3C]
	push    edx
	push    offset script_function_name
	mov     ecx, ebx
	call    ds:?add_method@class_base@detail@luabind@@QAEXPBDABUoverload_rep@23@@Z ; luabind::detail::class_base::add_method(char const *,luabind::detail::overload_rep const &)
	lea     ecx, [esp+54h+var_3C]
	call    ds:??1overload_rep@detail@luabind@@QAE@XZ ; luabind::detail::overload_rep::~overload_rep(void)
	pop     edi
	mov     eax, ebx
	pop     esi
	add     esp, 4Ch
	retn    8
script_function_name db fun_name, 0
register_fun_name endp
ENDM
