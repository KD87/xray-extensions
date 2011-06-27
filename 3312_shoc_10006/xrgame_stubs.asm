;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************
;.text:103B8CC0 ui_core__get_xml_name proc near     

;.text:103B8DE8                 mov     [eax+4], dl
;.text:103B8DEB loc_103B8DEB:  
org 103B8DEBh - shift
	jmp addr_103B8DFF
;.text:103B8DEB                 lea     eax, [esp+414h+Str]
;.text:103B8DEF                 push    eax
;.text:103B8DF0                 push    esi
;.text:103B8DF1                 push    offset a169Get_xml_nam ; "[16-9] get_xml_name for[%s] returns [%s"...
;.text:103B8DF6                 call    ds:?Msg@@YAXPBDZZ ; Msg(char const *,...)
;.text:103B8DFC                 add     esp, 0Ch
org 103B8DFFh - shift
addr_103B8DFF:
;.text:103B8DFF                 pop     edi
;.text:103B8E00





;.text:10355D40 xrServer__Process_event_destroy proc near 

;.text:10355D7F                 mov     ecx, ds:?Device@@3VCRenderDevice@@A ; CRenderDevice Device
org 10355D85h - shift
	jmp addr_10355D9B
;.text:10355D85                 mov     edx, [ecx+0F4h]
;.text:10355D8B                 push    edx
;.text:10355D8C                 push    eax
;.text:10355D8D                 push    offset aSvDestroyObjec ; "sv destroy object %s [%d]"
;.text:10355D92                 call    ds:?Msg@@YAXPBDZZ ; Msg(char const *,...)
;.text:10355D98                 add     esp, 0Ch
org 10355D9Bh - shift
addr_10355D9B:
;.text:10355D9B                 cmp     [esp+4060h+var_4024], ebx





;.text:10356400 xrServer__Process_event_reject proc near 

;.text:10356467                 mov     ecx, ds:?Device@@3VCRenderDevice@@A ; CRenderDevice Device
org 1035646Dh - shift
	jmp     addr_10356481
;.text:1035646D                 mov     edx, [ecx+0F4h]
;.text:10356473                 push    edx
;.text:10356474                 push    ebx
;.text:10356475                 push    eax
;.text:10356476                 push    offset aSvReject_Id_pa ; "sv reject. id_parent %s id_entity %s [%"...
;.text:1035647B                 call    ds:?Msg@@YAXPBDZZ ; Msg(char const *,...)
org 10356481h - shift
addr_10356481:
	mov    ebx, 10h
	nop
	nop
	nop
;.text:10356481                 mov     ebx, 10h
;.text:10356486                 add     esp, 10h
;.text:10356489                 cmp     [esp+48h+var_20], ebx




;.text:10356140 xrServer__Process_event_ownership proc near 

;.text:103561C3 loc_103561C3:                           ; CODE XREF: xrServer__Process_event_ownership+7Ej
;.text:103561C3                 mov     ecx, ds:?Device@@3VCRenderDevice@@A ; CRenderDevice Device
org 103561C9h - shift
	jmp     addr_103561DD
;.text:103561C9                 mov     edx, [ecx+0F4h]
;.text:103561CF                 push    edx
;.text:103561D0                 push    esi
;.text:103561D1                 push    eax
;.text:103561D2                 push    offset aSvOwnershipId_ ; "sv ownership id_parent %s id_entity %s "...
;.text:103561D7                 call    ds:?Msg@@YAXPBDZZ ; Msg(char const *,...)
org 103561DDh - shift
addr_103561DD:
	mov    esi, 10h
	nop
	nop
	nop
;.text:103561DD                 mov     esi, 10h
;.text:103561E2                 add     esp, 10h
;.text:103561E5                 cmp     [esp+6Ch+var_3C], esi



org 101AD260h - shift
get_object_by_id:
; добавляем колбек на взятие в инвентарный ящик

;.text:102861A0 ; void __thiscall CInventoryBox__OnEvent(int this, int packet, __int16 type)

org 102862E0h - shift
	jmp inventory_box_fix
;.text:102862E0                 call    xr_vector_u16___push_back
;.text:102862E5                 push    0               ; bool
;.text:102862E7                 push    ebx             ; obj
;.text:102862E8                 mov     ecx, esi        ; this
;.text:102862EA                 call    ds:?H_SetParent@CObject@@QAEPAV1@PAV1@_N@Z ; CObject::H_SetParent(CObject *,bool)
;.text:102862F0                 push    0
;.text:102862F2                 mov     ecx, esi
;.text:102862F4                 call    ds:?setVisible@CObject@@QAEXH@Z ; CObject::setVisible(int)
;.text:102862FA                 push    0
;.text:102862FC                 mov     ecx, esi
;.text:102862FE                 call    ds:?setEnabled@CObject@@QAEXH@Z ; CObject::setEnabled(int)
org 10286304h - shift
back_from_inventory_box_fix:
;.text:10286304 loc_10286304:                           ; CODE XREF: CInventoryBox__OnEvent+23j


org 10011380h - shift
xr_vector_u16___push_back: ; запись идентификатора предмета в список предметов инвентарного ящика

org 1042BF40h - shift
CUIGameSP__StartCarBody:

org 1014C760h - shift
register__run_talk_dialog: ; функция регистрации метода game_object спрототипом void fun(game_object*)

; попытка вылечить вылет при переносе предмета в багажник машины

;.text:10206590 CInventory__CanTakeItem proc near       ; CODE XREF: sub_100F7960+8Ap
;.text:102065B3                 test    al, al
;.text:102065B5                 jz      short loc_102065A3
org 102065B7h - shift
	nop
	nop
	nop
	nop
	jmp loc_1020663C_return_true
;.text:102065B7                 mov     eax, [esi+8]
;.text:102065BA                 mov     ecx, [esi+0Ch]
;.text:102065BD                 cmp     eax, ecx
;.text:102065BF                 jz      short loc_102065E9
;.text:102065C1                 mov     edx, [edi+0D4h]
;.text:102065C7                 movzx   edx, word ptr [edx+0A4h]
;.text:102065CE                 push    ebx
;.text:102065CF                 nop

org 1020663Ch - shift
loc_1020663C_return_true:
;.text:1020663C loc_1020663C:                           ; CODE XREF: CInventory__CanTakeItem+78j
;.text:1020663C                 mov     al, 1
;.text:1020663E                 pop     ecx
;.text:1020663F                 retn
;.text:1020663F CInventory__CanTakeItem endp



; в конструкторе сразу обнулить m_pOwner для дальнейшей определённости

;.text:102041A0 ; void __usercall CInventory__CInventory(int this<esi>)

;.text:10204328                 movss   dword ptr [esi+6Ch], xmm0
org 1020432Dh - shift
	jmp CInventory__CInventory_fix
;.text:1020432D                 mov     eax, esi
;.text:1020432F                 pop     ebx
;.text:10204330                 add     esp, 110h
;.text:10204336                 retn

; в CInventory__Take проверить m_pOwner на нулевое значение и сделать обход ветки, его использующей

;.text:102044F0 CInventory__Take proc near
;
;.text:1020469C                 call    CInventory__Ruck
;.text:102046A1                 jmp     short loc_102046B1
;.text:102046A3 ; ---------------------------------------------------------------------------
;
;.text:102046B1 loc_102046B1:                           ; CODE XREF: CInventory__Take+1A7j
;.text:102046B1                                         ; CInventory__Take+1B1j
org 102046B1h - shift
	jmp CInventory__Take_fix
;.text:102046B1                 mov     ecx, [ebx+60h]
;.text:102046B4                 mov     eax, [ecx]
;.text:102046B6                 mov     edx, [eax+0B4h]
;.text:102046BC                 push    ebp
;.text:102046BD                 call    edx
org 102046BFh - shift
back_from_CInventory__Take_fix:
;.text:102046BF                 mov     edi, ebx        ; EDI
;.text:102046C1                 call    CInventory__CalcTotalWeight

; в CInventory__Ruck сделать проверку 

;.text:10204D90 ; char __userpurge CInventory__Ruck<al>(int this<esi>, int item)
;.text:10204ED1                 mov     [esi+78h], ecx
org 10204ED4h - shift
	jmp CInventory__Ruck_fix
;.text:10204ED4                 mov     ecx, [esi+60h]
;.text:10204ED7                 mov     eax, [ebp+98h]
;.text:10204EDD                 mov     edx, [ecx]
;.text:10204EDF                 mov     edx, [edx+0BCh]
;.text:10204EE5                 push    eax
;.text:10204EE6                 push    ebp
;.text:10204EE7                 call    edx
org 10204EE9h - shift
back_from_CInventory__Ruck_fix:
;.text:10204EE9                 mov     dword ptr [ebp+98h], 3

; аналогично в CInventory__DropItem

;.text:102046F0 CInventory__DropItem proc near

;.text:10204A57 loc_10204A57:
org 10204A57h - shift
	jmp CInventory__DropItem_fix
;.text:10204A57                 mov     ecx, [esi+60h]
;.text:10204A5A                 mov     edx, [ecx]
;.text:10204A5C                 push    eax
;.text:10204A5D                 mov     eax, [edx+0C4h]
;.text:10204A63                 call    eax
org 10204A65h - shift
back_from_CInventory__DropItem_fix:
;.text:10204A65                 mov     edi, esi        ; EDI
;.text:10204A67                 call    CInventory__CalcTotalWeight






;.text:10289420 CCC_RegisterCommands proc near          ; CODE XREF: DllMain(x,x,x)+9p
; ...
;.text:1028E30C                 call    esi ; CConsole::AddCommand(IConsole_Command *) ; CConsole::AddCommand(IConsole_Command *)
org 1028E30Eh - shift
	jmp add_console_commands_fix ; возвращаться сюда не будем, прямо там сделаем возврат из функции
;.text:1028E30E                 pop     edi
;.text:1028E30F                 pop     esi
;.text:1028E310                 pop     ebx
;.text:1028E311                 retn



org 10173415h - shift
register_gs__bool__void: ; регистрация в глобальном пространстве имён функции с прототипом bool fun(void)

;.text:102D5B12                 movss   xmm0, [ebp+time_factor]
org 102D5B17h - shift
	jmp time_fix_jmp_label
;.text:102D5B17                 mov     [edi+8], eax
;.text:102D5B1A                 mov     [edi+0Ch], edx
;.text:102D5B1D                 mov     edx, ds:?Device@@3VCRenderDevice@@A ; CRenderDevice Device
;.text:102D5B23                 mov     eax, [edx+204h]
;.text:102D5B29                 mov     [edi+18h], eax
org 102D5B2Ch - shift
time_fix_jmp_label:
;.text:102D5B2C                 movss   dword ptr [edi+10h], xmm0




; дополнительные врезки для расширения глобального пространства имён
org 10149CA2h - shift
	jmp global_space_ext2
;.text:10149CA2                 call    register__gs_sell_condition__fl_fl
;.text:10149CA7                 pop     ecx
;.text:10149CA8                 pop     ecx
org 10149CA9h - shift
back_from_global_space_ext2:
;.text:10149CA9                 mov     eax, esp
;.text:10149CAB                 push    offset sss__inifile_string
;.text:10149CB0                 push    esi
;.text:10149CB1                 push    eax
;.text:10149CB2                 call    register__gs_show_condition

org 10149D24h - shift
	jmp global_space_ext2_additional
;.text:10149D24                 mov     ecx, eax
;.text:10149D26                 call    esi ; luabind::scope::operator,(luabind::scope) ; luabind::scope::operator,(luabind::scope)
;.text:10149D28                 mov     ecx, eax
;.text:10149D2A                 call    esi ; luabind::scope::operator,(luabind::scope) ; luabind::scope::operator,(luabind::scope)
org 10149D2Ch - shift
back_from_global_space_ext2_additional:
;.text:10149D2C                 mov     ecx, eax
;.text:10149D2E                 call    esi ; luabind::scope::operator,(luabind::scope) ; luabind::scope::operator,(luabind::scope)



; убираем кривую смену визуала при попадании костюма в рюкзак. Это будет делаться скриптом

;.text:1024C290 ; void __thiscall CCustomOutfit__OnMoveToRuck(int this)
org 1024C290h - shift
	retn ; вставить в список врезок. Длина команды == 1 байт
;.text:1024C290                 push    ecx
;.text:1024C291                 push    esi



org 1014C880h - shift
register__set_tip_text:

org 1014CCE0h - shift
register__string_void:

; вставки для коррекции скриптового изменения FOV
;.text:101DE710 ; void __thiscall CActor__IR_OnMouseMove(int a1, int d_x, int d_y)
;...
;.text:101DE769                 mov     edx, ds:?psMouseSensScale@@3MA ; float psMouseSensScale
org 101DE76Fh - shift
	fdiv    ds:g_fov
;.text:101DE76F                 fmul    ds:_1_fov
;.text:101DE775                 mov     eax, ds:?psMouseSens@@3MA ; float psMouseSens

;.text:1023B208                 movss   xmm0, dword ptr [esi+70h]
org 1023B20Dh - shift
	divss   xmm0, ds:g_fov
;.text:1023B20D                 mulss   xmm0, ds:_1_fov
;.text:1023B215                 mov     ecx, ds:?psMouseSensScale@@3MA ; float psMouseSensScale

;.text:10274018                 movss   xmm0, dword ptr [esi+70h]
org 1027401Dh - shift
	divss   xmm0, ds:g_fov
;.text:1027401D                 mulss   xmm0, ds:_1_fov
;.text:10274025                 mov     ecx, ds:?psMouseSensScale@@3MA ; float psMouseSensScale

;.text:10287823                 movss   xmm0, dword ptr [edx+70h]
org 10287828h - shift
	divss   xmm0, ds:g_fov
;.text:10287828                 mulss   xmm0, ds:_1_fov
;.text:10287830                 mulss   xmm0, dword ptr [eax]





; фрагмент функции CWeapon__UpdateAddonsVisibility
org 1021CA2Fh - shift
	jmp UpdateAddonsVisibility_fix
;.text:1021CA2F                 mov     ecx, esi ; <== это было
;.text:1021CA31                 call    ds:?CalculateBones_Invalidate@CKinematics@@QAEXXZ ; CKinematics::CalculateBones_Invalidate(void)
org 1021CA37h - shift
back_from_UpdateAddonsVisibility_fix:
;.text:1021CA37                 mov     eax, [esi]
;.text:1021CA39                 mov     edx, [eax+40h]
;.text:1021CA3C                 push    0
;.text:1021CA3E                 mov     ecx, esi
;.text:1021CA40                 call    edx
;.text:1021CA42                 pop     esi
;.text:1021CA43                 pop     ebp
;.text:1021CA44                 pop     ebx
;.text:1021CA45                 retn
;.text:1021CA45 CWeapon__UpdateAddonsVisibility endp

;org 10458970h - shift
;CKinematics__CalculateBones_Invalidate:

org 100F6B60h - shift
script_callback__void: ; this - в регистре eax. Аргументов нет

org 1006E8E0h - shift
CALifeUpdateManager__teleport_object: ;(int this<esi>, unsigned __int16 id, int game_vertex_id, int level_vertex_id, int position)


; фрагмент функции регистрации класса alife_simulator
; void __cdecl CALifeSimulator__script_register(int lua_state)

;.text:1004C9A6                 mov     [ebp+var_8], offset create_with_parent
;.text:1004C9AD                 call    register__create_with_parent ; <== было
org 1004C9ADh - shift
	jmp alife_simulator_fix
back_from_alife_simulator_fix:
;.text:1004C9B2                 mov     ecx, eax


org 1004E602h - shift
register__create_with_parent: ; функция регистрации в классе alife_simulator метода
; create(string <имя секции объекта>, vector* position, int level_vertex_id, int game_vertex_id, int parent_id)


org 1045094Ch - shift
__RTDynamicCast:

org 1014D690h - shift
register__remove_sound: ;  ; регистрация метода game_object с прототипом void fun(int)


org 10158CD0h - shift
register_general_goodwill: ; регистрация метода game_object с прототипом int fun(game_object*)

org 10206310h - shift 
CInventory__InBelt: ; int item<eax>, int this<ecx>
org 102062C0h - shift
CInventory__InSlot: ; int this<ebx>, int item<edi>

org 10206390h - shift
CInventory__CanPutInSlot: ; this<ebx>, int item<esi>
org 10206350h - shift
CInventory__CanPutInRuck: ; == ! CInventory__InRuck ; int item<eax>, int this<ecx>
org 10206410h
CInventory__CanPutInBelt: ; item<edi>, int this<esi>


org 10205EC0h - shift
CInventory__CalcTotalWeight:


org 10204D90h - shift
CInventory__Ruck: ; ??????????????????????????
org 10204BE0h - shift
CInventory__Belt: ; this<eax>, int item <stack>
org 10204A90h - shift
CInventory__Slot: ; item<eax>, this<ecx>, bool activate <stack>



org 101CA2F0h - shift
script_use_callback:


;CInventory__Belt
;.text:10204D6F                 call    ds:?processing_activate@CObject@@QAEXXZ ; CObject::processing_activate(void)
org 10204D75h - shift
	jmp on_belt_callback
;.text:10204D75                 pop     edi
;.text:10204D76                 pop     esi
;.text:10204D77                 pop     ebp
;.text:10204D78                 mov     al, 1
;.text:10204D7A                 pop     ebx
;.text:10204D7B                 add     esp, 8
;.text:10204D7E                 retn    4

;CInventory__Ruck
;.text:10204F0D                 call    ds:?processing_deactivate@CObject@@QAEXXZ ; CObject::processing_deactivate(void)
org 10204F13h - shift
	jmp on_ruck_callback
;.text:10204F13                 pop     edi
;.text:10204F14                 pop     ebp
;.text:10204F15                 mov     al, 1
;.text:10204F17                 pop     ebx
;.text:10204F18                 add     esp, 0Ch
;.text:10204F1B                 retn    4

;CInventory__Slot
;.text:10204BC9                 call    ds:?processing_activate@CObject@@QAEXXZ ; CObject::processing_activate(void)
org 10204BCFh - shift
	jmp on_slot_callback
;.text:10204BCF                 pop     edi
;.text:10204BD0                 pop     esi
;.text:10204BD1                 mov     al, 1
;.text:10204BD3                 pop     ebx
;.text:10204BD4                 retn    4




org 1014C2B0h - shift
register_object_count: ; функция для регистрации метода game_object с прототипом int fun(void);



;.text:101C6DC0 ; void __thiscall CActor__HitSignal(int this, float perc, void *dir, int who, unsigned __int16 bone)
org 101C6DC0h - shift
	jmp CActor_HitSignal_ext
;.text:101C6DC0                 sub     esp, 0Ch
;.text:101C6DC3                 push    edi
;.text:101C6DC4                 mov     edi, ecx
org 101C6DC6h - shift
back_to_CActor_HitSignal:
;.text:101C6DC6                 mov     eax, [edi+1B8h]
;.text:101C6DCC                 movss   xmm0, dword ptr [eax+4]
;.text:101C6DD1                 comiss  xmm0, ds:float_10459F94
;.text:101C6DD8                 jbe     loc_101C7298



; void __userpurge CHitMemoryManager__add3(int ebx0<ebx>, int entity)
org 100138F0h - shift
	jmp CHitMemoryManager__add3_fix
;.text:100138F0                 sub     esp, 0Ch
;.text:100138F3                 xorps   xmm0, xmm0
;.text:100138F6                 fldz
org 100138F8h - shift
back_to_CHitMemoryManager__add3:
;.text:100138F8                 xor     eax, eax
;.text:100138FA                 push    eax             ; a5



; миниправка функции get_rank на предмет блокировки сообщения "'cannot find rank for ..."
; для стволов, не прописанных в mp_ranks

;.text:10443CEC                 push    edi
;.text:10443CED                 mov     [esp+30h+var_24], 0FFFFFFFFh
org 10443CEDh - shift
	mov     dword ptr [esp+30h-24h], 0h
;.text:10443CF5                 jz      short loc_10443CFD



org 10149CF8h - shift
	;call script_register_game_object1


org 1014A580h - shift

script_register_game_object1:
	ret

; функция лога (в релизной версии ничего не делает)
org 10190080h - shift
LuaLog:
; фрагмент функции регистрации глобального пространства имён
; регистрация функций "log" "error_log"
;1019048F	push    [ebp+arg_0]
org 10190492h - shift
	jmp global_space_ext ; отсюда уходим на нашу вставку
;10190492	call    sub_10190668
back_from_global_space_ext:
;10190497	add     esp, 0Ch
;1019049A	push    offset LuaLog
;1019049F	push    offset aError_log ; "error_log"
;101904A4	push    [ebp+arg_0]
;101904A7	call    sub_10190668

org 10190668h - shift
; собственно функция, которая регистрирует глобальную скриптовую функция с прототипом void fun(char*);
; годится для любых функций такого вида
error_log_register:

; функция game_id
org 101A5520h - shift
loc_101A5520_game_id:


org 101AEE5Dh - shift
;.text:101AEE5D                 push    ecx
;.text:101AEE5E                 mov     eax, esp
;.text:101AEE60                 push    offset loc_101A5520
;.text:101AEE65                 push    offset aGame_id ; "game_id"
;.text:101AEE6A                 push    eax
org 101AEE6Bh - shift
	;jmp level_space_fix
;.text:101AEE6B                 call    sub_101AF9B1
back_from_level_space_fix:  ; сюда надо сделать переход назад
;.text:101AEE70                 pop     ecx
;.text:101AEE71                 pop     ecx
;.text:101AEE72                 mov     eax, esp

; функция, которая регистрирует фцнкцию вида int fff(void) . по идее в пространстве имён level
org 101AF9B1h - shift
game_id_register:

;==============================================================================
; ищется по ссылке на строку "li_pause_key"
;.text:101A6E50 CLevel__IR_OnKeyboardPress proc near    ; DATA XREF: .rdata:104811CCo
org 101A6E50h - shift
	jmp call_key_press_callback
;.text:101A6E50                 sub     esp, 414h
org 101A6E56h - shift
back_from_key_press_callback:
;.text:101A6E56                 push    ebx

org 101E5720h - shift
CGameObject__lua_game_object: ; аргумент this в edi


; CBaseMonster::HitSignal
; найти так: ищем комбинацию байт, соответствующую команде   "push    80200000h"
; это вот такая последовательность "68 00 00 20 80". Ищем все найденный вхождения, 
; их должно быть порядка 7-8. Теперь самое неприятное. Надо перебрать их все и найти функцию, 
; на вид похожую на уже найденные в других билдах. У меня она всегда оказывалась первой по списку,
; но понятное дело гарантий никаких. Если спросите, а как нашёл эту функцию в первый раз - не отвечу,
; ибо сам не того ведаю.
; В этой функции имеется фрагмент вызова колбека на хит. Это почти в конце. Рекомендуется к этому
; моменту уже найти адрес функции CGameObject__lua_game_object и прописать ей в IDA правильный прототип:
; void __thiscall CBaseMonster__HitSignal(int *this, float perc, void *direction, void *who, __int16 element) 
; Тогда этот фрагмент будет выглядеть как-то так:
; .text:1007E079                 mov     edx, [ebp+164h]
; .text:1007E07F                 lea     ecx, [esp+18h+who]
; .text:1007E083                 push    ecx
; .text:1007E084                 push    edx
; .text:1007E085                 mov     [esp+20h+who], 10h
; .text:1007E08D                 call    sub_101E5D60
; .text:1007E092                 mov     ebx, eax
; .text:1007E094                 mov     eax, dword ptr [esp+18h+element]
; .text:1007E098                 push    eax
; .text:1007E099                 mov     edi, esi
; .text:1007E09B                 call    CGameObject__lua_game_object
; .text:1007E0A0                 fld     [esp+1Ch+perc]
; .text:1007E0A4                 mov     ecx, [esp+1Ch+direction]
; .text:1007E0A8                 mov     edx, [ecx]
; .text:1007E0AA                 push    eax
; .text:1007E0AB                 sub     esp, 0Ch
; .text:1007E0AE                 mov     eax, esp
; .text:1007E0B0                 mov     [eax], edx
; .text:1007E0B2                 mov     edx, [ecx+4]
; .text:1007E0B5                 mov     ecx, [ecx+8]
; .text:1007E0B8                 mov     [eax+4], edx
; .text:1007E0BB                 push    ecx
; .text:1007E0BC                 mov     [eax+8], ecx
; .text:1007E0BF                 fstp    [esp+30h+var_30]
; .text:1007E0C2                 mov     edi, ebp
; .text:1007E0C4                 call    CGameObject__lua_game_object
; .text:1007E0C9                 push    eax
; .text:1007E0CA                 push    ebx
; .text:1007E0CB                 call    sub_10014CF0
; .text:1007E0D0                 test    esi, esi
; .text:1007E0D2                 jz      short loc_1007E109
; .text:1007E0D4                 mov     edx, [esi]

; здесь фрагмент перед первым CGameObject__lua_game_object - это получение объекта
; колбека. Дополнительная неприятность здесь заключается в том, что оптимизатор
; развернул вызов одной полезной функции (которую нам ещё предстоит найти) и превратил
; его в малополезную мешанину. В ЗП 1.6.02 этого к примеру нет, и там искать проще.
; Итак. Берём функцию, кторая в показанном фрагменте видна как sub_101E5D60. Запоминаем её,
; она нам тоже потребуется
org 101E5D60h - shift
CGameObject__callback_helper: ; оба аргумента в стеке

; и показываем все ссылки на неё. Среди них надо найти одну, где смещение от начала функции минимально
; что-то вроде Ch. Идём в эту функцию и видим там что-то вроде:
; .text:101E5AF0 sub_101E5AF0    proc near               ; CODE XREF: sub_10077AC0+121p
; .text:101E5AF0                                         ; sub_10077AC0+167p ...
; .text:101E5AF0
; .text:101E5AF0 arg_0           = byte ptr  4
; .text:101E5AF0
; .text:101E5AF0                 mov     edx, [ecx+164h]
; .text:101E5AF6                 lea     eax, [esp+arg_0]
; .text:101E5AFA                 push    eax
; .text:101E5AFB                 push    edx
; .text:101E5AFC                 call    sub_101E5D60
; .text:101E5B01                 retn    4
; .text:101E5B01 sub_101E5AF0    endp

; Вот эта функция нам и потребуется. Это функция CGameObject::callback()
; если присмотреться, то в ней проглядывает тот фрагмент сверху
; запоминаем её адрес:

org 101E5AF0h - shift
CGameObject__callback: ; оба аргумента в стеке

; теперь запоминаем второй адрес. Это функция собственно вызова колбека
; в вышеприведённом фрагменте это вызов после второго вызова функции CGameObject__lua_game_object
org 10014CF0h - shift
script_hit_callback: ; аргументы в стеке
; этот вызов годится для реализации колбека на хит актора, у которого почему-то разрабы 
; такого не добавили. Черти, им-то это пару строк бы стоило...

; для реализации колбека на нажатие однако удобен другой вызов, принимающий два целых
; числа, что  удобно для передачи в него кода нажатой клавиши.
; найти его несколько муторно. Сперва надо найти все ссылки на ранее найденную функцию CGameObject__callback_helper. 
; из них надо обыскать те, где смещение от начала функции примерно равно 0x42 - 0x43. Это вот такая функция:
; void __thiscall CTrade__OnPerformTrade(void *this, int money_get, int money_put)
; после правки её сигнатуры должна выглядеть как-то так:

; .text:10255330 CTrade__OnPerformTrade proc near        ; CODE XREF: sub_103BEC00+56p
; .text:10255330
; .text:10255330 var_4           = dword ptr -4
; .text:10255330 money_get       = dword ptr  4
; .text:10255330 money_put       = dword ptr  8
; .text:10255330
; .text:10255330                 push    ecx
; .text:10255331                 cmp     dword ptr [eax+1Ch], 1
; .text:10255335                 jnz     short loc_1025537E
; .text:10255337                 mov     eax, [eax+20h]
; .text:1025533A                 test    eax, eax
; .text:1025533C                 jz      short loc_10255355
; .text:1025533E                 push    0
; .text:10255340                 push    offset off_1054D518
; .text:10255345                 push    offset off_105421C8
; .text:1025534A                 push    0
; .text:1025534C                 push    eax
; .text:1025534D                 call    __RTDynamicCast
; .text:10255352                 add     esp, 14h
; .text:10255355
; .text:10255355 loc_10255355:                           ; CODE XREF: CTrade__OnPerformTrade+Cj
; .text:10255355                 mov     ecx, [esp+4+money_put]
; .text:10255359                 mov     edx, [esp+4+money_get]
; .text:1025535D                 push    ecx
; .text:1025535E                 push    edx
; .text:1025535F                 mov     edx, [eax+164h]
; .text:10255365                 lea     ecx, [esp+0Ch+var_4]
; .text:10255369                 push    ecx
; .text:1025536A                 push    edx
; .text:1025536B                 mov     [esp+14h+var_4], 3
; .text:10255373                 call    CGameObject__callback_helper
; .text:10255378                 push    eax
; .text:10255379                 call    sub_10255390
; .text:1025537E
; .text:1025537E loc_1025537E:                           ; CODE XREF: CTrade__OnPerformTrade+5j
; .text:1025537E                 pop     ecx
; .text:1025537F                 retn    8
; .text:1025537F CTrade__OnPerformTrade endp

; вызов, который следует прямо за CGameObject__callback_helper - это нужный нам вызов колбека
; принимающего два целых. Запомним его.

org 10255390h - shift
script_callback_int_int: ; this в регистре eax, два аргумента в стеке

; глобальная функция получения клиентского актора. В ЧН и ЗП ищется элементарно
; по ссылке на строку "Actor() method invokation must be only"
; в ТЧ сложнее. Ищем ссылку на строку "st_detail_list_for_%s"
; чуть дальше за этой ссылкой есть обращение к глобальной переменной. Типа такого:
; .text:103D5AD6                 push    offset aSt_detail_li_0 ; "st_detail_list_for_%s"
; .text:103D5ADB                 lea     edx, [esp+610h+var_100]
; .text:103D5AE2                 call    sub_100015C0
; .text:103D5AE7                 add     esp, 8
; .text:103D5AEA                 lea     ecx, [esp+608h+var_100]
; .text:103D5AF1                 push    ecx
; .text:103D5AF2                 mov     ecx, [edi+60h]
; .text:103D5AF5                 add     ecx, 5Ch
; .text:103D5AF8                 call    sub_103F0F40
; .text:103D5AFD                 mov     edx, dword_105602E8
; .text:103D5B03                 mov     eax, [edx+39Ch]
; .text:103D5B09                 call    sub_102034A0

; эта переменная и есть указатель на актора
; теперь вместо функции делаем просто:
; mov eax, [g_Actor]

; -------------------------------------------------------------------------------------------------
; CLevel__IR_OnKeyboardRelease
org 101A71F0h - shift
jmp call_key_release_callback
;.text:101A71F0                 push    ecx
;.text:101A71F1                 push    ebx
;.text:101A71F2                 push    ebp
;.text:101A71F3                 mov     ebp, ecx
org 101A71F5h - shift
back_from_key_release_callback:
;.text:101A71F5                 cmp     dword ptr [ebp+138h], 0
;.text:101A71FC                 jz      short loc_101A7213


; CLevel__IR_OnKeyboardHold
;.text:101A7320                 cmp     g_bDisableAllInput, 0
;.text:101A7327                 push    edi
;.text:101A7328                 mov     edi, ecx
;.text:101A732A                 jnz     loc_101A740C
org 101A7330h - shift
jmp call_key_hold_callback
;.text:101A7330                 cmp     dword ptr [edi+138h], 0
org 101A7337h - shift
back_from_key_hold_callback:
;.text:101A7337                 push    esi
;.text:101A7338                 mov     esi, [esp+8+arg_0]
;.text:101A733C                 jz      short loc_101A739A
;.text:101A733E                 mov     ecx, [edi+138h]


; CLevel__IR_OnMouseMove
;.text:101A6DB0                 cmp     g_bDisableAllInput, 0
;.text:101A6DB7                 push    esi
;.text:101A6DB8                 mov     esi, ecx
;.text:101A6DBA                 jnz     loc_101A6E4B
org 101A6DC0h - shift
jmp call_mouse_move_callback
;.text:101A6DC0                 mov     ecx, [esi+138h]
org 101A6DC6h - shift
back_from_mouse_move_callback_old:
;.text:101A6DC6                 mov     eax, [ecx]
;.text:101A6DC8                 mov     edx, [eax+18h]
;.text:101A6DCB                 push    ebx
;.text:101A6DCC                 push    edi

; void __thiscall CActor__IR_OnMouseMove(int a1, int d_x, int d_y)
org 101DE710h - shift
jmp call_mouse_move_callback
;.text:101DE710                 push    ecx
;.text:101DE711                 push    esi
;.text:101DE712                 mov     esi, ecx
;.text:101DE714                 mov     eax, [esi-194h]
org 101DE71Ah - shift
back_from_mouse_move_callback:
;.text:101DE71A                 shr     eax, 1Bh





; CLevel__IR_OnMouseWheel
;.text:101A6C90                 cmp     g_bDisableAllInput, 0
;.text:101A6C97                 push    esi
;.text:101A6C98                 mov     esi, ecx
;.text:101A6C9A                 jnz     loc_101A6D42
;.text:101A6CA0                 mov     eax, ds:?g_pGameLevel@@3PAVIGame_Level@@A ; IGame_Level * g_pGameLevel
org 101A6CA5h - shift
jmp call_mouse_wheel_callback
;.text:101A6CA5                 mov     ecx, [eax]
;.text:101A6CA7                 mov     ecx, [ecx+148h]
org 101A6CADh - shift
back_from_mouse_wheel_callback:
;.text:101A6CAD                 mov     edx, [ecx]


org 10190698h - shift
bit_and_register:

;-------------| Фрагмент script_register_game_object2 |------------------------

;.text:10155D53                 mov     [esp+6Ch+var_48], offset sub_101421D0
;.text:10155D5B                 call    sub_1014BF30
;.text:10155D60                 mov     ecx, eax
;.text:10155D62                 mov     byte ptr [esp+58h+var_38], bl
;.text:10155D66                 mov     eax, [esp+58h+var_38]
;.text:10155D6A                 push    eax
;.text:10155D6B                 mov     byte ptr [esp+5Ch+var_40], bl
;.text:10155D6F                 mov     edx, [esp+5Ch+var_40]
;.text:10155D73                 push    edx
;.text:10155D74                 push    offset aEnable_vision ; "enable_vision"
;.text:10155D79                 lea     eax, [esp+64h+var_48]
;.text:10155D7D                 mov     ebx, ecx
;.text:10155D7F                 mov     [esp+64h+var_48], offset sub_10142260
org 10155D87h - shift
	jmp game_object_fix
;.text:10155D87                 call    enable_vision_register
back_from_game_object_fix:
;.text:10155D8C                 xor     bl, bl


org 1014DC90h - shift
enable_vision_register: ; функция для регистрации функции с прототипом void fun(bool)

org 1014C550h - shift
register_set_actor_direction:
org 1014BF30h - shift
register_get_bleeding:

org 10142990h - shift
CScriptGameObject__get_car:




;===================| Секция .idata  |=========================================
; Ищутся по именам в окне Names IDA
org 10458DA8h - shift
Msg dword ?

org 104586CCh - shift
processing_activate dword ?


;===================| Секция .data  |=========================================
;сначала находится в билде 2947, а потом ищется в аналогичных функциях релиза
;===================| Секция .data  |=========================================

org 1052F630h - shift
FlushLog dword ?

org 105602E8h - shift
g_Actor dword ?
org 1055FC80h - shift
g_key_bindings  dword ?

org 105602C8h - shift
g_bDisableAllInput db ?


org 104585A8h - shift
pInput dd ?
org 104585ACh - shift
CInput__GetAsyncKeyState:



; набор заглушек для регистрации item_on_belt, item_in_ruck и др. с прототипом game_object* fun(int);
org 10151320h - shift
sub_10151320:
org 10151A80h - shift
sub_10151A80:
org 10151AE0h - shift
sub_10151AE0:

;.idata
org 10458F78h - shift
?set_match_fun@overload_rep_base@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z dword ?
org 10458F4Ch - shift
?set_fun@overload_rep@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z dword ?
org 10458F48h - shift
?add_method@class_base@detail@luabind@@QAEXPBDABUoverload_rep@23@@Z dword ?
org 10458F54h - shift
??1overload_rep@detail@luabind@@QAE@XZ dword ?

; набор заглушек для регистрации move_on_belt, move_in_ruck и др. с прототипом bool fun(game_object*);

org 1015DEF0h - shift
sub_1015DEF0:
org 1014F020h - shift
sub_1014F020:
org 1014F450h - shift
sub_1014F450:
;.idata
; эти не надо, уже были ранее
;?set_match_fun@overload_rep_base@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z dword ?
;?set_fun@overload_rep@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$allocator@Vfunction_base@boost@@@std@@@boost@@@Z dword ?
;?add_method@class_base@detail@luabind@@QAEXPBDABUoverload_rep@23@@Z dword ?
;??1overload_rep@detail@luabind@@QAE@XZ dword ?

;  набор заглушек для регистрации level_vertex_light с прототипом float fun(int);
org 101513C0h - shift
sub_101513C0:

; register__get_current_outfit_protection
org 1014F820h - shift
sub_1014F820:
org 10150020h - shift
sub_10150020:
org 10150A80h - shift
sub_10150A80:

;  register__set_const_force
org 1015EA90h - shift
sub_1015EA90:
org 1015EBD0h - shift
sub_1015EBD0:
org 1015EC30h - shift
sub_1015EC30:

;get_task_state = get_xxx_int
org 1015D390h - shift
sub_1015D390:
org 1015D480h - shift
sub_1015D480:
org 1015D4E0h - shift
sub_1015D4E0:


   ; void change_team(int team, int squad, int group);
;vertex_in_direction
;play_sound = set_xxx_int
;set_character_community = set_xxx_string

; какие-то поля для динамического приведения типа к CWeaponMagazinedWGrenade
org 10556CC8h - shift
off_10556CC8 dword ?
org 10538CDCh - shift
off_10538CDC dword ?


; необходимые заглушки для регистрации функции телепорта в alife_simulator
org 100015E0h - shift 
sub_100015E0:
org 10004260h - shift 
sub_10004260:
org 1004F0C3h - shift 
sub_1004F0C3:
org 1004F90Eh - shift 
sub_1004F90E:
org 1004F91Ah - shift 
sub_1004F91A:
org 10255F80h - shift 
sub_10255F80:
org 1030E428h - shift 
sub_1030E428:

; необходимые заглушки для регистрации функции-метода game_object с прототипом void fun(int, int, int)
org 1015A230h - shift
sub_1015A230:
org 1015F0E0h - shift
sub_1015F0E0:
org 1015A320h - shift
sub_1015A320:


org 10458A44h - shift
CKinematics__LL_BoneID dword ? ; функция получения номера кости по её имени
org 104588F4h - shift
CKinematics__LL_GetBonesVisible dword ? ; получение видимости всех костей
org 104588F8h - shift
CKinematics__LL_SetBoneVisible dword ? ; установка видимости кости
org 104588C0h - shift
CKinematics__LL_GetBoneVisible dword ? ; получение видимости кости с заданным номером
org 10458970h - shift
CKinematics__CalculateBones_Invalidate dword ?


org 1053C598h - shift
g_fov dword ?

org 10458DB0h - shift
g_pStringContainer dword ?
org 10458DACh - shift
str_container__dock dword ?


org 10458714h - shift
CObject__cNameVisual_set dword ?
org 101D2D30h - shift
CActor__ChangeVisual:

org 10458A4Ch - shift
g_pGamePersistent dword ?


org 10458504h - shift
CEnvironment__SetGameTime dword ?

org 10149F6Eh - shift
register__gs_sell_condition__fl_fl:

org 10458EECh - shift
luabind__scope__operator_ dword ?

;-------------------------------------------------------------
; level.get_target_dist()
;-------------------------------------------------------------
org 101AF85Dh - shift
get_snd_volume_register:

org 101AEF0Fh - shift
	jmp level_ns_extension_1

org 101AEF14h - shift
back_to_level_ns_ext_1:

org 101AF1C1h - shift
	jmp level_ns_extension_2
	nop
	nop
	nop
	
org 101AF1C9h - shift
back_to_level_ns_ext_2:

org 10458498h - shift
g_hud    dword ? ; class CCustomHUD * g_hud

;-------------------------------------------------------------
; level.get_target_obj()
;-------------------------------------------------------------
org 10458B04h - shift
?Memory@@3VxrMemory@@A	dword	?

org 10458DFCh - shift
?mem_alloc@xrMemory@@QAEPAXI@Z	dword	?

org 10458EB4h - shift
??0registration@detail@luabind@@QAE@XZ	dword	?

org 101AF65Fh - shift
loc_101AF65F:

org 10481E80h - shift
off_10481E80:

org 101AD260h - shift
sub_101AD260:

org 101AF661h - shift
loc_101AF661:


;=================================================
; затычки для регистрации консольной команды на изменение целого с двумя пределами

org 104A7014h - shift
off_104A7014    dd ?

org 10458678h - shift
Console dd ?

org 10450A5Fh - shift
_atexit:

org 104589C0h - shift
CConsole__AddCommand dd ?

org 104587FCh - shift
CCC_Integer__CCC_Integer dd ?

org 10458814h - shift
CCC_Integer___CCC_Integer dd ?

org 1056063Ch - shift
g_bHudAdjustMode dd ?

;-------------------
org 104A702Ch - shift
off_104A702C dd ?

org 104587D4h - shift
CCC_Float__CCC_Float dd ?

org 104587E4h - shift
CCC_Float___CCC_Float dd ?

org 10560640h - shift
g_fHudAdjustValue dd ?                  

; заглушки для функции преобразования SGO в CInventoryBox

org 1054F0B0h - shift
off_1054F0B0    dd ?

org 1053A6A0h - shift
??_R0?AVCGameObject@@@8 dd ?

; заглушки для функции получения худа
org 1054F0E8h - shift
off_1054F0E8 dd ?

org 1054F0CCh - shift
off_1054F0CC dd ?

org 104589FCh - shift
g_pGameLevel dd ?

; заглушки для фикса инвентаря
org 10458870h - shift
CObject__H_SetParent dd ?
org 10458A9Ch - shift
CObject__setVisible dd ?
org 10458AA8h - shift
CObject__setEnabled dd ?
