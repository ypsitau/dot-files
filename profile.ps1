#==============================================================================
# User Profile for Power Shell
# Set the link target of PowerShell icon as follows:
#   powershell.exe -NoLogo -NoExit -File Profile.ps1
#==============================================================================
$dirNameVsDev = &"C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe" -version 16.0 -latest -property installationpath
Import-Module (Join-Path $dirNameVsDev "Common7\Tools\Microsoft.VisualStudio.DevShell.dll")
Enter-VsDevShell -VsInstallPath $dirNameVsDev -SkipAutomaticLocation -DevCmdArguments -arch=x64

$Env:GURAX_PATH = "build\Debug;build\Release"

$Env:Path += ";C:\Program Files\sigrok\sigrok-cli\"
$Env:Path += ";C:\Program Files\7-zip\"
$Env:Path += ";C:\Program Files\git\bin\"
$Env:Path += ";C:\Program Files (x86)\BzEditor\"
$Env:Path += ";$dirNameVsDev\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\"
$Env:Path += ";$dirNameVsDev\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer\Git\usr\bin\"
$Env:Path += ";$HOME\source\gurax\bin\"
$Env:Path += ";$HOME\bin\"
# Raspberry Pi Pico
$Env:PICO_SDK_PATH = "$HOME\.pico-sdk\sdk\2.1.1"
$Env:PICO_TOOLCHAIN_PATH = "$HOME\.pico-sdk\toolchain\13_3_Rel1\bin"
$Env:Path += ";$Env:PICO_TOOLCHAIN_PATH"
$Env:Path += ";$HOME\.pico-sdk\cmake\v3.31.5\bin\"
$Env:Path += ";$HOME\.pico-sdk\picotool\2.1.1\picotool"
$Env:Path += ";$HOME\.pico-sdk\tools\2.1.1\pioasm"
$Env:Path += ";$HOME\.pico-sdk\openocd\0.12.0+dev"
# Arduino
$Env:Path += ";C:\Program Files\arduino-cli\"
$Env:Path += ";C:\Program Files\avrdude\"
$Env:Path += ";$Env:LOCALAPPDATA\Arduino15\packages\arduino\tools\avr-gcc\7.3.0-atmel3.6.1-arduino7\bin\"
#$Env:Path += ";$Env:LOCALAPPDATA\Arduino15\packages\arduino\tools\avrdude\6.3.0-arduino17\bin\"

. $PSScriptRoot\def-function.ps1
