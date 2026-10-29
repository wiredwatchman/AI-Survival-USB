@echo off
title AI Survival USB: Stop
color 0C

echo.
echo  Stopping the AI server...
taskkill /f /im ollama.exe >nul 2>&1
timeout /t 2 /nobreak >nul

tasklist | find /i "ollama.exe" >nul 2>&1
if not errorlevel 1 (
    echo  The AI server is still running. Trying once more...
    taskkill /f /t /im ollama.exe >nul 2>&1
    timeout /t 2 /nobreak >nul
)

echo.
echo  ============================================================
echo    Done. The AI server is stopped.
echo    You can now safely eject the USB drive.
echo  ============================================================
echo.
pause
