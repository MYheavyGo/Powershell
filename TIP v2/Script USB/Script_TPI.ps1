Set-TimeZone -Name "W. Europe Standard Time"
#Install Windows Updates
Install-Module PSWindowsUpdate
Get-WindowsUpdate
Install-WindowsUpdate
#Disable screen rotation
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AutoRotation -Name Enable -Value 0 -Type DWord
#Disable Wifi
Disable-NetAdapter -Name "Wi-Fi" -Confirm:$false
#Disable Windows Update with his service
stop-service wuauserv
set-service wuauserv –startup disabled
#Create a local User with the associated password
$Password = 'PpadU$er01'
New-LocalUser "Ppad-user" -Password $Password -FullName "PolicePad User" -Description "PolicePad Account."
Add-LocalGroupMember -Group "Users" -Member "Ppad-user"