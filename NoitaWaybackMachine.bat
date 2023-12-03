@echo off

SETLOCAL EnableDelayedExpansion

@REM Setting the downloader path
pushd %~dp0
echo %~dp0
popd
set downloaderHead=%~dp0DepotDownloader\DepotDownloader\bin\Release\net6.0\DepotDownloader.exe -app 881100 -depot 881101 -manifest 

@REM Set manifest id to download
set /p manifest=Which build you want to download? Copy it and right click here then press Enter: 
set downloaderMiddle1= -username 

@REM Logging into steam in order to be able to download the build
set /p downloaderMiddle2=To download the build you need to login into steam, enter your login: 

@REM Set directory for downloaded build
set buildsDirectory= -dir %~dp0Downloaded\
set downloaderTail= -remember-password

@REM Download build
START /B /WAIT %downloaderHead%%manifest%%downloaderMiddle1%%downloaderMiddle2%%buildsDirectory%%manifest%%downloaderTail%

@REM Set build directory active
cd %buildsDirectory%%manifest%

@REM Notify player that we're ready
echo Downloaded build %manifest%, enjoy playing!

@REM Open directory with the game
cd %~dp0Downloaded\%manifest%
set targetFilePath=%~dp0Downloaded\%manifest%\noita.exe
START /B /WAIT %SystemRoot%\Explorer.exe /select,%targetFilePath%

@REM Launch Noita
START /B /WAIT noita.exe