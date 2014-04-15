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
include xrcore_stubs.asm

; позиция в том месте, где в целевой DLL начинается наша секция
org sec1_sec2_dist

include common_macro.asm
include texture_loading_fix.asm
	
_CODE ENDS

end LibMain

