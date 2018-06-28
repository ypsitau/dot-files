@echo off
set VCVERSION=2017
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\vsdevcmd.bat" -arch=x86
set DIRCMD=/OG /ON
path=%USERPROFILE%\gura\bin-x86;%path%
path=%path%;C:\Program Files (x86)\TeraPad
path=%path%;%USERPROFILE%\gura\guest\buildtools-mswin\7za920
path=%path%;%USERPROFILE%\gura\guest\buildtools-mswin\curl
path=%path%;%USERPROFILE%\gura\guest\buildtools-mswin\UnxUtils
path=%path%;%USERPROFILE%\gura\guest\buildtools-mswin\wix38-binaries
doskey gura-archive=gura -S archive.gura $*
doskey gura-genmod=gura -S genmod.gura $*
doskey gura-genclass=gura -S genclass.gura $*
doskey gura-grep=gura -S grep.gura $*
