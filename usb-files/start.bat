@echo off
title AI Survival USB
color 0A
setlocal
set "DRIVE=%~d0"
set "MODEL=llama3"
set "OLLAMA_MODELS=%DRIVE%\ollama\models"

echo.
echo  ============================================================
echo    AI SURVIVAL USB: offline AI helper
echo    No internet needed to run it
echo  ============================================================
echo.

if not exist "%DRIVE%\ollama.exe" (
    echo [STOP] ollama.exe is not on this USB drive.
    echo        Read START-HERE.txt on the drive, then try again.
    echo.
    pause
    exit /b 1
)

if not exist "%DRIVE%\ollama\models" (
    echo [STOP] The model folder is missing: %DRIVE%\ollama\models
    echo        Read START-HERE.txt on the drive, then try again.
    echo.
    pause
    exit /b 1
)

echo [1/3] Stopping any old AI server...
taskkill /f /im ollama.exe >nul 2>&1
timeout /t 2 /nobreak >nul

echo [2/3] Starting the AI server...
start "AI Server" /min "%DRIVE%\ollama.exe" serve

echo [3/3] Waiting for the server to answer...
set /a TRIES=0

:waitloop
set /a TRIES+=1
if %TRIES% GTR 30 goto failed
timeout /t 2 /nobreak >nul
netstat -an | find ":11434" | find "LISTENING" >nul 2>&1
if errorlevel 1 goto waitloop
goto ready

:failed
echo.
echo [STOP] The AI server did not start after about 60 seconds.
echo        Run stop.bat, restart the PC, and try again.
echo.
pause
exit /b 1

:ready
echo.
echo  ============================================================
echo    READY. Type your question and press Enter.
echo    Type /bye to leave the chat.
echo    When you are done, double-click stop.bat.
echo  ============================================================
echo.

"%DRIVE%\ollama.exe" run %MODEL%

echo.
echo  Chat closed. Double-click stop.bat to shut the AI server down.
pause
