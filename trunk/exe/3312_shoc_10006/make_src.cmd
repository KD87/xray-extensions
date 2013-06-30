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

pause