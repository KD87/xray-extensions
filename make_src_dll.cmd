@echo off
if exist mydll.obj del mydll.obj
if exist mydll.dll del mydll.dll
c:\masm32\bin\ml /c /coff /Fo mydll.obj mydll.asm
c:\masm32\bin\Link /SUBSYSTEM:WINDOWS /DLL /OUT:mydll.dll /DEF:mydll.def mydll.obj 
del mydll.obj
del mydll.exp
del mydll.lib

pause