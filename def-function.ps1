#==============================================================================
# User functions for Power Shell
#==============================================================================
function gurax-dev {
    $Env:Path = "$HOME\source\gurax\bin\;$Env:Path"
    $Env:GURAX_PATH = "build\Debug;build\Release"
}

function prompt {
    "$($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1))";
}

function zenn-preview { npx zenn preview }

function zenn-new { npx zenn new:article --slug $args }
function gurax-base64encode { gurax -S base64encode.gura $args }
function gurax-base64decode { gurax -S base64decode.gura $args }
function gurax-diff { gurax -S diff-s.gura $args }
function gurax-genclass { gurax -S genclass.gura $args }
function gurax-genmod { gurax -S genmod.gura $args }
function gurax-dump { gurax -S dump.gura $args }

function stop-exploer { stop-process -name explorer }

function pico-ocd {
    openocd -f interface/cmsis-dap.cfg -f target/rp2040.cfg -c "adapter speed 5000"
}

function pico-gdb {
    arm-none-eabi-gdb -q -ex "target remote localhost:3333" -ex "monitor reset init" -ex "load" $args
}

function pico-run {
    arm-none-eabi-gdb -q -ex "target remote localhost:3333" -ex "monitor reset init" -ex "load" -ex "continue" $args
}

function arduino-genasm {
    gurax "$Env:USERPROFILE\source\Arduino\script\arduino-genasm.gura" $args
}

function arduino-compile {
    arduino-cli compile --fqbn arduino:avr:pro --build-path build $args
    gurax "$Env:USERPROFILE\source\Arduino\script\arduino-genasm.gura" build
}

function arduino-upload {
    arduino-cli compile --fqbn arduino:avr:pro --build-path build --upload --port com5 $args
    gurax "$Env:USERPROFILE\source\Arduino\script\arduino-genasm.gura" build
}

function avrdude-p {
    avrdude -C "$Env:LOCALAPPDATA\Arduino15\packages\arduino\tools\avrdude\6.3.0-arduino17\etc\avrdude.conf" `
        -c arduino -P com5 -b 57600 -p atmega328p $args
}

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
