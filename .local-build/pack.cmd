@echo off
CHCP 1252
setlocal

:: -------------------------------------------------------
:: Fuehrt pack.cmd in allen Sub-Repos aus.
:: -------------------------------------------------------

set "ROOT=%~dp0.."

call :run_pack "josyn-jap-shared"
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

echo.
echo [OK] Alle Pakete erfolgreich erstellt.
exit /b 0

:run_pack
echo.
echo ======================================================
echo  %~1
echo ======================================================
call "%ROOT%\%~1\.local-build\pack.cmd"
exit /b %ERRORLEVEL%
