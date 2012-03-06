@echo off
if exist mydll.obj del mydll.obj
if exist mydll.dll del mydll.dll
if exist mydll.exp del mydll.exp
if exist mydll.lib del mydll.lib

..\tools\ml /c /coff /Fo mydll.obj mydll.asm
rem ..\tools\Link /SUBSYSTEM:WINDOWS /DLL /OUT:mydll.dll /DEF:mydll.def mydll.obj /SAFESEH:NO /MAP:map.txt
C:\masm32\bin\link.exe  /SUBSYSTEM:WINDOWS /DLL /OUT:mydll.dll /DEF:mydll.def mydll.obj 
rem /SAFESEH:NO /MAP:map.txt


del mydll.obj
del mydll.exp
del mydll.lib

pause