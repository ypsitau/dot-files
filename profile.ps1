#==============================================================================
# User Profile for Power Shell
# Set the link target of PowerShell icon as follows:
#   PowerShell -NoLogo -NoExit -File Profile.ps1
#==============================================================================
$installPath = &"C:\Program Files (x86)\Microsoft Visual Studio\Installer\vswhere.exe" -version 16.0 -property installationpath
Import-Module (Join-Path $installPath "Common7\Tools\Microsoft.VisualStudio.DevShell.dll")
Enter-VsDevShell -VsInstallPath $installPath -SkipAutomaticLocation

$Env:Path += ";C:\Program Files\7-zip\"
$Env:Path += ";${installPath}\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer\Git\cmd\"
$Env:Path += ";${installPath}\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\"
$Env:Path += ";${installPath}\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer\Git\usr\bin\"

function prompt {
    "$($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1))";
}
