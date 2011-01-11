ALIGN_8
game_object_fix proc
; делаем то, что вырезали 
	call    enable_vision_register
; добавляем своё
	; регистрируем функцию разрешения колбеков на нажатия и мышь
	mov     ecx, eax
	mov     byte ptr [esp+58h-38h], bl
	mov     eax, [esp+58h-38h]
	push    eax
	mov     byte ptr [esp+5Ch-40h], bl
	mov     edx, [esp+5Ch-40h]
	push    edx
	push    offset aEnable_Input_Extensions ; "enable_input_extensions"
	lea     eax, [esp+64h-48h]
	mov     ebx, ecx
	mov     [esp+64h-48h], offset enable_input_extensions
	call    enable_vision_register
	; регистрируем функцию получения топлива у машины
	xor ebx, ebx
	mov     byte ptr [esp+88h-74h], bl
	mov     ecx, [esp+88h-74h]
	push    ecx
	mov     byte ptr [esp+8Ch-6Ch], bl
	mov     edx, [esp+8Ch-6Ch]
	push    edx
	lea     ecx, [esp+90h-64h]
	push    ecx
	push    offset aGet_fuel ; "get_fuel"
	push    eax
	mov     [esp+9Ch-64h], offset CScriptGameObject__GetFuel
	call    register_get_bleeding
	; регистрируем функцию получения потребления топлива у машины
	xor ebx, ebx
	mov     byte ptr [esp+88h-74h], bl
	mov     ecx, [esp+88h-74h]
	push    ecx
	mov     byte ptr [esp+8Ch-6Ch], bl
	mov     edx, [esp+8Ch-6Ch]
	push    edx
	lea     ecx, [esp+90h-64h]
	push    ecx
	push    offset aGet_fuel_consumption ; "get_fuel_consumption"
	push    eax
	mov     [esp+9Ch-64h], offset CScriptGameObject__GetFuelConsumption
	call    register_get_bleeding
	; регистрируем функцию получения объёма бака у машины
	xor bl, bl
	mov     byte ptr [esp+88h-74h], bl
	mov     ecx, [esp+88h-74h]
	push    ecx
	mov     byte ptr [esp+8Ch-6Ch], bl
	mov     edx, [esp+8Ch-6Ch]
	push    edx
	lea     ecx, [esp+90h-64h]
	push    ecx
	push    offset aGet_fuel_tank ; "get_fuel_tank"
	push    eax
	mov     [esp+9Ch-64h], offset CScriptGameObject__GetFuelTank
	call    register_get_bleeding
	; регистрируем функцию установки топлива у машины
	mov     ebx, eax
	xor     al, al
	mov     byte ptr [esp+88h-6Ch], al
	mov     ecx, [esp+88h-6Ch]
	mov     byte ptr [esp+88h-64h], al
	mov     eax, [esp+88h-64h]
	push    eax
	push    ecx
	push    offset aSet_fuel ; "set_fuel"
	lea     eax, [esp+94h-74h]
	mov     [esp+94h-74h], offset CScriptGameObject__SetFuel
	call    register_set_actor_direction
	; регистрируем функцию установки потребления топлива у машины
	mov     ebx, eax
	xor     al, al
	mov     byte ptr [esp+88h-6Ch], al
	mov     ecx, [esp+88h-6Ch]
	mov     byte ptr [esp+88h-64h], al
	mov     eax, [esp+88h-64h]
	push    eax
	push    ecx
	push    offset aSet_fuel_consumption ; "set_fuel_consumption"
	lea     eax, [esp+94h-74h]
	mov     [esp+94h-74h], offset offset CScriptGameObject__SetFuelConsumption
	call    register_set_actor_direction
	; идём обратно
	jmp back_from_game_object_fix
game_object_fix endp

aEnable_Input_Extensions db "enable_input_extensions", 0
aGet_fuel db "get_fuel", 0
aSet_fuel db "set_fuel", 0
aGet_fuel_consumption db "get_fuel_consumption", 0
aSet_fuel_consumption db "set_fuel_consumption", 0
aGet_fuel_tank db "get_fuel_tank", 0

ALIGN_8
input_extensions_enabled dd 0

ALIGN_8
enable_input_extensions    proc near               ; DATA XREF: script_register_game_object2+51Fo
arg_0           = byte ptr  8
	mov eax, [ebp+4]
	mov [input_extensions_enabled], eax
	retn 4
enable_input_extensions    endp

CScriptGameObject__GetFuel proc
var_4 = dword ptr -4

	push    ebp
	mov     ebp, esp
	
	call CScriptGameObject__get_car
	
	; this + 1256 ; fuel
	; this +  1260 ; fuel_tank
	; this +  1264 ; fuel_consumption
	fld     dword ptr [eax + 1256] ; 
	
	pop     ebp
	retn
CScriptGameObject__GetFuel endp

CScriptGameObject__GetFuelConsumption proc
	call CScriptGameObject__get_car
	fld     dword ptr [eax + 1264]
	retn
CScriptGameObject__GetFuelConsumption endp

CScriptGameObject__GetFuelTank proc
	call CScriptGameObject__get_car
	fld     dword ptr [eax + 1260]
	retn
CScriptGameObject__GetFuelTank endp


CScriptGameObject__SetFuel proc
dir = dword ptr  8
	push    ebp
	mov     ebp, esp
	push    ebx
	push    eax
	
	call CScriptGameObject__get_car
	
	mov     ebx, [ebp+dir]
	mov     [eax + 1256], ebx
	
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
	mov     [eax + 1264], ebx
	
	pop     eax
	pop     ebx
	pop     ebp
	retn    4
CScriptGameObject__SetFuelConsumption endp

