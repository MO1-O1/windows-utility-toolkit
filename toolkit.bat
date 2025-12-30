@echo off
setlocal EnableExtensions
title MO1 Windows Utility Toolkit - MO1_1 x ChatGPT
color 0A

:menu
cls
echo ==================================================
echo   MO1 Windows Utility Toolkit
echo   Built by MO1_1 with ChatGPT (technical assistant)
echo ==================================================
echo 1) Clean Temp Files
echo 2) System File Check (SFC)
echo 3) Repair Windows Image (DISM)
echo 4) Restart Network (Release/Renew/FlushDNS)
echo 5) Close Common Apps (Discord/Chrome)
echo 6) System Info
echo 0) Exit
echo ==================================================
set /p choice=Select an option: 

if "%choice%"=="1" goto clean
if "%choice%"=="2" goto sfc
if "%choice%"=="3" goto dism
if "%choice%"=="4" goto network
if "%choice%"=="5" goto closeapps
if "%choice%"=="6" goto info
if "%choice%"=="0" goto end
goto menu

:clean
cls
echo [Clean Temp] Running...
echo Deleting: %temp%
del /f /s /q "%temp%\*" >nul 2>&1
for /d %%D in ("%temp%\*") do rd /s /q "%%D" >nul 2>&1
echo Done. (Some files may be in use and skipped.)
pause
goto menu

:sfc
cls
echo [SFC] System File Checker...
echo Tip: Run this as Administrator for best results.
sfc /scannow
pause
goto menu

:dism
cls
echo [DISM] Repair Windows image...
echo Tip: This may take time. Run as Administrator.
DISM /Online /Cleanup-Image /RestoreHealth
pause
goto menu

:network
cls
echo [Network] Restarting network stack...
ipconfig /release
ipconfig /renew
ipconfig /flushdns
echo Done.
pause
goto menu

:closeapps
cls
echo [Close Apps] Attempting to close common apps...
taskkill /IM discord.exe /F >nul 2>&1
taskkill /IM chrome.exe /F >nul 2>&1
echo Done. (If an app wasn't running, it will be ignored.)
pause
goto menu

:info
cls
echo [System Info]
systeminfo
pause
goto menu

:end
endlocal
exit /b