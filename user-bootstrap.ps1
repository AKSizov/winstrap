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

scoop install git
scoop install git-lfs

scoop bucket add extras
scoop bucket add games
scoop bucket add versions
scoop bucket add java
scoop bucket add nonportable

$packages = @(
    'extras/firefox',
    'extras/ungoogled-chromium',
    'extras/discord',
    'extras/spotify',
    'extras/vlc',
    'main/ffmpeg',
    'extras/cpu-z',
    'extras/gpu-z',
    'extras/rufus',
    'extras/autohotkey',
    'extras/obs-studio',
    'extras/godot',
    'extras/blender',
    'extras/gimp',
    'main/7zip',
    'main/syncthing',
    'extras/obsidian',
    'versions/steam',
    'versions/python311',
    'java/openjdk21',
    'extras/vscodium',
    'main/git-lfs',
    'extras/winscp',
    'main/curl'
)

foreach ($pkg in $packages) {
    Write-Host "Installing $pkg..." -ForegroundColor Cyan
    try {
        scoop install $pkg -ErrorAction Stop
        Write-Host "✅ Installed $pkg" -ForegroundColor Green
    } catch {
        Write-Warning "❌ Failed to install $pkg: $_"
    }
}

scoop install nonportable/powertoys-np extras/windowsdesktop-runtime-lts
#scoop install extras/tailscale extras/epic-games-launcher
explorer $env:USERPROFILE\scoop\apps\sunshine\current\scripts
# Run this script as Administrator

# TCP Ports to allow
$tcpPorts = @(47984, 47989, 48010)

# UDP Ports to allow (individual and range)
$udpPorts = @(48002, 48010)
$udpPortRanges = @("47998-48000")

# Function to add a firewall rule for TCP
foreach ($port in $tcpPorts) {
    New-NetFirewallRule -DisplayName "Allow TCP Port $port" `
                        -Direction Inbound `
                        -Protocol TCP `
                        -LocalPort $port `
                        -Action Allow `
                        -Profile Any
}

# Function to add a firewall rule for UDP (individual ports)
foreach ($port in $udpPorts) {
    New-NetFirewallRule -DisplayName "Allow UDP Port $port" `
                        -Direction Inbound `
                        -Protocol UDP `
                        -LocalPort $port `
                        -Action Allow `
                        -Profile Any
}

# Function to add a firewall rule for UDP (ranges)
foreach ($range in $udpPortRanges) {
    New-NetFirewallRule -DisplayName "Allow UDP Ports $range" `
                        -Direction Inbound `
                        -Protocol UDP `
                        -LocalPort $range `
                        -Action Allow `
                        -Profile Any
}

pause