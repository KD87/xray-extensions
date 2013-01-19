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
	mov     ecx, ds:Console
	test    ecx, ecx
	mov     cmd_obj, offset IConsole_Command___vftable ; const IConsole_Command::`vftable'
	jz      short exit_destructor
	push    offset cmd_obj ; C
	call    CConcole__RemoveCommand ; CConsole::RemoveCommand(IConsole_Command *)
exit_destructor:
	retn
	
lab1:
	test    flag_was_registered, 1
	jnz     short skip
	or      flag_was_registered, 1

	push    mask_value
	push    offset bitfield_to_bind
	push    offset command_name 
	mov     ecx, offset cmd_obj
	call    CCC_Mask__CCC_Mask ; CCC_Mask::CCC_Mask(char const *,_flags<uint> *,uint)
	push    offset obj_destructor ; void (__cdecl *)()
	call    _atexit
	add     esp, 4
skip:
	mov     edi, ds:Console ; CConsole * Console
	mov     ecx, offset cmd_obj
	mov		ecx, [ecx+4]
	add     edi, 484h
	lea     esi, [esp+10h]
	mov     [esp+10h], ecx
	call    sub_4B9E10
	mov     dword ptr [eax], offset cmd_obj
ENDM

REGISTER_CC_FLOAT MACRO var_to_bind:REQ, command_name_str:REQ, low_bond:REQ, high_bond:REQ
LOCAL lab1
LOCAL flag_was_registered
LOCAL command_name
LOCAL cmd_obj
LOCAL obj_destructor
LOCAL exit_destructor
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
	mov     ecx, ds:Console
	test    ecx, ecx
	mov     cmd_obj, offset IConsole_Command___vftable ; const IConsole_Command::`vftable'
	jz      short exit_destructor
	push    offset cmd_obj ; C
	call    CConcole__RemoveCommand ; CConsole::RemoveCommand(IConsole_Command *)
exit_destructor:
	retn
	
lab1:
	test    flag_was_registered, 1
	jnz     short skip
	or      flag_was_registered, 1

	mov     eax, [HB_]
	push    eax
	mov     eax, [LB_]
	push    eax
	
	push    offset var_to_bind
	push    offset command_name
	mov     ecx, offset cmd_obj
	call    CCC_Float__CCC_Float 
	push    offset obj_destructor ; void (__cdecl *)()
	call    _atexit
	add     esp, 4
skip:
	mov     edi, ds:Console ; CConsole * Console
	mov     ecx, offset cmd_obj
	mov		ecx, [ecx+4]
	add     edi, 484h
	lea     esi, [esp+10h]
	mov     [esp+10h], ecx
	call    sub_4B9E10
	mov     dword ptr [eax], offset cmd_obj
ENDM

REGISTER_CC_INT MACRO var_to_bind:REQ, command_name_str:REQ, low_bond:REQ, high_bond:REQ
LOCAL lab1
LOCAL flag_was_registered
LOCAL command_name
LOCAL cmd_obj
LOCAL obj_destructor
LOCAL exit_destructor
LOCAL skip
	jmp     lab1
flag_was_registered db 0
command_name db command_name_str, 0
cmd_obj  dd 24 DUP (0)
obj_destructor:
	mov     ecx, ds:Console
	test    ecx, ecx
	mov     cmd_obj, offset IConsole_Command___vftable ; const IConsole_Command::`vftable'
	jz      short exit_destructor
	push    offset cmd_obj ; C
	call    CConcole__RemoveCommand ; CConsole::RemoveCommand(IConsole_Command *)
exit_destructor:
	retn

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
	call    _atexit
	add     esp, 4
skip:
	mov     edi, ds:Console
	mov     edx, offset cmd_obj
	mov		edx, [edx+4]
	add     edi, 484h
	lea     esi, [esp+10h]
	mov     [esp+10h], edx
	call    sub_4B9E10
	mov     dword ptr [eax], offset cmd_obj
ENDM