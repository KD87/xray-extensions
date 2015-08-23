CUICustomEdit_fix proc
	;PERFORM_EXPORT_CUIWND__FLOAT__VOID CUICustomEdit__GetTestValue, "get_test_value"

	;
	mov     ecx, eax
	xor     eax, eax
	lea     edi, [ebp-0Ch]
	;
	jmp back_from_CUICustomEdit_fix

CUICustomEdit_fix endp

;g_test_value dd  123.456

;CUICustomEdit__GetTestValue proc
;	fld     [g_test_value]
;	retn
;CUICustomEdit__GetTestValue endp

g_input_language dd 0 ; 0 - eng, 1 - rus

CUICustomEdit__KeyPressed_fix proc
	; 
	push ecx
	movzx ecx, byte ptr [g_input_language]
	test ecx, ecx
	jz use_latin
	cmp eax, 52
	ja use_latin
	movzx ecx, byte ptr [g_rus_char_map + eax]
	test ecx, ecx
	jz use_latin
	pop edi ; парный к push ecx
	pop edi
	jmp letter_inserting
use_latin:
	pop ecx
	;
	call    gs_DIK2CHR_find
	mov     eax, [eax]
	cmp     dword_10560904, eax
	pop     edi
	jz      loc_103F4B42
	movzx   ecx, byte ptr [eax+10h]
	; --
letter_inserting:
	push    ecx
	mov     ecx, ebp
	;
	jmp back_from_CUICustomEdit__KeyPressed_fix
CUICustomEdit__KeyPressed_fix endp

;g_test_input_letter db 'я'

;                 ? esc 1 2 3 4 5 6 7 8 9 0 - = bk tb "qwertyuiop[]" ret lc "asdfghjkl;'" gr ls bs "zxcvbnm,." last - 52
g_rus_char_map db 0,0,  0,0,0,0,0,0,0,0,0,0,0,0, 0, 0,"йцукенгшщзхъ",  0, 0,"фывапролджэ", 0, 0, 0,"ячсмитьбю"

CUICustomEdit__KeyPressed_fix_1 proc ; обаботка нажатия 'х'
	mov     bl, byte ptr [g_input_language]
	test    bl, bl
	jz      use_latin
	mov     bl, [ebp+0E9h]
	test    bl, bl
	mov     bl, 'х'
	jz      go_on
	mov     bl, 'Х'
	jmp     go_on
use_latin:
	mov     bl, [ebp+0E9h]  ; jumptable 103F4C09 case 14
	neg     bl
	sbb     bl, bl
	and     bl, 20h
	add     bl, 5Bh
go_on:
	;
	jmp back_from_CUICustomEdit__KeyPressed_fix_1
CUICustomEdit__KeyPressed_fix_1 endp

CUICustomEdit__KeyPressed_fix_2 proc ; обаботка нажатия 'ъ'
	mov     bl, byte ptr [g_input_language]
	test    bl, bl
	jz      use_latin
	mov     bl, [ebp+0E9h]
	test    bl, bl
	mov     bl, 'ъ'
	jz      go_on
	mov     bl, 'Ъ'
	jmp     go_on
use_latin:
	mov     bl, [ebp+0E9h]  ; jumptable 103F4C09 case 15
	neg     bl
	sbb     bl, bl
	and     bl, 20h
	add     bl, 5Dh
go_on:
	jmp back_from_CUICustomEdit__KeyPressed_fix_2
CUICustomEdit__KeyPressed_fix_2 endp

CUICustomEdit__KeyPressed_fix_3 proc ; 'жЖ'
	mov     bl, byte ptr [g_input_language]
	test    bl, bl
	jz      use_latin
	mov     bl, [ebp+0E9h]
	test    bl, bl
	mov     bl, 'ж'
	jz      go_on
	mov     bl, 'Ж'
	jmp     go_on
use_latin:
	cmp     byte ptr [ebp+0E9h], 0 ; jumptable 103F4C09 case 27
	setz    bl
	add     bl, 3Ah
go_on:
	jmp back_from_CUICustomEdit__KeyPressed_fix_3
CUICustomEdit__KeyPressed_fix_3 endp

CUICustomEdit__KeyPressed_fix_4 proc ; 'эЭ'
	mov     bl, byte ptr [g_input_language]
	test    bl, bl
	jz      use_latin
	mov     bl, [ebp+0E9h]
	test    bl, bl
	mov     bl, 'э'
	jz      go_on
	mov     bl, 'Э'
	jmp     go_on
use_latin:
	mov     bl, [ebp+0E9h]  ; jumptable 103F4C09 case 28
	neg     bl
	sbb     bl, bl
	and     bl, 0FBh
	add     bl, 27h
go_on:
	jmp back_from_CUICustomEdit__KeyPressed_fix_4
CUICustomEdit__KeyPressed_fix_4 endp

CUICustomEdit__KeyPressed_fix_5 proc ; 'бБ'
	mov     bl, byte ptr [g_input_language]
	test    bl, bl
	jz      use_latin
	mov     bl, [ebp+0E9h]
	test    bl, bl
	mov     bl, 'б'
	jz      go_on
	mov     bl, 'Б'
	jmp     go_on
use_latin:
	mov     bl, [ebp+0E9h]  ; jumptable 103F4C09 case 39
	neg     bl
	sbb     bl, bl
	and     bl, 10h
	add     bl, 2Ch
go_on:
	jmp back_from_CUICustomEdit__KeyPressed_fix_5
CUICustomEdit__KeyPressed_fix_5 endp

CUICustomEdit__KeyPressed_fix_6 proc ; 'юЮ'
	mov     bl, byte ptr [g_input_language]
	test    bl, bl
	jz      use_latin
	mov     bl, [ebp+0E9h]
	test    bl, bl
	mov     bl, 'ю'
	jz      go_on
	mov     bl, 'Ю'
	jmp     go_on
use_latin:
	mov     bl, [ebp+0E9h]  ; jumptable 103F4C09 case 40
	neg     bl
	sbb     bl, bl
	and     bl, 10h
	add     bl, 2Eh
go_on:
	jmp back_from_CUICustomEdit__KeyPressed_fix_6
CUICustomEdit__KeyPressed_fix_6 endp

CUICustomEdit__KeyPressed_fix_7 proc ; '.,'
	mov     bl, byte ptr [g_input_language]
	test    bl, bl
	jz      use_latin
	mov     bl, [ebp+0E9h]
	test    bl, bl
	mov     bl, '.'
	jz      go_on
	mov     bl, ','
	jmp     go_on
use_latin:
	mov     bl, [ebp+0E9h]  ; jumptable 103F4C09 case 41
	neg     bl
	sbb     bl, bl
	and     bl, 10h
	add     bl, 2Fh
go_on:
	jmp back_from_CUICustomEdit__KeyPressed_fix_7
CUICustomEdit__KeyPressed_fix_7 endp
