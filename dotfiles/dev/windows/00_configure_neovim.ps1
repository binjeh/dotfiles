# Copyright (C) 2020-2021 Jef Oliver.
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
# SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR
# IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
# Authors:
# Jef Oliver <jef@eljef.me>

$cocPlugins=@('coc-css',
              'coc-diagnostic',
              'coc-docker',
              'coc-highlight',
              'coc-html',
              'coc-json',
              'coc-markdownlint',
              'coc-python',
              'coc-rls',
              'coc-sh',
              'coc-tsserver',
              'coc-vetur',
              'coc-yaml'
)

$fileName=$MyInvocation.MyCommand.Source
$baseDir = $(Split-Path $fileName -Parent)
$baseFound = $False
while ($baseDir -ne "") {
    $scPath = $(Join-Path -Path "$baseDir" -ChildPath "script_common")
    if (Test-Path "$scPath") {
        $baseFound = $True
        break;
    }

    $baseDir=$(Split-Path $baseDir -Parent)
}
if (!($baseFound)) {
    $HOST.UI.WriteErrorLine("Could not find base diretory or script_common")
    Exit -1
}
$commonScript = $(Join-Path -Path $baseDir -ChildPath "script_common\common.ps1")
. $commonScript

################################################################################
# Functionality Below
################################################################################

Confirm-Install nvim neovim | Out-Null
Confirm-Install pwsh powershell-core | Out-Null
Confirm-Install sed base.sed | Out-Null

$nodeExec = $(Confirm-Install node.exe nodejs) -replace "\\", "\/"
$pythonExec = $(Confirm-Install python.exe python) -replace "\\", "\/"

$neovim_buffer_text = @"

    When the plugin installation is done,
    Please close neovim with :qa!

    Thanks for playing along!

"@

if (Test-IsCore)
{
    $filesDir = $( Join-Path -Path $baseDir -ChildPath "dotfiles\dev\files" )

    $nvimDir = Join-Path -Path "$env:LOCALAPPDATA" -ChildPath "nvim"

    Copy-File $( Join-Path -Path $filesDir -ChildPath "nvim\coc.vim" ) $( Join-Path -Path "$nvimDir" -ChildPath "coc.vim" )
    Copy-File $( Join-Path -Path $filesDir -ChildPath "nvim\coc-node-path.vim" ) $( Join-Path -Path "$nvimDir" -ChildPath "coc-node-path.vim" )
    Copy-File $( Join-Path -Path $filesDir -ChildPath "nvim\dev_windows.vim" ) $( Join-Path -Path "$nvimDir" -ChildPath "dev.vim" )
    Copy-File $( Join-Path -Path $filesDir -ChildPath "nvim\files.vim" ) $( Join-Path -Path "$nvimDir" -ChildPath "files.vim" )
    Copy-File $( Join-Path -Path $filesDir -ChildPath "nvim\omnifunc.vim" ) $( Join-Path -Path "$nvimDir" -ChildPath "omnifunc.vim" )
    Copy-File $( Join-Path -Path $filesDir -ChildPath "nvim\plugins_windows.vim" ) $( Join-Path -Path "$nvimDir" -ChildPath "plugins.vim" )
    Copy-File $( Join-Path -Path $filesDir -ChildPath "coc-settings.json" ) $( Join-Path -Path "$nvimDir" -ChildPath "coc-settings.json" )

    # Fix node executable location
    Invoke-Executable "sed" @("-i", "-e",
    "`"s/let g:coc_node_path.*/let g:coc_node_path='$nodeExec'/`"",
    $( Join-Path -Path "$nvimDir" -ChildPath "coc-node-path.vim" ))

    # Fix python executable location
    Invoke-Executable "sed" @("-i", "-e",
    "`"s/\/usr\/bin\/python/$pythonExec/g`"",
    $( Join-Path -Path "$nvimDir" -ChildPath "coc-settings.json" ))

    $neovim_buffer_text | nvim -c PlugInstall

    $cocCommand = @("CocInstall") + $cocPlugins
    $neovim_buffer_text | nvim -c ($cocCommand -Join " ")

    Write-Host "neovim configuration complete"
    Wait-ForExit 0
}
else {
    Start-Process pwsh.exe -ArgumentList "-Command $fileName"
}
