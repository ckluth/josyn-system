@echo off
CHCP 1252
cd /d "%~dp0.."

dotnet pack JOSYN.Jap.Shared.Contract --output "..\..\local-packages"
if %ERRORLEVEL% neq 0 (
    echo [FEHLER] Pack JOSYN.Jap.Shared.Contract fehlgeschlagen.
    exit /b %ERRORLEVEL%
)

dotnet pack JOSYN.Jap.Shared.Log --output "..\..\local-packages"
if %ERRORLEVEL% neq 0 (
    echo [FEHLER] Pack JOSYN.Jap.Shared.Log fehlgeschlagen.
    exit /b %ERRORLEVEL%
)

echo.
echo [OK] Beide Pakete erfolgreich gepackt.
REM pause
