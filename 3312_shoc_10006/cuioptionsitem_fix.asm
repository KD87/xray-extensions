CHECK_VID_RESTART_OPTION MACRO opt_name_str:REQ
LOCAL no_restart
LOCAL lab1
LOCAL opt_name
	jmp     lab1
opt_name db opt_name_str, 0
lab1:
	mov     esi, offset opt_name
	;PRINT_UINT "opt: %s", esi
	mov     ecx, edi
	call    str_cmp
	test    al, al
	;jnz     vid_restart
	jz     no_restart
	;PRINT "need restart"
	jmp     vid_restart
no_restart:
ENDM


CUIOptionsItem__SaveValue_fix proc
	mov     eax, [ecx+18h]
	push    ebx
	push    esi
	push    edi
	lea     edi, [ecx+4]
CHECK_VID_RESTART_OPTION "vid_mode"
CHECK_VID_RESTART_OPTION "_preset"
CHECK_VID_RESTART_OPTION "rs_fullscreen"
CHECK_VID_RESTART_OPTION "r__supersample"
CHECK_VID_RESTART_OPTION "rs_refresh_60hz"
CHECK_VID_RESTART_OPTION "rs_no_v_sync"
CHECK_VID_RESTART_OPTION "texture_lod"
ifdef OGSE_BUILD
	CHECK_VID_RESTART_OPTION "r2_mblur"
	CHECK_VID_RESTART_OPTION "r2_aa"
	CHECK_VID_RESTART_OPTION "r2_dof_quality"
	CHECK_VID_RESTART_OPTION "r2_sunshafts"
	CHECK_VID_RESTART_OPTION "r2_sunshafts_mode"
	CHECK_VID_RESTART_OPTION "r2_ssao"
	CHECK_VID_RESTART_OPTION "r2_dof"
	CHECK_VID_RESTART_OPTION "r2_dof_zoom"
	CHECK_VID_RESTART_OPTION "r2_dof_reload"
	CHECK_VID_RESTART_OPTION "r__detail_radius"
	CHECK_VID_RESTART_OPTION "r__detail_density"
	CHECK_VID_RESTART_OPTION "r2_lens_flare"
	CHECK_VID_RESTART_OPTION "r2_lens_dirt"
	CHECK_VID_RESTART_OPTION "r2_volumetric_lights"
	CHECK_VID_RESTART_OPTION "r2_lights_shadow_fade"
	CHECK_VID_RESTART_OPTION "r2_ao"
	CHECK_VID_RESTART_OPTION "r2_ao_intensity"
endif
	jmp no_vid_restart
CUIOptionsItem__SaveValue_fix endp
