#Invoke-WebRequest -Uri "https://example.com/path/to/yourfile.zip" -OutFile "C:\Downloads\yourfile.zip"
mkdir C:\docs
mkdir C:\docs\res
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/AKSizov/winstrap/refs/heads/master/res/kanistra-studio-17-service-station.jpg" -OutFile "C:\docs\res\kanistra-studio-17-service-station.jpg"
# Invoke-WebRequest -Uri "https://raw.githubusercontent.com/AKSizov/winstrap/refs/heads/master/res/disable_lwin.ahk" -OutFile "C:\docs\res\disable_lwin.ahk"
explorer C:\docs\res
