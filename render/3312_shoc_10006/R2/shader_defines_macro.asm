REGISTER_DEFINE_FLAG MACRO bitfield_to_bind:REQ, mask_value:REQ, define_name_str:REQ
LOCAL lab1
LOCAL define_name
LOCAL define_exit
LOCAL flag_was_registered
	jmp     lab1
define_name db define_name_str, 0
lab1:
	test	bitfield_to_bind, mask_value
	jz		short define_exit
	mov		[esp+esi*8+680h+defines], offset define_name
	mov		[esp+esi*8+680h+var_604], edi
	add		esi, 1
define_exit:
ENDM

REGISTER_DEFINE_INT MACRO var_to_bind:REQ, define_name_str:REQ
LOCAL lab1
LOCAL define_name
LOCAL define_exit
LOCAL flag_was_registered
	jmp     lab1
define_name db define_name_str, 0
lab1:
	cmp		var_to_bind, 0
	jz		short define_exit
	push	eax
	push	ecx
	push	edx
	mov     edx, var_to_bind
	push    edx
	lea     eax, [esp+690h+c_smapsize]
	push    offset aD       ; "%d"
	push    eax             ; char *
	call    ds:__imp__sprintf
	lea     ecx, [esp+698h+c_smapsize]
	mov     [esp+esi*8+698h+defines], offset define_name
	mov     [esp+esi*8+698h+var_604], ecx
	add     esp, 0Ch
	pop		edx
	pop		ecx
	pop		eax
	add     esi, 1
define_exit:
ENDM

aD db "%d", 0
c_smapsize      = byte ptr -648h
defines         = dword ptr -608h
var_604         = dword ptr -604h
pFunctionName   = dword ptr  1Ch
