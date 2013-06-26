if exist XR_3DA.exe del XR_3DA.exe

..\..\..\trunk\tools\bspatch.exe XR_3DA_orig.exe XR_3DA.exe XR_3DA.exe.diff
..\..\..\trunk\tools\patcher.exe XR_3DA.exe src.exe corrections_list.txt
pause
