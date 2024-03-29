#==============================================================================
# User Profile for Power Shell
# Set the link target of PowerShell icon as follows:
#   powershell.exe -NoLogo -NoExit -File Profile.ps1
#==============================================================================
$dirNameVsDev = &"C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe" -version 16.0 -latest -property installationpath
Import-Module (Join-Path $dirNameVsDev "Common7\Tools\Microsoft.VisualStudio.DevShell.dll")
Enter-VsDevShell -VsInstallPath $dirNameVsDev -SkipAutomaticLocation -DevCmdArguments -arch=x64

#$Env:GURAX_PATH = "script;build\Debug;build\Release"

$Env:Path += ";C:\Program Files\7-zip\"
$Env:Path += ";C:\Program Files\git\bin\"
$Env:Path += ";$dirNameVsDev\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\"
$Env:Path += ";$dirNameVsDev\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer\Git\usr\bin\"
$Env:Path += ";$HOME\Source\gurax\bin\"

. $PSScriptRoot\def-function.ps1
