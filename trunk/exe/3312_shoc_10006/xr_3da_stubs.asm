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
org 004CC5C8h - shift
pSettings dd ?
org 0050BB7Ch - shift
g_GamePersistent dd ?

; члены вектора из примера
org 0050BEA0h - shift		
	dword_50BEA0 dd ?
org 0050BEA4h - shift		
	dword_50BEA4 dd ?
org 0050BEA8h - shift		
	dword_50BEA8 dd ?
	
; массив констант R_constants
org 0050C3D0h - shift		
	unk_50C3D0 dd ?
org 0050D3D4h - shift		
	dword_50D3D4 dd ?
org 0050D3D8h - shift		
	dword_50D3D8 dd ?
org 0050D3E0h - shift	
	dword_50D3E0 dd ?
org 0050D3F0h - shift	
	unk_50D3F0 dd ?
org 0050E3F4h - shift	
	dword_50E3F4 dd ?
org 0050E3F8h - shift
	dword_50E3F8 dd ?
org 0050E3F8h - shift
	dword_50E400 dd ?
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; консольные команды

org 004B8022h - shift
	jmp con_comm
	
org 004C8FF7h - shift	
_atexit:
org 00410620h - shift
CCC_Float__CCC_Float:
org 0050BBBCh - shift
Console dd ?
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

org 0043896Ch - shift
	jmp test_weather