@echo off
if exist src.obj del src.obj
if exist src.exe del src.exe
if exist src.exp del src.exp
if exist src.lib del src.lib

g:\masm32\bin\ml /c /coff /Fo src.obj src.asm
g:\masm32\bin\Link /SUBSYSTEM:WINDOWS /BASE:0x400000 /OUT:src.exe /DEF:src.def src.obj 

del src.obj
del src.exp
del src.lib

if exist xr_3DA.exe del xr_3DA.exe
..\..\..\trunk\tools\bspatch.exe xr_3DA_orig.exe xr_3DA.exe xr_3DA.exe.diff 
..\..\..\trunk\tools\patcher.exe xr_3DA.exe src.exe corrections_list.txt
copy xr_3DA.exe "G:\GAMES\STALKER\SOC\bin\"
pause