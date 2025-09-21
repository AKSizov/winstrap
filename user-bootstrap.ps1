#Invoke-WebRequest -Uri "https://example.com/path/to/yourfile.zip" -OutFile "C:\Downloads\yourfile.zip"
mkdir C:\docs
mkdir C:\docs\res
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/AKSizov/winstrap/refs/heads/master/res/kanistra-studio-17-service-station.jpg" -OutFile "C:\docs\res\kanistra-studio-17-service-station.jpg"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/AKSizov/winstrap/refs/heads/master/res/disable_lwin.ahk" -OutFile "C:\docs\res\disable_lwin.ahk"
explorer C:\docs\res


Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
# Install Scoop only if it's not already installed
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    powershell -NoProfile -Command "irm get.scoop.sh | iex"
}

scoop install git
scoop install git-lfs

scoop bucket add extras
scoop bucket add games
scoop bucket add versions
scoop bucket add java
scoop bucket add nonportable

scoop install extras/firefox
scoop install extras/ungoogled-chromium
scoop install extras/discord
scoop install extras/spotify
scoop install extras/vlc
scoop install main/ffmpeg
scoop install extras/cpu-z
scoop install extras/gpu-z
scoop install extras/rufus
scoop install extras/autohotkey
scoop install extras/obs-studio
scoop install extras/godot
scoop install extras/blender
scoop install extras/gimp
scoop install main/7zip
scoop install main/syncthing
scoop install extras/obsidian
scoop install versions/steam
scoop install versions/python311
scoop install java/openjdk21
scoop install extras/vscodium
scoop install main/git-lfs
scoop install extras/winscp
scoop install main/curl

scoop install nonportable/powertoys-np extras/windowsdesktop-runtime-lts
#scoop install extras/tailscale extras/epic-games-launcher
explorer $env:USERPROFILE\scoop\apps\sunshine\current\scripts
pause