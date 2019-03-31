#POWERCFG

#R�cup�ration du PowerPlan utilis� (MODE WMI)
$startTime = Get-Date
Get-WmiObject -Class Win32_PowerPlan -Namespace "root\cimv2\power" | Select-Object ElementName, IsActive | Format-Table
$elapsedTime = (Get-Date) - $startTime

$totalTime = "{0:HH:mm:ss,fff}" -f ([datetime]$elapsedTime.Ticks)
Write-Host $totalTime

#Recuperation du PowerPlan utilis� (MODE CIM)
$startTime = Get-Date
Get-CimInstance -Class Win32_PowerPlan -Name "root\cimv2\power" | Select-Object ElementName, IsActive | Format-Table
$elapsedTime = (Get-Date) - $startTime

$totalTime = "{0:HH:mm:ss,fff}" -f ([datetime]$elapsedTime.Ticks)
Write-Host $totalTime

#Point PowerPlan et boutons d'alimentations
# 1. Dupliquer le sch�ma utiliser et r�cup�rer le GUID
# 2. Modifier les param�tres voulues (gr�ce aux GUID) (comme le temps de mise en veille ou �teindre l'�cran, les boutons d'alimentations)
# 3. Ensuite s�lectionner le nouveau plan
powercfg /list
powercfg /query 381b4222-f694-41f0-9685-ff5bb260df2e

#Pour set la r�solution d'�cran et le DPI
# 1. avoir un user qui s'est d�j� connect� (pour avoir des infos dans regedit)
# 2. R�cup�rer son SID et trouver le USER dans HKU:\SID\Control Panel\Desktop
# 3. Modifier les param�tres
# 4. Red�marrer

#PATH FOR DISPLAY SETTINGS
$registryDPI = "HKCU:\Control Panel\Desktop"

Test-Path $registryDPI