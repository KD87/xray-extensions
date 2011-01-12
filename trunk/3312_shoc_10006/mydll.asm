.686
.XMM

.model flat,  C

include addr.inc

_CODE segment public 'CODE' use32
	assume cs:_CODE
	assume ds:_CODE
; заглушка для линковшика
LibMain proc STDCALL instance:DWORD,reason:DWORD,unused:DWORD 
    ret
LibMain ENDP

; вставки из целевой либы
include xrgame_stubs.asm

ALIGN_8 MACRO
	;ALIGN 8
ENDM



; позиция в том месте, где в целевой DLL начинается наша секция
org sec1_sec2_dist

include actor_input_fix.asm
include global_ns_fix.asm
include game_object_fix.asm

_CODE ENDS

end LibMain

