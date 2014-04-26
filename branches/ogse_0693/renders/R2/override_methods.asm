; CRenderTarget::phase_combine

override_crt__phase_combine:
	mov		ecx, [esp+4]
	call	g_CRenderTarget__phase_combine
	retn	4
	
override_crt__crt:
	mov		ecx, eax
	call	g_CRenderTarget__CRenderTarget
	retn	
	
override_crt___crt:
	mov		ecx, esi
	call	g_CRenderTarget___CRenderTarget
	retn	
	
override_cr__create:
	call	g_CRender__create
	retn	
	
override_cr__reset_begin:
	call	g_CRender__reset_begin
	retn	
	
override_cr__reset_end:
	call	g_CRender__reset_end
	retn	
	
override_init_console:
	call	g_xrRender_initconsole
	retn	
	
; нельзя использовать call, т.к. level_Load вызывается с аргументом на стеке
; если применить call, будет сдвигаться указатель стека и все поломается.
override_cr__level_load:
	jmp		g_CRender__level_Load
	
override_cr__level_unload:
	call	g_CRender__level_Unload
	retn	
	
; нельзя использовать call, т.к. MT_CALC имеет соглашение о вызове __stdcall
; если применить call, будет сдвигаться указатель стека и все поломается.
override_cdm__mt_calc:
	jmp	g_CDetailManager__MT_CALC		
	
override_cdm__render:
	mov		ecx, esi
	call	g_CDetailManager__Render
	retn	
	
override_cr__add_skeletonwallmark:
	jmp		g_CRender__Add_SkeletonWallmark
	
override_cr__add_skeletonwallmark_ptr:
	jmp		g_CRender__Add_SkeletonWallmark_ptr
	
override_cldb__update:
	mov		ecx, eax
	jmp		g_CLight_DB__Update
	
override_cr__shader_compile	:
	jmp		g_CRender__shader_compile	
	
override_uber_deffer:
	push	ecx
	mov		ecx, [esp+4+18h]
	push	ecx
	push	eax
	mov		ecx, [esp+0Ch+14h]
	push	ecx
	mov		ecx, [esp+10h+10h]
	push	ecx
	mov		ecx, [esp+14h+0Ch]
	push	ecx
	mov		ecx, [esp+18h+8h]
	push	ecx
	mov		ecx, [esp+1Ch+4h]
	push	ecx
	call	g_uber_deffer
	add		esp, 1Ch
	pop		ecx
	retn
	
override_crt_phase_scene_prepare:
	mov		ecx, eax
	jmp		g_CRenderTarget__phase_scene_prepare	
	
override_cr_blender_create:
	jmp		g_CRender__blender_create
	
override_cr_blender_destroy:
	jmp		g_CRender__blender_destroy
		
override_crt_accum_spot:
	push	ecx
	mov		ecx, [esp+4+8h]
	push	ecx
	mov		ecx, [esp+8+4h] 
	call	g_CRenderTarget__accum_spot
	pop		ecx
	retn	8
	
override_crt_accum_point:
	push	ebx
	mov		ecx, [esp+4+4h] 
	call	g_CRenderTarget__accum_point
	retn	4
	
;override_l_export:
;	push	ecx
;	mov		ecx, [esp+4+8h] 
;	push	ecx
;	mov		ecx, [esp+8+4h] 
;	call	g_light__export
;	pop		ecx
;	retn	8
;	
;override_cr_light_create:
;	jmp		g_CRender__light_create

override_cr_render_indirect:
	push	ecx
	mov		ecx, [esp+4+8h] 
	push	ecx
	mov		ecx, [esp+8+4h] 
	call	g_CRender__render_indirect
	pop		ecx
	retn	8
	
override_crt_accum_direct:
	push	ecx
	mov		ecx, [esp+4+8h]
	push	ecx
	mov		ecx, [esp+8+4h] 
	call	g_CRenderTarget__accum_direct
	pop		ecx
	retn	8
	
override_crt_phase_smap_spot:
	push	esi
	call	g_CRenderTarget__phase_smap_spot
	retn	
