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
LOCAL buf
LOCAL define_name
LOCAL define_exit
LOCAL flag_was_registered
	jmp     lab1
define_name db define_name_str, 0
buf dd 0
lab1:
	cmp		var_to_bind, 0
	jz		short define_exit
	; сохраняем регистры. ecx - обязательно, его портит sprintf
	push	ecx
	push	edx
	; подготовим аргументы для sprintf
	mov     edx, var_to_bind
	;lea     ecx, [esp+688h+c_smapsize]
	lea     ecx, buf
	; сконвертируем char в int
	push    edx
	push    offset aD       ; "%d"
	push    ecx             ; char *
	call    ds:__imp__sprintf
	; устанавливаем дефайн
	;lea     ecx, [esp+694h+c_smapsize]
	lea     ecx, buf
	mov     [esp+esi*8+694h+defines], offset define_name
	mov     [esp+esi*8+694h+var_604], ecx;ecx
	add     esp, 0Ch
	; восстанавливаем содержимое регистров
	pop		edx
	pop		ecx
	; инкрементируем индекс дефайна в массиве для следующей записи
	add     esi, 1
define_exit:
ENDM

REGISTER_DEFINE_FLOAT MACRO var_to_bind:REQ, define_name_str:REQ
LOCAL lab1
LOCAL buf
LOCAL define_name
LOCAL define_exit
LOCAL flag_was_registered
	jmp     lab1
define_name db define_name_str, 0
buf dd 0
lab1:
	cmp		var_to_bind, 0
	jz		short define_exit
	; сохраняем регистры. ecx - обязательно, его портит sprintf
	push	ecx
	push	edx
	; подготовим аргументы для sprintf
	mov     edx, var_to_bind
	;lea     ecx, [esp+688h+c_smapsize]
	lea     ecx, buf
	; сконвертируем char в int
	push    edx
	push    offset aF       ; "%f"
	push    ecx             ; char *
	call    ds:__imp__sprintf
	; устанавливаем дефайн
	;lea     ecx, [esp+694h+c_smapsize]
	lea     ecx, buf
	mov     [esp+esi*8+694h+defines], offset define_name
	mov     [esp+esi*8+694h+var_604], ecx;ecx
	add     esp, 0Ch
	; восстанавливаем содержимое регистров
	pop		edx
	pop		ecx
	; инкрементируем индекс дефайна в массиве для следующей записи
	add     esi, 1
define_exit:
ENDM

aD db "%d", 0
aF db "%f", 0
c_smapsize      = byte ptr -648h
defines         = dword ptr -608h
var_604         = dword ptr -604h
pFunctionName   = dword ptr  1Ch
