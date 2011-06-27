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
include global_ns_fix2.asm
include game_object_fix.asm
include actor_hit_callback.asm
include hit_memory_manager_fix.asm
include actor_inventory_callbacks.asm
include alife_simulator_fix.asm
include weapon_fix.asm
include console_commands_reg_fix.asm
include CInventory_fix.asm
include inventory_box_fix.asm
include	level_ns_fix.asm

_CODE ENDS

end LibMain

