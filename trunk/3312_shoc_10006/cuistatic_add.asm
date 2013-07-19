;Изначально я собирался сделать функции для вызова AdjustHeightToText и AdjustWeithToText. Но у меня не получалось и я сделал xmk параметр. Теперь создаем дефолтную секцию в xml и кастомизируем ее


cuistatic_xml_add proc
arg_0= dword ptr  8
arg_8= dword ptr  10h



	mov     ecx, [ebp+arg_0]
	push    0
	push    offset aAdjustHeightToText ; "AdjustHeightToText"
	push    esi
	push    edi
	call    ebx ; CXml::ReadAttribInt(char const *,int,char const *,int) ; CXml::ReadAttribInt(char const *,int,char const *,int)
	test    eax, eax
	jz      short skip_height
	
	push	edi
	mov 	edi, [ebp+arg_8]
	call	CUIStatic__AdjustHeightToText
	pop		edi
	
	skip_height:
	
	mov     ecx, [ebp+arg_0]
	push    0
	push    offset aAdjustWeigthToText ; "AdjustWeigthToText"
	push    esi
	push    edi
	call    ebx ; CXml::ReadAttribInt(char const *,int,char const *,int) ; CXml::ReadAttribInt(char const *,int,char const *,int)
	test    eax, eax
	jz      short skip_weigth
	
	push	edi
	mov 	edi, [ebp+arg_8]
	call	CUIStatic__AdjustWeigthToText
	pop		edi
	
	skip_weigth:
	
	;Делаем то что вырезали
	mov     ecx, [ebp+arg_0]
	push    0
	
	
	jmp back_from_cuistatic_xml_add
cuistatic_xml_add endp

aAdjustHeightToText db "adjust_height_to_text", 0
aAdjustWeigthToText db "adjust_weigth_to_text", 0

aSetTextComplexMode db "SetTextComplexMode", 0
aSetcolor db "SetColor", 0
AdjustHeightToText db "AdjustHeightToText", 0
AdjustWidthToText db "AdjustWidthToText", 0

CUIStatic__script_register_1:
	; Вырезанное
	xor		ecx, ecx
	push	ecx
	mov		ecx, offset CUIStatic__SetColor
	push	ecx
	push	offset aSetcolor
	push	ecx
	
	; Наше
	xor		ecx, ecx
	push	ecx
	mov		ecx, offset CUIStatic__SetTextComplexMode_script
	push	ecx
	push	offset aSetTextComplexMode
	push	ecx
	
	xor		ecx, ecx
	push	ecx
	mov		ecx, offset CUIStatic__AdjustHeightToText_script
	push	ecx
	push	offset AdjustHeightToText
	push	ecx	

	xor		ecx, ecx
	push	ecx
	mov		ecx, offset CUIStatic__AdjustWeigthToText_script
	push	ecx
	push	offset AdjustWidthToText
	push	ecx
	
	jmp		CUIStatic__script_register_1_back

CUIStatic__script_register_2:
	call	CUIStatic__uint_register
	pop		ecx
	push	eax
	
	call	CUIStatic__uint_register
	pop		ecx
	push	eax

	call	CUIStatic__uint_register
	pop		ecx
	push	eax	
	
	call	CUIStatic__uint_register
	
	jmp		CUIStatic__script_register_2_back

CUIStatic__SetTextComplexMode_script proc
	push 	edi
	push	[esp+8]	
	mov 	edi, ecx
	call	CUIStatic__SetTextComplexMode
	pop		edi

	retn 	4
CUIStatic__SetTextComplexMode_script endp

CUIStatic__AdjustHeightToText_script proc
	push	edi
	mov		edi, ecx
	call	CUIStatic__AdjustHeightToText
	pop		edi
	
	retn	4
CUIStatic__AdjustHeightToText_script endp
	
CUIStatic__AdjustWeigthToText_script proc
	push	edi
	mov		edi, ecx
	call	CUIStatic__AdjustWeigthToText
	pop		edi
	
	retn	4
CUIStatic__AdjustWeigthToText_script endp
