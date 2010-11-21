;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************

org 100490C0h - shift
script_hit_callback:

; Функция smart_cast<CGameObject*>()
; ищем так:
; находим строку "ph_capture_visuals"
; находим ссылку на строку, их всего две. 
; Из них та функция, у которой есть один аргумент - это CActor::shedule_Update(int dt).
; в этой функции ищем следующий фрагмент (функция длинная, примерно посередине):
;.text:10262968 loc_10262968:                           ; CODE XREF: CActor__shedule_Update+61Fj
;.text:10262968                 mov     eax, ds:?g_hud@@3PAVCCustomHUD@@A ; CCustomHUD * g_hud  <== удобный ориентир - импортированная из dll ф-я
;.text:1026296D                 mov     ecx, [eax]
;.text:1026296F                 call    sub_104AFE40
;.text:10262974                 xor     ebx, ebx
;.text:10262976                 cmp     [esi+900h], ebx
;.text:1026297C                 mov     ebp, eax
;.text:1026297E                 jnz     loc_10262C25
;.text:10262984                 mov     eax, [ebp+0]
;.text:10262987                 cmp     eax, ebx
;.text:10262989                 jz      loc_10262C25
;.text:1026298F                 test    dword ptr [eax+0A4h], 2000000h
;.text:10262999                 jz      loc_10262C25
;.text:1026299F                 movss   xmm0, ds:flt_105B7998
;.text:102629A7                 comiss  xmm0, dword ptr [ebp+4]
;.text:102629AB                 jbe     loc_10262C25
;.text:102629B1                 push    eax
;.text:102629B2                 call    sub_1007A4F0  <==   эти два вызова - это и есть вызов smart_cast<CGameObject*>
;.text:102629B7                 mov     [esi+510h], eax
;.text:102629BD                 mov     ecx, [ebp+0]
;.text:102629C0                 push    ecx
;.text:102629C1                 call    sub_1007A4F0  <==
;.text:102629C6                 mov     ebp, eax

org 1007A4F0h - shift
smart_cast_CGameObject: ; по большому счёту не нужна, поскольку в релизе ничего не делает. 
; странно, что оптимизатор её не повырезал

; миниправка для снятия ограничения на выкидывание из ящиков
;.text:101C7460 CScriptGameObject__DropItem proc near
; функцию находим по рядом с ссылкой на строку "drop_item"
; ...
;.text:101C749C                 test    esi, esi           <== эти 4 строки выполняют проверку на 
;.text:101C749E                 jz      short loc_101C74F8 <== то, что выкидывающий - это CInventoryOwner и 
;.text:101C74A0                 test    eax, eax           <== предмет - это CInventoryItem. Какая из них за что отвечает,
;.text:101C74A2                 jz      short loc_101C74F8 <== точно не знаю, так что забиваем все. Контроль делайте сами.
;.text:101C74A4                 lea     ecx, [esp+4020h+var_4014]

org 101C749Ch - shift ; не забыть вставить в список правок (8 байт)
    nop ; test    esi, esi           ;2 байта
	nop
	nop ; jz      short loc_101C74F8 ;2 байта
	nop
	nop ; test    eax, eax
	nop
	nop ; jz      short loc_101C74F8
	nop
; итого: 0x101C74A4 - 0x101C749C = 0xA4 - 0x9C = 8 - сходится
	
;-----------< регистрация глобального пространства имён >----------------------
; функция, которая регистрирует глобальную скриптовую функцию с прототипом:
; void fun(char*)
; ссылку см. ниже
org 10222902h - shift 
error_log_register:

; функция, которая регистрирует глобальную скриптовую функцию с прототипом:
; void fun(void)
; адрес ищем рядом со ссылкой на строку "flush"
org 102225EEh - shift
flush_register:

; Функция CScriptEngine::script_register
; ищем по ссылке на строку "error_log"
;.text:10223997                 push    offset aError_log ; "error_log"
;.text:1022399C                 push    esi
org 1022398Dh - shift
	jmp global_space_ext ; врезка с инструкцией перехода - 5 байт
;.text:1022399D                 call    sub_10222902; error_log register
org 10223992h - shift
back_to_global_space_ext:
;.text:102239A2                 lea     eax, [ebp+var_1]
;.text:102239A5                 push    eax
;.text:102239A6                 push    offset nullsub_1
;.text:102239AB                 push    offset aFlush   ; "flush"


;--------------< Регистрации пространства имён level >-------------------------

; функция регистрирующая в пространстве имён level функцию с прототипом:
; game_object* fun(int);
; аргумент при вызове можно игнорировать
; используется для регистрации level.object_by_id. Ищем по ссылке на строку "object_by_id". 
; Там будет:

;.text:1024A74C                 push    offset loc_1023F5A0; <== Это сама функция level.object_by_id   будет нужна
;.text:1024A751                 lea     eax, [ebp+var_8]
;.text:1024A754                 push    offset aObject_by_id ; "object_by_id"
;.text:1024A759                 push    eax
;.text:1024A75A                 call    sub_10241611; object_by_id_register <== это наш адрес
;.text:1024A75F                 add     esp, 18h

org 10241611h - shift
object_by_id_register: 

; функция регистрирующая в пространстве имён level функцию с прототипом:
; float fun(void);
; ссылку см. ниже
org 1024177Dh - shift
get_snd_volume_register: 

; метод CLevel::script_register
; ищем по ссылке на строку "get_snd_volume"

; Первый фрагмент
;.text:1024A345                 push    offset aGet_snd_volume ; "get_snd_volume" - этот адрес нам неинтересен
;.text:1024A34A                 push    eax
org 1024A34Bh - shift
	jmp level_ns_extension_1
;.text:1024A34B                 call    sub_1024177D; регистрация get_snd_volume - см. метку выше
org 1024A350h - shift
back_to_level_ns_ext_1:
;.text:1024A350                 pop     ecx
;.text:1024A351                 pop     ecx
;.text:1024A352                 mov     eax, esp
;.text:1024A354                 push    offset loc_10243A00
;.text:1024A359                 push    offset aPhysics_world ; "physics_world"

; Второй фрагмент. Начинается сразу за первым и состоит из нескольких повторов mov ecx, eax;   call esi;
; Этих повторов столько, сколько выше было регистраций функций. Значит, на каждую свою дорегистрацию
; надо добавить по одной такой паре.
;.text:1024A764                 call    esi ; luabind::scope::operator,(luabind::scope) ; luabind::scope::operator,(luabind::scope)
org 1024A766h - shift
	jmp level_ns_extension_2 ; врезка с инструкцией перехода - 5 байт
;.text:1024A766                 mov     ecx, eax
;.text:1024A768                 call    esi ; luabind::scope::operator,(luabind::scope) ; luabind::scope::operator,(luabind::scope)
;.text:1024A76A                 mov     ecx, eax
;.text:1024A76C                 call    esi ; luabind::scope::operator,(luabind::scope) ; luabind::scope::operator,(luabind::scope)
org 1024A76Eh - shift
back_to_level_ns_ext_2: ; расстояние 8 байт, хватает, чтобы вставить 5 байт врезки
;.text:1024A76E                 mov     ecx, eax


;------------------------------------------------------------------------------
;void __thiscall CActor::HitSignal(CActor *this, float perc, _vector3<float> *vLocalDir, CObject* who, __int16 element)
; как найти: ищем в idata элемент с адресом функции CBoneInstance::get_param
; смотрим все ссылки на эту функцию. Есть две функции, из которых идёт по одной ссылке.
; в одной из них ссылка идёт по смещению +46h, из другой - по смещению +379h. Вторая нам и нужна.
; скорее всего, в других билдах смещения будут немного другими.

; фрагмент в начале этой функции. В начале потому, что в конце из-за оптимизации портится часть
; аргументов (их место используется под локальные переменные). Для простоты приходится
; игнорировать проверку на живость актора. Колбек будет вызываться всегда. Для актора
; в сингле это по большому счёту фиолетово.

org 10260120h - shift
	jmp CActor_HitSignal_ext
;.text:10260120                 xorps   xmm5, xmm5
;.text:10260123                 sub     esp, 0Ch
org 10260126h - shift
back_to_CActor_HitSignal:
;.text:10260126                 push    edi
;.text:10260127                 mov     edi, ecx
;.text:10260129                 mov     eax, [edi+200h]

; -----------------------------------------------------------------------------
; Метод класса CGameObject, который возвращает для него скриптовый объект game_object
; аргументов нет, this передаётся через ecx
; ищем так:
; сначала находим функцию level.object_by_id (см. выше поиск object_by_id_register)
; затем в этой функции в конце видим переход:
;.text:1023F5CE                 mov     ecx, eax
;.text:1023F5D0                 jmp     sub_1027FD40 ; CGameObject__lua_game_object <== это наш адрес
org 1027FD40h - shift
CGameObject__lua_game_object:

org 10281920h - shift
CGameObject__callback:

;--------------< регистрация класса CUIStatic >--------------------------------
; метод класса CUIStatic::SetTextureRect - ccылку ищем в первом фрагменте ниже
org 1047B6E0h - shift
CUIStatic__SetTextureRect:

; фрагменты функции CUIStatic::::script_register
; Функцию ищем по ссылке на строку "SetTextureRect"

; ---------- первый фрагмент: аргументы пишутся в стек
;.text:1047F4B0                 push    offset aSetstretchtext ; "SetStretchTexture"
org 1047F4B5h - shift
	jmp CUIStatic_extention_1 ; врезка с инструкцией перехода - 5 байт
;.text:1047F4B5                 xor     eax, eax
;.text:1047F4B7                 push    eax
;.text:1047F4B8                 mov     eax, offset sub_1047B6E0; CUIStatic__SetTextureRect - см. выше
;.text:1047F4BD                 push    eax
;.text:1047F4BE                 push    offset aSettexturerect ; "SetTextureRect"
org 1047F4C3h - shift
back_to_CUIStatic_ext_1:
;.text:1047F4C3                 push    [ebp+var_10]
;.text:1047F4C6                 mov     eax, offset sub_103F1DAF
;.text:1047F4CB                 push    eax

; ---------- второй фрагмент: вызываются функции регистрации в обратном порядке
;.text:1047F4DF                 push    [ebp+var_C]
;.text:1047F4E2                 push    offset aCuistatic ; "CUIStatic"
;.text:1047F4E7                 lea     ecx, [ebp+var_34]
;.text:1047F4EA                 call    sub_1047D536    ; register class CUIStatic
;.text:1047F4EF                 mov     ecx, eax
;.text:1047F4F1                 call    sub_1047CF5A    ; register constructor CUIStatic()
;.text:1047F4F6                 mov     ecx, eax
;.text:1047F4F8                 call    sub_1047F2B1    ; TextControl
;.text:1047F4FD                 mov     ecx, eax
;.text:1047F4FF                 call    sub_1047EE96    ; InitTexture
org 1047F504h - shift
	jmp CUIStatic_extention_2 ; врезка с инструкцией перехода - 5 байт
;.text:1047F504                 mov     ecx, eax
;.text:1047F506                 call    sub_1047EEC1    ; register SetTextureRect
org 1047F50Bh - shift
back_to_CUIStatic_ext_2:
;.text:1047F50B                 mov     ecx, eax

; Шаблонная функция для регистрации функции с прототипом:
; void fun(CUIStatic* this, Frect* r)
; адрес ищем во втором фрагменте выше
org 1047EEC1h - shift
SetTextureRect_register:

org 104AFE40h - shift
CCustomHUD__GetRQ:

; миниправка функции get_rank на предмет блокировки сообщения "'cannot find rank for ..."
; для стволов, не прописанных в mp_ranks
; Сейчас, если ранг не найден, функция будет возвращать ранг 0 
org 104CCC2Eh + 4 - shift ; в список правок впишем 0x104CCC32 4
		 dword 00000000h ; второй аргумент инструкции   mov     [esp+34h+var_24], 0FFFFFFFFh

; ищется по названию atexit
; используется для вызова деструкторов у статических объектов
org 10509FD0h - shift
_atexit:

; void __cdecl CCC_RegisterCommands()
; как найти: находим DllMain по названию и первая вызываемая функция будет она
org 103349CDh - shift
CCC_RegisterCommands_part_0:
	;было
;.text:103349CD		mov     eax, 4000h
	;стало
	jmp		CCC_RegisterCommands_chunk_0
	
CCC_RegisterCommands_1:
;.text:103349D2		test    dword_1064FB44, eax
;.text:103349D8		jnz     short loc_10334A0D

; void __cdecl InventoryUtilities::SendInfoToActor(const char info_portion)
; как найти: ищем строчку "ui_pda_hide", переходим по ссылке на код, который на нее ссылается
; там будет что-то вида:
;.text:10442B5E		push    offset aUi_pda_hide ; "ui_pda_hide"
;.text:10442B63		call    sub_10466290 <= это и есть нужная функция InventoryUtilities__SendInfoToActor
org 10466290h - shift
InventoryUtilities__SendInfoToActor:

; void __thiscall CUIPdaWnd::SetActiveSubdialog(CUIPdaWnd *this, EPdaTabs section)
;как найти: ищем строку "CUIPdaWnd::SetActiveSubdialog" - функция, в которой она используется, и есть нужная
;.text:104428B0     CUIPdaWnd__SetActiveSubdialog proc near 
;.text:104428B0     section         = dword ptr  4
;.text:104428B0
;.text:104428B0		push    esi
;.text:104428B1		mov     esi, ecx
;.text:104428B3		mov     eax, [esi+7Ch]
;.text:104428B6		push    edi
;.text:104428B7		mov     edi, [esp+8+section]
org 104428BBh - shift
CUIPdaWnd__SetActiveSubdialog_ext:
	;было
;.text:104428BB		cmp     eax, [edi]
;.text:104428BD		jz      loc_104429F8
	;стало
	jmp		CUIPdaWnd__SetActiveSubdialog_chunk
	nop
	nop
	nop
	
CUIPdaWnd__SetActiveSubdialog_1:	
;.text:104428C3		mov     eax, [esi+78h]
;.text:104428C6 	test    eax, eax

;ищется по названию
org 10509D9Ah - shift
__RTDynamicCast:
;.text:10509D9A                 jmp     ds:__imp___RTDynamicCast

org 1026F8C0h - shift
CActor__SetWeaponHideState:

; public: void __thiscall CPHMovementControl::DestroyCharacter(void)
org 104FE590h - shift
CPHMovementControl__DestroyCharacter:

; protected: bool __thiscall CActor::use_Vehicle(class CHolderCustom *)
org 10278B8Ah - shift
CActor__use_Vehicle_part:
    ;было
;.text:10278B8A                 mov     dword ptr [esi+540h], 0
	;стало
	jmp		CActor__use_Vehicle_chunk_1
	nop
	nop
	nop
	nop
	nop
	
loc_10278B94:
;.text:10278B94                 pop     edi
;.text:10278B95                 mov     al, 1
;.text:10278B97                 pop     esi
;.text:10278B98                 add     esp, 0Ch
;.text:10278B9B                 retn    4


;===================| Секция .idata  |=========================================
; Ищутся по именам в окне Names IDA
org 10512558h - shift
FlushLog dword ? ; void __cdecl FlushLog(void)
org 10512820h - shift 
Msg      dword ? ; void __cdecl Msg(char const *, ...)
org 10512D30h - shift
g_hud    dword ? ; class CCustomHUD * g_hud
org 10512B0Ch - shift
_CCC_Float_	dd ? ; public: __thiscall CCC_Float::CCC_Float(char const *, float *, float, float)
org 10512AF4h - shift
_1CCC_Float_	dd ?  ; public: virtual __thiscall CCC_Float::~CCC_Float(void)
org 10512DB8h - shift
_Console_	dd ?  ; class CConsole * Console
org 10513264h - shift
_phTimefactor_	dd ? ; float phTimefactor
org 1062CD54h - shift
_R0_AVCCar dd ?  ; class CCar `RTTI Type Descriptor'
org 1062D130h - shift
_R0_AVCHolderCustom	dd ?  ; class CHolderCustom `RTTI Type Descriptor'
org 10512258h - shift
__imp___RTDynamicCast dd ? ; __imp___RTDynamicCast

;===================| Секция .data  |=========================================
;сначала находится в билде 2947, а потом ищется в аналогичных функциях COP
org 10635C44h - shift
g_fov dd ?
org 1064EA60h - shift
INV_STATE_CAR	 dw ?	; unsigned int INV_STATE_CAR


