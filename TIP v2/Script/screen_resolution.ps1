$UserProfiles = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\*" | Where {$_.PSChildName -match "S-1-5-21-(\d+-?){4}$" } | Select-Object @{Name="SID"; Expression={$_.PSChildName}}, @{Name="UserHive";Expression={"$($_.ProfileImagePath)\NTuser.dat"}}

# write-host $UserProfiles

$UserProfile = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\*" | Where {$_.ProfileImagePath -match "Ppad-user" } | Select-Object @{Name="SID"; Expression={$_.PSChildName}}, @{Name="UserHive";Expression={"$($_.ProfileImagePath)\NTuser.dat"}}

write-host $UserProfile


If (($ProfileWasLoaded = Test-Path Registry::HKEY_USERS\$($UserProfile.SID)) -eq $false) {
        Start-Process -FilePath "CMD.EXE" -ArgumentList "/C REG.EXE LOAD HKU\$($UserProfile.SID) $($UserProfile.UserHive)" -Wait -WindowStyle Hidden }

  
# Start-Process -FilePath "CMD.EXE" -ArgumentList "/C REG.EXE LOAD HKU\$($UserProfile.SID) $($UserProfile.UserHive)" -Wait -windowsstyle Hidden
        
        
$key = "Registry::HKEY_USERS\$($UserProfile.SID)\control panel\desktop"

$Name_1 = "Win8DpiScaling"

$value_1 = "1"

$Name_2 = "LogPixels"

$value_2 = "96"

Test-Path "Registry::HKEY_USERS\$($UserProfile.SID)\control Panel\Desktop"

New-ItemProperty -Path $key -name $name_1 -value $value_1 -PropertyType dword -Force

New-Itemproperty -path $key -name $name_2 -value $value_2 -PropertyType dword -force
 
(Get-ItemProperty -path $key -name $name).win8dpiscaling 

(Get-ItemProperty -path $key -name $name_2).$name_2

# Unload NTuser.dat        
If ($ProfileWasLoaded -eq $false) {
    [gc]::Collect()
    Start-Sleep 1
    Start-Process -FilePath "CMD.EXE" -ArgumentList "/C REG.EXE UNLOAD HKU\$($UserProfile.SID)" -Wait -WindowStyle Hidden| Out-Null
}