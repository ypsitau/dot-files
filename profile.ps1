#==============================================================================
# User Profile for Power Shell
# Create a file that has a name indicated by $Profile with the code below:
#   . "C:\Users\ypsit\dot-files\profile.ps1"
#==============================================================================
$Env:Path += ";C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer\Git\cmd\"
$Env:Path += ";C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\"
$Env:Path += ";C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer\Git\usr\bin\"

function prompt {
    "$($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1))";
}
