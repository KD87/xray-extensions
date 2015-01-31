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


;.text:100337C5                 addss   xmm0, ds:__real@3d7a35dd
org 100337C0h - shift
;	addss   xmm0, dword ptr [tan_shift]
	jmp light_blink_fix
org 100337CDh - shift
back_from_light_blink_fix:
	
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

;--------------------------
;замена обращений к 31h
;кол-во строк и столбцов в cache_pool, cache_task и cache
;--------------------------

org 10023D7Ah - shift
	jmp cache_initialize_1
org 10023D83h - shift
back_to_cache_initialize_1:

org 10023D85h - shift
	jmp cache_initialize_2 
org 10023D8Bh - shift
back_to_cache_initialize_2:

org 10024144h - shift
	jmp cache_update_1
org 10024152h - shift
back_to_cache_update_1:

org 100241A9h - shift
	jmp cache_update_2
org 100241B2h - shift
back_to_cache_update_2:

org 1002422Eh - shift
	jmp cache_update_3 
org 10024234h - shift
back_to_cache_update_3:

org 1002428Bh - shift
	jmp cache_update_4 
org 10024291h - shift
back_to_cache_update_4:

;----------------------
;замена обращений к 30h
; то же, что и 31h, просто используется в циклах с другим условием
;----------------------

org 10024121h - shift
	jmp update_30h_1
org 10024126h - shift
back_to_update_30h_1:

org 10024130h - shift
	jmp update_30h_2
org 1002413Bh - shift
back_to_update_30h_2:

org 10024173h - shift
	jmp update_30h_3
org 10024178h - shift
back_to_update_30h_3:

org 100241FAh - shift
	jmp update_30h_4
org 100241FFh - shift
back_to_update_30h_4:

org 10024254h - shift
	jmp update_30h_5
org 10024259h - shift
back_to_update_30h_5:

org 10024276h - shift
	jmp update_30h_6
org 1002427Fh - shift
back_to_update_30h_6:

;----------------------
;замена обращений к 0Сh
; кол-во строк и столбцов в cache_level1
;----------------------

org 10022F2Eh - shift
	jmp cache_upvism_1 
org 10022F34h - shift
back_to_cache_upvism_1:

org 10022F3Eh - shift
	jmp cache_upvism_2
org 10022F44h - shift
back_to_cache_upvism_2:

org 10022A53h - shift
	jmp cache_upvism_3
org 10022A5Ch - shift
back_to_cache_upvism_3:

org 10023D8Dh - shift
	jmp cache_init_4
org 10023DA5h - shift
back_to_cache_init_4:

org 10023DA5h - shift
	jmp cache_init_5
org 10023DAAh - shift
back_to_cache_init_5:

org 10024420h - shift
	jmp cache_upd_6
org 10024436h - shift
back_to_cache_upd_6:

org 1002444Ah - shift
	jmp cache_upd_7
org 10024452h - shift
back_to_cache_upd_7:

;----------------------
;замена обращений к 0С4h
; длина строки в cache
;----------------------

org 10023DD4h - shift
	jmp cache_init_C4_1
org 10023DD9h - shift
back_to_cache_init_C4_1:

org 10024201h - shift
	jmp cache_upd_C4_2
org 10024211h - shift
back_to_cache_upd_C4_2:

org 10024260h - shift
	jmp cache_upd_C4_3
org 1002426Dh - shift
back_to_cache_upd_C4_3:

;----------------------
;замена обращений к 960h
; кол-во элементов в cache_pool, cache_task и cache - 1
;----------------------

org 1002229Eh - shift
	jmp const_960_1
org 100222AFh - shift
back_to_const_960_1:

org 100224E1h - shift
	jmp const_960_2
org 100224ECh - shift
back_to_const_960_2:

;----------------------
;разное
;----------------------

org 1002223Fh - shift
	jmp cache_level1_length
org 1002224Ah - shift
back_to_cache_level1_length:

org 10024197h - shift
	jmp red_cl1_line_size_minus
org 1002419Dh - shift
back_to_red_cl1_line_size_minus:

org 1002421Ch - shift
	jmp cache_size_w_o_last_line_minus
org 10024222h - shift
back_to_cache_size_w_o_last_line_minus:

org 100242A6h - shift
	jmp cache_length
org 100242B3h - shift
back_to_cache_length:

org 10023DF0h - shift
	jmp four_lines_length
org 10023DF6h - shift
back_to_four_lines_length:

; float - константы
org 10022BC7h - shift
	jmp vis
org 10022BCEh - shift
back_to_vis:

org 10022BEDh - shift
	jmp circle
org 10022BF5h - shift
back_to_circle:

;----------------------
;патч смещений членов класса
;----------------------
org 10023D57h - shift
	jmp offset_1
org 10023D63h - shift
back_to_offset_1:

;org 10023D8Dh - shift
;	jmp offset_2
;org 10023D93h - shift
;back_to_offset_2:

org 10024077h - shift
	jmp offset_3
org 1002408Ah - shift
back_to_offset_3:

org 100240FEh - shift
	jmp offset_4
org 10024104h - shift
back_to_offset_4:

org 1002416Bh - shift
	jmp offset_5
org 10024171h - shift
back_to_offset_5:

org 100241F2h - shift
	jmp offset_6
org 100241F8h - shift
back_to_offset_6:

org 10024245h - shift
	jmp offset_7
org 1002424Bh - shift
back_to_offset_7:

org 100242F6h - shift
	jmp offset_8
org 100242FCh - shift
back_to_offset_8:

org 10024306h - shift
	jmp offset_9
org 1002430Ch - shift
back_to_offset_9:

org 10024323h - shift
	jmp offset_10
org 10024335h - shift
back_to_offset_10:

org 100243BDh - shift
	jmp offset_11
org 100243C4h - shift
back_to_offset_11:

org 100243CBh - shift
	jmp offset_12
org 100243D8h - shift
back_to_offset_12:

org 100243E0h - shift
	jmp offset_13
org 100243F7h - shift
back_to_offset_13:

org 100243FEh - shift
	jmp offset_14
org 10024405h - shift
back_to_offset_14:

org 10022A76h - shift
	jmp offset_15
org 10022A85h - shift
back_to_offset_15:
;	{	offset	=>	0x2223F	,	src_value	=>	0x5C0	,	val_format	=>	4	}	,	 offset	cache_level1
;	{	offset	=>	0x22A76	,	src_value	=>	0x5C0	,	val_format	=>	4	}	,	 offset	cache_level1
;	{	offset	=>	0x22A7E	,	src_value	=>	0x5C0	,	val_format	=>	4	}	,	 offset	cache_level1
;	{	offset	=>	0x23D93	,	src_value	=>	0x600	,	val_format	=>	4	}	,	 offset	cache_level1
;	{	offset	=>	0x24420	,	src_value	=>	0x5E8	,	val_format	=>	4	}	,	 offset	cache_level1
;	{	offset	=>	0x2229E	,	src_value	=>	0x9688	,	val_format	=>	4	}	,
;	{	offset	=>	0x222A4	,	src_value	=>	0x968C	,	val_format	=>	4	}	,
;	{	offset	=>	0x23D57	,	src_value	=>	0x968C	,	val_format	=>	4	}	,
;	{	offset	=>	0x23D5D	,	src_value	=>	0x4B80	,	val_format	=>	4	}	,
;	{	offset	=>	0x23D8D	,	src_value	=>	0x4B88	,	val_format	=>	4	}	,
;	{	offset	=>	0x24077	,	src_value	=>	0x9688	,	val_format	=>	4	}	,
;	{	offset	=>	0x2407D	,	src_value	=>	0x7104	,	val_format	=>	4	}	,
;	{	offset	=>	0x24084	,	src_value	=>	0x9688	,	val_format	=>	4	}	,
;	{	offset	=>	0x240FE	,	src_value	=>	0x4B80	,	val_format	=>	4	}	,
;	{	offset	=>	0x2416B	,	src_value	=>	0x4C40	,	val_format	=>	4	};
;	{	offset	=>	0x241F2	,	src_value	=>	0x7040	,	val_format	=>	4	};
;	{	offset	=>	0x24245	,	src_value	=>	0x4B80	,	val_format	=>	4	}	,
;	{	offset	=>	0x242A6	,	src_value	=>	0x9688	,	val_format	=>	4	}	,
;	{	offset	=>	0x242F6	,	src_value	=>	0x9688	,	val_format	=>	4	}	,
;	{	offset	=>	0x24306	,	src_value	=>	0x9688	,	val_format	=>	4	}	,
;	{	offset	=>	0x24323	,	src_value	=>	0x9688	,	val_format	=>	4	}	,
;	{	offset	=>	0x2432F	,	src_value	=>	0x7104	,	val_format	=>	4	}	,
;	{	offset	=>	0x243BD	,	src_value	=>	0x7104	,	val_format	=>	4	}	,
;	{	offset	=>	0x243CB	,	src_value	=>	0x9688	,	val_format	=>	4	}	,
;	{	offset	=>	0x243D2	,	src_value	=>	0x9688	,	val_format	=>	4	}	,
;	{	offset	=>	0x243E0	,	src_value	=>	0x7108	,	val_format	=>	4	}	,
;	{	offset	=>	0x243E7	,	src_value	=>	0x7104	,	val_format	=>	4	}	,
;	{	offset	=>	0x243F1	,	src_value	=>	0x9688	,	val_format	=>	4	}	,
;	{	offset	=>	0x243FE	,	src_value	=>	0x9688	,	val_format	=>	4	}	,


;----------------------
;замена обращений к 18h
;позиция актора
;----------------------	

org 10023E2Ah - shift
	jmp cache_task_1 
org 10023E31h - shift
back_to_cache_task_1:

; фикс мигания травы

org 100229DCh - shift
	jmp	detail_blink_fix
org 100229F6h - shift
back_from_detail_blink_fix:
org 1007A988h - shift
RImplementation dd ?

;===========================================
; ПЛОТНОСТЬ ТРАВЫ.
;===========================================

CCC_Float       struct ; (sizeof=0x18, standard type)
	baseclass_0     dd ?
	value           dd ?                    ; offset
	min             dd ?
	max             dd ?
CCC_Float       ends

org 10001752h - shift
	jmp det_density
org 10001761h - shift
back_to_det_density:

org 10089C28h - shift
xCCC_Float_42 CCC_Float <?>

;===========================================
; КОНСОЛЬНАЯ КОМАНДА
;===========================================

org 10002D42h - shift
	jmp con_comm
org 10002D49h - shift
back_to_con_comm:
	
org 10067424h - shift	
_atexit:

; imported functions
org 10069268h - shift
CCC_Integer__CCC_Integer      dword ?
org 1006924Ch - shift
CCC_Integer___CCC_Integer     dword ?
org 10069248h - shift
CCC_Mask__CCC_Mask dd ?
org 100692B8h - shift
CCC_Mask___CCC_Mask dd ?
org 10069290h - shift
CCC_Float__CCC_Float dd ?
org 1006927Ch - shift
CCC_Float___CCC_Float dd ?
org 100692ACh - shift
CCC_Token__CCC_Token dd ?
org 10069298h - shift
CCC_Token___CCC_Token dd ?
org 10069D10h - shift 
CCC_Preset dd ?
org 100692B0h - shift
Console dd ?
org 10069294h - shift
CConsole__AddCommand dd ?

;===========================================
; ОБРАБОТЧИК КОНСОЛЬНОЙ КОМАНДЫ.
; вызывается из CRender::level_Load
; врезка тут:
; .text:10007607                 push    0D0BB8h
; как раз пять байт
;===========================================

org 10007607h - shift
	jmp calculate_stuff
org 1000760Ch - shift
back_to_calculate_stuff:

; параметры
org 10089D1Ch - shift
rad	dd ?					; 31h
org 10089D20h - shift
rad_dec	dd ?				; rad-1						30h
org 10089D24h - shift
sq_rad	dd ?				; rad*rad					961h
org 10089D28h - shift
sq_rad_dec	dd ?			; rad*rad - 1				960h
org 10089D2Ch - shift
det_lev1_size	dd ?		; rad_dec/4					0Ch
org 10089D30h - shift
sq_det_lev1_size_dec	dd ?	; det_lev1_size * det_lev1_size - 1				08Fh
org 10089D34h - shift
lev1_size_line	dd ?		; rad * 4					0C4h
org 10089D38h - shift
lev1_size_line_dec	dd ?	; rad_dec * 4				0C0h
org 10089D3Ch - shift
act_pos	dd ?				; rad_dec / 2				018h
org 10089D40h - shift
cache_size_w_o_last_line	dd ?				; 4 * rad * (rad - 1)		24C0h
org 10089D44h - shift
four_lines_length_in_cache	dd ?				; 4 * lev1_size_line		0310h
org 10089D48h - shift
class_mem	dd ?
org 10089D58h - shift	
cache_level1_size	dd ?
org 10089D5Ch - shift	
cache_size	dd ?
org 10089D60h - shift	
c_task_size	dd ?
org 10089D64h - shift	
c_pool_size	dd ?

org 10089D68h - shift	
cache_level1_offset	dd ?
org 10089D6Ch - shift	
cache_first_el_offset	dd ?
org 10089D70h - shift	
cache_third_el_offset	dd ?
org 10089D74h - shift	
cache_last_el_first_line_offset	dd ?
org 10089D78h - shift	
cache_first_el_last_line_offset	dd ?	
org 10089D7Ch - shift	
cache_task_first_offset	dd ?	
org 10089D80h - shift	
cache_task_second_offset	dd ?	
org 10089D84h - shift	
cache_task_last_offset	dd ?
org 10089D88h - shift	
cache_pool_offset	dd ?	

org 10089D8Ch - shift	
visibility	REAL4 ?
org 10089D90h - shift	
smooth_circle	REAL4 ?

off dd offset det_dens_max_offset

; тени травы
org 100690ECh - shift
memmove_s dword ?
org 1000D1C9h - shift
	jmp sun_check
org 1000D1CFh - shift
back_to_sun_check:
org 10079774h - shift
ps_r2_ls_flags    dd ?
org 10027997h - shift
	nop
	jmp	sun_details_1_fix
org 100279C6h - shift
back_to_sun_details_1_fix:

; rt_position fix
org 1006679Ch - shift
	jmp	rt_position_clear

; bloodmarks
org 1000D0B6h - shift
	jmp	bloodmarks
org 1000D0BCh - shift
back_to_bloodmarks:

org 10079480h - shift
g_r dd 1


; дефайны шейдеров
org 100059A2h - shift
	nop
	nop
	jmp	shader_defines
org 100059A9h - shift
back_to_shader_defines:
	
org 100690CCh - shift
__imp__sprintf dd ?
org 100690D4h - shift
__imp__strstr dd ?


org 1006946Ch - shift
IBlender__Compile dd ?
org 10069470h - shift
CBlender_Compile__r_Pass dd ?
org 10069488h - shift
CBlender_Compile__r_Sampler dd ?
org 1006948Ch - shift
CBlender_Compile__r_Sampler1 dd ?
org 10069474h - shift
CBlender_Compile__r_Sampler_clf dd ?
org 10069494h - shift
CBlender_Compile__r_Sampler_clw dd ?
org 10069490h - shift
CBlender_Compile__r_Sampler_rtf dd ?
org 10069478h - shift
CBlender_Compile__r_End dd ?
org 1007AC5Ch - shift
dword_1007AC5C dd 0
org 1003AB50h - shift
shared_str__shared_str:
org 1003CE80h - shift
uber_deffer:

; регистрация семплеров в combine-шейдере
org 1003ADEEh - shift
	jmp combine_2_sampler_register
org 1003ADF4h - shift
back_to_combine_2_sampler_register:

; добавление собственного блендера в CRenderTarget
org 10069698h - shift
_Memory dd ?
org 1006969Ch - shift
xrMemory__mem_alloc dd ?
org 100696A0h - shift
xrMemory__mem_free dd ?
org 10069464h - shift
IBlender__IBlender dd ?
org 10069468h - shift
IBlender___IBlender dd ?
org 1006946Ch - shift
IBlender__Compile dd ?
org 1006BE98h - shift
CBlender_combine__vfptr dd ?
org 1006942Ch - shift
resptrcode_shader__create dd ?
org 10069404h - shift
resptrcode_shader__create1 dd ?

; смещения на функции
org 10067D46h - shift
IBlender__getName:
org 10067D4Ch - shift
IBlender__Save:
org 10067D52h - shift
IBlender__Load:
org 1003ABE0h - shift
CBlender_light_occq__canBeLMAPped:
org 10067E90h - shift
_D3DXCreateTexture:
org 100566B0h - shift
generate_jitter:

; увеличим место под экземпляр класса CRenderTarget:
;0x180 - b_ikvision		- блендер класса CBlender_ikvision
;0x184 - s_ikvision		- шейдер ик-видения
;0x188 - t_noise_hd_surf - указатель на объект типа  IDirect3DTexture9 - DirectX поверхность для шума высокого разрешения
;0x188 - t_noise_hd - объект типа resptr_core<CTexture,resptrcode_texture> - текстура для шума высокого разрешения
	; увеличение места под экземпляр класса CRenderTarget в CRender::create()
org 10004218h - shift
push 190h		; 180h по умолчанию
	; увеличение места под экземпляр класса CRenderTarget в CRender::reset_end()
org 10004773h - shift
push 190h		; 180h по умолчанию
	; инициализируем блендер и создаем шейдер на его основе
org 100578C7h - shift
	jmp	CRenderTarget_constructor
org 100578CFh - shift
back_to_CRenderTarget_constructor:
	; добавляем переключение между шейдерами при рендере
org 1006468Fh - shift
	jmp	CRenderTarget_phase_combine_add
org 10064694h - shift
back_to_CRenderTarget_phase_combine_add:

	; добавляем нойз-текстуру хорошего разрешения
org 10057871h - shift
	jmp	noise_texture
org 10057877h - shift
back_to_noise_texture:

; правильное положение солнца
org 1006E564h - shift
__real@bf400000 dd 0.0
org 10030515h - shift
	subss   xmm0, ds:__real@bf400000
	
org 1003048Ch - shift
	movss   xmm3, ds:sun_far
	
;===========================================
; r__geometry_lod
;===========================================	
org 1006E4C0h - shift
	dd 3.0
	
;===========================================
; MIPBIAS.
;===========================================
org 10001BFFh - shift
	jmp mip_bias
org 10001C0Eh - shift
back_to_mip_bias:

org 10089AF4h - shift
mipbias_obj dd ?

;===========================================
; регистрация семплеров в CBlender_Particle
;===========================================
org 1003CE19h - shift
	jmp particle_sampler_register
org 1003CE3Ah - shift
back_to_particle_sampler_register:

;===========================================
; детальный бамп
;===========================================
org 100690FCh - shift
strcat_s dd ?
org 1003D2B1h - shift
	jmp add_detail_bump_sampler
org 1003D2E7h - shift
back_to_add_detail_bump_sampler:

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
; Дополнительные разрешения карты теней
;===========================================
org 10003F43h - shift
	jmp	new_smap_sizes
org 10003F48h - shift
back_from_new_smap_sizes:
org 1006964Ch - shift
Core dd ?

;===========================================
; Расширенная регулировка r2_sun_near
;===========================================
org 100024DAh - shift
	jmp	sun_near_fix_label
org 100024E1h - shift
back_from_sun_near_fix_label:

;===========================================
; Фикс отрисовки самосветящейся геометрии
;===========================================
org 1003BBF8h - shift
	db 2
org 1003BBFCh - shift
	db 1
org 1003BCB8h - shift
	db 2
org 1003BCBCh - shift
	db 1
	
;------------------------------------------
; r2_sun_near_border [0,5..1,5]
; исправляем глюк тени на краю экрана.
;------------------------------------------

org 10089888h - shift
unk_10089888:

org 10002523h - shift	; 2 bytes
	nop
	nop

org 1000252Fh - shift	; 7 bytes
	nop
	nop
	jmp		r2_sun_near_border_EXT_CHUNK
	
org 10002544h - shift
r2_sun_near_border_EXT_CHUNK_OUT:
	