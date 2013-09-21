LOAD_DLL MACRO module_name_str:REQ, g_lib_hinst:REQ
LOCAL lab1
LOCAL loaded
LOCAL module_name
	jmp     lab1
module_name db module_name_str, 0
lab1:
	mov     eax, [g_lib_hinst]
	test    eax, eax
	jnz     loaded
	push    offset module_name
	call    [LoadLibraryA]
	test    eax, eax
	jnz     loaded
	; failed to load lib
	mov     eax, offset module_name
	PRINT_UINT "Failed to load library '%s'", eax
	push    offset module_name
	call    msg_and_fail
	add     esp, 4
	retn
loaded:
	mov     [g_lib_hinst], eax
	mov     edx, offset module_name
	PRINT_UINT "Loaded: %s", edx
ENDM

GET_PROC_ADDR MACRO g_lib_hinst:REQ, fun_name_str:REQ, g_fun_addr:REQ
LOCAL lab1
LOCAL success
LOCAL fun_name
	jmp     lab1
fun_name db fun_name_str, 0
lab1:
	push    offset fun_name
	push    [g_lib_hinst]
	call    [GetProcAddress]
	test    eax, eax
	jnz     success
	; can't get address
	mov     eax, offset fun_name
	PRINT_UINT   "can't get address of '%s'", eax
	push    offset fun_name
	call    msg_and_fail
	add     esp, 4
	retn
success:
	mov [g_fun_addr], eax
ENDM

g_ogse_lib_hinst dd 0
g_CEnvDescriptor__load dd 0
g_CEnvDescriptor__CEnvDescriptor dd 0
g_CEnvDescriptor__CEnvDescriptor_destr dd 0
g_CEnvDescriptorMixer__lerp dd 0
g_CEnvDescriptor__operator_ dd 0
g_CEffect_Rain__Born dd 0
g_CLensFlare__Render dd 0
g_CLensFlare__OnFrame dd 0
g_CEnvironment__Invalidate dd 0
g_CLensFlareDescriptor__load dd 0
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
g_CBlender_Compile__SetMapping dd 0
g_CRender__Add_SkeletonWallmark dd 0
g_CRender__Add_SkeletonWallmark_ptr dd 0
g_CObject__UpdateCL dd 0
g_CLight_DB__Update dd 0
g_uber_deffer dd 0
g_CRenderTarget__phase_scene_prepare dd 0
g_CEffect_Rain__Render dd 0
g_CRender__blender_create dd 0
g_CRender__blender_destroy dd 0
g_CRenderTarget__accum_spot dd 0
g_CRenderTarget__accum_point dd 0
;g_light__export dd 0
;g_CRender__light_create dd 0
g_CRender__render_indirect dd 0

s_render_import_table STRUCT
	dd g_CRenderTarget__phase_combine
	dd g_CRenderTarget__CRenderTarget
	dd g_CRenderTarget___CRenderTarget
	dd g_CRender__create
	dd g_CRender__reset_end
	dd g_xrRender_initconsole
	dd g_CRender__level_Load
	dd g_CRender__level_Unload
	dd g_CRender__shader_compile
	dd g_CDetailManager__MT_CALC
	dd g_CDetailManager__Render
	dd g_CRender__Add_SkeletonWallmark
	dd g_CRender__Add_SkeletonWallmark_ptr
	dd g_CLight_DB__Update
	dd g_uber_deffer
	dd g_CRenderTarget__phase_scene_prepare
	dd g_CRender__blender_create
	dd g_CRender__blender_destroy
	dd g_CRenderTarget__accum_spot
	dd g_CRenderTarget__accum_point
	dd g_CRender__render_indirect
;	dd g_CRender__light_create
;	dd g_light__export
s_render_import_table ENDS

g_RenderImportsTable s_render_import_table <>

init_external_libs proc
	LOAD_DLL "extensions\ogse.dll", g_ogse_lib_hinst
	GET_PROC_ADDR g_ogse_lib_hinst, "CEnvDescriptor__load", g_CEnvDescriptor__load
	GET_PROC_ADDR g_ogse_lib_hinst, "CEnvDescriptor__CEnvDescriptor", g_CEnvDescriptor__CEnvDescriptor
	GET_PROC_ADDR g_ogse_lib_hinst, "CEnvDescriptor___CEnvDescriptor", g_CEnvDescriptor__CEnvDescriptor_destr
	GET_PROC_ADDR g_ogse_lib_hinst, "CEnvDescriptorMixer__lerp", g_CEnvDescriptorMixer__lerp
	GET_PROC_ADDR g_ogse_lib_hinst, "CEnvDescriptor__operator_", g_CEnvDescriptor__operator_
	GET_PROC_ADDR g_ogse_lib_hinst, "CEffect_Rain__Born", g_CEffect_Rain__Born
	GET_PROC_ADDR g_ogse_lib_hinst, "CLensFlare__Render", g_CLensFlare__Render
	GET_PROC_ADDR g_ogse_lib_hinst, "CLensFlare__OnFrame", g_CLensFlare__OnFrame
	GET_PROC_ADDR g_ogse_lib_hinst, "CEnvironment__Invalidate", g_CEnvironment__Invalidate
	GET_PROC_ADDR g_ogse_lib_hinst, "CLensFlareDescriptor__load", g_CLensFlareDescriptor__load
	GET_PROC_ADDR g_ogse_lib_hinst, "CRenderTarget__phase_combine", g_CRenderTarget__phase_combine
	GET_PROC_ADDR g_ogse_lib_hinst, "CRenderTarget__CRenderTarget", g_CRenderTarget__CRenderTarget
	GET_PROC_ADDR g_ogse_lib_hinst, "CRenderTarget___CRenderTarget", g_CRenderTarget___CRenderTarget
	GET_PROC_ADDR g_ogse_lib_hinst, "CRender__create", g_CRender__create
	GET_PROC_ADDR g_ogse_lib_hinst, "CRender__reset_end", g_CRender__reset_end
	GET_PROC_ADDR g_ogse_lib_hinst, "xrRender_initconsole", g_xrRender_initconsole
	GET_PROC_ADDR g_ogse_lib_hinst, "CRender__level_Load", g_CRender__level_Load
	GET_PROC_ADDR g_ogse_lib_hinst, "CRender__level_Unload", g_CRender__level_Unload
	GET_PROC_ADDR g_ogse_lib_hinst, "CRender__shader_compile", g_CRender__shader_compile
	GET_PROC_ADDR g_ogse_lib_hinst, "CDetailManager__MT_CALC", g_CDetailManager__MT_CALC
	GET_PROC_ADDR g_ogse_lib_hinst, "CDetailManager__Render", g_CDetailManager__Render
	GET_PROC_ADDR g_ogse_lib_hinst, "CBlender_Compile__SetMapping", g_CBlender_Compile__SetMapping
	GET_PROC_ADDR g_ogse_lib_hinst, "CRender__Add_SkeletonWallmark", g_CRender__Add_SkeletonWallmark
	GET_PROC_ADDR g_ogse_lib_hinst, "CRender__Add_SkeletonWallmark_ptr", g_CRender__Add_SkeletonWallmark_ptr
	GET_PROC_ADDR g_ogse_lib_hinst, "CObject__UpdateCL", g_CObject__UpdateCL
	GET_PROC_ADDR g_ogse_lib_hinst, "CLight_DB__Update", g_CLight_DB__Update
	GET_PROC_ADDR g_ogse_lib_hinst, "uber_deffer", g_uber_deffer
	GET_PROC_ADDR g_ogse_lib_hinst, "CRenderTarget__phase_scene_prepare", g_CRenderTarget__phase_scene_prepare
	GET_PROC_ADDR g_ogse_lib_hinst, "CEffect_Rain__Render", g_CEffect_Rain__Render
	GET_PROC_ADDR g_ogse_lib_hinst, "CRender__blender_create", g_CRender__blender_create
	GET_PROC_ADDR g_ogse_lib_hinst, "CRender__blender_destroy", g_CRender__blender_destroy
	GET_PROC_ADDR g_ogse_lib_hinst, "CRenderTarget__accum_spot", g_CRenderTarget__accum_spot
	GET_PROC_ADDR g_ogse_lib_hinst, "CRenderTarget__accum_point", g_CRenderTarget__accum_point
;	GET_PROC_ADDR g_ogse_lib_hinst, "light__export", g_light__export
;	GET_PROC_ADDR g_ogse_lib_hinst, "CRender__light_create", g_CRender__light_create
	GET_PROC_ADDR g_ogse_lib_hinst, "CRender__render_indirect", g_CRender__render_indirect
	retn
init_external_libs endp
