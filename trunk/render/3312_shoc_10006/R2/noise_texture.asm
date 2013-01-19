noise_texture:
	xor		ecx, ecx
	mov		[edi+18Ch], ecx
	mov     ecx, ds:HW
	mov     edx, [ecx+8]
	lea		ebx, [edi+188h]			; t_noise_hd_surf
	; создадим DirectX-текстуру под шум
	push    ebx
	mov     esi, 1
	push    esi
	push    3Fh
	push    0
	push    esi
	mov		ecx, [edi+8]
	push	ecx
	;push    200h
	mov		ecx, [edi+4]
	;push    200h
	push	ecx
	push    edx
	call    _D3DXCreateTexture ; D3DXCreateTexture(x,x,x,x,x,x,x,x)
	test    eax, eax
	; если не вышло - вылетаем
	jge     short loc_3A77712
	mov     ecx, ds:Debug
	push    offset byte_3AA95E7
	push    offset aCrendertargetC ; "CRenderTarget::CRenderTarget"
	push    1A8h
	push    offset atest ; "E:\\stalker\\sources\\trunk\\xr_3da\\xrRende"...
	push    offset atest ; "D3DXCreateTexture (HW.pDevice,TEX_jitte"...
	push    eax
	call    ds:xrDebug__error
loc_3A77712:                          
	; создадим внутриигровую текстуру (CTexture) под шум 
	mov     ecx, ds:Device
	mov     ecx, [ecx+1D4h]
	lea     eax,  offset aUserJitter_5 ; "$user$jitter_5"
	push    eax
	call    ds:CResourceManager___CreateTexture
	test    eax, eax
	mov     [esp+378h-35Ch], eax
	jz      short loc_3A7773B
	add     [eax+4], esi
	mov     eax, [esp+378h-35Ch]
loc_3A7773B:                       
	test    eax, eax
	mov     [esp+378h-348h], eax
	jz      short loc_3A77746
	add     [eax+4], esi
loc_3A77746:                         
	lea     esi, [ebx+4]
	; обычная лабуда с пересчетом ссылок в умных указателях на текстуру
	mov     ecx, esi
	call    ds:resptr_base_CTexture____dec
	mov     edx, [esp+378h-348h]
	lea     ecx, [esp+378h-35Ch]
	mov     [esi], edx
	call    ds:resptr_base_CTexture____dec
	; устанавливаем соответствие между созданной DirectX текстурой и внутриигровой текстурой
	mov     eax, [ebx]
	mov     ecx, [esi]
	push    eax
	call    ds:CTexture__surface_set
	mov     edx, [esp+378h-358h]
	mov     eax, [ebx]
	mov     ecx, [eax]
	; лочим текстуру, в edx берем указатель на объект типа D3DLOCKED_RECT
	push    0
	push    0
	push    edx
	push    0
	push    eax
	mov     eax, [ecx+4Ch]
	call    eax					; HRESULT LockRect( [in] UINT Level, [out]D3DLOCKED_RECT *pLockedRect, [in] const RECT *pRect, [in] DWORD Flags )
	test    eax, eax
	jge     short loc_3A777B4
	; вылетаем, если не получилось залочить
	mov     ecx, ds:Debug
	push    offset byte_3AA95E7
	push    offset aCrendertargetC ; "CRenderTarget::CRenderTarget"
	push    1ABh
	push    offset atest ; "E:\\stalker\\sources\\trunk\\xr_3da\\xrRende"...
	push    offset atest ; "t_noise_surf[it]->LockRect (0,&R[it],0,"...
	push    eax
	call    ds:xrDebug__error
	; заполняем буфер в D3DLOCKED_RECT нужными данными
	
loc_3A777B4:
	xor     ebx, ebx
loc_3A777D2:  
	xor     esi, esi
loc_3A777D4:         
	lea     ecx, [esp+378h-318h]
	push    ecx             ; dest
	call    generate_jitter ; generate_jitter(ulong *,uint)
	add     esp, 4
	xor     eax, eax
	mov     edx, [esp+378h-308h]
	mov     ecx, [esp+378h-318h]
	imul    edx, ebx
	add     edx, [esp+378h-304h]
	mov     [edx+esi], ecx
	add     esi, 4
	mov		ecx, [edi+4]
	shl		ecx, 2
	cmp     esi, ecx
	jb      short loc_3A777D4
	add     ebx, 1
	mov		esi, [edi+8]
	cmp     ebx, esi
	;cmp     ebx, 200h				
	jb      short loc_3A777D2
	mov     ebx, ds:xrDebug__error
	lea     eax, [edi+188h]
	mov     esi, eax
loc_3A77826:                     
	mov     eax, [esi]
	mov     edx, [eax]
	; разлочиваем текстуру.
	push    0
	push    eax
	mov     eax, [edx+50h]
	call    eax					; HRESULT UnlockRect( [in]  UINT Level );
	test    eax, eax
	jge     short loc_3A77861
	mov     ecx, ds:Debug
	push    offset byte_3AA95E7
	push    offset aCrendertargetC ; "CRenderTarget::CRenderTarget"
	push    1BDh
	push    offset atest ; "E:\\stalker\\sources\\trunk\\xr_3da\\xrRende"...
	push    offset atest ; "t_noise_surf[it]->UnlockRect(0)"
	push    eax
	call    ebx ; xrDebug::error(long,char const *,char const *,int,char const *,bool &) ; xrDebug::error(long,char const *,char const *,int,char const *,bool &)
loc_3A77861:                           
	mov     ebx, ds:resptrcode_shader__create1 ; resptrcode_shader::create(char const *,char const *,char const *,char const *)  
	push	0
	push	0
	push	0
	jmp	back_to_noise_texture
	
	
aCrendertargetC db "CRenderTarget::CRenderTarget", 0
atest db "just test", 0
byte_3AA95E7 db 0
aUserJitter_5 db "$user$jitter_5", 0