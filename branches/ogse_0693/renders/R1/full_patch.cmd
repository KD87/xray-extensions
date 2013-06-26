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

if exist xrRender_R1.dll del xrRender_R1.dll
..\..\..\..\trunk\tools\bspatch.exe xrRender_R1_orig.dll xrRender_R1.dll xrRender_R1.dll.diff 
..\..\..\..\trunk\tools\patcher.exe xrRender_R1.dll mydll.dll corrections_list.txt
copy xrRender_R1.dll "G:\GAMES\STALKER\SOC\bin\"
pause