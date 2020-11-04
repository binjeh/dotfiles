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

. .\common.ps1

try {
    Install-PackageProvider Nuget -Force
}
catch {
    Error-Exit "Could not install Nuget" $Error.Exception.Message
}

try {
    Install-Module -Name PowerShellGet -Force -AllowClobber
}
catch {
    Error-Exit "Could not install PowerShellGet" $Error.Exception.Message
}

try {
    Update-Module -Name PowerShellGet
}
catch {
    Error-Exit "Could not update PowerShellGet" $Error.Exception.Message
}

