;*******************************************************************************
; S.T.A.L.K.E.R data stubs
;*******************************************************************************

; увеличиваем размер объекта light
org 10004BB6h - shift
push    278h ; вместо 270h - 5 байт
org 1002FD32h - shift
push    278h
org 100300D0h - shift
push    278h
org 100301BAh - shift
push    278h

org 1000ABB1h - shift
	jmp      loc_1000AEB3
;.text:1000ABB1                 jz      loc_1000AEB3
org 1000AEB3h - shift
loc_1000AEB3:



;light::light
;.text:1002E768                 mov     eax, [esi+3Ch]
;.text:1002E76B                 mov     dword ptr [esi+0Ch], 2
;.text:1002E772                 lea     edi, [esi+114h]
;.text:1002E778                 lea     ebp, [esi+118h]
org 1002E77Eh - shift
	jmp light__light_fix
;.text:1002E77E                 and     eax, 0FFFFFF81h
;.text:1002E781                 or      eax, 1
;.text:1002E784                 mov     [esi+3Ch], eax
org 1002E787h - shift
back_from_light__light_fix:
;.text:1002E787                 movss   dword ptr [esi+40h], xmm0



; CLight_Compute_XFORM_and_VIS::compute_xf_spot
;.text:100337E2                 fdivrp  st(1), st
org 100337F2h - shift
	jmp CLight_Compute_XFORM_and_VIS__compute_xf_spot_fix
;.text:100337F2                 movss   dword ptr [edi+1DCh], xmm2
;.text:100337FA                 movaps  xmm0, xmm1
;.text:100337FD                 subss   xmm0, ds:SMAP_near_plane
;.text:10033805                 divss   xmm1, xmm0
;.text:10033809                 xorps   xmm0, xmm0
;.text:1003380C                 movss   dword ptr [edi+1B4h], xmm0
;.text:10033814                 movss   dword ptr [edi+1B8h], xmm0
;.text:1003381C                 movss   dword ptr [edi+1BCh], xmm0
;.text:10033824                 movss   dword ptr [edi+1C0h], xmm0
;.text:1003382C                 movss   dword ptr [edi+1C8h], xmm0
;.text:10033834                 movss   dword ptr [edi+1CCh], xmm0
;.text:1003383C                 movss   dword ptr [edi+1D0h], xmm0
;.text:10033844                 movss   dword ptr [edi+1D4h], xmm0
;.text:1003384C                 movss   dword ptr [edi+1E0h], xmm0
;.text:10033854                 movss   dword ptr [edi+1E4h], xmm0
;.text:1003385C                 movss   dword ptr [edi+1ECh], xmm0
;.text:10033864                 movss   dword ptr [edi+1D8h], xmm1
;.text:1003386C                 mulss   xmm1, ds:dword_1006E5F0
org 10033874h - shift
back_from_CLight_Compute_XFORM_and_VIS__compute_xf_spot_fix:
;.text:10033874                 movss   dword ptr [edi+1E8h], xmm1


;light::export
;.text:1002FD41                 mov     esi, eax
org 1002FD43h - shift
	jmp light__export_fix
;.text:1002FD43                 call    light__light
;.text:1002FD48                 jmp     short loc_1002FD4C
org 1002FD4Ch - shift
loc_1002FD4C:
org 1002E6F0h - shift
light__light:


org 1000D27Eh - shift
	jmp CRender__render_forward_fix
;.text:1000D27E                 jz      short loc_1000D28D
;.text:1000D280                 mov     eax, [ecx]
;.text:1000D282                 push    offset sorted_L1
;.text:1000D287                 push    eax
;.text:1000D288                 call    FixedMAP_float_R_dsgraph___MatrixItemS__recurseRL
org 1000D28Dh - shift
back_from_CRender__render_forward_fix:
;.text:1000D28D loc_1000D28D:





org 10018F40h - shift
sorted_L1:
org 1001A710h - shift
FixedMAP_float_R_dsgraph___MatrixItemS__recurseRL:

; CRender__Render
;.text:1000D1C9                 mov     eax, [ebx+504h]
;.text:1000D1CF                 call    CRenderTarget__phase_accumulator
org 1000D1D4h - shift
	jmp CRender__Render_hud_emissive_fix
;.text:1000D1D4                 mov     dword ptr [ebx+388h], 0
;.text:1000D1DE                 lea     ecx, [ebx+588h] ; this
org 1000D1E4h - shift
back_from_CRender__Render_hud_emissive_fix:
;.text:1000D1E4                 push    ecx
;.text:1000D1E5                 push    ebx

org 1007AB24h - shift - 019ch
RI dd ?

org 1007AB28h - shift
dword_1007AB28 dd ?
org 1007AB24h - shift
dword_1007AB24 dd ?


org 10069694h - shift
Msg dd ?

org 100692F8h - shift
Device dd ?
org 10069344h - shift
?set_xform_project@CBackend@@QAEXABU?$_matrix@M@@@Z dd ?
org 10069344h - shift
CBackend__set_xform_project dd ?
org 10069340h - shift
CBackend__set_xform_view dd ?
org 1006935Ch - shift
CBackend__set_Stencil dd ?
org 10069360h - shift
CBackend__set_ColorWriteEnable dd ?
org 10069124h - shift
CBackend__set_RT dd ?
org 100693D0h - shift
CBackend__set_ZB dd ?
org 10055D60h - shift
CRenderTarget__u_setrt:
org 10069364h - shift
?_dec@?$resptr_base@VCRT@@@@IAEXXZ dd ?
org 100692B4h - shift
HW dd ?
org 1006966Ch - shift
Debug dd ?
org 1006965Ch - shift
xrDebug__error dd ?
org 100693E8h - shift
CResourceManager___CreateTexture dd ?
org 100693F0h - shift
resptr_base_CTexture____dec dd ?
org 100693ECh - shift
CTexture__surface_set dd ?
org 10069358h - shift
R_constants__flush_cache dd ?
org 10069408h - shift
R_constant_table__get_char_const dd ?

org 100692E0h - shift
RCache dd ?
org 10069314h - shift
g_pGamePersistent dd ?
org 100693ACh - shift
psHUD_FOV dd ?
org 1006E430h - shift
dword_1006E430 dd ?
org 1006E3E8h - shift
flt_1006E3E8 dd ?
org 1000D380h - shift
sub_1000D380:
org 1007981Ch - shift
dword_1007981C dd ?
org 1006E3FCh - shift
flt_1006E3FC dd ?
org 1006E644h - shift
dword_1006E644 dd ?
;org 10018F40h - shift
;sub_10018F40:
org 1001A6D0h - shift
sub_1001A6D0:





;.text:10006E0F                 mov     eax, offset dword_1007A988
org 10006E14h - shift
	jmp CRender_constructor_fix
;.text:10006E14                 retn
;.text:10006E14 sub_10006C10    endp
;.text:10006E14
;.text:10006E14 ; ---------------------------------------------------------------------------
;.text:10006E15                 align 10h



org 10017AB0h - shift
sub_10017AB0:
org 10017A20h - shift
sub_10017A20:
org 10017C60h - shift
sub_10017C60:





org 10017990h - shift
sub_10017990:
;.text:10016580                 jz      short not_hud
org 10016582h - shift
	jmp hud_shader_fix
;.text:10016582                 test    al, 4
;.text:10016584                 lea     edi, [esp+0B0h+distSQ]
;.text:10016588                 jz      short not_strict_sorting


org 10017B40h - shift
FixedMAP__MatrixItemS__insertInAnyWay:
org 1007AA8Ch - shift
RI_val_pObject  dd 0
org 1007AA90h - shift
RI_val_pTransform dd 0

org 10079774h - shift
ps_r2_ls_flags    dd ?
	
org 100690CCh - shift
__imp__sprintf dd ?
org 100690D4h - shift
__imp__strstr dd ?

;===========================================
; тень от ГГ на R2
;===========================================
org 10069308h - shift
g_pGameLevel dd ?
org 1000BA1Dh - shift
	jmp	actor_shadow_fix
org 1000BA23h - shift
back_to_actor_shadow_fix:	

;===========================================
; загрузка из ogse.dll
;===========================================
org 100163BDh - shift
	jmp init_external_libs
org 100163C3h - shift
back_to_init_external_libs:

;===========================================
; замена методов
;===========================================
org 10062AE0h - shift
	jmp override_crt__phase_combine
org 100567E0h - shift
	jmp override_crt__crt
org 10057940h - shift
	jmp override_crt___crt
org 10003B30h - shift
	jmp override_cr__create
org 100046C5h - shift
	jmp override_cr__reset_end
org 10001630h - shift
	jmp override_init_console
org 100073E0h - shift
	jmp override_cr__level_load
org 10007860h - shift
	nop
	mov     eax, ds:g_pGameLevel
	jmp override_cr__level_unload
org 100231C0h - shift
	jmp override_cdm__mt_calc
org 10022F90h - shift
	jmp override_cdm__render
org 10004DD0h - shift
	jmp override_cr__add_skeletonwallmark
org 10004D90h - shift
	jmp override_cr__add_skeletonwallmark_ptr
org 100303B0h - shift
	jmp override_cldb__update
org 10005760h - shift
	jmp override_cr__shader_compile
org 1003CE80h - shift
	jmp override_uber_deffer
org 1006679Ch - shift
	jmp override_crt_phase_scene_prepare
org 10006E80h - shift
	jmp override_cr_blender_create
org 10007190h - shift
	jmp override_cr_blender_destroy
org 1005E6A0h - shift
	jmp override_crt_accum_spot

	
; temp
org 10002DC9h - shift
	jmp dllmain_hack
org 10002DCEh - shift
back_to_dllmain_hack:
org 10016390h - shift	
sub_10016390:
org 100693DCh - shift	
psDeviceFlags dd ?