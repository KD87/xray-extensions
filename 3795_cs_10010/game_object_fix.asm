game_object_fix:
; делаем то, что вырезали 
	call    get_corpse_registration 
; добавляем своё
	; регистрируем функцию получения объекта, на который смотрим
	mov     byte ptr [esp+80h+4], bl
	mov     ecx, [esp+80h+4]
	push    ecx
	mov     byte ptr [esp+84h-68h], bl
	mov     edx, [esp+84h-68h]
	push    edx
	lea     ecx, [esp+88h-6Ch]
	push    ecx
	push    offset aGet_target_obj; "get_target_obj"
	push    eax
	mov     [esp+94h-6Ch], offset GetTargetObject
	call    get_corpse_registration
	; регистрируем функцию получения координат мыши
	mov     byte ptr [esp+80h+4], bl
	mov     edx, [esp+80h+4]
	push    edx
	mov     byte ptr [esp+84h+68h], bl
	mov     ecx, [esp+84h+68h]
	push    ecx
	lea     edx, [esp+88h+6Ch]
	push    edx
	push    offset aGetMousePos ; "GetMousePos"
	push    eax
	mov     [esp+94h+6Ch], offset CScriptGameObject__GetMousePos
	call    position_register
	;
	xor     cl, cl
	mov     byte ptr [esp+80h-68h], cl
	mov     edx, [esp+80h-68h]
	mov     byte ptr [esp+80h+4h], cl
	mov     ecx, [esp+80h+4h]
	push    ecx
	push    edx
	lea     edi, [esp+88h-6Ch]
	mov     ebx, eax
	mov     [esp+88h-6Ch], offset CScriptGameObject__GetItemOnBelt
	call    item_on_belt_registration
	; регистрация метода получения количества объектов на поясе
	xor     bl, bl
	mov     byte ptr [esp+80h+4h], bl
	mov     ecx, [esp+80h+4h]
	push    ecx
	mov     byte ptr [esp+84h-68h], bl
	mov     edx, [esp+84h-68h]
	push    edx
	lea     ecx, [esp+88h-6Ch]
	push    ecx
	push    offset aBelt_object_count ; "belt_object_count"
	push    eax
	mov     [esp+94h-6Ch], offset CScriptGameObject__GetBeltObjectCount
	call    register__object_count
	; регистрируем функцию получения топлива у машины
	xor     ebx, ebx ; ?????????????????????????????????????
	mov     byte ptr [esp+80h+4], bl
	mov     ecx, [esp+80h+4]
	push    ecx
	mov     byte ptr [esp+84h-68h], bl
	mov     edx, [esp+84h-68h]
	push    edx
	lea     ecx, [esp+88h-6Ch]
	push    ecx
	push    offset aGet_fuel ; "get_fuel"
	push    eax
	mov     [esp+94h-6Ch], offset CScriptGameObject__GetFuel
	call    register_get_bleeding
	; регистрируем функцию получения потребления топлива у машины
	xor     ebx, ebx ; ?????????????????????????????????????
	mov     byte ptr [esp+80h+4], bl
	mov     ecx, [esp+80h+4]
	push    ecx
	mov     byte ptr [esp+84h-68h], bl
	mov     edx, [esp+84h-68h]
	push    edx
	lea     ecx, [esp+88h-6Ch]
	push    ecx
	push    offset aGet_fuel_consumption ; "get_fuel_consumption"
	push    eax
	mov     [esp+94h-6Ch], offset CScriptGameObject__GetFuelConsumption
	call    register_get_bleeding
	; регистрируем функцию получения объёма бака у машины
	xor     ebx, ebx ; ?????????????????????????????????????
	mov     byte ptr [esp+80h+4], bl
	mov     ecx, [esp+80h+4]
	push    ecx
	mov     byte ptr [esp+84h-68h], bl
	mov     edx, [esp+84h-68h]
	push    edx
	lea     ecx, [esp+88h-6Ch]
	push    ecx
	push    offset aGet_fuel_tank ; "get_fuel_tank"
	push    eax
	mov     [esp+94h-6Ch], offset CScriptGameObject__GetFuelTank
	call    register_get_bleeding
	; регистрируем функцию установки топлива у машины
	xor     cl, cl
	mov     byte ptr [esp+80h-68h], cl
	mov     edx, [esp+80h-68h]
	mov     byte ptr [esp+80h+4], cl
	mov     ecx, [esp+80h+4]
	push    ecx
	push    edx
	push    offset aSet_fuel ; "set_fuel"
	lea     edi, [esp+8Ch-6Ch]
	mov     ebx, eax
	mov     [esp+8Ch-6Ch], offset CScriptGameObject__SetFuel
	call    register_set_actor_direction
	; регистрируем функцию установки потребления топлива у машины
	xor     cl, cl
	mov     byte ptr [esp+80h-68h], cl
	mov     edx, [esp+80h-68h]
	mov     byte ptr [esp+80h+4], cl
	mov     ecx, [esp+80h+4]
	push    ecx
	push    edx
	push    offset aSet_fuel_consumption ; "set_fuel_consumption"
	lea     edi, [esp+8Ch-6Ch]
	mov     ebx, eax
	mov     [esp+8Ch-6Ch], offset CScriptGameObject__SetFuelConsumption
	call    register_set_actor_direction
	; регистрируем функцию установки имени персонажа
	xor     bl, bl
	mov     byte ptr [esp+58h-28h], bl
	mov     ecx, [esp+58h-28h]
	mov     byte ptr [esp+58h-30h], bl
	mov     edx, [esp+58h-30h]
	push    ecx
	push    edx
	push    offset aSet_character_name ; "set_character_name"
	lea     edi, [esp+64h-38h]
	mov     ebx, eax
	mov     [esp+64h-38h], offset CScriptGameObject__set_character_name
	call    register_sound_prefix
	; идём обратно
	jmp back_from_game_object_fix


	
aGet_target_obj db "get_target_obj", 0
aGetMousePos db "GetMousePos", 0
aGet_fuel db "get_fuel", 0
aSet_fuel db "set_fuel", 0
aGet_fuel_consumption db "get_fuel_consumption", 0
aSet_fuel_consumption db "set_fuel_consumption", 0
aGet_fuel_tank db "get_fuel_tank", 0
aBelt_object_count db "belt_object_count", 0
aItem_on_belt db "item_on_belt", 0
aSet_character_name db "set_character_name", 0

; GetTargetObject:
	; mov     eax, [g_hud] ; CCustomHUD * g_hud
	; mov     ecx, [eax]
	; call    CCustomHUD__GetRQ ; eax = RQ
	; ;--
	; mov     eax, [eax] ; RQ.O
	; ;--
	; ;push    dword ptr [eax] ; RQ.O
	; ;call    smart_cast_CGameObject ; eax = smart_cast<CGameObject*>
	; ;pop     ecx
	; test    eax, eax ; если ничего не нашли
	; jnz     return_value_
	; xor     eax, eax ; то возвращаем nil
	; retn
; return_value_: ; иначе - конвертируем в game_object
	; mov     ecx, eax ; this = <найденный CGameObject>
	; jmp     CGameObject__lua_game_object

	
	
GetTargetObject:
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	push    ecx
	
	mov     eax, [g_hud] ; CCustomHUD * g_hud
	mov     ecx, [eax]
	call    CCustomHUD__GetRQ ; eax = RQ
	;--
	mov     eax, [eax] ; RQ.O

	test    eax, eax ; если ничего не нашли
	jnz     return_value_
	;xor     eax, eax ; то возвращаем nil
	jmp     exit__
return_value_: ; иначе - конвертируем в game_object
	mov     edi, eax ; this = <найденный CGameObject>
	
	
	call    CGameObject__lua_game_object
exit__:	
	pop     ecx
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn
		
	
CScriptGameObject__GetMousePos proc
res = dword ptr 8
	push ebp
	mov ebp, esp
	push edx
	xor edx, edx
	
	mov     eax, [g_pGamePersistent]
	mov     eax, [eax]
	; cmp eax, edx
	; jnz lab1
	; push    offset aaa1
	; call    [Msg] 
	; add     esp, 4
	; call    my_flush
	; jmp exit
; lab1:
	; push    offset aaa1_
	; call    [Msg] 
	; add     esp, 4
	; call    my_flush
	
	mov     eax, [eax+524h] ; ui_core
	; cmp eax, edx
	; jnz lab2
	; push    offset aaa2
	; call    [Msg] 
	; add     esp, 4
	; call    my_flush
	; jmp exit
; lab2:
	; push    offset aaa2_
	; call    [Msg] 
	; add     esp, 4
	; call    my_flush
	
	mov     ecx, [eax+154h] ; CUICursor
	; cmp ecx, edx
	; jnz lab3
	; push    offset aaa3
	; call    [Msg] 
	; add     esp, 4
	; call    my_flush
	; jmp exit
; lab3:
	; push    offset aaa3_
	; call    [Msg] 
	; add     esp, 4
	; call    my_flush
	
	mov     eax, [ebp+res]
	mov     edx, [ecx+5]
	mov     [eax], edx
	mov     edx, [ecx+9]
	mov     [eax+4], edx
	xor      ecx, ecx
	mov     [eax+8], ecx

exit:
	pop edx
	pop ebp
	retn 4
CScriptGameObject__GetMousePos endp

f_1 dd 1.1
f_2 dd 2.2
f_3 dd 3.3


aaa1 db "game = 0", 0
aaa2 db "ui = 0", 0
aaa3 db "cursor = 0", 0

aaa1_ db "111", 0
aaa2_ db "222", 0
aaa3_ db "333", 0


item_on_belt_registration proc

var_4C          = dword ptr -4Ch
var_48          = dword ptr -48h
var_44          = dword ptr -44h
var_40          = dword ptr -40h
var_3C          = byte ptr -3Ch

                sub     esp, 50h
                push    esi
                lea     esi, [esp+54h+var_3C]
                call    sub_10181110
                mov     eax, [edi]
                mov     [esp+54h+var_4C], eax
                xor     esi, esi
                lea     eax, [esp+54h+var_4C]
                push    eax
                mov     [esp+58h+var_48], esi
                mov     [esp+58h+var_44], esi
                mov     [esp+58h+var_40], esi
                call    sub_100DF320
                add     esp, 4
                test    al, al
                jnz     short lab2
                mov     ecx, ds:?allocator_parameter@luabind@@3PAXA ; void * luabind::allocator_parameter
                mov     eax, ds:?allocator@luabind@@3P6APAXPAXPBXI@ZA ; void * (*luabind::allocator)(void *,void const *,uint)
                mov     [esp+54h+var_40], offset sub_10181BE0
                mov     [esp+54h+var_48], offset loc_101814B0
                mov     edx, [ecx]
                mov     ecx, [eax]
                push    4
                push    esi
                push    edx
                call    ecx
                add     esp, 0Ch
                cmp     eax, esi
                jz      short lab1
                mov     edx, [esp+54h+var_4C]
                mov     [eax], edx

lab1:
                mov     [esp+54h+var_44], eax

lab2:
                lea     eax, [esp+54h+var_48]
                push    eax
                lea     ecx, [esp+58h+var_3C]
                call    ds:?set_match_fun@overload_rep_base@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$memory_allocator@Vfunction_base@boost@@@luabind@@@boost@@@Z ; luabind::detail::overload_rep_base::set_match_fun(boost::function1<int,lua_State *,luabind::memory_allocator<boost::function_base>> const &)
                mov     eax, [esp+54h+var_48]
                cmp     eax, esi
                jz      short lab3
                mov     ecx, [esp+54h+var_44]
                push    1
                push    ecx
                call    eax
                add     esp, 8

lab3:
                mov     eax, [edi]
                lea     edx, [esp+54h+var_4C]
                push    edx
                mov     [esp+58h+var_48], esi
                mov     [esp+58h+var_44], esi
                mov     [esp+58h+var_40], esi
                mov     [esp+58h+var_4C], eax
                call    sub_100DF320
                add     esp, 4
                test    al, al
                jnz     short lab5
                mov     eax, ds:?allocator_parameter@luabind@@3PAXA ; void * luabind::allocator_parameter
                mov     edx, ds:?allocator@luabind@@3P6APAXPAXPBXI@ZA ; void * (*luabind::allocator)(void *,void const *,uint)
                mov     [esp+54h+var_40], offset sub_10181C20
                mov     [esp+54h+var_48], offset loc_101814B0
                mov     ecx, [eax]
                mov     eax, [edx]
                push    4
                push    esi
                push    ecx
                call    eax
                add     esp, 0Ch
                cmp     eax, esi
                jz      short lab4
                mov     ecx, [esp+54h+var_4C]
                mov     [eax], ecx

lab4:
                mov     [esp+54h+var_44], eax

lab5:
                lea     edx, [esp+54h+var_48]
                push    edx
                lea     ecx, [esp+58h+var_3C]
                call    ds:?set_fun@overload_rep@detail@luabind@@QAEXABV?$function1@HPAUlua_State@@V?$memory_allocator@Vfunction_base@boost@@@luabind@@@boost@@@Z ; luabind::detail::overload_rep::set_fun(boost::function1<int,lua_State *,luabind::memory_allocator<boost::function_base>> const &)
                mov     eax, [esp+54h+var_48]
                cmp     eax, esi
                jz      short lab6
                mov     ecx, [esp+54h+var_44]
                push    1
                push    ecx
                call    eax
                add     esp, 8

lab6:
                lea     edx, [esp+54h+var_3C]
                push    edx
                push    offset aItem_on_belt ; "item_on_belt"
                mov     ecx, ebx
                call    ds:?add_method@class_base@detail@luabind@@QAEXPBDABUoverload_rep@23@@Z ; luabind::detail::class_base::add_method(char const *,luabind::detail::overload_rep const &)
                lea     ecx, [esp+54h+var_3C]
                call    ds:??1overload_rep@detail@luabind@@QAE@XZ ; luabind::detail::overload_rep::~overload_rep(void)
                mov     eax, ebx
                pop     esi
                add     esp, 50h
                retn    8
item_on_belt_registration endp

CScriptGameObject__GetFuel proc
var_4 = dword ptr -4

	push    ebp
	mov     ebp, esp
	
	call CScriptGameObject__get_car
	
	; this + 1308 ; fuel
	; this +  1312 ; fuel_tank
	; this +  1316 ; fuel_consumption
	;fld     [fuel_res] ; dword ptr 
	fld     dword ptr [eax + 1308] ; 
	;mov     esp, ebp
	pop     ebp
	retn
CScriptGameObject__GetFuel endp

CScriptGameObject__GetFuelConsumption proc
	call CScriptGameObject__get_car
	fld     dword ptr [eax + 1316]
	retn
CScriptGameObject__GetFuelConsumption endp

CScriptGameObject__GetFuelTank proc
	call CScriptGameObject__get_car
	fld     dword ptr [eax + 1312]
	retn
CScriptGameObject__GetFuelTank endp

fuel_res dd 123.456

CScriptGameObject__SetFuel proc
dir = dword ptr  8
	push    ebp
	mov     ebp, esp
	push    ebx
	push    eax
	
	call CScriptGameObject__get_car
	
	mov     ebx, [ebp+dir]
	mov     [eax + 1308], ebx
	
	pop     eax
	pop     ebx
	pop     ebp
	retn    4
CScriptGameObject__SetFuel endp


CScriptGameObject__SetFuelConsumption proc
dir = dword ptr  8
	push    ebp
	mov     ebp, esp
	push    ebx
	push    eax
	
	call CScriptGameObject__get_car
	
	mov     ebx, [ebp+dir]
	mov     [eax + 1316], ebx
	
	pop     eax
	pop     ebx
	pop     ebp
	retn    4
CScriptGameObject__SetFuelConsumption endp


CScriptGameObject__GetBeltObjectCount proc near
                push    ebp
                mov     ebp, esp
                and     esp, 0FFFFFFF8h
                mov     ecx, [ecx+4] ; ecx = m_game_object
                test    ecx, ecx
                jz      short lab1
                mov     eax, [ecx]   ; eax = vtable ???
                mov     edx, [eax+80h]
                call    edx          ; eax = CInventoryOwner
                test    eax, eax
                jz      short lab1
                mov     ecx, [eax+1Ch] ; ecx = CInventory
                mov     eax, [ecx+32]   ; eax = &end
                sub     eax, [ecx+28]   ; eax = &end - &start
                ;add     ecx, 4         ; eax = &end - &start + 4
                sar     eax, 2         ; eax = (&end - &start + 4) / 4
                mov     esp, ebp
                pop     ebp
                retn
; ---------------------------------------------------------------------------
lab1:
                xor     eax, eax
                mov     esp, ebp
                pop     ebp
                retn
CScriptGameObject__GetBeltObjectCount endp

CScriptGameObject__GetItemOnBelt_old    proc

arg_0           = dword ptr  8

                push    ebp
                mov     ebp, esp
				push edi
				;mov     ecx, [ecx+4]
                ;mov     edi, ecx
				call Actor ; eax = client actor
				mov edi, eax
                call    CGameObject__lua_game_object
				;xor eax, eax
				
				pop edi
                pop     ebp
                retn    4
CScriptGameObject__GetItemOnBelt_old    endp

CScriptGameObject__GetItemOnBelt proc
arg_0 = dword ptr  8

	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    ecx
	mov     ecx, [ecx+4] ; ecx = m_game_object
	test    ecx, ecx
	push    edi
	jz      short fail_exit
	mov     eax, [ecx]
	mov     edx, [eax+80h]
	call    edx         ; eax = CInventoryOwner
	test    eax, eax
	jz      short fail_exit
	mov     ecx, [eax+1Ch]  ; ecx = CInventory
	
	mov     edx, [ecx+32] ; edx = &end
	;mov     edx, [ecx+8] ; edx = &end
	sub     edx, [ecx+28] ; edx = &end - &begin
	;sub     edx, [ecx+4] ; edx = &end - &begin
	
	mov     eax, [ebp+arg_0]  ; eax = index
	sar     edx, 2            ; edx = (&end - &begin)/4 == <общее количество объектов на поясе>
	cmp     edx, eax ; если количество <= индексу, значит что-то не то
	jbe     short fail_exit
	
	mov     ecx, [ecx+28] ; ecx = &begin
	;mov     ecx, [ecx+4] ; ecx = &begin
	
	shl     eax, 2        ; eax = index * 4
	mov     eax, [eax+ecx] ; получаем предмет из массива
	test    eax, eax 
	jz      short fail_exit ; если там ноль, валим отсюда
	; приводим CInventoryItem к CGameObject
	mov     edx, [eax]
	mov     ecx, eax
	mov     eax, [edx+124h]
	call    eax
	test    eax, eax
	jz      fail_exit
	; получаем CScriptGameObject из CGameObject 
	mov     edi, eax
	call    CGameObject__lua_game_object
	jmp     success
fail_exit:
	xor     eax, eax
success:
	pop     edi
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__GetItemOnBelt endp


;m_belt; // begin == 7*4   end == 8*4

CScriptGameObject__set_character_name proc
arg_0 = dword ptr  8
	
	push    ebp
	mov     ebp, esp
	and     esp, 0FFFFFFF8h
	push    esi
	push    edi
	
	mov     ecx, [ecx+4] ; ecx = m_game_object
	test    ecx, ecx
	jz      short fail ; if (!m_game_object) goto fail
	mov     eax, [ecx]
	mov     edx, [eax+80h]
	call    edx     ;  eax = pInventoryOwner
	test    eax, eax 
	jz     short fail
	mov     esi, eax

	mov     edi, offset aTestName
	mov     ecx, edi
	lea     edx, [ecx+1]
len_loop:
	mov     al, [ecx]
	add     ecx, 1
	test    al, al
	jnz     short len_loop

	sub     ecx, edx
	add     ecx, edi
	push    ecx
	push    edi
	lea     eax, [esi+40h]
	call    xr_string__assign_operator
fail:
	pop     edi
	pop     esi
	mov     esp, ebp
	pop     ebp
	retn    4
CScriptGameObject__set_character_name endp

aTestName db "it is a test name", 0
aEmpty_str db 0