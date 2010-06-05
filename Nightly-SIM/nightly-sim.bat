

REM STEP 1: Remove the files in the cir folder
REM STEP 2: Make a SVN update for CIR folder
REM STEP 3: Read all the files to simulate
REM STEP 4: Simulate the files & add it to a 7z file in CSD folder
REM STEP 5: Commit the files


set PSPBASE=C:\OrCAD\OrCAD_16.0\tools\pspice
set CIRBASE=C:\Documents\TESIS\fiocs\Nightly-SIM\CIR-files
set CSDBASE=C:\Documents\TESIS\fiocs\Nightly-SIM\CSD-files
set ZIPBASE=

%PSPBASE%\psp_cmd.exe %CIRBASE%\*.*

%ZIPBASE% %CSDBASE%\%DATE%\