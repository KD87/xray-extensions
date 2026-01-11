@echo off
cd render\3312_shoc_10006\R1
if exist mydll.obj del mydll.obj
if exist mydll.dll del mydll.dll
if exist mydll.exp del mydll.exp
if exist mydll.lib del mydll.lib
if exist xrRender_R1.dll del xrRender_R1.dll

..\..\..\tools\ml /c /coff /Fo mydll.obj mydll.asm
..\..\..\tools\link /SUBSYSTEM:WINDOWS /DLL /OUT:mydll.dll /DEF:mydll.def mydll.obj 
..\..\..\tools\bspatch.exe xrRender_R1_orig.dll xrRender_R1.dll xrRender_R1.dll.diff
..\..\..\tools\patcher.exe xrRender_R1.dll mydll.dll corrections_list.txt

del /Q mydll.obj
del /Q mydll.dll
del /Q mydll.exp
del /Q mydll.lib
pause
