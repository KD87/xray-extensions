; int this<eax>, int item<ebx>
CUITradeWnd__CanMoveToOther_fix proc
	; делаем своё
	; проверяем глобальный флажок
	push    eax
	mov     eax, [g_trade_filtration_active]
	test    eax, eax
	pop     eax
	jz      no_filtration
	; проверяем флажок явной установки торговли предмета
	push    eax
	push    ebx
	;mov     eax, [ebx]      ; item
	mov     eax, [ebx+132] ; флажки предмета
	and     eax, 01000h
	pop     ebx
	pop     eax
	jz      no_explicit_enable
	mov     eax, 1
	retn
no_explicit_enable:
	; проверяем флажок явного запрета торговли предмета
	push    eax
	push    ebx
	mov     eax, [ebx+132] ; флажки предмета
	and     eax, 02000h
	pop     ebx
	pop     eax
	jz      no_explicit_disable
	xor     eax, eax
	retn
no_explicit_disable:
;
no_filtration:
	; делаем то, что вырезали
	sub     esp, 1Ch
	push    esi
	mov     esi, eax
	mov     eax, [esi+5Ch]
	; идём обратно
	jmp     back_from_CUITradeWnd__CanMoveToOther_fix
CUITradeWnd__CanMoveToOther_fix endp

; логика раскраски следующая:
; 1. если do_colorize == 0, значит предмет не в инвентаре актора, не раскрашиваем
; 2. если предмет не продаётся по результату функции CUITradeWnd__CanMoveToOther,
;    что включает также и запрет по состоянию, то закрасить дефолтовым цветом с индексом 0 из палитры
; 3. если влючён флажок активности глобальной закраски и для предмета активен его локальный
;    флажок кастомной закраски, то использовать индекс из двух байт сразу за флагом
;    прочитать из палитры увет и закрасить им
CUITradeWnd__FillList_fix proc
this_           = dword ptr  4
do_colorize     = byte ptr  0Ch
	; делаем, что вырезали
	mov     edi, eax
	mov     ebx, [esi]      ; a2
	; проверяем движковый аргумент функции, чтобы не закрашивать объекты у торговца
	cmp     [esp+10h+do_colorize], 0 ; z set if do_colorize == 0
	jz     no_colorization
	;
	;mov     eax, [ebx+132] ; флажки предмета
	;test    eax, 01000h ; always_tradable
	;jnz     no_colorization ; продаваемый всегда, не устанавливаем цвет
	; здесь проверяем движковую раскраску
	mov     eax, [esp+10h+this_] ; this
	call    CUITradeWnd__CanMoveToOther
	test    al, al
	jnz     check_manual_colorization ; al == 1, можно торговать, идём проверять кастомную раскраску
	; а иначе красим в цвет с индексом 0 (обычно красный)
	mov     eax, [g_highlight_colors]
	push    eax
	jmp     manual_color_defined
check_manual_colorization:
	; проверяем, что активирован глобальный режим использования ручной раскраски
	cmp     [g_manual_highlignt_active], 1 ; z set if g_manual_highlignt_active == 1
	jnz     no_colorization ; флажок не установлен, поскольку тогуемость уже проверяли, то не раскаршиваем вовсе
	; проеряем флаг ручной раскраски
	mov     eax, [ebx+132] ; флажки предмета
	test    eax, 08000h ; пользовательский ii флажок "manual_highlighting"
	jz      no_colorization ; флажок не установлен, поскольку тогуемость уже проверяли, то не раскаршиваем вовсе
	; задано подсветить предмет кастомным цветом, индекс которого хранится в 4-х битах по смещению 134
	push    esi
	mov     esi, [ebx+134]
	and     esi, 0Fh
	mov     eax, [g_highlight_colors + esi*4]
	pop     esi
	push    eax
manual_color_defined:
	mov     eax, [edi]
	mov     edx, [eax+90h]
	mov     ecx, edi
	call    edx ; SetColor
no_colorization:
	; идём обратно
	jmp     back_from_CUITradeWnd__FillList_fix
CUITradeWnd__FillList_fix endp
