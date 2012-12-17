include console_commands_reg_macro.asm

add_console_commands_fix proc 

	xor      eax, eax
	mov      g_bHudAdjustMode, eax
REGISTER_CC_INT2   g_bHudAdjustMode,  "hud_adjust_mode",    0, 5
	;xor     eax, eax
	;mov     [g_fHudAdjustValue], eax
REGISTER_CC_FLOAT2 g_fHudAdjustValue, "hud_adjust_value", 0.0, 1.0

REGISTER_CC_FLOAT2 g_ftest, "test_float", 0.0, 123.0
REGISTER_CC_INT2   g_itest,  "test_int",    0, 255

REGISTER_CC_FLAG g_test_flags, 01h, "test_flag_1"
REGISTER_CC_FLAG g_test_flags, 02h, "test_flag_2"
REGISTER_CC_FLAG g_test_flags, 04h, "test_flag_3"
REGISTER_CC_FLAG g_test_flags, 08h, "test_flag_4"
REGISTER_CC_FLAG g_test_flags, 10h, "test_flag_5"
REGISTER_CC_FLAG g_test_flags, 20h, "test_flag_6"
REGISTER_CC_FLAG g_test_flags, 40h, "test_flag_7"
REGISTER_CC_FLAG g_test_flags, 80h, "test_flag_8"
REGISTER_CC_INT2 g_test_flags, "test_flags", 0, 255
;REGISTER_CC_FLAG g_ammo_on_belt, 1h, "g_ammunition_on_belt"

REGISTER_CC_FLAG g_mt_config, 001h, "mt_cnf_0"
REGISTER_CC_FLAG g_mt_config, 002h, "mt_cnf_1"
REGISTER_CC_FLAG g_mt_config, 004h, "mt_cnf_2"
REGISTER_CC_FLAG g_mt_config, 008h, "mt_cnf_3"
REGISTER_CC_FLAG g_mt_config, 010h, "mt_cnf_4"
REGISTER_CC_FLAG g_mt_config, 020h, "mt_cnf_5"
REGISTER_CC_FLAG g_mt_config, 040h, "mt_cnf_6"
REGISTER_CC_FLAG g_mt_config, 080h, "mt_cnf_7"
REGISTER_CC_FLAG g_mt_config, 100h, "mt_cnf_8"
REGISTER_CC_INT2 g_mt_config, "mt_cnf", 0, 0FFFFFFFFh


	; делаем то, что вырезали, включая возврат из функции
	pop     edi
	pop     esi
	pop     ebx
	retn
add_console_commands_fix endp

g_ftest dd 0.123
g_itest dd 123
g_test_flags dd 0
g_ammo_on_belt dd 0