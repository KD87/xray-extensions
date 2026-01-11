@echo off
cd 3312_shoc_10006\build

if exist mydll.obj del mydll.obj
if exist mydll.dll del mydll.dll
if exist mydll.exp del mydll.exp
if exist mydll.lib del mydll.lib

..\..\tools\ml /c /coff /Fo mydll.obj ..\mydll.asm
..\..\tools\link /SUBSYSTEM:WINDOWS /DLL /OUT:mydll.dll /DEF:..\mydll.def mydll.obj 
rem /SAFESEH:NO /MAP:map.txt

if exist mydll.obj del mydll.obj
if exist mydll.exp del mydll.exp
if exist mydll.lib del mydll.lib

if exist xrGame.dll del xrGame.dll
if exist corrections_list_tmp.txt del corrections_list_tmp.txt

..\..\tools\gpp.exe -o corrections_list_tmp.txt +z --nostdinc corrections_list.txt
rem ..\..\tools\gpp.exe -o corrections_list_tmp.txt +z -n +c ";" "\n" +c "\n;" "\n" --nostdinc corrections_list.txt
..\..\tools\bspatch.exe xrGame_orig.dll xrGame.dll xrGame.diff
..\..\tools\patcher.exe xrGame.dll mydll.dll corrections_list_tmp.txt

if exist mydll.dll del mydll.dll
if exist corrections_list_tmp.txt del corrections_list_tmp.txt

pause
