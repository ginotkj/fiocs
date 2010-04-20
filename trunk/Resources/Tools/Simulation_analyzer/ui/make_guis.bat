CLS

@ECHO OFF

ECHO.
ECHO ESTE PROGRAMA GENERA LOS ARCHIVOS .PY EN BASE A LOS .UI DE QT
ECHO.

REM 1) CREAMOS AL QUE SE ENCARGA DE LLAMAR
rem ECHO process.bat > fragment.txt

REM 2) CREAMOS LISTA DE ARCHIVOS
REM FOR %%x IN (*.ui) DO ECHO %%x >> data.txt
REM READS THE FILES WITHOUT THE EXTENSION
@FOR /f "delims=" %%? IN ('DIR/b *.ui') DO @ECHO/%%~n? >> tempdata.txt
REM CLEAN BLANK LINES IN THE FILE
@FOR /F "tokens=* delims=" %%A IN (tempdata.txt) DO (ECHO %%A >> data.txt)

REM 3) CREAMOS ARCHIVO DE PROCESOS
ECHO IF "%%1" == "" GOTO EXIT > process.bat
ECHO ECHO Backuping file: %%1.ui >> process.bat
ECHO SET BACKED=%%1.ui.backup >> process.bat
ECHO COPY /V %%1.ui %%BACKED%% >> process.bat
ECHO ECHO Creating PyQt file: %%1.ui >> process.bat
ECHO SET PYUIC="C:\Python26_x86\Lib\site-packages\PyQt4\uic\pyuic.py" >> process.bat
ECHO SET PYFILE=%%1.py >> process.bat
ECHO python %%PYUIC%% %%1.ui ^> %%PYFILE%% >> process.bat
ECHO ECHO. >> process.bat
ECHO :EXIT >> process.bat

REM 4) MAIN PROGRAM
:START
COPY fragment.txt + data.txt data.bat > NUL
CALL data.bat
TYPE data.bat | FIND /v /i "process.bat" > data.txt
DIR data.txt | FIND " 0 bytes" > NUL
IF ERRORLEVEL 1 GOTO START

REM 5) CLEANING FILEs
ECHO Deleting files...
DEL data.txt
DEL tempdata.txt
DEL process.bat
DEL data.bat
:DONE