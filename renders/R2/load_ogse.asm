g_CRenderTarget__phase_combine dd 0
g_CRenderTarget__CRenderTarget dd 0
g_CRenderTarget___CRenderTarget dd 0
g_CRender__create dd 0
g_CRender__reset_end dd 0
g_xrRender_initconsole dd 0
g_CRender__level_Load dd 0
g_CRender__level_Unload dd 0
g_CRender__shader_compile dd 0
g_CDetailManager__MT_CALC dd 0
g_CDetailManager__Render dd 0
g_CRender__Add_SkeletonWallmark dd 0
g_CRender__Add_SkeletonWallmark_ptr dd 0
g_CLight_DB__Update dd 0
g_uber_deffer dd 0
g_CRenderTarget__phase_scene_prepare dd 0
g_CRender__blender_create dd 0
g_CRender__blender_destroy dd 0
g_CRenderTarget__accum_spot dd 0
g_CRenderTarget__accum_point dd 0
g_CRender__render_indirect dd 0
g_CRenderTarget__accum_direct dd 0
;g_CRender__light_create dd 0
;g_light__export dd 0


init_external_libs:
	mov		ecx, [eax]
	mov		ecx, [ecx]
	mov		g_CRenderTarget__phase_combine, ecx
	mov		ecx, [eax+4]
	mov		ecx, [ecx]
	mov		g_CRenderTarget__CRenderTarget, ecx
	mov		ecx, [eax+8]
	mov		ecx, [ecx]
	mov		g_CRenderTarget___CRenderTarget, ecx
	mov		ecx, [eax+0Ch]
	mov		ecx, [ecx]
	mov		g_CRender__create, ecx
	mov		ecx, [eax+10h]
	mov		ecx, [ecx]
	mov		g_CRender__reset_end, ecx
	mov		ecx, [eax+14h]
	mov		ecx, [ecx]
	mov		g_xrRender_initconsole, ecx
	mov		ecx, [eax+18h]
	mov		ecx, [ecx]
	mov		g_CRender__level_Load, ecx
	mov		ecx, [eax+1Ch]
	mov		ecx, [ecx]
	mov		g_CRender__level_Unload, ecx
	mov		ecx, [eax+20h]
	mov		ecx, [ecx]
	mov		g_CRender__shader_compile, ecx
	mov		ecx, [eax+24h]
	mov		ecx, [ecx]
	mov		g_CDetailManager__MT_CALC, ecx
	mov		ecx, [eax+28h]
	mov		ecx, [ecx]
	mov		g_CDetailManager__Render, ecx
	mov		ecx, [eax+2Ch]
	mov		ecx, [ecx]
	mov		g_CRender__Add_SkeletonWallmark, ecx
	mov		ecx, [eax+30h]
	mov		ecx, [ecx]
	mov		g_CRender__Add_SkeletonWallmark_ptr, ecx
	mov		ecx, [eax+34h]
	mov		ecx, [ecx]
	mov		g_CLight_DB__Update, ecx
	mov		ecx, [eax+38h]
	mov		ecx, [ecx]
	mov		g_uber_deffer, ecx	
	mov		ecx, [eax+3Ch]
	mov		ecx, [ecx]
	mov		g_CRenderTarget__phase_scene_prepare, ecx	
	mov		ecx, [eax+40h]
	mov		ecx, [ecx]
	mov		g_CRender__blender_create, ecx	
	mov		ecx, [eax+44h]
	mov		ecx, [ecx]
	mov		g_CRender__blender_destroy, ecx	
	mov		ecx, [eax+48h]
	mov		ecx, [ecx]
	mov		g_CRenderTarget__accum_spot, ecx	
	mov		ecx, [eax+4Ch]
	mov		ecx, [ecx]
	mov		g_CRenderTarget__accum_point, ecx	
	mov		ecx, [eax+50h]
	mov		ecx, [ecx]
	mov		g_CRender__render_indirect, ecx	
	mov		ecx, [eax+54h]
	mov		ecx, [ecx]
	mov		g_CRenderTarget__accum_direct, ecx	
;	mov		ecx, [eax+54h]
;	mov		ecx, [ecx]
;	mov		g_CRender__light_create, ecx	
;	mov		ecx, [eax+58h]
;	mov		ecx, [ecx]
;	mov		g_light__export, ecx	

	mov     eax, [esp+0Ch]
	mov     ecx, [eax]
	
	jmp		back_to_init_external_libs
