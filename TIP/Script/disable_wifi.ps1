Get-NetAdapter | format-table
Disable-NetAdapter -Name "Wi-Fi" -Confirm:$false
#Enable
#Enable-NetAdapter -Name "Wi-Fi" -Confirm:$false