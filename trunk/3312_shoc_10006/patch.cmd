if exist xrGame.dll del xrGame.dll

..\tools\bspatch.exe xrGame_orig.dll xrGame.dll xrGame.diff
..\tools\patcher.exe xrGame.dll mydll.dll corrections_list.txt
