;.text:1003D2B1                 push    3
;.text:1003D2B3                 push    2
;.text:1003D2B5                 push    3
;.text:1003D2B7                 push    1
;.text:1003D2B9                 push    0
;.text:1003D2BB                 lea     edx, [esp+630h+Dst]
;.text:1003D2C2                 push    edx
;.text:1003D2C3                 push    offset aS_bumpd ; "s_bumpD"
;.text:1003D2C8                 mov     ecx, ebp
;.text:1003D2CA                 call    esi ; CBlender_Compile::r_Sampler(char const *,char const *,bool,uint,uint,uint,uint) ; CBlender_Compile::r_Sampler(char const *,char const *,bool,uint,uint,uint,uint)
;.text:1003D2CC

add_detail_bump_sampler:
	cmp     dword ptr [ebp+44h], 0
	jz		no_detail_bump
	; detail texture
	push    3
	push    2
	push    3
	push    1
	push    0
	lea     edx, [esp+630h+Dst]
	push    edx
	push    offset aS_detail ; "s_detail"
	mov     ecx, ebp
	call    esi ; CBlender_Compile::r_Sampler(char const *,char const *,bool,uint,uint,uint,uint)
	
	; detail bump texture
	; измерим длину имени детальной текстуры
	lea     eax, [esp+61Ch+Dst]
	lea		edx, [eax+1]
check_dt_name_length:
	mov     cl, [eax]
	add     eax, 1
	test    cl, cl
	jnz     short check_dt_name_length
	sub		eax, edx
	; приклеим окончание _bump
	mov		esi, eax
	mov     eax, 100h
	push    offset aBump ; "_bump"
	sub     eax, esi
	push    eax 		; SizeInBytes
	lea     ecx, [esp+624h+Dst]
	push    ecx             ; Dst
	call    ds:strcat_s
;	lea		edx, [esp+628h+fn]
	add     esp, 0Ch
	push    3
	push    2
	push    3
	push    1
	push    0
	lea		edx, [esp+630h+Dst]
	push    edx
	push    offset aS_detailbump ; "s_detailbump"
	mov     ecx, ebp
	call    ds:CBlender_Compile__r_Sampler
	; измерим длину имени бампа детальной текстуры
	lea     eax, [esp+61Ch+Dst]
	lea		edx, [eax+1]
check_dt_bump_name_length:
	mov     cl, [eax]
	add     eax, 1
	test    cl, cl
	jnz     short check_dt_bump_name_length
	sub		eax, edx
	; приклеим окончание #
	mov		esi, eax
	mov     eax, 100h
	push    offset aBumpX ; "#"
	sub     eax, esi
	push    eax 		; SizeInBytes
	lea     ecx, [esp+624h+Dst]
	push    ecx             ; Dst
	call    ds:strcat_s
;	lea		eax, [esp+628h+Dst]
	add     esp, 0Ch
	push    3
	push    2
	push    3
	push    1
	push    0
	lea		edx, [esp+630h+Dst]
	push    edx
	push    offset aS_detailbumpX ; "s_detailbumpX"
	mov     ecx, ebp
	mov		esi, ds:CBlender_Compile__r_Sampler
	call	esi
	jmp	back_to_add_detail_bump_sampler
	
no_detail_bump:
	; detail bump texture
	push    3
	push    2
	push    3
	push    1
	push    0
	lea     edx, [esp+630h+Dst]
	push    edx
	push    offset aS_bumpd ; "s_bumpD"
	mov     ecx, ebp
	call    esi ; CBlender_Compile::r_Sampler(char const *,char const *,bool,uint,uint,uint,uint)
	; detail texture
	push    3
	push    2
	push    3
	push    1
	push    0
	lea     edx, [esp+630h+Dst]
	push    edx
	push    offset aS_detail ; "s_detail"
	mov     ecx, ebp
	call    esi ; CBlender_Compile::r_Sampler(char const *,char const *,bool,uint,uint,uint,uint)
	jmp	back_to_add_detail_bump_sampler

aS_detail db "s_detail", 0
aS_detailbump db "s_detailbump", 0
aS_detailbumpX db "s_detailbumpX", 0
aS_bumpd db "s_bumpD", 0
aBump db "_bump", 0
aBumpX db "#", 0
fn	= byte ptr -200h
Dst	= byte ptr -100h
	
