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
include xrgame_stubs.asm

; позиция в том месте, где в целевой DLL начинается наша секция
org sec1_sec2_dist

include global_ns_fix.asm
include level_ns_fix.asm
include cuistatic_fix.asm
include actor_hit_callback.asm
include console_fix.asm
include pda_fix.asm
include car_fix.asm
include level_input_fix.asm
include cuilistbox_fix.asm
_CODE ENDS

end LibMain

