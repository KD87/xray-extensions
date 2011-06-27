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

	; делаем то, что вырезали, включая возврат из функции
	pop     edi
	pop     esi
	pop     ebx
	retn
add_console_commands_fix endp

g_ftest dd 0.123
g_itest dd 123