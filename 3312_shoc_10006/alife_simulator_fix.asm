include alife_simulator_reg_macro.asm

ALIFE_SIM_REGISTER_TELEPORT register_teleport_object, "teleport_object"
ALIFE_SIM_REGISTER_TELEPORT register_assign_story_id, "assign_story_id"

alife_simulator_fix proc
	; делаем то, что вырезали
	call    register__create_with_parent
	; делаем то, что хотели
	ALIFE_SIM_PERFORM_EXPORT__TELEPORT register_teleport_object, CALifeSimulator__TeleportObject
	ALIFE_SIM_PERFORM_EXPORT__TELEPORT register_assign_story_id, CALifeSimulator__RegisterStoryObject
	;pusha
	;push offset alife_sim_reg_msg
	;call Msg
	;pop eax
	;popa
	; идём обратно
	jmp back_from_alife_simulator_fix
alife_simulator_fix endp

;alife_sim_reg_msg db "alife simulator fix",0


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

;parent_id_fmt db "parent_id=%d",0
;game_vertex_id_fmt  db "game_vertex_id=%d",0
;level_vertex_id_fmt  db "level_vertex_id=%d",0


release_fix proc
	; делаем то, что вырезали
	test    esi, esi
	; если указатель не нулевой, то идём обратно
	jnz     loc_1004C3DA
	; иначе крашим игру
	mov     ecx, ds:Debug ; this
	push    offset ignore_always
	push    offset aCALifeSimulator__release 
	push    666             ; line
	push    offset aHZ ; 
	push    offset aObjectNotDefined ; 
	call    ds:xrDebug__fail
aHZ db "deep deep in space",0
release_fix endp
;ignore_always1 db 0
aCALifeSimulator__release db "CALifeSimulator__release",0
aObjectNotDefined db "Object to release is a zero pointer",0

ALIGN 8
CALifeSimulator__RegisterStoryObject proc
this_     = dword ptr  8
dummy1_str= dword ptr  0Ch
dummy2    = dword ptr  10h
object_id = dword ptr  14h
story_id  = dword ptr  18h
dummy3    = dword ptr  1Ch
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    ebx
	
	mov     eax, [ebp+object_id]
	push    eax
	mov     eax, [ebp+this_]
	push    eax
	call    object_by_id
	add     esp, 8
	test    eax, eax
	jz      exit_fail ; eax = server_object
	push    eax             ; object
	mov     ebx, [ebp+story_id] ; story_id
	mov     dword ptr [eax+0B8h], ebx ; прописываем объекту story_id
	push    ebx
	mov     eax, [ebp+this_] ; alife_simulator
	mov     eax, [eax+294h+20h]
	push    eax             ; this == story_registry
	call    CALifeStoryRegistry__add
exit_fail:
	xor eax, eax
	pop     ebx
	mov     esp, ebp
	pop     ebp
	retn
CALifeSimulator__RegisterStoryObject endp

