;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************

;.text:0048B6D0 fill_vid_mode_list proc near
;
;.text:0048B73B                 mov     eax, [esp+60h+var_30]
org 0048B73Fh - shift
	cmp     eax, 450 ; 5 bytes
;.text:0048B73F                 cmp     eax, 320h
;.text:0048B744                 jb      loc_48B7D7

org 00506BA4h - shift
psHUD_FOV dd ?

; ВЫРЕЗАН ПЕРВЫЙ РЕНДЕР
org 0050BBB8h - shift
renderer_value  dd 2 ; всегда полная динамика

org 004BA9F4h - shift
	jmp loc_4BAA99
;.text:004BA9F4                 jnz     loc_4BAA99
;.text:004BA9FA                 push    0
;.text:004BA9FC                 push    80000h
;.text:004BAA01                 mov     ecx, offset ?psDeviceFlags@@3U?$_flags@I@@A ; _flags<uint> psDeviceFlags
;.text:004BAA06                 call    _flags_unsigned_int___set
;.text:004BAA0B                 push    offset aXrrender_r1_dl ; "xrRender_R1.dll"
;.text:004BAA10                 push    offset aLoadingDll ; "Loading DLL:"
;.text:004BAA15                 mov     ds:renderer_value, 0
;.text:004BAA1F                 call    edi ; Log(char const *,char const *)
;.text:004BAA21                 add     esp, 8
;.text:004BAA24                 push    offset aXrrender_r1_dl ; "xrRender_R1.dll"
;.text:004BAA29                 call    ebp ; LoadLibraryA
;.text:004BAA2B                 test    eax, eax
;.text:004BAA2D                 mov     [esi+4], eax
;.text:004BAA30                 jnz     short loc_4BAA68
;.text:004BAA32                 call    ds:GetLastError
;.text:004BAA38                 cmp     ds:byte_50E696, 0
;.text:004BAA3F                 jnz     short loc_4BAA68
;.text:004BAA41                 test    eax, eax
;.text:004BAA43                 jge     short loc_4BAA68
;.text:004BAA45                 mov     ecx, ds:?Debug@@3VxrDebug@@A ; _DWORD
;.text:004BAA4B                 push    offset byte_50E696 ; _DWORD
;.text:004BAA50                 push    offset aCengineapiInit ; "CEngineAPI::Initialize"
;.text:004BAA55                 push    39h             ; _DWORD
;.text:004BAA57                 push    offset aEStalkerSou_50 ; "E:\\stalker\\sources\\trunk\\xr_3da\\EngineA"...
;.text:004BAA5C                 push    offset aGetlasterror ; "GetLastError()"
;.text:004BAA61                 push    eax             ; _DWORD
;.text:004BAA62                 call    ds:?error@xrDebug@@QAEXJPBD0H0AA_N@Z ; xrDebug::error(long,char const *,char const *,int,char const *,bool &)
;.text:004BAA68
;.text:004BAA68 loc_4BAA68:                             ; CODE XREF: CEngineAPI::Initialize(void)+90j
;.text:004BAA68                                         ; CEngineAPI::Initialize(void)+9Fj ...
;.text:004BAA68                 cmp     ds:byte_50E697, 0
;.text:004BAA6F                 jnz     short loc_4BAA99
;.text:004BAA71                 cmp     dword ptr [esi+4], 0
;.text:004BAA75                 jnz     short loc_4BAA99
;.text:004BAA77                 mov     ecx, ds:?Debug@@3VxrDebug@@A ; _DWORD
;.text:004BAA7D                 push    offset byte_50E697 ; _DWORD
;.text:004BAA82                 push    offset aCengineapiInit ; "CEngineAPI::Initialize"
;.text:004BAA87                 push    3Ah             ; _DWORD
;.text:004BAA89                 push    offset aEStalkerSou_50 ; "E:\\stalker\\sources\\trunk\\xr_3da\\EngineA"...
;.text:004BAA8E                 push    offset aHrender ; "hRender"
;.text:004BAA93                 call    ds:?fail@xrDebug@@QAEXPBD0H0AA_N@Z ; xrDebug::fail(char const *,char const *,int,char const *,bool &)
;.text:004BAA99
org 004BAA99h - shift
loc_4BAA99:
;.text:004BAA99 loc_4BAA99:                             ; CODE XREF: CEngineAPI::Initialize(void)+54j
;.text:004BAA99                                         ; CEngineAPI::Initialize(void)+CFj ...

;.text:00411400 WinMain_impl    proc near               ; CODE XREF: WinMain(x,x,x,x)
; ...
;.text:0041158E                 push    offset aBatch_benchmar ; "-batch_benchmark "
org 00411593h - shift
	jmp WinMain_impl_fix
;.text:00411593                 push    ebx             ; Str
;.text:00411594                 call    edi ; strstr
;.text:00411596                 add     esp, 8
;.text:00411599                 test    eax, eax
;.text:0041159B                 jz      short loc_4115FA

;...
;.text:004115FA loc_4115FA:                             ; CODE XREF: WinMain_impl+19Bj
;.text:004115FA                 push    offset aLauncher ; "-launcher"
;.text:004115FF                 push    ebx
;.text:00411600                 call    edi ; strstr
;org 00411602h - shift
;	jmp WinMain_impl_fix
;.text:00411602                 mov     eax, ds:?Core@@3VxrCore@@A ; xrCore Core
;.text:00411607                 add     eax, 4D0h
;.text:0041160C                 push    offset aR2a     ; "-r2a"
;.text:00411611                 push    eax
;.text:00411612                 call    edi ; strstr
;.text:00411614                 add     esp, 10h
;.text:00411617                 test    eax, eax
;.text:00411619                 jz      short loc_41162D
;.text:0041161B                 mov     ecx, ds:?Console@@3PAVCConsole@@A ; CConsole * Console
;.text:00411621                 push    offset aRendererRender ; "renderer renderer_r2a"
;.text:00411626                 call    ?Execute@CConsole@@QAEXPBD@Z ; CConsole::Execute(char const *)
;.text:0041162B                 jmp     short loc_41168C
;.text:0041162D ; ---------------------------------------------------------------------------
;.text:0041162D
;.text:0041162D loc_41162D:                             ; CODE XREF: WinMain_impl+219j
;.text:0041162D                 mov     eax, ds:?Core@@3VxrCore@@A ; xrCore Core
;.text:00411632                 add     eax, 4D0h
;.text:00411637                 push    offset aR2      ; "-r2"
;.text:0041163C                 push    eax
;.text:0041163D                 call    edi ; strstr
;.text:0041163F                 add     esp, 8
;.text:00411642                 test    eax, eax
;.text:00411644                 jz      short loc_411658
;.text:00411646                 mov     ecx, ds:?Console@@3PAVCConsole@@A ; CConsole * Console
;.text:0041164C                 push    offset aRendererRend_0 ; "renderer renderer_r2"
;.text:00411651                 call    ?Execute@CConsole@@QAEXPBD@Z ; CConsole::Execute(char const *)
;.text:00411656                 jmp     short loc_41168C
;.text:00411658 ; ---------------------------------------------------------------------------
;.text:00411658
;.text:00411658 loc_411658:                             ; CODE XREF: WinMain_impl+244j
;.text:00411658                 push    offset aRenderer ; "renderer "
;.text:0041165D                 call    sub_420FC0
;.text:00411662                 mov     ecx, ds:?Console@@3PAVCConsole@@A ; CConsole * Console
;.text:00411668                 add     ecx, 440h
;.text:0041166E                 add     esp, 4
;.text:00411671                 mov     [esp+22A0h+FilePart], eax
;.text:00411675                 mov     edx, [eax]
;.text:00411677                 mov     edx, [edx+4]
;.text:0041167A                 push    ecx
;.text:0041167B                 mov     ecx, eax
;.text:0041167D                 call    edx
;.text:0041167F                 lea     eax, [esp+22A0h+FilePart]
;.text:00411683                 push    eax
;.text:00411684                 call    sub_421010
;.text:00411689                 add     esp, 4
;.text:0041168C
org 0041168Ch - shift
back_from_WinMain_impl_fix:
;.text:0041168C loc_41168C:                             ; CODE XREF: WinMain_impl+22Bj
;.text:0041168C                                         ; WinMain_impl+256j
;.text:0041168C                 call    InitInput
;.text:00411691                 mov     ecx, offset unk_50E544

org 00506BA0h - shift
r2_sun_static dd ?

;.text:004B6A90 CCC_r2__Execute proc near
;.text:004B6A90
;.text:004B6A90 Str2            = dword ptr  4
;.text:004B6A90
org 004B6A90h - shift
	jmp CCC_r2__Execute_fix
;.text:004B6A90                 mov     eax, [esp+Str2]
;.text:004B6A94                 push    eax             ; Str2
;.text:004B6A95                 call    ?Execute@CCC_Token@@UAEXPBD@Z ; CCC_Token::Execute(char const *)
;.text:004B6A9A                 xor     ecx, ecx
;.text:004B6A9C                 cmp     ecx, ds:renderer_value
;.text:004B6AA2                 mov     ecx, offset ?psDeviceFlags@@3U?$_flags@I@@A ; _flags<uint> psDeviceFlags
;.text:004B6AA7                 sbb     edx, edx
;.text:004B6AA9                 neg     edx
;.text:004B6AAB                 push    edx
;.text:004B6AAC                 push    80000h
;.text:004B6AB1                 call    _flags_unsigned_int___set
;.text:004B6AB6                 xor     eax, eax
;.text:004B6AB8                 cmp     ds:renderer_value, 2
;.text:004B6ABF                 setnz   al
;.text:004B6AC2                 mov     ds:?r2_sun_static@@3HA, eax ; int r2_sun_static
;.text:004B6AC7                 retn    4
;.text:004B6AC7 CCC_r2__Execute endp

;.text:004B6AD0 CCC_r2__Save    proc near               ; DATA XREF: .rdata:004D8674o
;.text:004B6AD0
;.text:004B6AD0 arg_0           = dword ptr  4
;.text:004B6AD0
;.text:004B6AD0                 mov     eax, ds:?Core@@3VxrCore@@A ; xrCore Core
org 004B6AD5h - shift
	retn 4
;.text:004B6AD5                 push    esi
;.text:004B6AD6                 add     eax, 4D0h
;.text:004B6ADB                 push    offset aR2      ; "-r2"
;.text:004B6AE0                 push    eax             ; Str
;.text:004B6AE1                 mov     esi, ecx
;.text:004B6AE3                 call    ds:strstr
;.text:004B6AE9                 add     esp, 8
;.text:004B6AEC                 test    eax, eax
;.text:004B6AEE                 jnz     short loc_4B6AFC
;.text:004B6AF0                 mov     eax, [esp+4+arg_0]
;.text:004B6AF4                 push    eax
;.text:004B6AF5                 mov     ecx, esi
;.text:004B6AF7                 call    ?Save@IConsole_Command@@UAEXPAVIWriter@@@Z ; IConsole_Command::Save(IWriter *)
;.text:004B6AFC
;.text:004B6AFC loc_4B6AFC:                             ; CODE XREF: CCC_r2__Save+1Ej
;.text:004B6AFC                 pop     esi
;.text:004B6AFD                 retn    4
;.text:004B6AFD CCC_r2__Save    endp

org 004D2098h - shift
aRendererRend_0 db ?

org 004B9A30h - shift
CConsole__Execute:

org 004147F0h - shift
_flags_unsigned_int___set:

; ПОГОДНЫЕ ПРАВКИ

org 00443538h - shift
	jmp	envdescriptor_hack_rain_color_fix
org 00443562h - shift
back_to_envdescriptor_hack_rain_color_fix:	

;.text:00447E70 ; public: void __thiscall CLensFlareDescriptor::load(class CInifile *, char const *)
org 00447E70h - shift
	jmp CLensFlareDescriptor__load_fix
;.text:00447E70                 push    ebp
;.text:00447E71                 mov     ebp, esp
;.text:00447E73                 and     esp, 0FFFFFFF8h
;.text:00447E76                 sub     esp, 12Ch


;.text:004387D0 ; void __thiscall CEnvironment__SetWeather(void *this, int name, bool forced)
org 004387D0h - shift
	jmp CEnvironment__SetWeather_fix
;.text:004387D0                 sub     esp, 8
;.text:004387D3                 push    ebx
;.text:004387D4                 push    ebp
org 004387D5h - shift
back_from_CEnvironment__SetWeather_fix:
;.text:004387D5                 push    esi
;.text:004387D6                 mov     esi, [esp+14h+name]


;.text:004385B0 ; public: void __thiscall CEnvironment::Invalidate(void)
org 004385B0h - shift
	jmp CEnvironment__Invalidate_fix
;.text:004385B0                 xor     eax, eax
;.text:004385B2                 mov     [ecx+294h], al
;.text:004385B8                 mov     [ecx+28Ch], eax
;.text:004385BE                 mov     [ecx+290h], eax



;.text:004488E0 ; public: void __thiscall CLensFlare::OnFrame(int)
org 004488E0h - shift
	jmp CLensFlare__OnFrame_fix
;.text:004488E0                 push    ebp
;.text:004488E1                 mov     ebp, esp
;.text:004488E3                 and     esp, 0FFFFFFF8h
;.text:004488E6                 mov     eax, ds:dword_50BD7C


;.text:004493F0 ; public: void __fastcall CLensFlare::Render(int, int, int)
org 004493F0h - shift
	jmp CLensFlare__Render_fix
;.text:004493F0                 push    ebp
;.text:004493F1                 mov     ebp, esp
;.text:004493F3                 and     esp, 0FFFFFFF8h
;.text:004493F6                 sub     esp, 0ECh


;.text:00442DB0 ; void __thiscall CEffect_Rain__Born(void *this, CEffect_Rain::Item *a1, float radius)
org 00442DB0h - shift
	jmp CEffect_Rain__Born_fix
;.text:00442DB0                 sub     esp, 18h
;.text:00442DB3                 xorps   xmm1, xmm1
;.text:00442DB6                 push    ebx
;.text:00442DB7                 mov     ebx, ecx



;.text:0040D510 ; public: class CEnvDescriptor & __thiscall CEnvDescriptor::operator=(class CEnvDescriptor const &)
org 0040D510h - shift
	jmp CEnvDescriptor__assign_operator_fix
;.text:0040D510                 push    ebx
;.text:0040D511                 mov     ebx, [esp+4+arg_0]
;.text:0040D515                 fld     dword ptr [ebx]
;.text:0040D517                 push    esi
;.text:0040D518                 push    edi
;.text:0040D519                 mov     edi, ecx
;.text:0040D51B                 fstp    dword ptr [edi]
;.text:0040D51D                 xor     edx, edx
;.text:0040D51F                 fld     dword ptr [ebx+4]



;.text:0043DAD0 ; void __thiscall CEnvDescriptorMixer__lerp(void *this, int, int, int, int, float, int)
org 0043DAD0h - shift
	jmp CEnvDescriptorMixer__lerp_fix
;.text:0043DAD0                 push    ebp
;.text:0043DAD1                 mov     ebp, esp
;.text:0043DAD3                 and     esp, 0FFFFFFF8h
org 0043DAD6h - shift
back_from_CEnvDescriptorMixer__lerp_fix:
;.text:0043DAD6                 sub     esp, 14h




org 004CC594h - shift
xrMemory__mem_free dd ?

;.text:0040D220 ; public: __thiscall CEnvDescriptor::~CEnvDescriptor(void)
org 0040D220h - shift
	jmp jmp_over_reloc1
;.text:0040D220                 push    ebx
;.text:0040D221                 push    ebp
;.text:0040D222                 mov     ebp, ds:?mem_free@xrMemory@@QAEXPAX@Z ; xrMemory::mem_free(void *)
org 0040D228h - shift
jmp_over_reloc1:
	jmp CEnvDescriptor__CEnvDescriptor_destr_fix
;.text:0040D228                 push    esi
;.text:0040D229                 mov     esi, ecx
;.text:0040D22B                 mov     eax, [esi+1Ch]
org 0040D22Eh - shift
back_from_CEnvDescriptor__CEnvDescriptor_destr_fix:
;.text:0040D22E                 xor     ebx, ebx
;.text:0040D230                 cmp     eax, ebx



;.text:0043CF50 ; public: __thiscall CEnvDescriptor::CEnvDescriptor(void)
org 0043CF50h - shift
	jmp CEnvDescriptor__CEnvDescriptor_fix
;.text:0043CF50                 mov     eax, ecx
;.text:0043CF52                 xorps   xmm0, xmm0
org 0043CF55h - shift
back_from_CEnvDescriptor__CEnvDescriptor_fix:
;.text:0043CF55                 movss   xmm1, ds:dword_4D8D4C
;.text:0043CF5D                 movss   xmm2, ds:dword_4D8EA4
;.text:0043CF65                 xor     ecx, ecx


org 004CC04Ch - shift
LoadLibraryA dd ?
org 004CC08Ch - shift
GetProcAddress dd ?
org 004CC3D0h - shift
Debug dd ?
org 004CC3C8h - shift
xrDebug__fail dd ?

;.text:0043D070 ; public: void __thiscall CEnvDescriptor::load(char const *, char const *, class CEnvironment *)
org 0043D070h - shift
	jmp CEnvDescriptor__load_fix
;.text:0043D070                 push    ebp
;.text:0043D071                 mov     ebp, esp
;.text:0043D073                 and     esp, 0FFFFFFF8h
org 0043D076h - shift
back_from_CEnvDescriptor__load_fix:
;.text:0043D076                 sub     esp, 44Ch
;.text:0043D07C                 push    ebx
;.text:0043D07D                 push    esi
;.text:0043D07E                 push    edi


;.text:00439200 ; int __fastcall CEnvironment__OnFrame(int)
;.text:00439200
;.text:00439200                 push    ebp
;.text:00439201                 mov     ebp, esp
;.text:00439203                 and     esp, 0FFFFFFF8h
;.text:00439206                 sub     esp, 70h
;.text:00439209                 cmp     ds:?g_pGameLevel@@3PAVIGame_Level@@A, 0 ; IGame_Level * g_pGameLevel
;.text:00439210                 push    ebx
;.text:00439211                 push    ebp
;.text:00439212                 push    esi
;.text:00439213                 push    edi
;.text:00439214                 mov     edi, ecx
;.text:00439216                 jz      loc_439B29
;.text:0043921C                 cmp     byte ptr [edi+294h], 0
;.text:00439223                 jz      short loc_439236
;.text:00439225                 xorps   xmm0, xmm0
;.text:00439228                 comiss  xmm0, dword ptr [edi+298h]
;.text:0043922F                 jb      short loc_439236
;.text:00439231                 call    ?StopWFX@CEnvironment@@AAEXXZ ; CEnvironment::StopWFX(void)
;.text:00439236 loc_439236:
;.text:00439236                 fld     dword ptr [edi+168h]
;.text:0043923C                 push    ecx             ; float
;.text:0043923D                 mov     ecx, edi
;.text:0043923F                 fstp    [esp+84h+var_84]
;.text:00439242                 call    ?SelectEnvs@CEnvironment@@QAEXM@Z ; CEnvironment::SelectEnvs(float)
;.text:00439247                 mov     eax, [edi+290h]
;.text:0043924D                 fld     dword ptr [eax]
;.text:0043924F                 mov     ecx, [edi+28Ch]
;.text:00439255                 sub     esp, 0Ch
;.text:00439258                 fstp    [esp+8Ch+var_84]
;.text:0043925C                 fld     dword ptr [ecx]
;.text:0043925E                 mov     ecx, edi
;.text:00439260                 fstp    [esp+8Ch+var_88]
;.text:00439264                 fld     dword ptr [edi+168h]
;.text:0043926A                 fstp    [esp+8Ch+var_8C]
;.text:0043926D                 call    ?TimeWeight@CEnvironment@@AAEMMMM@Z ; CEnvironment::TimeWeight(float,float,float)
;.text:00439272                 xorps   xmm0, xmm0
;.text:00439275                 fstp    [esp+80h+var_68]
org 00439279h - shift
	jmp CEnvironment__OnFrame_dbg_fix
;.text:00439279                 mov     edx, ds:dword_50BE94
;.text:0043927F                 mov     ecx, ds:dword_50BE9C
org 00439285h - shift
back_from_CEnvironment__OnFrame_dbg_fix:
;.text:00439285                 mov     eax, ds:dword_50BE98

org 50BE94h - shift
dword_50BE94 dd ?
org 50BE9Ch - shift
dword_50BE9C dd ?

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; увеличение размера вершинного буфера
org 4B5BEAh - shift
	vb dd 600000h
org 4B5BFEh - shift
	vb_size dd 600000h ;180000h по умолчанию, 1,5 Мб

;;;;;;;;;;;;;;;;;;;;;;;;
; полноэкранные заставки
org 4D8F24h - shift
	hgt dd 768.0			; 256->768, высота заставки
	wdt dd 1024.0			; 512->1024, ширина заставки
	x dd 0.0				; 369->0, координаты левого нижнего угла, x
	y dd 0.0				; 257->0, координаты левого нижнего угла, y
	
; смена порядка отрисовки текста
org 41302Ah - shift
	jmp to_logo
org 41399Bh - shift
	jmp to_text
org 4135F4h - shift
	jmp to_end
org 413610h - shift
	jz text_rendering
	
org 4135FAh - shift
logo_rendering:
;org 413032h - shift
org 413539h - shift
text_rendering:
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; чтение архивов русской версии
; параметры декриптора базы данных
org 00509154h - shift
trivial_encryptor__m_encrypt_seed dd 131A9D3h 
org 005090D4h - shift
trivial_encryptor__m_table_seed dd 1329436h

;.text:004112E0 trivial_encryptor__initialize proc near ; CODE XREF: sub_411390+9p
;...
;.text:00411308                 mov     [ebp+var_4], 400h
org 00411308h - shift
	mov     dword ptr [ebp-4], 800h ; 7 байт

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; консольные команды

org 004B8022h - shift
	jmp con_comm
	
org 004C8FF7h - shift	
_atexit:
org 004100D0h - shift
CCC_Mask__CCC_Mask:
org 00410620h - shift
CCC_Float__CCC_Float:
org 00410D00h - shift
CCC_Integer__CCC_Integer:
org 00410960h - shift
CCC_Vector3__CCC_Vector3:
org 0050BBBCh - shift
Console dd ?
org 0050BC88h - shift
Device dd ?
org 004B8070h - shift
CConsole__AddCommand:
org 004B80A0h - shift
CConcole__RemoveCommand:
org 004D2550h - shift
IConsole_Command___vftable dd ?
org 004B9E10h - shift
sub_4B9E10:
org 0050E858h - shift
xCCC_Integer dd ?
org 004CC5CCh - shift
Msg dd ?
org 004CC59Ch - shift
Log dd ?
org 004CC1F8h - shift
__imp__sprintf_s dd ?
	
; массив констант R_constants
org 0050D3D4h - shift		
	dword_50D3D4 dd ?
org 0050D3D8h - shift		
	dword_50D3D8 dd ?
org 0050E3F4h - shift	
	dword_50E3F4 dd ?
org 0050E3F8h - shift
	dword_50E3F8 dd ?
org 00404340h - shift
R_constant_array__set:
org 0050C3D0h - shift
	RCache_constants_a_pixel dd ?
org 0050D3E0h - shift
	RCache_constants_a_pixel_b_dirty dd ?
org 0050D3F0h - shift
	RCache_constants_a_vertex dd ?
org 0050E400h - shift
	RCache_constants_a_vertex_b_dirty dd ?	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; погодные параметры
org 004CC590h - shift
	Memory dd ?
org 004CC598h - shift
	xrMemory__mem_alloc dd ?
org 004CC594h - shift
	xrMemory__mem_free dd ?
org 0050BB7Ch - shift
	g_pGamePersistent dd ?
org 004CC47Ch - shift
	CInifile__r_fvector3 dd ?


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; подготовка импортов для рендера
org 0048AA39h - shift
	jmp	load_table_address
org 0048AA3Eh - shift
back_to_load_table_address:
org 00509334h - shift
psDeviceFlags dd ?

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; перегрузка CBlender_Compile::SetMapping()
org 0048F280h - shift
	jmp	override_set_mapping
org 0048F286h - shift
back_to_set_mapping:
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; перегрузка CObject::UpdateCL()
org 00433620h - shift
	jmp	override_updatecl
org 00433628h - shift
back_to_updatecl:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; перегрузка CEffectRain::Render()
org 0050BB6Ch - shift 
Render dd ?
org 00443480h - shift
	jmp	cer__Render
org 00443486h - shift	
back_to_cer__Render:

org 004CC5CCh - shift
Msg dd ?
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; перегрузка CTextureDescrMngr::LoadLTX()
org 0049F4B6h - shift
	jmp load_ltx_overload
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; перегрузка CTextureDescrMngr::LoadTHM()
org 0049F800h - shift
	jmp load_thm_overload

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; время жизни блудмарков
org 004D8F60h - shift
wm_lifetime dd ?

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; переделка int CBlender_Compille::bDetail_Bump во флаг
org 0048D0E1h - shift
	jmp cblender_cpp_compile_hack
org 0048D0FCh - shift
back_from_cblender_cpp_compile_hack:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; фикс вертикальной синхронизации
org 0048A879h - shift
	jmp vsync_fix_1
org 0048A883h - shift
back_from_vsync_fix_1:

org 0048B095h - shift
	jmp vsync_fix_2
org 0048B09Ch - shift
back_from_vsync_fix_2:

org 0048B3C0h - shift
CHW__selectPresentInterval:

org 00479930h - shift
	jmp render_skeleton
org 00479B8Bh - shift
back_from_render_skeleton: