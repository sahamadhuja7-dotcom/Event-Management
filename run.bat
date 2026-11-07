@echo off
title CampusConnect Server
echo ============================================================
echo         Starting CampusConnect Web Application
echo ============================================================
echo.

set "PY_EXE="

REM 1. Check local venv
if exist "%~dp0backend\venv\Scripts\python.exe" (
    set "PY_EXE=%~dp0backend\venv\Scripts\python.exe"
    goto launch
)

REM 2. Check dedicated Codex Python (Primary runtime)
if exist "%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe" (
    set "PY_EXE=%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
    goto launch
)

REM 3. Check AppData Python312
if exist "%LOCALAPPDATA%\Programs\Python\Python312\python.exe" (
    set "PY_EXE=%LOCALAPPDATA%\Programs\Python\Python312\python.exe"
    goto launch
)

REM 4. Try standard where python
for /f "delims=" %%i in ('where python 2^>nul') do (
    set "PY_EXE=%%i"
    goto launch
)

REM 5. Try py launcher
for /f "delims=" %%i in ('where py 2^>nul') do (
    set "PY_EXE=%%i"
    goto launch
)

echo [ERROR] Python was not found automatically.
echo Please install Python 3.10+ from python.org
pause
exit /b 1

:launch
echo Detected Python: "%PY_EXE%"
echo.
cd /d "%~dp0backend"
"%PY_EXE%" app.py

if %ERRORLEVEL% neq 0 (
    echo.
    echo [ERROR] The server exited with error code %ERRORLEVEL%.
    pause
)
