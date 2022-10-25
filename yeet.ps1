$PSNativeCommandUseErrorActionPreference = $true 
$ErrorActionPreference = 'Stop'

yt-dlp -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' --batch-file input.md --extract-audio --audio-format mp3 --add-metadata