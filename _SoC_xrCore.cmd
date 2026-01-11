@echo off
cd xrcore\3312_shoc_10006
if exist mydll.obj del mydll.obj
if exist mydll.dll del mydll.dll
if exist mydll.exp del mydll.exp
if exist mydll.lib del mydll.lib
if exist xrCore.dll del xrCore.dll

..\..\tools\ml /c /coff /Fo mydll.obj mydll.asm
..\..\tools\link /SUBSYSTEM:WINDOWS /DLL /OUT:mydll.dll /DEF:mydll.def mydll.obj 
..\..\tools\bspatch.exe xrCore_orig.dll xrCore.dll xrCore.dll.diff
..\..\tools\patcher.exe xrCore.dll mydll.dll corrections_list.txt

del /Q mydll.obj
del /Q mydll.dll
del /Q mydll.exp
del /Q mydll.lib
pause
