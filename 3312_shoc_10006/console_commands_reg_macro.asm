REGISTER_CC_INT2 MACRO var_to_bind:REQ, command_name_str:REQ, low_bond:REQ, high_bond:REQ
LOCAL lab1
LOCAL flag_was_registered
LOCAL command_name
LOCAL cmd_obj
LOCAL obj_destructor
LOCAL skip
	jmp     lab1
flag_was_registered db 0
command_name db command_name_str, 0
cmd_obj  dd 24 DUP (0)
obj_destructor:
	mov     ecx, offset cmd_obj
	jmp     ds:CCC_Integer___CCC_Integer ; CCC_Integer::~CCC_Integer(void)
lab1:
	test    flag_was_registered, 1
	jnz     short skip
	or      flag_was_registered, 1

	push    high_bond
	push    low_bond
	push    offset var_to_bind
	push    offset command_name 
	mov     ecx, offset cmd_obj
	call    ds:CCC_Integer__CCC_Integer ; CCC_Integer::CCC_Integer(char const *,int *,int,int)
	push    offset obj_destructor ; void (__cdecl *)()
	mov     edi, offset off_104A7014
	mov     cmd_obj, edi
	call    _atexit
	add     esp, 4
skip:
	mov     edx, ds:Console
	mov     ecx, [edx]
	push    offset cmd_obj
	call    CConsole__AddCommand ; CConsole::AddCommand(IConsole_Command *)
ENDM
;=============================================================================================
REGISTER_CC_FLOAT2 MACRO var_to_bind:REQ, command_name_str:REQ, low_bond:REQ, high_bond:REQ
LOCAL lab1
LOCAL flag_was_registered
LOCAL command_name
LOCAL cmd_obj
LOCAL obj_destructor
LOCAL skip
LOCAL LB_
LOCAL HB_
	jmp     lab1
LB_ dd low_bond
HB_ dd high_bond
flag_was_registered db 0
command_name db command_name_str, 0
cmd_obj  dd 24 DUP (0)
obj_destructor:
	mov     ecx, offset cmd_obj
	jmp     ds:CCC_Float___CCC_Float ; CCC_Float::~CCC_Float(void)
lab1:
	test    flag_was_registered, 1
	jnz     short skip
	or      flag_was_registered, 1
	
	;sub     esp, 8
	;fld     [HB_]
	;fstp    DWORD ptr [esp+4h];
	;fld     [LB_]
	;fstp    DWORD ptr [esp];
	
	mov     eax, [HB_]
	push    eax
	mov     eax, [LB_]
	push    eax
	
	push    offset var_to_bind
	push    offset command_name
	mov     ecx, offset cmd_obj
	call    ds:CCC_Float__CCC_Float 
	push    offset obj_destructor ; void (__cdecl *)()
	mov     edi, offset off_104A702C
	mov     cmd_obj, edi
	call    _atexit
	add     esp, 4
skip:
	mov     edx, ds:Console ; CConsole * Console
	mov     ecx, [edx]
	push    offset cmd_obj
	call    CConsole__AddCommand ; CConsole::AddCommand(IConsole_Command *)
ENDM
;=============================================================================================
REGISTER_CC_FLAG MACRO bitfield_to_bind:REQ, mask_value:REQ, command_name_str:REQ
LOCAL lab1
LOCAL flag_was_registered
LOCAL command_name
LOCAL cmd_obj
LOCAL obj_destructor
LOCAL skip
	jmp     lab1
flag_was_registered db 0
command_name db command_name_str, 0
cmd_obj  dd 24 DUP (0)
obj_destructor:
	mov     ecx, offset cmd_obj
	jmp     ds:CCC_Mask___CCC_Mask ; CCC_Mask::~CCC_Mask(void)
lab1:
	test    flag_was_registered, 1
	jnz     short skip
	or      flag_was_registered, 1

	push    mask_value
	push    offset bitfield_to_bind
	push    offset command_name 
	mov     ecx, offset cmd_obj
	call    ds:CCC_Mask__CCC_Mask ; CCC_Mask::CCC_Mask(char const *,_flags<uint> *,uint)
	push    offset obj_destructor ; void (__cdecl *)()
	;mov     edi, offset off_104A7014
	;mov     cmd_obj, edi
	call    _atexit
	add     esp, 4
skip:
	mov     edx, ds:Console
	mov     ecx, [edx]
	push    offset cmd_obj
	call    CConsole__AddCommand ; CConsole::AddCommand(IConsole_Command *)
ENDM
;=============================================================================================
REGISTER_CC_FLAG2 MACRO bitfield_to_bind:REQ, mask_value:REQ, command_name_str:REQ
LOCAL lab1
LOCAL flag_was_registered
LOCAL command_name
LOCAL cmd_obj
LOCAL obj_destructor
LOCAL skip
	jmp     lab1
flag_was_registered db 0
command_name db command_name_str, 0
cmd_obj  dd 24 DUP (0)
obj_destructor:
	mov     ecx, offset cmd_obj
	jmp     ds:CCC_Mask___CCC_Mask ; CCC_Mask::~CCC_Mask(void)
lab1:
	test    flag_was_registered, 1
	jnz     short skip
	or      flag_was_registered, 1

	mov     eax, ds:bitfield_to_bind
	push    mask_value
	push    eax
	push    offset command_name 
	mov     ecx, offset cmd_obj
	call    ds:CCC_Mask__CCC_Mask ; CCC_Mask::CCC_Mask(char const *,_flags<uint> *,uint)
	push    offset obj_destructor ; void (__cdecl *)()
	;mov     edi, offset off_104A7014
	;mov     cmd_obj, edi
	call    _atexit
	add     esp, 4
skip:
	mov     edx, ds:Console
	mov     ecx, [edx]
	push    offset cmd_obj
	call    CConsole__AddCommand ; CConsole::AddCommand(IConsole_Command *)
ENDM
