if exist xrRender_R2.dll del xrRender_R2.dll
..\..\..\tools\bspatch.exe xrRender_R2_orig.dll xrRender_R2.dll xrRender_R2.dll.diff 
pause