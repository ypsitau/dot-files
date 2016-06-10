@echo off
set VCVERSION=14.0
call "C:\Program Files (x86)\Microsoft Visual Studio %VCVERSION%\VC\vcvarsall.bat"
set DIRCMD=/OG /ON
path=%USERPROFILE%\gura\bin-x86;%path%
path=%path%;C:\Program Files (x86)\TeraPad
path=%path%;%USERPROFILE%\gura\guest\buildtools-mswin\7za920
path=%path%;%USERPROFILE%\gura\guest\buildtools-mswin\curl
path=%path%;%USERPROFILE%\gura\guest\buildtools-mswin\UnxUtils
path=%path%;%USERPROFILE%\gura\guest\buildtools-mswin\wix38-binaries
