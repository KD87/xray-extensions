REGISTER_DEFINE MACRO bitfield_to_bind:REQ, mask_value:REQ, define_name_str:REQ
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

shader_defines:

REGISTER_DEFINE ps_r2_ls_flags, 40000h, "USE_SOFT_WATER"
REGISTER_DEFINE ps_r2_ls_flags, 80000h, "USE_SUNSHAFTS"
REGISTER_DEFINE ps_r2_ls_flags, 100000h, "USE_IMPROVED_PARALLAX"
REGISTER_DEFINE ps_r2_ls_flags, 200000h, "USE_SOFT_SHADOWS"
REGISTER_DEFINE ps_r2_ls_flags, 400000h, "USE_DDOF"
REGISTER_DEFINE ps_r2_ls_flags, 800000h, "USE_F32"
REGISTER_DEFINE ps_r2_ls_flags, 1000000h, "USE_SSDO"
REGISTER_DEFINE ps_r2_ls_flags, 2000000h, "USE_HBAO"

	; делаем вырезанное
	mov     ebx, [ebp+pFunctionName]
	mov     [esp+esi*8+680h+defines], ecx
	jmp back_to_shader_defines
	
defines         = dword ptr -608h
var_604         = dword ptr -604h
pFunctionName   = dword ptr  1Ch