$PSNativeCommandUseErrorActionPreference = $true 
$ErrorActionPreference = 'Stop'

try {
    Get-Command python
} catch {
    winget install --accept-package-agreements --accept-source-agreements python
}

try {
    Get-Command yt-dlp
} catch {
    try {
        python -m pip install -U yt-dlp
    } catch {
        throw
    }
}

if (-not (Test-Path -Path ".\ffmpeg")) {
    if (-not (Test-Path -Path ".\ffmpeg-master-latest-win64-gpl.zip")) {
        throw "ffmpeg installer zip not found: ffmpeg-master-latest-win64-gpl.zip"
    }
    Expand-Archive -LiteralPath ffmpeg-master-latest-win64-gpl.zip -DestinationPath .
    Move-Item ffmpeg-master-latest-win64-gpl ffmpeg
}


# Modify Path
$oldpath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
$found = $oldpath -like '*ffmpeg*'
if (-not $found) {
    Write-Output 'Adding ffmpeg to path, a restart is required'
    $here = (Get-Location).Path
    $newpath = "$oldpath$here\ffmpeg\bin;"
    Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $newPath
    Stop-Process -Name explorer
    Restart-Computer
}

Write-Output 'All components installed'