@echo off
set VCVERSION=2017
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\Tools\VsDevCmd.bat" -arch=x86

set DIRCMD=/OG /ON
set GURAPATH=msc
path=%USERPROFILE%\gura\bin-x86;%path%
path=%path%;C:\Program Files (x86)\TeraPad
path=%path%;C:\Program Files (x86)\BzEditor
path=%path%;%USERPROFILE%\gura\guest\buildtools-mswin\7za920
path=%path%;%USERPROFILE%\gura\guest\buildtools-mswin\curl
path=%path%;%USERPROFILE%\gura\guest\buildtools-mswin\UnxUtils
path=%path%;%USERPROFILE%\gura\guest\buildtools-mswin\wix38-binaries
path=%path%;%USERPROFILE%\bin
path=%path%;%USERPROFILE%\bin\VJR200_131
path=%path%;%USERPROFILE%\bin\jrasm
path=%path%;C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer\Git\cmd
doskey gura-archive=gura -S archive.gura $*
doskey gura-genmod=gura -S genmod.gura $*
doskey gura-genclass=gura -S genclass.gura $*
doskey gura-grep=gura -S grep.gura $*
