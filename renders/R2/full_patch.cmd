@echo off
if exist mydll.obj del mydll.obj
if exist mydll.dll del mydll.dll
if exist mydll.exp del mydll.exp
if exist mydll.lib del mydll.lib

g:\masm32\bin\ml /c /coff /Fo mydll.obj mydll.asm
g:\masm32\bin\Link /SUBSYSTEM:WINDOWS /DLL /OUT:mydll.dll /DEF:mydll.def mydll.obj 

del mydll.obj
del mydll.exp
del mydll.lib

if exist xrRender_R2.dll del xrRender_R2.dll
..\..\..\..\trunk\tools\bspatch.exe xrRender_R2_orig.dll xrRender_R2.dll xrRender_R2.dll.diff 
..\..\..\..\trunk\tools\patcher.exe xrRender_R2.dll mydll.dll corrections_list.txt
copy xrRender_R2.dll "G:\GAMES\STALKER\SOC\bin\"
pause