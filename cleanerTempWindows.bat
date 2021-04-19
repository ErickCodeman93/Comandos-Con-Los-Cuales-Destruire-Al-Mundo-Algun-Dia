@echo off
:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /C "%~dp0"
::--------------------------------------

::ENTER YOUR CODE BELOW:

color 0A

@REM Temporales del disco
CD C:\Windows\Temp

ECHO .
ECHO Borrando Archivos temporales del disco
ECHO .

@REM Borra todo los archivos y no pregunta
DEL *.* /q
@REM Lista los archivos que quedan en el directorio
DIR 

@REM Temporales del usuario
CD C:\Users\Usuario\AppData\Local\Temp
ECHO .
ECHO Borrando Archivos temporales del Usuario
ECHO .

@REM Borra todo los archivos y no pregunta
DEL *.* /q
@REM Lista los archivos que quedan en el directorio
DIR 

@REM Intenta borrar la papelera de reciclaje
RD /s %systemdrive%\$Recycle.Bin /q

PAUSE

MSG * Limpieza Terminada !!!
START shell:RecycleBinFolder

EXIT


