;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************
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
; добавление переменных в шейдера
org 0048F3B7h - shift
	jmp shaders_mapping
org 0048F3BCh - shift
back_to_shaders_mapping:
org 0048DD30h - shift	
CBlender_Compile__r_Constant:
org 004CC3F4h - shift
CInifile__r_float dd ?
org 004CC3E4h - shift
CInifile__r_string dd ?
org 004CC5C8h - shift
pSettings dd ?
org 0050BB7Ch - shift
g_GamePersistent dd ?
	
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
; проверка режима зума для шейдеров
org 00433639h - shift
	jmp cobject_check
org 0043363Fh - shift
back_to_cobject_check:

org 0050BE84h - shift
timer dd ?

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

org 0043D424h - shift
	jmp	envdescriptor_hack_load
org 0043D44Eh - shift
back_to_envdescriptor_hack_load:	
org 00443538h - shift
	jmp	envdescriptor_hack_rain_color_fix
org 00443562h - shift
back_to_envdescriptor_hack_rain_color_fix:	
org 0043E1DEh - shift
	jmp	descriptor_mixer_lerp
org 0043E244h - shift
back_to_descriptor_mixer_lerp:	
org 0040D603h - shift
	jmp	descriptor_copy_operator
org 0040D615h - shift
back_to_descriptor_copy_operator:	
org 0040D426h - shift
	jmp	descriptor_copy_constructor
org 0040D438h - shift
back_to_descriptor_copy_constructor:	
org 0040D312h - shift
	jmp	envdescriptor_hack_destructor
; угол падения капель
org 00442E05h - shift
	jmp rain_drop_angle
org 00442E0Bh - shift
back_to_rain_drop_angle:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; таймер дождя
org 0050BB78h - shift
g_pGameLevel dd ?
org 00442FA0h - shift
CEffect_Rain__RayPick:

org 00443480h - shift
	jmp	CEffectsRain__Render_rain_timer
org 004434C3h - shift
back_to_CEffectsRain__Render_rain_timer:	
org 00444811h - shift
exit_CEffectsRain__Render:
