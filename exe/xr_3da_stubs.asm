;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************

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
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; перегрузка CObject::UpdateCL()
org 00433620h - shift
	jmp	override_updatecl
	
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