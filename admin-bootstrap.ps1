# Disable mouse accel
New-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseSpeed" -Value "0" -PropertyType String -Force
New-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseThreshold1" -Value "0" -PropertyType String -Force
New-ItemProperty -Path "HKCU:\Control Panel\Mouse" -Name "MouseThreshold2" -Value "0" -PropertyType String -Force

# Enable file extensions
Set-Itemproperty -path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -value 0

# Restore legacy right click menu
reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve

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