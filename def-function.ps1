#==============================================================================
# User functions for Power Shell
#==============================================================================
function prompt {
    "$($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1))";
}

function gurax-genclass { gurax -S genclass.gura $args }
function gurax-genmod { gurax -S genmod.gura $args }
function gurax-base64encode { gurax -S base64encode.gura $args }
function gurax-base64decode { gurax -S base64decode.gura $args }

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
