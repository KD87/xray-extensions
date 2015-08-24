.686
.XMM

.model flat,  C

include addr.inc

_CODE segment byte public 'CODE' use32
	assume cs:_CODE
	assume ds:_CODE
; заглушка дл€ линковшика
LibMain proc STDCALL instance:DWORD,reason:DWORD,unused:DWORD 
    ret
LibMain ENDP

; вставки из целевой либы
include xrrender_r2_stubs.asm

; позици€ в том месте, где в целевой DLL начинаетс€ наша секци€
org sec1_sec2_dist

include misc.asm
include types.asm
include detail_radius_fix.asm	; радиус отрисовки травы
include detail_density_fix.asm	; плотность травы
include sun_details_fix.asm		; тени травы
include rt_position_fix.asm		; очистка rt_Position каждый кадр
include hud_shader_fix.asm		; добавление самосвечени€ на худ
include console_comm_reg_macro.asm ; макросы дл€ добавлени€ консольных команд
include console_comm.asm		; добавление консольных команд
include light_fix.asm			; фикс виртуального радиуса ламп
include bloodmarks.asm			; восстановление блудмарков
include shader_defines_macro.asm	; макросы дл€ установки дефайнов дл€ шейдеров
include shader_defines.asm		; установка дефайнов дл€ шейдеров
include	register_sampler_macro.asm	; макросы регистрации семплеров дл€ шейдера
include	register_sampler_combine.asm	; регистраци€ семплеров дл€ CBlender_combine
include	register_sampler_particle.asm	; регистраци€ семплеров дл€ CBlender_Particle
include noise_texture.asm		; шумова€ текстура высокого разрешени€
include mip_bias_fix.asm
include detail_bump.asm
include actor_shadow_fix.asm
include smap_size_macro.asm
include new_smap_sizes.asm
include detail_blink_fix.asm
include sun_near_fix.asm
include hemi_update_fix.asm

_code ENDS

end LibMain

