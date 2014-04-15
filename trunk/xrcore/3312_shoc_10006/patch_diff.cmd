if exist xrCore.dll del xrCore.dll
..\..\tools\bspatch.exe xrCore_orig.dll xrCore.dll xrCore.dll.diff 
pause