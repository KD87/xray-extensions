con_comm:

REGISTER_CC_INT det_rad_value, "r__detail_radius", 31h, 0FAh

REGISTER_CC_TOKEN ssao_quality_token, "r2_ssao", ssao_quality
REGISTER_CC_TOKEN ssao_mode_token, "r2_ssao_mode", ssao_mode
REGISTER_CC_TOKEN aa_quality_token, "r2_aa", aa_quality
REGISTER_CC_TOKEN aa_mode_token, "r2_aa_mode", aa_mode
REGISTER_CC_TOKEN soft_shadows_token, "r2_soft_shadows", soft_shadows
REGISTER_CC_TOKEN steep_parallax_token, "r2_steep_parallax", steep_parallax
REGISTER_CC_TOKEN dynamic_dof_token, "r2_dof", dynamic_dof
REGISTER_CC_TOKEN sunshafts_quality_token, "r2_sunshafts", sunshafts_quality

REGISTER_CC_FLAG dof_flags, 2, "r2_dof_zoom"
REGISTER_CC_FLAG dof_flags, 4, "r2_dof_reload"

REGISTER_CC_FLAG fake_flag, 04000h, "r2_exp_donttest_uns"
REGISTER_CC_FLAG ps_r2_ls_flags, 10000h, "r__bloodmarks"
REGISTER_CC_FLAG fake_flag, 40000h, "r2_soft_water"
REGISTER_CC_FLAG fake_flag, 80000h, "r2_soft_particles"
REGISTER_CC_FLAG fake_flag, 100000h, "r2_color_grading"
REGISTER_CC_FLAG fake_flag, 800000h, "r2_float32"
REGISTER_CC_FLAG fake_flag, 1000000h, "r2_detail_bump"

REGISTER_CC_FLAG fake_flag2, 8h, "r2_rain_drops"

REGISTER_CC_FLOAT mblur_amount, "r2_mblur_amount", 0.0, 1.0
REGISTER_CC_TOKEN render_mode_token, "r2_render_mode", render_mode

	; делаем вырезанное
	pop		edi
	pop		esi
	pop		ebp
	pop		ebx
	add		esp, 18h
	retn

; дефолтные значения параметров (int)
render_mode dd 0
aa_mode dd 0
aa_quality dd 0
mblur_amount dd 0.0
det_rad_value dd 31h
sunshafts_quality dd 0
ssao_quality dd 0
ssao_mode dd 0
soft_shadows dd 0
steep_parallax dd 0
dynamic_dof dd 0
dof_flags dd 0
posteffect_flags dd 0

; общий токен
aOff db "qt_off", 0
aLow db "qt_low", 0
aMid db "qt_medium", 0
aHigh db "qt_high", 0
aExtreme db "qt_extreme", 0
quality_token STRUCT
	dd offset aOff
	dd 0
	dd offset aLow
	dd 1
	dd offset aMid
	dd 2
	dd offset aHigh
	dd 3
	dd offset aExtreme
	dd 4
	db 8 dup (0)
quality_token ENDS

aNormal db "Normal", 0
aThermal db "Thermal", 0
rm_token STRUCT
	dd offset aNormal
	dd 0
	dd offset aThermal
	dd 1
	db 8 dup (0)
rm_token ENDS

render_mode_token rm_token <>

sunshafts_quality_token quality_token <>
ssao_quality_token quality_token <>
aa_quality_token quality_token <>
soft_shadows_token quality_token <>
steep_parallax_token quality_token <>
dynamic_dof_token quality_token <>

; токен для ssao
aSSDO db "ssdo", 0
aHBAO db "hbao", 0
ssao_token STRUCT
	dd offset aSSDO
	dd 0
	dd offset aHBAO
	dd 1
	db 8 dup (0)
ssao_token ENDS

ssao_mode_token ssao_token <>

; токен для ssao
aFXAA db "fxaa", 0
aSMAA db "smaa", 0
aa_token STRUCT
	dd offset aFXAA
	dd 0
	dd offset aSMAA
	dd 1
	db 8 dup (0)
aa_token ENDS

aa_mode_token aa_token <>
fake_flag dd 0
fake_flag2 dd 0