# Copyright (C) 2020 Jef Oliver.
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

. ..\common.ps1

Requires-Install nvim neovim | Out-Null
Requires-Install sed base.sed | Out-Null

##### Variables needed throughout the script ###################################

$vimPlugURI = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

$dirInfo = Dotfiles-Locations $MyInvocation.MyCommand.Source "..\..\.."

$nodeExec = $(Requires-Install node.exe nodejs) -replace "\\", "\/"
$pythonExec = $(Requires-Install python.exe python) -replace "\\", "\/"

$nvimDir = Join-Path -Path "$env:LOCALAPPDATA" -ChildPath "nvim"

##### Functions needed in the script ###########################################

<#
.SYNOPSIS
    Downloads the vim-plug plugin from github.

.DESCRIPTION
    Downloads the vim-plug plugin from github.
#>
function Download-Vim-Plug {
    try {
        (New-Object Net.WebClient).DownloadFile(
            $vimPlugURI,
            $(Join-Path -Path "$nvimDir" -ChildPath "autoload\plug.vim")
        )
    }
    catch {
        Error-Exit "Could not download vim-plug" $Error.Exception.Message
    }
}

##### Actual script functionality ##############################################

Create-Directory $nvimDir
Create-Directory $(Join-Path -Path "$nvimDir" -ChildPath "autoload")
Create-Directory $(Join-Path -Path "$nvimDir" -ChildPath "plugged")

Download-Vim-Plug

Copy-File $(Join-Path -Path $dirInfo.Dotfiles -ChildPath "config\nvim\init.vim") $(Join-Path -Path "$nvimDir" -ChildPath "init.vim")
Copy-File $(Join-Path -Path $dirInfo.Dotfiles -ChildPat "coc-settings.json") $(Join-Path -Path "$nvimDir" -ChildPath "coc-settings.json")

# Fix plugin directory location
try {
    sed -i -e "s/call plug#begin.*/call plug#begin\('~\/AppData\/local\/nvim\/plugged'\)/" $(Join-Path -Path "$nvimDir" -ChildPath "init.vim")
}
catch {
    Error-Exit "Could not sed plug#begin" $Error.Exception.Message
}

# Fix node executable location
try {
    sed -i -e "s/let g:coc_node_path.*/let g:coc_node_path='$nodeExec'/" $(Join-Path -Path "$nvimDir" -ChildPath "init.vim")
}
catch {
    Error-Exit "Could not sed coc_node_path" $Error.Exception.Messaage
}

# Fix python executable location
try {
    sed -i -e "s/\/usr\/bin\/python/$pythonExec/g" $(Join-Path -Path "$nvimDir" -ChildPath "coc-settings.json")
}
catch {
    Error-Exit "Could not sed python executable location for coc-settings" $Error.Exception.Messaage
}

