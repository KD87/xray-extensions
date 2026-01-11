@echo off
cd exe\3312_shoc_10006
if exist src.obj del src.obj
if exist src.exe del src.exe
if exist src.exp del src.exp
if exist src.lib del src.lib
if exist XR_3DA.exe del XR_3DA.exe

..\..\tools\ml /c /coff /Fo src.obj src.asm
..\..\tools\link /SUBSYSTEM:WINDOWS /BASE:0x400000 /OUT:src.exe /DEF:src.def src.obj 
..\..\tools\bspatch.exe XR_3DA_orig.exe XR_3DA.exe XR_3DA.exe.diff
..\..\tools\patcher.exe XR_3DA.exe src.exe corrections_list.txt

del /Q src.obj
del /Q src.exe
del /Q src.exp
del /Q src.lib
pause
