@echo off
if exist mydll.obj del mydll.obj
if exist mydll.dll del mydll.dll
if exist mydll.exp del mydll.exp
if exist mydll.lib del mydll.lib

..\..\tools\ml_10 /c /coff /DOGSE_BUILD /Fo mydll.obj ..\mydll.asm
rem C:\masm32\bin\link  /SUBSYSTEM:WINDOWS /DLL /OUT:mydll.dll /DEF:..\mydll.def mydll.obj
..\..\tools\link_5  /SUBSYSTEM:WINDOWS /DLL /OUT:mydll.dll /DEF:..\mydll.def mydll.obj
rem /SAFESEH:NO /MAP:map.txt


if exist mydll.obj del mydll.obj
if exist mydll.exp del mydll.exp
if exist mydll.lib del mydll.lib

pause