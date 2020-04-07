#==============================================================================
# User Profile for Power Shell
# Set the link target of PowerShell icon as follows:
#   PowerShell /NoLogo /NoExit /File Profile.ps1
#==============================================================================
$installPath = &"C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe" -version 16.0 -property installationpath
Import-Module (Join-Path $installPath "Common7\Tools\Microsoft.VisualStudio.DevShell.dll")
Enter-VsDevShell -VsInstallPath $installPath -SkipAutomaticLocation -DevCmdArguments -arch=x64

#$Env:GURAX_DIRBASE = "${Home}\source\gurax"
$Env:GURAX_PATH = "build/Debug;build/Release"

$Env:Path += ";C:\Program Files\7-zip\"
$Env:Path += ";C:\Program Files\git\bin\"
$Env:Path += ";${installPath}\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\"
$Env:Path += ";${installPath}\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer\Git\usr\bin\"
$Env:Path += ";${HOME}\Source\gurax\bin\"

function prompt {
    "$($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1))";
}

function gurax-genclass { gurax -S genclass.gura $args }
function gurax-genmod { gurax -S genmod.gura $args }

function build { cmake --build build $args }
