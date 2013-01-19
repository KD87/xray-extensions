.686
.XMM

.model flat,  C

include addr.inc

_CODE segment byte public 'CODE' use32
	assume cs:_CODE
	assume ds:_CODE
; заглушка для линковшика
LibMain proc STDCALL instance:DWORD,reason:DWORD,unused:DWORD 
    ret
LibMain ENDP

; вставки из целевой либы
include xrrender_r2_stubs.asm

; позиция в том месте, где в целевой DLL начинается наша секция
org sec1_sec2_dist

include misc.asm
include types.asm
include detail_radius_fix.asm	; радиус отрисовки травы
include detail_density_fix.asm	; плотность травы
include sun_details_fix.asm		; тени травы
include rt_position_fix.asm		; очистка rt_Position каждый кадр
include hud_shader_fix.asm		; добавление самосвечения на худ
include console_comm_reg_macro.asm ; макросы для добавления консольных команд
include console_comm.asm		; добавление консольных команд
include light_fix.asm			; фикс виртуального радиуса ламп
include bloodmarks.asm			; восстановление блудмарков
include shader_defines_macro.asm	; макросы для установки дефайнов для шейдеров
include shader_defines.asm		; установка дефайнов для шейдеров
include	register_sampler_macro.asm	; макросы регистрации семплеров для шейдера
include	register_sampler_combine.asm	; регистрация семплеров для s_combine
include	ikvision_blender.asm		; блендер ик-видения
include noise_texture.asm		; шумовая текстура высокого разрешения
	
_code ENDS

end LibMain

