#Invoke-WebRequest -Uri "https://example.com/path/to/yourfile.zip" -OutFile "C:\Downloads\yourfile.zip"
mkdir C:\docs
mkdir C:\docs\res
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/AKSizov/winstrap/refs/heads/master/res/kanistra-studio-17-service-station.jpg" -OutFile "C:\docs\res\kanistra-studio-17-service-station.jpg"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/AKSizov/winstrap/refs/heads/master/res/disable_lwin.ahk" -OutFile "C:\docs\res\disable_lwin.ahk"
explorer C:\docs\res


Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
# Install Scoop only if it's not already installed
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    irm get.scoop.sh | iex
}

scoop bucket add extras
scoop bucket add games
scoop bucket add versions
scoop bucket add java
scoop bucket add nonportable
scoop install extras/firefox extras/ungoogled-chromium extras/discord extras/tailscale extras/spotify extras/vlc main/ffmpeg extras/cpu-z extras/gpu-z extras/rufus extras/autohotkey extras/obs-studio extras/godot extras/blender extras/gimp main/7zip main/syncthing extras/obsidian versions/steam epic-games-launcher versions/python311 java/openjdk21 extras/vscodium main/git-lfs extras/winscp main/curl
scoop install nonportable/powertoys-np
pause