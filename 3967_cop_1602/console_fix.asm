; Добавляет консольные команды:
;  	cam_fov 		- угол обзора игрока
;  	hud_fov 		- дистанция от камеры до худа оружия
;	ph_timefactor	- скорость течения времени при просчете физики

; Флаг. Показывает, что консольные команды инициализированы
CommandCreated	dd	0

; Параметры консольной команды fov
fov_min		REAL4	55.0				; минимальное значение
fov_max		REAL4	90.0				; максимальное значение
fov_cmd		db 		"cam_fov",0			; название
g_fov_ccc	db 		36 dup(?)			;CCC_Float g_fov_ccc

; Параметры консольной команды hud_fov
hud_fov_min	REAL4	0.0					; минимальное значение
hud_fov_max	REAL4	1.0					; максимальное значение
hud_fov_cmd	db 		"hud_fov",0			; название
g_hud_fov_ccc	db 	36 dup(?)			;CCC_Float g_hud_fov_ccc

; Параметры консольной команды ph_timefactor
ph_tf_min	REAL4	0.0					; минимальное значение
ph_tf_max	REAL4	10.0				; максимальное значение
ph_tf_cmd	db 		"ph_timefactor",0	; название
g_ph_tf_ccc	db 		36 dup(?)			;CCC_Float g_ph_tf_ccc

; По факту деструктор статической переменной g_fov_ccc
fov_dtor proc
	mov     ecx, offset g_fov_ccc
	jmp     ds:_1CCC_Float_ ; CCC_Float::~CCC_Float(void)
fov_dtor endp

; По факту деструктор статической переменной g_hud_fov_ccc
hud_fov_dtor proc
	mov     ecx, offset g_hud_fov_ccc
	jmp     ds:_1CCC_Float_ ; CCC_Float::~CCC_Float(void)
hud_fov_dtor endp

; По факту деструктор статической переменной g_ph_tf_ccc
ph_tf_dtor proc
	mov     ecx, offset g_ph_tf_ccc
	jmp     ds:_1CCC_Float_ ; CCC_Float::~CCC_Float(void)
ph_tf_dtor endp

; Регистрация консольных команд
CCC_RegisterCommands_chunk_0 proc
var_10          = dword ptr -10h
var_C           = dword ptr -0Ch

;проверяем, что команда еще не создана
	mov     eax, 1
	test    CommandCreated, eax
	jnz     m1
	fld     ds:fov_max
	or      CommandCreated, eax
	
; вызов конструктора
	sub     esp, 8
	fstp    [esp+10h+var_C]
	fld     ds:fov_min
	fstp    [esp+10h+var_10]
	push    offset g_fov
	push    offset fov_cmd
	mov     ecx, offset g_fov_ccc
	call    ds:_CCC_Float_ 			; CCC_Float::CCC_Float(char const *,float *,float,float)

; регистрируем деструктор статического объекта
	push    offset fov_dtor
	call    _atexit
	add     esp, 4

m1: 
; регистрация консольной команды
	mov     edx, ds:_Console_ 		; CConsole * Console
	mov     ecx, [edx]
	push    offset g_fov_ccc
	call    esi 					; CConsole::AddCommand(IConsole_Command *) ; CConsole::AddCommand(IConsole_Command *)

	mov     eax, 2
	test    CommandCreated, eax
	jnz     m2
	fld     ds:hud_fov_max
	or      CommandCreated, eax
	sub     esp, 8
	fstp    [esp+10h+var_C]
	fld     ds:hud_fov_min
	fstp    [esp+10h+var_10]
	push    00490624h ; float psHUD_FOV
	push    offset hud_fov_cmd
	mov     ecx, offset g_hud_fov_ccc
	call    ds:_CCC_Float_ ; CCC_Float::CCC_Float(char const *,float *,float,float)
	push    offset hud_fov_dtor ; void (__cdecl *)()
	call    _atexit
	add     esp, 4

m2: 
	mov     edx, ds:_Console_ ; CConsole * Console
	mov     ecx, [edx]
	push    offset g_hud_fov_ccc
	call    esi ; CConsole::AddCommand(IConsole_Command *) ; CConsole::AddCommand(IConsole_Command *)

;проверяем, что команда еще не создана
	mov     eax, 4
	test    CommandCreated, eax
	jnz     m3
	fld     ds:ph_tf_max
	mov     ecx, ds:_phTimefactor_ ;  float phTimefactor
	or      CommandCreated, eax
	
; вызов конструктора	
	sub     esp, 8
	fstp    [esp+10h+var_C]
	fld     ds:ph_tf_min
	fstp    [esp+10h+var_10]
	push    ecx
	push    offset ph_tf_cmd
	mov     ecx, offset g_ph_tf_ccc
	call    ds:_CCC_Float_ ; CCC_Float::CCC_Float(char const *,float *,float,float)
	
; регистрируем деструктор статического объекта	
	push    offset ph_tf_dtor ; void (__cdecl *)()
	call    _atexit
	add     esp, 4

m3: 
; регистрация консольной команды
	mov     edx, ds:_Console_ ; CConsole * Console
	mov     ecx, [edx]
	push    offset g_ph_tf_ccc
	call    esi ; CConsole::AddCommand(IConsole_Command *) ; CConsole::AddCommand(IConsole_Command *)

; выполняем замененный в месте вставки код
	mov     eax, 4000h
	
; возвращаем управление обратно
	jmp		CCC_RegisterCommands_1
CCC_RegisterCommands_chunk_0 endp
