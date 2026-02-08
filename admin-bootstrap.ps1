# Disable mouse accel
New-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseSpeed" -Value "0" -PropertyType String -Force
New-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseThreshold1" -Value "0" -PropertyType String -Force
New-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseThreshold2" -Value "0" -PropertyType String -Force

# Enable file extensions
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -value 0

# Install choco
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install programs
choco install -y sunshine
choco install -y parsec --params "/Shared"
choco install -y firefox
choco install -y nvidia-app

choco install -y steam
choco install -y minecraft-launcher
choco install -y epicgameslauncher

choco install -y git
choco install -y rsync
# choco install -y autohotkey

choco install -y blender
choco install -y freecad
choco install -y openscad
choco install -y gimp