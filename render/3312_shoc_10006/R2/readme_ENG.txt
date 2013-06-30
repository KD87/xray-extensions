How to patch:
  1) install masm32 (www.masm32.com)
  2) change path to masm in make_src_dll.bat to one where you installed masm
  3) launch make_src_dll.bat
  4) put xrRender_R2.dll in R2 folder
  5) rename dll in xrRender_R2_orig.dll
  6) launch patch_diff.bat
  7) launch patch.bat

Fixes description:
;=====EXTENDED TUNING OF DETAILS DISTANCE=======
   this fix allows to increase distance of details rendering and adds 
   a console command (r__detail_radius) to tune it.
   Default details radius - 49, this fix change limit to 250.
   If you want more, you can change limit in console_comm.asm (0F0h number)

;========NEW CONSOLE COMMANDS=========
   Allow to add new console commands. Already defined commands:
   r__detail_radius
   r__bloodmarks
   r2_sun_shafts
   r2_soft_water
   r2_soft_particles

;==EXTENDED TUNING OF DETAILS DENSITY=
   Change upper limit of detail density option to 0.02,
   so you can get more dense grass

;======RESTORING OF SUN DETAILS=======
   This fix restores sun details, which were broken in 1.0004 patch

;==========RT0 CLEANING FIX===========
   Service fix. Clean position texture of G-buffer.
   Enable it if you are using OGSE sunshafts.
   It eliminates annoying ghosting on the sky.

;===WORKING SELFLIGHT SHADER ON HUD===
   With this fix selflight shaders properly works on hud

;==EXTENDED TUNING OF MAIN_VIRTUAL_SIZE FOR LAMPS==
   Fix removes lower limit for main_virtual_size option for lamps.
   It is useful when using lamps with grate 

;==============BLOODMARKS=============
   Fix restores bloodmarks on bodies (r__bloodmarks on/off)

;=======NEW DEFINES FOR SHADERS=======
   Service fix. Allows to add new defines for shaders.
   Enable it when using ogse shaders (soft water, soft particles, sunshafts)

;=====COMBINE SAMPLERS REGISTRATION===
   Service fix. Allows to add new samplers for combine_2 shaders.
   Enable it when using sunshafts with dust enabled.

;======CRENDERTARGET EXTENSION========
   Service fix. Allows to extend CRenderTarget class.
   You need this only if you are using OGSE sunshafts with dust.

;==========TERMOVISION BLENDER=======
   Service fix. Adds new blender type. You probably  
   should never enable this.

;=======HI-DEF NOISE TEXTURE==========
   Service fix. Creates fullcsreen noise texture.
   Requires CRENDERTARGET EXTENSION fix.
   Enable it if you are using OGSE sunshafts with dust.

;=========REAL SUN POSITION===========
   Fix forces sun shadows to be rendered from actual sun position.

;=====LOD SWITCH EXTENDED TUNING======
   Fix extends lod switch upper limit (r__geometry_lod) to 3,0

;===MIPMAPS SWITCH EXTENDED TUNING====
   Fix extends mipmaps switch limits (r2_tf_mipbias) to [-3.0;3,0]

;===PARTICLE SAMPLERS REGISTRATION===
   Service fix. Allows to add new samplers for CBlender_Particle blender.
   Enable it when using OGSE soft particles.

;=============DETAIL BUMP=============
   Fix aloows to use detail bump textures in sload.h. Useless without proper shader.

;============ACTOR SHADOW===================
   Fix adds actor shadow. Reqiures another fix in xrGame.dll

;====ADDITIONAL SHADOW MAP RESOLUTIONS======
   Fix adds new shadow map resolution - 8192x8192 and 16384x16384.
   Use it if you want to increase sun shadows quality.
