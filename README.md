# What is this?

This helps install and run https://github.com/yt-dlp/yt-dlp on a Windows computer to download songs from videos.

I got very tired of the clicky-clicky methods used for Python and FFmpeg installers and scripted it.

Note that FFmpeg is installed right in this directory, and the install.ps1 script adds the ffmpeg\bin folder to your system path and reboots your system.

# Install

* Open Admin PowerShell
* Run "set-executionpolicy unrestricted" to allow scripts
* Run "./install.ps1" to run install script
* Run "set-executionpolicy restricted" to put back Windows to the secure setting

# Usage

* Paste in the URL to the video you want to download audio for in input.md, including playlists
* Open Powershell in this folder (non-admin is fine)
* Ch

# Licence
GPLv3 applied to match ffmpeg since we're using it here