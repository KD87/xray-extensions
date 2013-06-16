include console_commands_reg_macro.asm

add_console_commands_fix proc 

	xor      eax, eax
	mov      g_bHudAdjustMode, eax
REGISTER_CC_INT2   g_bHudAdjustMode,  "hud_adjust_mode",    0, 5
	;xor     eax, eax
	;mov     [g_fHudAdjustValue], eax
REGISTER_CC_FLOAT2 g_fHudAdjustValue, "hud_adjust_value", 0.0, 1.0

REGISTER_CC_FLAG g_ammo_on_belt, 1h, "g_ammunition_on_belt"

REGISTER_CC_FLAG g_mouse_wheel_sc, 1h, "mouse_wheel_slot_changing"

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
g_mouse_wheel_sc dd 1
