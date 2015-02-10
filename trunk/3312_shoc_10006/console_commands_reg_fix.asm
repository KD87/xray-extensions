include console_commands_reg_macro.asm

add_console_commands_fix proc 
	xor      eax, eax
	mov      g_bHudAdjustMode, eax
REGISTER_CC_INT2   g_bHudAdjustMode,  "hud_adjust_mode",    0, 5
	;xor     eax, eax
	;mov     [g_fHudAdjustValue], eax
REGISTER_CC_FLOAT2 g_fHudAdjustValue, "hud_adjust_value", 0.0, 1.0
REGISTER_CC_FLOAT2 g_ui_mouse_sens, "mouse_ui_sens", 1.0, 10.0
ifndef OGSE_BUILD
	REGISTER_CC_FLAG g_ammo_on_belt, 1h, "g_ammunition_on_belt"
endif
REGISTER_CC_FLAG g_mouse_wheel_sc, 1h, "mouse_wheel_slot_changing"

ifdef OGSE_BUILD
	REGISTER_CC_INT2   g_ogse_nv_bind,           "ogse_nv_bind",           0, 07FFFFFFFh
	REGISTER_CC_INT2   g_ogse_antirad_bind,      "ogse_antirad_bind",      0, 07FFFFFFFh
	REGISTER_CC_INT2   g_ogse_energy_drink_bind, "ogse_energy_drink_bind", 0, 07FFFFFFFh
	REGISTER_CC_INT2   g_ogse_yod_bind,          "ogse_yod_bind",          0, 07FFFFFFFh
	REGISTER_CC_INT2   g_ogse_bipsizon_bind,     "ogse_bipsizon_bind",     0, 07FFFFFFFh
	REGISTER_CC_INT2   g_ogse_handradio_bind,    "ogse_handradio_bind",     0, 07FFFFFFFh
	REGISTER_CC_FLAG   g_ogse_flag,     	1h,  "write_debug_log"
endif

; =========================================================================================
; ========================= added by Ray Twitty (aka Shadows) =============================
; =========================================================================================
; ====================================== START ============================================
; =========================================================================================
REGISTER_CC_FLOAT2 g_fov, "cam_fov", 55.0, 90.0
REGISTER_CC_FLOAT2 00506BA4h, "hud_fov", 0.0, 1.0
REGISTER_CC_FLOAT2 phTimefactor, "ph_timefactor", 0.0, 10.0
REGISTER_CC_FLOAT2 phGravity, "ph_gravity", 0.0, 100.0
ifdef DEBUG_COMMANDS
	REGISTER_CC_FLAG psActorFlags, 8, "g_unlimitedammo"
	REGISTER_CC_FLAG psActorFlags, 1, "g_god"
endif
ifdef PZ_BUILD
	REGISTER_CC_FLAG psGameFlags, 1, "g_storyline_music"
	REGISTER_CC_FLAG psGameFlags, 2, "hud_date"
endif
; =========================================================================================
; ======================================= END =============================================
; =========================================================================================

	; делаем то, что вырезали, включая возврат из функции
	pop     edi
	pop     esi
	pop     ebx
	retn
add_console_commands_fix endp

g_ui_mouse_sens dd 3.3
ifdef PZ_BUILD
	g_ammo_on_belt dd 1
else
	g_ammo_on_belt dd 0
endif
g_mouse_wheel_sc dd 1

ifdef OGSE_BUILD
	g_ogse_nv_bind           dd 100000
	g_ogse_antirad_bind      dd 100000
	g_ogse_energy_drink_bind dd 100000
	g_ogse_yod_bind          dd 100000
	g_ogse_bipsizon_bind     dd 100000
	g_ogse_handradio_bind     dd 100000
	g_ogse_flag			     dd 0
endif

phGravity dd 19.62
ifdef PZ_BUILD
	psGameFlags dd 1
endif
