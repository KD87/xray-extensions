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
include hud_shader_fix.asm		; добавление самосвечения на худ
include light_fix.asm			; фикс виртуального радиуса ламп
include actor_shadow_fix.asm
include load_ogse.asm
include override_methods.asm
include dllmain.asm

_code ENDS

end LibMain

