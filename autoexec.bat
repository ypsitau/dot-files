@echo off
call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"
set DIRCMD=/OG /ON
path=%path%;C:\Program Files (x86)\TeraPad
path=C:\Users\ypsitau\Documents\gura\bin-x86;%path%
path=%path%;C:\Users\ypsitau\Documents\gura\guest\buildtools-mswin\7za920
path=%path%;C:\Users\ypsitau\Documents\gura\guest\buildtools-mswin\curl
path=%path%;C:\Users\ypsitau\Documents\gura\guest\buildtools-mswin\UnxUtils
path=%path%;C:\Users\ypsitau\Documents\gura\guest\buildtools-mswin\wix38-binaries
