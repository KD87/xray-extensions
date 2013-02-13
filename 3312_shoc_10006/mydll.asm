.686
.XMM

.model flat,  C

include addr.inc
_CODE segment public 'CODE' use32 ;ALIGN(0)
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

PRINT MACRO msg_txt:REQ
LOCAL lab1_
LOCAL a_msg
	jmp     lab1_
a_msg db msg_txt, 0
lab1_:
	pusha
	push    offset a_msg
	call    Msg
	add     esp, 04h
	popa
ENDM

PRINT_UINT MACRO fmt_txt:REQ, val:REQ
LOCAL lab1_
LOCAL a_msg
	jmp     lab1_
a_msg db fmt_txt, 0
lab1_:
	pusha
	push    val
	push    offset a_msg
	call    Msg
	add     esp, 08h
	popa
ENDM

PRINT_FLOAT MACRO fmt_txt:REQ, val:REQ
LOCAL lab1_
LOCAL a_msg
LOCAL value1
	jmp     lab1_
a_msg db fmt_txt, 0
value1 dd ?
lab1_:
	pusha
	mov     [value1], val
	sub     esp, 8
	fld     [value1]
	fstp    QWORD ptr [esp]
	push    offset a_msg
	call    Msg
	add     esp, 0Ch
	
	popa
ENDM

; позиция в том месте, где в целевой DLL начинается наша секция
org sec1_sec2_dist

include types.asm

include actor_input_fix.asm
include global_ns_fix.asm
include global_ns_fix2.asm
include game_object_fix.asm
include game_object_castings.asm
include actor_hit_callback.asm
include hit_memory_manager_fix.asm
include actor_inventory_callbacks.asm
include alife_simulator_fix.asm
include weapon_fix.asm
include console_commands_reg_fix.asm
include CInventory_fix.asm
include inventory_box_fix.asm
include	level_ns_fix.asm
include car_fix.asm
include cuiwindow_fix.asm
include ctime_fix.asm
include matrix_fix.asm
include monster_movement_manager_fix.asm
include alife_smart_terrain_task_fix.asm
include debug_fixes.asm
include cuitradewnd_fix.asm
include actor_input_fix_pda.asm
include cuipdawnd_fix.asm
include cuistatic_add.asm
include misc.asm
include inventory_item_fix.asm
include projector_fix.asm
include ammo_on_belt_fix.asm
include weapon_stat_mgun_fix.asm
include stalker_fix.asm
include hanging_lamp_fix.asm
include CEffectorZoomInertion_fix.asm
include new_engine_slots.asm
include car_camera_fix.asm
include actor_shadow_fix.asm

_CODE ENDS

end LibMain

