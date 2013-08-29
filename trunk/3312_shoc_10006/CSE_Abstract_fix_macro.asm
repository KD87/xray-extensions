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
