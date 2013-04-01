.686
.XMM

.model flat,  C

include addr.inc

_code segment byte public 'CODE' use32
	assume cs:_code
	assume ds:_code
; заглушка для линковшика
LibMain proc STDCALL instance:DWORD,reason:DWORD,unused:DWORD 
    ret
LibMain ENDP

; вставки из целевой либы
include xr_3da_stubs.asm 

; позиция в том месте, где в целевой DLL начинается наша секция
org sec1_sec2_dist

;include empty.asm ; затычка для патчера
include misc.asm
include shaders_mapping_macro.asm
include shaders_mapping.asm
include console_comm_reg_macro.asm
include console_comm.asm
include zoom_check.asm
include loadscreen_fix.asm
include weather_parameters.asm
include rain_timer.asm
include debug_fixes.asm
include load_ogse.asm
include envdescriptor_fix.asm

_code ENDS

end LibMain

