set PSPBASE=C:\OrCAD\OrCAD_16.0\tools\pspice
set CIRBASE=C:\Documents\TESIS\fiocs\Nightly-SIM\CIR-files
set CSDBASE=C:\Documents\TESIS\fiocs\Nightly-SIM\CSD-files
set ZIPBASE=

%PSPBASE%\psp_cmd.exe %CIRBASE%\*.*

%ZIPBASE% %CSDBASE%\%DATE%\