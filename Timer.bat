@echo off
setlocal enabledelayedexpansion
title Timer - by Frederik Shull
REM PERSONAL START
cd "C:\Users\zlyfer\Documents\Batchscripts\Timer"
REM PERSONAL END
cd data
if exist running.dat echo There was already running a instance of Timer. - Terminating..
del data1.bat >nul 2>nul
del data2.bat >nul 2>nul
del data1.vbs >nul 2>nul
del running.dat >nul 2>nul
cls
set var= A
echo Write down the time you want the alert to be activated (e.g. 20:15.00).
if %time:~0,1%A==%var% echo Current time:%time:~0,5%.%time:~6,2% & goto skip1
echo Current time: %time:~0,5%.%time:~6,2%
:skip1
set ctime=abc
set /P ctime=Time: 
if %ctime%==abc goto skip1
cls
echo Write down the note which will be shown when the alert gets activated.
echo Time: %ctime%
set /P note=Note: 
echo set ctime=%ctime%>data1.bat
echo set note=%note%>>data1.bat
echo msgbox"'%note%'",0+64,"Timer - %ctime%!">>data1.vbs
echo.
echo Do you want to execute a self-made command-script when time reached?
echo A notepad-windows will open in which you can program your own script.
:re1
set command=123
set /P command=(Y/N)? - 
if /I %command%==n goto skip2
if /I not %command%==y goto re1
echo REM Write down the command-script below, save and close.>data2.bat
notepad data2.bat
:skip2
echo.
echo Timer will continue running in background now...
ping -n 3 localhost >nul
start engine.exe 2>nul
exit