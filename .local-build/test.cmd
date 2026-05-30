@echo off
CHCP 1252
setlocal

:: -------------------------------------------------------
:: Fuehrt test.cmd in allen Sub-Repos aus.
:: -------------------------------------------------------

set "ROOT=%~dp0.."

call :run_test "josyn-jap-shared"
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

echo.
echo [OK] Alle Tests erfolgreich.
exit /b 0

:run_test
echo.
echo ======================================================
echo  %~1
echo ======================================================
call "%ROOT%\%~1\.local-build\test.cmd"
exit /b %ERRORLEVEL%
