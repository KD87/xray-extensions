@echo off
cd 3312_shoc_10006
if exist mydll.obj del mydll.obj
if exist mydll.dll del mydll.dll
if exist mydll.exp del mydll.exp
if exist mydll.lib del mydll.lib
if exist xrGame.dll del xrGame.dll

g:\masm32\bin\ml /c /coff /Fo mydll.obj mydll.asm
g:\masm32\bin\Link /SUBSYSTEM:WINDOWS /DLL /OUT:mydll.dll /DEF:mydll.def mydll.obj 
..\tools\bspatch.exe xrGame_orig.dll xrGame.dll xrGame.diff
..\tools\patcher.exe xrGame.dll mydll.dll corrections_list.txt

del /Q mydll.obj
del /Q mydll.dll
del /Q mydll.exp
del /Q mydll.lib
pause
