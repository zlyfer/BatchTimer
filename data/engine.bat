@echo off
setlocal enabledelayedexpansion
if not exist data1.bat (
echo msgbox"ERROR: 'data1.bat' not found. Timer will be closed now.",0+64,"Timer - ERROR!">data1.vbs
ping -n 2 localhost >nul
start data1.vbs >nul 2>nul
ping -n 2 localhost >nul
del data1.vbs >nul 2>nul
exit
)
call data1.bat >nul 2>nul
echo.>running.dat
:loop
if not exist running.dat (
echo msgbox"ERROR: New instance of Timer detected. Current instance has been terminated.",0+64,"Timer - TERMINATED!">data1.vbs
ping -n 2 localhost >nul
start data1.vbs >nul 2>nul
ping -n 2 localhost >nul
del data1.vbs >nul 2>nul
exit
)
if %time:~0,5%.%time:~6,2%==%ctime% (
start data1.vbs >nul 2>nul
if exist data2.bat start data2.bat >nul 2>nul
ping -n 2 localhost >nul
del running.dat >nul 2>nul
exit
)
goto loop