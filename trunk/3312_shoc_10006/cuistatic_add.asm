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
	
	push	esi
	mov 	esi, [ebp+arg_8]
	call	CUIStatic__AdjustWeigthToText
	pop		esi
	
	skip_weigth:
	
	;Делаем то что вырезали
	mov     ecx, [ebp+arg_0]
	push    0
	
	
	jmp back_from_cuistatic_xml_add
cuistatic_xml_add endp

aAdjustHeightToText db "adjust_height_to_text", 0
aAdjustWeigthToText db "adjust_width_to_text", 0
