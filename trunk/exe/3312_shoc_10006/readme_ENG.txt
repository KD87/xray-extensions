How to patch:
  1) install masm32 (www.masm32.com)
  2) change path to masm in make_src.bat to one where you installed masm
  3) launch make_src.bat
  4) put xr_3DA.exe (ENGLISH VERSION WITHOUT PROTECTION!!!) in 3312_shoc_10006 folder
  5) rename exe in xr_3DA_orig.exe
  6) launch patch_diff.bat
  7) launch patch.bat

Fixes description:
;=============FULLSCREEN INTROS==============
   Stretches intro texture to full screen size.

;==========VERTEX BUFFER IMPROVEMENT=========
   Fixes crash with bytes_need <= mSize & & vl_Count in log

;===READING OF RUSSIAN GAMEDATA ARCHIVES=====
   Lets english exe to read russian archives. If you use english version of stalker
   do not enable it.

;=======UNIFORM VARIABLES FOR SHADERS========
   Fix allows to create new global uniform variables for shaders.
   Enable when use OGSE shader pack

;============NEW CONSOLE COMMANDS============
   Fix allows to add new console commands in exe.
   Enable when use OGSE shader pack

;============WEATHER PARAMETERS==============
   Fix adds new parameters in weather configs:
   sun_shafts - sunshafts intensity
   sun_shafts_density - sunshafts density
   rain_max_drop_angle - max angle for falling rain drops (10 degrees by default)