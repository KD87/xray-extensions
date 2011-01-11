.686
.XMM

.model flat,  C

include addr.inc

_code segment public 'CODE' use32
	assume cs:_code
	assume ds:_code
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
include actor_input_fix.asm
include actor_hit_callback.asm
include game_object_fix.asm
include cuiwindow_fix.asm
_code ENDS

end LibMain

