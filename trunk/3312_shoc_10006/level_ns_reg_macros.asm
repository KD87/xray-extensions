
PERFORM_EXPORT_LEVEL__VOID__FLOAT MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset fun_to_export
	push    offset fun_name
	push    eax
	call    register__ns__set_snd_volume
ENDM

PERFORM_EXPORT_LEVEL__INT__INT MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset fun_to_export
	push    offset fun_name
	push    eax
	call    register__ns__int__int
ENDM
	
PERFORM_EXPORT_LEVEL__FLOAT__VOID MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset fun_to_export
	push    offset fun_name
	push    eax
	call    get_snd_volume_register
ENDM

PERFORM_EXPORT_LEVEL__FLOAT__STR_INT_BOOL_STR MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset fun_to_export
	push    offset fun_name
	push    eax
	call    register_level__float__str_int_bool_str
ENDM

PERFORM_EXPORT_LEVEL__INT__INT MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset fun_to_export
	push    offset fun_name
	push    eax
	call    register__ns__int__int
ENDM

PERFORM_EXPORT_LEVEL__BOOL__VOID MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset fun_to_export
	push    offset fun_name
	push    eax
	call    register__ns__bool__void
ENDM

PERFORM_EXPORT_LEVEL__GO__INT MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset fun_to_export
	push    offset fun_name
	push    eax
	call    register__ns__go__void
ENDM

REGISTER_LEVEL__GO__INT MACRO register_fun_name:REQ, fun_name:REQ, fun_to_export:REQ
LOCAL script_function_name
ALIGN_8
register_fun_name proc near

var_8           = dword ptr -8
var_4           = byte ptr -4
arg_0           = dword ptr  8

                push    ebp
                mov     ebp, esp
                push    ecx
                push    ecx
                mov     ecx, ds:Memory
                push    esi
                push    14h             ; _DWORD
                call    ds:xrMemory__mem_alloc
                mov     esi, eax
                test    esi, esi
                jz      short lab1
                mov     ecx, esi
                call    ds:??0registration@detail@luabind@@QAE@XZ ; luabind::detail::registration::registration(void)
                mov     dword ptr [esi], offset off_10481E80
                mov     dword ptr [esi+8], offset script_function_name
                mov     dword ptr [esi+0Ch], offset fun_to_export
                jmp     short lab2
lab1:
                xor     esi, esi
lab2:
                and     [ebp+var_8], 0
                push    ecx
                mov     eax, esp
                lea     ecx, [ebp+var_4]
                mov     [eax], esi
                call    ds:??0scope@luabind@@QAE@V?$auto_ptr@Uregistration@detail@luabind@@@std@@@Z ; luabind::scope::scope(std::auto_ptr<luabind::detail::registration>)
                mov     ecx, [ebp+arg_0]
                push    eax
                call    ds:??0scope@luabind@@QAE@ABU01@@Z ; luabind::scope::scope(scope::scope const &)
                lea     ecx, [ebp+var_4]
                call    ds:??1scope@luabind@@QAE@XZ ; luabind::scope::~scope(void)
                mov     ecx, [ebp+var_8]
                test    ecx, ecx
                jz      short lab3
                mov     eax, [ecx]
                push    1
                call    dword ptr [eax]
lab3:
                mov     eax, [ebp+arg_0]
                pop     esi
                leave
                retn

script_function_name db fun_name, 0
register_fun_name endp
ENDM


PERFORM_EXPORT_LEVEL__DLG__VOID_ MACRO export_fun:REQ
	push    esp
	call    export_fun
ENDM


REGISTER_LEVEL__DLG__VOID_ MACRO register_fun_name:REQ, fun_name:REQ, fun_to_export:REQ
LOCAL script_function_name
ALIGN_8
register_fun_name proc near

var_8           = dword ptr -8
var_4           = byte ptr -4
arg_0           = dword ptr  8

	push    ebp
	mov     ebp, esp
	push    ecx
	push    ecx
	mov     ecx, ds:Memory
	push    esi
	push    14h             ; _DWORD
	call    ds:xrMemory__mem_alloc
	mov     esi, eax
	test    esi, esi
	jz      short loc_101AFE57
	mov     ecx, esi
	call    ds:??0registration@detail@luabind@@QAE@XZ ; luabind::detail::registration::registration(void)
	mov     dword ptr [esi], offset off_10481F40
	mov     dword ptr [esi+8], offset script_function_name
	mov     dword ptr [esi+0Ch], offset fun_to_export
	jmp     short loc_101AFE59
; ---------------------------------------------------------------------------

loc_101AFE57:                           ; CODE XREF: register__level__main_input_receiver+18j
	xor     esi, esi

loc_101AFE59:                           ; CODE XREF: register__level__main_input_receiver+36j
	and     [ebp+var_8], 0
	push    ecx
	mov     eax, esp
	lea     ecx, [ebp+var_4]
	mov     [eax], esi
	call    ds:??0scope@luabind@@QAE@V?$auto_ptr@Uregistration@detail@luabind@@@std@@@Z ; luabind::scope::scope(std::auto_ptr<luabind::detail::registration>)
	mov     ecx, [ebp+arg_0]
	push    eax
	call    ds:??0scope@luabind@@QAE@ABU01@@Z ; luabind::scope::scope(scope::scope const &)
	lea     ecx, [ebp+var_4]
	call    ds:??1scope@luabind@@QAE@XZ ; luabind::scope::~scope(void)
	mov     ecx, [ebp+var_8]
	test    ecx, ecx
	jz      short loc_101AFE8B
	mov     eax, [ecx]
	push    1
	call    dword ptr [eax]

loc_101AFE8B:                           ; CODE XREF: register__level__main_input_receiver+64j
	mov     eax, [ebp+arg_0]
	pop     esi
	leave
	retn
script_function_name db fun_name, 0
register_fun_name endp
ENDM

register_ns_dialog_void    proc
var_8           = dword ptr -8
var_4           = byte ptr -4
arg_0           = dword ptr  8
arg_4           = dword ptr  0Ch
arg_8           = dword ptr  10h

	push    ebp
	mov     ebp, esp
	push    ecx
	push    ecx
	mov     ecx, ds:Memory
	push    esi
	push    14h             ; _DWORD
	call    ds:xrMemory__mem_alloc
	mov     esi, eax
	test    esi, esi
	jz      short loc_101AFC1F
	mov     ecx, esi
	call    ds:??0registration@detail@luabind@@QAE@XZ ; luabind::detail::registration::registration(void)
	mov     eax, [ebp+arg_4]
	mov     [esi+8], eax
	mov     eax, [ebp+arg_8]
	mov     dword ptr [esi], offset off_10481F40
	mov     [esi+0Ch], eax
	jmp     short loc_101AFC21
; ---------------------------------------------------------------------------

loc_101AFC1F:                           ; CODE XREF: sub_101AFBE9+18j
	xor     esi, esi

loc_101AFC21:                           ; CODE XREF: sub_101AFBE9+34j
	and     [ebp+var_8], 0
	push    ecx
	mov     eax, esp
	lea     ecx, [ebp+var_4]
	mov     [eax], esi
	call    ds:??0scope@luabind@@QAE@V?$auto_ptr@Uregistration@detail@luabind@@@std@@@Z ; luabind::scope::scope(std::auto_ptr<luabind::detail::registration>)
	mov     ecx, [ebp+arg_0]
	push    eax
	call    ds:??0scope@luabind@@QAE@ABU01@@Z ; luabind::scope::scope(scope::scope const &)
	lea     ecx, [ebp+var_4]
	call    ds:??1scope@luabind@@QAE@XZ ; luabind::scope::~scope(void)
	mov     ecx, [ebp+var_8]
	test    ecx, ecx
	jz      short loc_101AFC53
	mov     eax, [ecx]
	push    1
	call    dword ptr [eax]

loc_101AFC53:                           ; CODE XREF: sub_101AFBE9+62j
	mov     eax, [ebp+arg_0]
	pop     esi
	leave
	retn
register_ns_dialog_void    endp

PERFORM_EXPORT_LEVEL__DLG__VOID MACRO fun_to_export:REQ, fun_name_str:REQ
LOCAL lab1
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	pop     ecx
	pop     ecx
	mov     eax, esp
	push    offset fun_to_export
	push    offset fun_name
	push    eax
	call    register_ns_dialog_void
ENDM