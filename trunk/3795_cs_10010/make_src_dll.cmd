@echo off
if exist mydll.obj del mydll.obj
if exist mydll.dll del mydll.dll
if exist mydll.exp del mydll.exp
if exist mydll.lib del mydll.lib

..\tools\ml /c /coff /Fo mydll.obj mydll.asm
c:\masm32\bin\Link /DLL /OUT:mydll.dll /DEF:mydll.def mydll.obj 

del mydll.obj
del mydll.exp
del mydll.lib

pause