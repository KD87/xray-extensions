@echo off
cd render\3967_cop_1602\R3
if exist mydll.obj del mydll.obj
if exist mydll.dll del mydll.dll
if exist mydll.exp del mydll.exp
if exist mydll.lib del mydll.lib
if exist xrRender_R3.dll del xrRender_R3.dll

..\..\..\tools\ml /c /coff /Fo mydll.obj mydll.asm
..\..\..\tools\link /SUBSYSTEM:WINDOWS /DLL /OUT:mydll.dll /DEF:mydll.def mydll.obj 
..\..\..\tools\bspatch.exe xrRender_R3_orig.dll xrRender_R3.dll xrRender_R3.dll.diff
..\..\..\tools\patcher.exe xrRender_R3.dll mydll.dll corrections_list.txt

del /Q mydll.obj
del /Q mydll.dll
del /Q mydll.exp
del /Q mydll.lib
pause
