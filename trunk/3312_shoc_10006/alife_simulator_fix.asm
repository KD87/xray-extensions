include alife_simulator_reg_macro.asm

ALIFE_SIM_REGISTER_TELEPORT register_teleport_object, "teleport_object"

alife_simulator_fix proc
	; делаем то, что вырезали
	call    register__create_with_parent
	; делаем то, что хотели
	ALIFE_SIM_PERFORM_EXPORT__TELEPORT register_teleport_object, CALifeSimulator__TeleportObject
	pusha
	push offset alife_sim_reg_msg
	call Msg
	pop eax
	popa
	; идём обратно
	jmp back_from_alife_simulator_fix
alife_simulator_fix endp

alife_sim_reg_msg db "alife simulator fix",0


CALifeSimulator__TeleportObject proc
 ;*(_DWORD *)(*(_DWORD *)(this + 12) + 4) + this + 12,
this_           = dword ptr  8
section_        = dword ptr  0Ch
position        = dword ptr  10h
level_vertex_id = dword ptr  14h
game_vertex_id  = dword ptr  18h
parent_id       = dword ptr  1Ch

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	
	pusha
	
	mov eax, [ebp+position]
	push eax
	mov eax, [ebp+level_vertex_id]
	push eax
	mov eax, [ebp+game_vertex_id]
	push eax
	mov eax, [ebp+parent_id]
	push eax
	
	mov     esi, [ebp+this_]

	call CALifeUpdateManager__teleport_object ;(int this<esi>, unsigned __int16 id, int game_vertex_id, int level_vertex_id, int position)
	
	popa
	xor eax, eax

	mov     esp, ebp
	pop     ebp
	retn

CALifeSimulator__TeleportObject endp

parent_id_fmt db "parent_id=%d",0
game_vertex_id_fmt  db "game_vertex_id=%d",0
level_vertex_id_fmt  db "level_vertex_id=%d",0
