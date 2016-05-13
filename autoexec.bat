@echo off
rem call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"

call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat"
set DIRCMD=/OG /ON
path=%path%;C:\Program Files (x86)\TeraPad
path=%USERPROFILE%\Documents\gura\bin-x86;%path%
path=%path%;%USERPROFILE%\Documents\gura\guest\buildtools-mswin\7za920
path=%path%;%USERPROFILE%\Documents\gura\guest\buildtools-mswin\curl
path=%path%;%USERPROFILE%\Documents\gura\guest\buildtools-mswin\UnxUtils
path=%path%;%USERPROFILE%\Documents\gura\guest\buildtools-mswin\wix38-binaries
