echo off
if exist xrGame.dll del xrGame.dll
if exist corrections_list_tmp.txt del corrections_list_tmp.txt

..\..\tools\gpp.exe -o corrections_list_tmp.txt -DPZ +z --nostdinc corrections_list.txt
rem ..\..\tools\gpp.exe -o corrections_list_tmp.txt -DPZ +z -n +c ";" "\n" +c "\n;" "\n" --nostdinc corrections_list.txt
..\..\tools\bspatch.exe xrGame_orig.dll xrGame.dll xrGame.diff
..\..\tools\patcher.exe xrGame.dll mydll.dll corrections_list_tmp.txt

if exist mydll.dll del mydll.dll
if exist corrections_list_tmp.txt del corrections_list_tmp.txt

pause