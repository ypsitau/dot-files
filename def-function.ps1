#==============================================================================
# User functions for Power Shell
#==============================================================================
function prompt {
    "$($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1))";
}

function gurax-base64encode { gurax -S base64encode.gura $args }
function gurax-base64decode { gurax -S base64decode.gura $args }
function gurax-diff { gurax -S diff-s.gura $args }
function gurax-genclass { gurax -S genclass.gura $args }
function gurax-genmod { gurax -S genmod.gura $args }

function build {
    if (-not(Test-Path "build")) { cmake . -G Ninja -B build }
    ninja -C build $args
}

function build-Release {
    if (-not(Test-Path "build-Release")) {
        cmake . -G Ninja -B build-Release -DCMAKE_BUILD_TYPE=Release
    }
    ninja -C build-Release $args
}

function create-patch-vs {
    Param([parameter(mandatory)][string]$fileNameOut, [parameter(mandatory)][string]$path)
    $pathNames = Foreach ($fileName in (Get-ChildItem -path $path -recurse -include ('*.vcxproj', '*.sln') -name)) {
        Join-Path ($path -replace "^.\\","") $fileName
    }
    echo $pathNames
    if (Test-Path $fileNameOut) { del $fileNameOut }
    if ($fileNameOut.EndsWith(".tar.gz")) {
        $fileNameTar = $fileNameOut.Substring(0, $fileNameOut.Length - 3)
        7z a $fileNameTar $pathNames
        7z a $fileNameOut $fileNameTar
        if (Test-Path $fileNameTar) { del $fileNameTar }
    } else {
        7z a $fileNameOut $pathNames
    }
}
