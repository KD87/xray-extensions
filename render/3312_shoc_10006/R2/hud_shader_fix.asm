g_map_hud_emissive FixedMAP_float_MatrixItemS {0,0,0}
g_map_hud_sorted FixedMAP_float_MatrixItemS {0,0,0}

CRender_constructor_fix proc
	xor eax, eax
	mov ds:[g_map_hud_emissive.nodes], eax
	mov ds:[g_map_hud_emissive.pool], eax
	mov ds:[g_map_hud_emissive.limit], eax
	;
	mov ds:[g_map_hud_sorted.nodes], eax
	mov ds:[g_map_hud_sorted.pool], eax
	mov ds:[g_map_hud_sorted.limit], eax
	;
	retn
CRender_constructor_fix endp

hud_shader_fix proc
distSQ          = dword ptr -0A0h
SSA_            = dword ptr -09Ch

	test    al, 4
	lea     edi, [esp+0B0h+distSQ]
	;
	push eax ; сохраняем флаги шейдера
	;
	jz      short not_strict_sorting
	;lea     eax, [edx+160h] ; mapSorted
	lea     eax, [g_map_hud_sorted]
	call    FixedMAP__MatrixItemS__insertInAnyWay
	movss   xmm0, [esp+0B0h+SSA_]
	movss   dword ptr [eax+4], xmm0
	mov     edx, RI_val_pObject
	mov     [eax+8], edx

hud_common_ending:
	mov     [eax+0Ch], ebx
	mov     esi, RI_val_pTransform
	lea     edi, [eax+10h]
	mov     ecx, 10h
	rep movsd
	mov     [eax+50h], ebp
	;
	jmp add_emissive 
	pop eax
	
	pop     edi
	pop     esi
	pop     ebp
	add     esp, 0A4h
	retn    4
not_strict_sorting:
	lea     eax, [edx+16Ch] ; mapHud
	call    FixedMAP__MatrixItemS__insertInAnyWay
	movss   xmm0, [esp+0B0h+SSA_]
	movss   dword ptr [eax+4], xmm0
	mov     ecx, RI_val_pObject
	mov     [eax+8], ecx
	jmp     short hud_common_ending


add_emissive:
	pop eax ; восстанавливаем флаги
	test    al, 8           ; emissive
	jz      not_emissive

	; добавляем шейдер свечения
	mov     edx, [esp+0B0h+4]
	
	;lea     eax, [edx+19Ch] ; emissive
	;lea     eax, [edx+16Ch] ; hud
	lea     eax, [g_map_hud_emissive]
	
	lea     edi, [esp+0B0h+distSQ]
	call    FixedMAP__MatrixItemS__insertInAnyWay
	movss   xmm0, [esp+0B0h+SSA_]
	movss   dword ptr [eax+4], xmm0
	mov     ecx, RI_val_pObject
	mov     [eax+8], ecx
	mov     [eax+0Ch], ebx
	mov     esi, RI_val_pTransform
	lea     edi, [eax+10h]
	mov     ecx, 10h
	rep movsd
	mov     edx, [ebx+40h]
	mov     ecx, [edx+18h]
	mov     edx, [esp+0B0h+4]
	mov     [eax+50h], ecx
not_emissive:
	; делаем вырезанное
	pop     edi
	pop     esi
	pop     ebp
	add     esp, 0A4h
	retn    4
hud_shader_fix endp

R_dsgraph_structure__r_dsgraph_render_hud_emissive proc near
var_98          = dword ptr -98h
var_84          = dword ptr -84h
var_80          = byte ptr -80h
var_40          = byte ptr -40h
arg_0           = dword ptr  4

	sub     esp, 84h
	mov     eax, ds:Device
	push    ebx
	push    ebp
	mov     ebp, [esp+8Ch+arg_0]
	push    esi
	push    edi
	lea     ebx, [eax+27Ch]
	mov     ecx, 10h
	mov     esi, ebx
	lea     edi, [esp+94h+var_80]
	rep movsd
	lea     esi, [eax+2BCh]
	mov     ecx, 10h
	lea     edi, [esp+94h+var_40]
	rep movsd
	mov     ecx, ds:g_pGamePersistent
	mov     edx, [ecx]
	mov     ecx, [edx+46Ch]
	movss   xmm0, dword ptr [ecx+1B4h]
	mov     edx, ds:psHUD_FOV
	movss   [esp+94h+var_84], xmm0
	movss   xmm0, dword ptr [eax+33Ch]
	mulss   xmm0, dword ptr [edx]
	mulss   xmm0, ds:dword_1006E430
	mulss   xmm0, ds:flt_1006E3E8
	push    ecx             ; float
	movss   [esp+98h+var_98], xmm0
	call    sub_1000D380
	fld1
	mov     eax, ds:Device
	fdivrp  st(1), st
	movss   xmm1, [esp+98h+var_84]
	movss   xmm2, dword_1007981C
	movaps  xmm0, xmm1
	subss   xmm0, ds:flt_1006E3FC
	divss   xmm1, xmm0
	xorps   xmm0, xmm0
	add     esp, 4
	fld     dword ptr [eax+340h]
	fmul    st, st(1)
	movss   dword ptr [ebx+4], xmm0
	movss   dword ptr [ebx+8], xmm0
	movss   dword ptr [ebx+0Ch], xmm0
	movss   dword ptr [ebx+10h], xmm0
	movss   dword ptr [ebx+18h], xmm0
	fstp    dword ptr [ebx]
	movss   dword ptr [ebx+1Ch], xmm0
	movss   dword ptr [ebx+20h], xmm0
	fstp    dword ptr [ebx+14h]
	movss   dword ptr [ebx+24h], xmm0
	movss   dword ptr [ebx+30h], xmm0
	movss   dword ptr [ebx+34h], xmm0
	movss   dword ptr [ebx+3Ch], xmm0
	movss   dword ptr [ebx+28h], xmm1
	mulss   xmm1, ds:dword_1006E644
	movss   dword ptr [ebx+2Ch], xmm2
	movss   dword ptr [ebx+38h], xmm1
	mov     edx, ds:Device
	movss   xmm0, dword ptr [edx+2ACh]
	mulss   xmm0, dword ptr [edx+248h]
	movss   xmm1, dword ptr [edx+244h]
	mulss   xmm1, dword ptr [edx+29Ch]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [edx+240h]
	mulss   xmm1, dword ptr [edx+28Ch]
	lea     eax, [edx+23Ch]
	lea     ecx, [edx+27Ch]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx]
	mulss   xmm1, dword ptr [eax]
	addss   xmm0, xmm1
	movss   dword ptr [edx+2BCh], xmm0
	movss   xmm0, dword ptr [eax+4]
	mulss   xmm0, dword ptr [ecx+14h]
	movss   xmm1, dword ptr [eax+8]
	mulss   xmm1, dword ptr [ecx+24h]
	add     edx, 2BCh
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+34h]
	mulss   xmm1, dword ptr [eax+0Ch]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+4]
	mulss   xmm1, dword ptr [eax]
	addss   xmm0, xmm1
	movss   dword ptr [edx+4], xmm0
	movss   xmm0, dword ptr [eax+8]
	mulss   xmm0, dword ptr [ecx+28h]
	movss   xmm1, dword ptr [ecx+38h]
	mulss   xmm1, dword ptr [eax+0Ch]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax]
	mulss   xmm1, dword ptr [ecx+8]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+18h]
	mulss   xmm1, dword ptr [eax+4]
	addss   xmm0, xmm1
	movss   dword ptr [edx+8], xmm0
	movss   xmm0, dword ptr [ecx+3Ch]
	mulss   xmm0, dword ptr [eax+0Ch]
	movss   xmm1, dword ptr [ecx+0Ch]
	mulss   xmm1, dword ptr [eax]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+4]
	mulss   xmm1, dword ptr [ecx+1Ch]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+2Ch]
	mulss   xmm1, dword ptr [eax+8]
	addss   xmm0, xmm1
	movss   dword ptr [edx+0Ch], xmm0
	movss   xmm0, dword ptr [ecx+30h]
	mulss   xmm0, dword ptr [eax+1Ch]
	movss   xmm1, dword ptr [ecx]
	mulss   xmm1, dword ptr [eax+10h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+20h]
	mulss   xmm1, dword ptr [eax+18h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+10h]
	mulss   xmm1, dword ptr [eax+14h]
	addss   xmm0, xmm1
	movss   dword ptr [edx+10h], xmm0
	movss   xmm0, dword ptr [ecx+4]
	mulss   xmm0, dword ptr [eax+10h]
	movss   xmm1, dword ptr [ecx+34h]
	mulss   xmm1, dword ptr [eax+1Ch]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+24h]
	mulss   xmm1, dword ptr [eax+18h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+14h]
	mulss   xmm1, dword ptr [eax+14h]
	addss   xmm0, xmm1
	movss   dword ptr [edx+14h], xmm0
	movss   xmm0, dword ptr [ecx+38h]
	mulss   xmm0, dword ptr [eax+1Ch]
	movss   xmm1, dword ptr [ecx+28h]
	mulss   xmm1, dword ptr [eax+18h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+10h]
	mulss   xmm1, dword ptr [ecx+8]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+18h]
	mulss   xmm1, dword ptr [eax+14h]
	addss   xmm0, xmm1
	movss   dword ptr [edx+18h], xmm0
	movss   xmm0, dword ptr [ecx+3Ch]
	mulss   xmm0, dword ptr [eax+1Ch]
	movss   xmm1, dword ptr [ecx+2Ch]
	mulss   xmm1, dword ptr [eax+18h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+14h]
	mulss   xmm1, dword ptr [ecx+1Ch]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+10h]
	mulss   xmm1, dword ptr [ecx+0Ch]
	addss   xmm0, xmm1
	movss   dword ptr [edx+1Ch], xmm0
	movss   xmm0, dword ptr [ecx+30h]
	movss   xmm1, dword ptr [ecx]
	mulss   xmm0, dword ptr [eax+2Ch]
	mulss   xmm1, dword ptr [eax+20h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+20h]
	mulss   xmm1, dword ptr [eax+28h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+10h]
	mulss   xmm1, dword ptr [eax+24h]
	addss   xmm0, xmm1
	movss   dword ptr [edx+20h], xmm0
	movss   xmm0, dword ptr [ecx+4]
	mulss   xmm0, dword ptr [eax+20h]
	movss   xmm1, dword ptr [ecx+34h]
	mulss   xmm1, dword ptr [eax+2Ch]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+24h]
	mulss   xmm1, dword ptr [eax+28h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+14h]
	mulss   xmm1, dword ptr [eax+24h]
	addss   xmm0, xmm1
	movss   dword ptr [edx+24h], xmm0
	movss   xmm0, dword ptr [ecx+38h]
	mulss   xmm0, dword ptr [eax+2Ch]
	movss   xmm1, dword ptr [ecx+28h]
	mulss   xmm1, dword ptr [eax+28h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+20h]
	mulss   xmm1, dword ptr [ecx+8]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+18h]
	mulss   xmm1, dword ptr [eax+24h]
	addss   xmm0, xmm1
	movss   dword ptr [edx+28h], xmm0
	movss   xmm0, dword ptr [ecx+3Ch]
	mulss   xmm0, dword ptr [eax+2Ch]
	movss   xmm1, dword ptr [ecx+2Ch]
	mulss   xmm1, dword ptr [eax+28h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+24h]
	mulss   xmm1, dword ptr [ecx+1Ch]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+20h]
	mulss   xmm1, dword ptr [ecx+0Ch]
	addss   xmm0, xmm1
	movss   dword ptr [edx+2Ch], xmm0
	movss   xmm0, dword ptr [ecx+30h]
	mulss   xmm0, dword ptr [eax+3Ch]
	movss   xmm1, dword ptr [eax+34h]
	mulss   xmm1, dword ptr [ecx+10h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx]
	mulss   xmm1, dword ptr [eax+30h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+20h]
	mulss   xmm1, dword ptr [eax+38h]
	addss   xmm0, xmm1
	movss   dword ptr [edx+30h], xmm0
	movss   xmm0, dword ptr [ecx+4]
	mulss   xmm0, dword ptr [eax+30h]
	movss   xmm1, dword ptr [eax+34h]
	mulss   xmm1, dword ptr [ecx+14h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+24h]
	mulss   xmm1, dword ptr [eax+38h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+3Ch]
	mulss   xmm1, dword ptr [ecx+34h]
	addss   xmm0, xmm1
	movss   dword ptr [edx+34h], xmm0
	movss   xmm0, dword ptr [ecx+38h]
	mulss   xmm0, dword ptr [eax+3Ch]
	movss   xmm1, dword ptr [ecx+28h]
	mulss   xmm1, dword ptr [eax+38h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+30h]
	mulss   xmm1, dword ptr [ecx+8]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+18h]
	mulss   xmm1, dword ptr [eax+34h]
	addss   xmm0, xmm1
	movss   dword ptr [edx+38h], xmm0
	movss   xmm0, dword ptr [ecx+3Ch]
	mulss   xmm0, dword ptr [eax+3Ch]
	movss   xmm1, dword ptr [ecx+2Ch]
	mulss   xmm1, dword ptr [eax+38h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+34h]
	mulss   xmm1, dword ptr [ecx+1Ch]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+30h]
	mulss   xmm1, dword ptr [ecx+0Ch]
	addss   xmm0, xmm1
	movss   dword ptr [edx+3Ch], xmm0
	mov     ecx, ds:Device
	add     ecx, 27Ch
	push    ecx
	mov     ecx, ds:RCache
	call    ds:?set_xform_project@CBackend@@QAEXABU?$_matrix@M@@@Z ; CBackend::set_xform_project(_matrix<float> const &)
	mov     edx, [ebp+0]
	mov     eax, [edx+0D4h]
	mov     ecx, ebp
	call    eax
	cmp     ds:[g_map_hud_emissive.pool], 0
	lea     ecx, ds:[g_map_hud_emissive.nodes]
	jz      short loc_1001A451
	mov     edx, [ecx]
	push    offset sorted_L1
	push    edx
	call    sub_1001A6D0

loc_1001A451:
	mov     eax, [ebp+0]
	mov     edx, [eax+0DCh]
	mov     ecx, ebp
	mov     ds:[g_map_hud_emissive.pool], 0
	call    edx
	mov     edi, ds:Device
	add     edi, 27Ch
	mov     ecx, 10h
	lea     esi, [esp+94h+var_80]
	rep movsd
	mov     edi, ds:Device
	add     edi, 2BCh
	mov     ecx, 10h
	lea     esi, [esp+94h+var_40]
	rep movsd
	mov     eax, ds:Device
	pop     edi
	pop     esi
	pop     ebp
	add     eax, 27Ch
	pop     ebx
	add     esp, 84h
	mov     [esp+arg_0], eax
	mov     ecx, ds:RCache
	jmp     ds:?set_xform_project@CBackend@@QAEXABU?$_matrix@M@@@Z ; CBackend::set_xform_project(_matrix<float> const &)
R_dsgraph_structure__r_dsgraph_render_hud_emissive endp

CRenderTarget__phase_render_hud_emissive proc
var_18          = dword ptr -18h
var_8           = dword ptr -8
var_4           = dword ptr -4

	sub     esp, 8
	push    esi
	mov     esi, eax
	push    edi
	xor     edi, edi
	mov     [esp+10h+var_4], edi
	mov     [esp+10h+var_8], edi
; ---------------------------------------------------------------------------
	;mov     eax, ds:HW
	;mov     ecx, [eax+10h]
	;push    ecx
	;lea     edx, [esp+14h+var_8]
	;push    edx
	;lea     eax, [esp+18h+var_4]
	;push    eax
	;lea     eax, [esi+48h]
	;mov     ecx, esi
	;call    CRenderTarget__u_setrt
	;lea     ecx, [esp+10h+var_4]
	;call    ds:?_dec@?$resptr_base@VCRT@@@@IAEXXZ ; resptr_base<CRT>::_dec(void)
	;lea     ecx, [esp+10h+var_8]
	;call    ds:?_dec@?$resptr_base@VCRT@@@@IAEXXZ ; resptr_base<CRT>::_dec(void)
	;fld1
	;push    edi
	;mov     dword ptr [esi+10h], 5
	;mov     ecx, ds:HW
	;mov     eax, [ecx+8]
	;mov     edx, [eax]
	;push    ecx
	;fstp    [esp+18h+var_18]
	;push    edi
	;push    1
	;push    edi
	;push    edi
	;push    eax
	;mov     eax, [edx+0ACh]
	;call    eax
	;
	;mov     ecx, ds:Device
	;add     ecx, 27Ch
	;push    ecx
	;mov     ecx, ds:RCache
	;call    ds:CBackend__set_xform_project
	;-------------------
	;mov     edx, ds:Device
	;mov     ecx, ds:RCache
	;add     edx, 23Ch
	;push    edx
	;call    ds:CBackend__set_xform_view
	;----------------------------
	mov     ecx, ds:RCache
	push    1
	mov     esi, 3
	push    esi
	push    1
	push    0FFh
	push    0FFh
	push    1
	push    8
	push    1
	call    ds:CBackend__set_Stencil
	;
	mov     ecx, ds:RCache
	;cmp     [ecx+2264h], esi
	;jz      short lab1
	;mov     [ecx+2264h], esi
	;mov     eax, ds:HW
	;mov     eax, [eax+8]
	;mov     ecx, [eax]
	;mov     edx, [ecx+0E4h]
	;push    esi
	;push    16h
	;push    eax
	;call    edx
	;mov     ecx, ds:RCache

lab1:
	push    0Fh
	call    ds:CBackend__set_ColorWriteEnable
	
	;cmp     dword_1007AB28, edi
	;jz      short lab2
	;mov     eax, dword_1007AB24
	;push    offset sorted_L1
	;push    eax
	;mov     ecx, offset dword_1007AB24
	;call    sub_1001A6D0
	push offset RI
	call R_dsgraph_structure__r_dsgraph_render_hud_emissive

lab2:
	mov     ecx, ds:RCache
	push    1
	push    1
	push    1
	push    edi
	push    0FFh
	push    1
	push    4
	push    1
	mov     dword_1007AB28, edi
	call    ds:CBackend__set_Stencil
	mov     ecx, ds:RCache
	cmp     dword ptr [ecx+2264h], 1
	jz      short lab3
	mov     dword ptr [ecx+2264h], 1
	mov     ecx, ds:HW
	mov     eax, [ecx+8]
	mov     edx, [eax]
	push    1
	push    16h
	push    eax
	mov     eax, [edx+0E4h]
	call    eax
	mov     ecx, ds:RCache
lab3:
	push    0Fh
	call    ds:CBackend__set_ColorWriteEnable
	pop     edi
	pop     esi
	add     esp, 8
	retn
CRenderTarget__phase_render_hud_emissive endp

CRender__Render_hud_emissive_fix proc
	mov     eax, [ebx+504h]
	call    CRenderTarget__phase_render_hud_emissive
	;
	mov     dword ptr [ebx+388h], 0
	lea     ecx, [ebx+588h]
	;
	jmp back_from_CRender__Render_hud_emissive_fix

CRender__Render_hud_emissive_fix endp

R_dsgraph_structure__r_dsgraph_render_hud_sorted proc near
var_98          = dword ptr -98h
var_84          = dword ptr -84h
var_80          = byte ptr -80h
var_40          = byte ptr -40h
arg_0           = dword ptr  4

	sub     esp, 84h
	mov     eax, ds:Device
	push    ebx
	push    ebp
	mov     ebp, [esp+8Ch+arg_0]
	push    esi
	push    edi
	lea     ebx, [eax+27Ch]
	mov     ecx, 10h
	mov     esi, ebx
	lea     edi, [esp+94h+var_80]
	rep movsd
	lea     esi, [eax+2BCh]
	mov     ecx, 10h
	lea     edi, [esp+94h+var_40]
	rep movsd
	mov     ecx, ds:g_pGamePersistent
	mov     edx, [ecx]
	mov     ecx, [edx+46Ch]
	movss   xmm0, dword ptr [ecx+1B4h]
	mov     edx, ds:psHUD_FOV
	movss   [esp+94h+var_84], xmm0
	movss   xmm0, dword ptr [eax+33Ch]
	mulss   xmm0, dword ptr [edx]
	mulss   xmm0, ds:dword_1006E430
	mulss   xmm0, ds:flt_1006E3E8
	push    ecx             ; float
	movss   [esp+98h+var_98], xmm0
	call    sub_1000D380
	fld1
	mov     eax, ds:Device
	fdivrp  st(1), st
	movss   xmm1, [esp+98h+var_84]
	movss   xmm2, dword_1007981C
	movaps  xmm0, xmm1
	subss   xmm0, ds:flt_1006E3FC
	divss   xmm1, xmm0
	xorps   xmm0, xmm0
	add     esp, 4
	fld     dword ptr [eax+340h]
	fmul    st, st(1)
	movss   dword ptr [ebx+4], xmm0
	movss   dword ptr [ebx+8], xmm0
	movss   dword ptr [ebx+0Ch], xmm0
	movss   dword ptr [ebx+10h], xmm0
	movss   dword ptr [ebx+18h], xmm0
	fstp    dword ptr [ebx]
	movss   dword ptr [ebx+1Ch], xmm0
	movss   dword ptr [ebx+20h], xmm0
	fstp    dword ptr [ebx+14h]
	movss   dword ptr [ebx+24h], xmm0
	movss   dword ptr [ebx+30h], xmm0
	movss   dword ptr [ebx+34h], xmm0
	movss   dword ptr [ebx+3Ch], xmm0
	movss   dword ptr [ebx+28h], xmm1
	mulss   xmm1, ds:dword_1006E644
	movss   dword ptr [ebx+2Ch], xmm2
	movss   dword ptr [ebx+38h], xmm1
	mov     edx, ds:Device
	movss   xmm0, dword ptr [edx+2ACh]
	mulss   xmm0, dword ptr [edx+248h]
	movss   xmm1, dword ptr [edx+244h]
	mulss   xmm1, dword ptr [edx+29Ch]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [edx+240h]
	mulss   xmm1, dword ptr [edx+28Ch]
	lea     eax, [edx+23Ch]
	lea     ecx, [edx+27Ch]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx]
	mulss   xmm1, dword ptr [eax]
	addss   xmm0, xmm1
	movss   dword ptr [edx+2BCh], xmm0
	movss   xmm0, dword ptr [eax+4]
	mulss   xmm0, dword ptr [ecx+14h]
	movss   xmm1, dword ptr [eax+8]
	mulss   xmm1, dword ptr [ecx+24h]
	add     edx, 2BCh
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+34h]
	mulss   xmm1, dword ptr [eax+0Ch]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+4]
	mulss   xmm1, dword ptr [eax]
	addss   xmm0, xmm1
	movss   dword ptr [edx+4], xmm0
	movss   xmm0, dword ptr [eax+8]
	mulss   xmm0, dword ptr [ecx+28h]
	movss   xmm1, dword ptr [ecx+38h]
	mulss   xmm1, dword ptr [eax+0Ch]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax]
	mulss   xmm1, dword ptr [ecx+8]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+18h]
	mulss   xmm1, dword ptr [eax+4]
	addss   xmm0, xmm1
	movss   dword ptr [edx+8], xmm0
	movss   xmm0, dword ptr [ecx+3Ch]
	mulss   xmm0, dword ptr [eax+0Ch]
	movss   xmm1, dword ptr [ecx+0Ch]
	mulss   xmm1, dword ptr [eax]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+4]
	mulss   xmm1, dword ptr [ecx+1Ch]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+2Ch]
	mulss   xmm1, dword ptr [eax+8]
	addss   xmm0, xmm1
	movss   dword ptr [edx+0Ch], xmm0
	movss   xmm0, dword ptr [ecx+30h]
	mulss   xmm0, dword ptr [eax+1Ch]
	movss   xmm1, dword ptr [ecx]
	mulss   xmm1, dword ptr [eax+10h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+20h]
	mulss   xmm1, dword ptr [eax+18h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+10h]
	mulss   xmm1, dword ptr [eax+14h]
	addss   xmm0, xmm1
	movss   dword ptr [edx+10h], xmm0
	movss   xmm0, dword ptr [ecx+4]
	mulss   xmm0, dword ptr [eax+10h]
	movss   xmm1, dword ptr [ecx+34h]
	mulss   xmm1, dword ptr [eax+1Ch]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+24h]
	mulss   xmm1, dword ptr [eax+18h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+14h]
	mulss   xmm1, dword ptr [eax+14h]
	addss   xmm0, xmm1
	movss   dword ptr [edx+14h], xmm0
	movss   xmm0, dword ptr [ecx+38h]
	mulss   xmm0, dword ptr [eax+1Ch]
	movss   xmm1, dword ptr [ecx+28h]
	mulss   xmm1, dword ptr [eax+18h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+10h]
	mulss   xmm1, dword ptr [ecx+8]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+18h]
	mulss   xmm1, dword ptr [eax+14h]
	addss   xmm0, xmm1
	movss   dword ptr [edx+18h], xmm0
	movss   xmm0, dword ptr [ecx+3Ch]
	mulss   xmm0, dword ptr [eax+1Ch]
	movss   xmm1, dword ptr [ecx+2Ch]
	mulss   xmm1, dword ptr [eax+18h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+14h]
	mulss   xmm1, dword ptr [ecx+1Ch]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+10h]
	mulss   xmm1, dword ptr [ecx+0Ch]
	addss   xmm0, xmm1
	movss   dword ptr [edx+1Ch], xmm0
	movss   xmm0, dword ptr [ecx+30h]
	movss   xmm1, dword ptr [ecx]
	mulss   xmm0, dword ptr [eax+2Ch]
	mulss   xmm1, dword ptr [eax+20h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+20h]
	mulss   xmm1, dword ptr [eax+28h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+10h]
	mulss   xmm1, dword ptr [eax+24h]
	addss   xmm0, xmm1
	movss   dword ptr [edx+20h], xmm0
	movss   xmm0, dword ptr [ecx+4]
	mulss   xmm0, dword ptr [eax+20h]
	movss   xmm1, dword ptr [ecx+34h]
	mulss   xmm1, dword ptr [eax+2Ch]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+24h]
	mulss   xmm1, dword ptr [eax+28h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+14h]
	mulss   xmm1, dword ptr [eax+24h]
	addss   xmm0, xmm1
	movss   dword ptr [edx+24h], xmm0
	movss   xmm0, dword ptr [ecx+38h]
	mulss   xmm0, dword ptr [eax+2Ch]
	movss   xmm1, dword ptr [ecx+28h]
	mulss   xmm1, dword ptr [eax+28h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+20h]
	mulss   xmm1, dword ptr [ecx+8]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+18h]
	mulss   xmm1, dword ptr [eax+24h]
	addss   xmm0, xmm1
	movss   dword ptr [edx+28h], xmm0
	movss   xmm0, dword ptr [ecx+3Ch]
	mulss   xmm0, dword ptr [eax+2Ch]
	movss   xmm1, dword ptr [ecx+2Ch]
	mulss   xmm1, dword ptr [eax+28h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+24h]
	mulss   xmm1, dword ptr [ecx+1Ch]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+20h]
	mulss   xmm1, dword ptr [ecx+0Ch]
	addss   xmm0, xmm1
	movss   dword ptr [edx+2Ch], xmm0
	movss   xmm0, dword ptr [ecx+30h]
	mulss   xmm0, dword ptr [eax+3Ch]
	movss   xmm1, dword ptr [eax+34h]
	mulss   xmm1, dword ptr [ecx+10h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx]
	mulss   xmm1, dword ptr [eax+30h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+20h]
	mulss   xmm1, dword ptr [eax+38h]
	addss   xmm0, xmm1
	movss   dword ptr [edx+30h], xmm0
	movss   xmm0, dword ptr [ecx+4]
	mulss   xmm0, dword ptr [eax+30h]
	movss   xmm1, dword ptr [eax+34h]
	mulss   xmm1, dword ptr [ecx+14h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+24h]
	mulss   xmm1, dword ptr [eax+38h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+3Ch]
	mulss   xmm1, dword ptr [ecx+34h]
	addss   xmm0, xmm1
	movss   dword ptr [edx+34h], xmm0
	movss   xmm0, dword ptr [ecx+38h]
	mulss   xmm0, dword ptr [eax+3Ch]
	movss   xmm1, dword ptr [ecx+28h]
	mulss   xmm1, dword ptr [eax+38h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+30h]
	mulss   xmm1, dword ptr [ecx+8]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [ecx+18h]
	mulss   xmm1, dword ptr [eax+34h]
	addss   xmm0, xmm1
	movss   dword ptr [edx+38h], xmm0
	movss   xmm0, dword ptr [ecx+3Ch]
	mulss   xmm0, dword ptr [eax+3Ch]
	movss   xmm1, dword ptr [ecx+2Ch]
	mulss   xmm1, dword ptr [eax+38h]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+34h]
	mulss   xmm1, dword ptr [ecx+1Ch]
	addss   xmm0, xmm1
	movss   xmm1, dword ptr [eax+30h]
	mulss   xmm1, dword ptr [ecx+0Ch]
	addss   xmm0, xmm1
	movss   dword ptr [edx+3Ch], xmm0
	mov     ecx, ds:Device
	add     ecx, 27Ch
	push    ecx
	mov     ecx, ds:RCache
	call    ds:?set_xform_project@CBackend@@QAEXABU?$_matrix@M@@@Z ; CBackend::set_xform_project(_matrix<float> const &)
	mov     edx, [ebp+0]
	mov     eax, [edx+0D4h]
	mov     ecx, ebp
	call    eax
	cmp     ds:[g_map_hud_sorted.pool], 0
	lea     ecx, ds:[g_map_hud_sorted.nodes]
	jz      short loc_1001A451
	mov     edx, [ecx]
	push    offset sorted_L1
	push    edx
	call    FixedMAP_float_R_dsgraph___MatrixItemS__recurseRL

loc_1001A451:
	mov     eax, [ebp+0]
	mov     edx, [eax+0DCh]
	mov     ecx, ebp
	mov     ds:[g_map_hud_sorted.pool], 0
	call    edx
	mov     edi, ds:Device
	add     edi, 27Ch
	mov     ecx, 10h
	lea     esi, [esp+94h+var_80]
	rep movsd
	mov     edi, ds:Device
	add     edi, 2BCh
	mov     ecx, 10h
	lea     esi, [esp+94h+var_40]
	rep movsd
	mov     eax, ds:Device
	pop     edi
	pop     esi
	pop     ebp
	add     eax, 27Ch
	pop     ebx
	add     esp, 84h
	mov     [esp+arg_0], eax
	mov     ecx, ds:RCache
	jmp     ds:?set_xform_project@CBackend@@QAEXABU?$_matrix@M@@@Z ; CBackend::set_xform_project(_matrix<float> const &)
R_dsgraph_structure__r_dsgraph_render_hud_sorted endp

CRender__render_forward_fix proc
	;
	jz      loc_1000D28D
	mov     eax, [ecx]
	push    offset sorted_L1
	push    eax
	call    FixedMAP_float_R_dsgraph___MatrixItemS__recurseRL
loc_1000D28D:
	; добавляем своё
	push    offset RI
	call    R_dsgraph_structure__r_dsgraph_render_hud_sorted
	; идём обратно
	jmp back_from_CRender__render_forward_fix
CRender__render_forward_fix endp
