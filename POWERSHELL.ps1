#POWERCFG

#Récupération du PowerPlan utilisé (MODE WMI)
$startTime = Get-Date
Get-WmiObject -Class Win32_PowerPlan -Namespace "root\cimv2\power" | Select-Object ElementName, IsActive | Format-Table
$elapsedTime = (Get-Date) - $startTime

$totalTime = "{0:HH:mm:ss,fff}" -f ([datetime]$elapsedTime.Ticks)
Write-Host $totalTime

#Recuperation du PowerPlan utilisé (MODE CIM)
$startTime = Get-Date
Get-CimInstance -Class Win32_PowerPlan -Name "root\cimv2\power" | Select-Object ElementName, IsActive | Format-Table
$elapsedTime = (Get-Date) - $startTime

$totalTime = "{0:HH:mm:ss,fff}" -f ([datetime]$elapsedTime.Ticks)
Write-Host $totalTime

#Point PowerPlan et boutons d'alimentations
# 1. Dupliquer le schéma utiliser et récupérer le GUID
# 2. Modifier les paramètres voulues (grâce aux GUID) (comme le temps de mise en veille ou éteindre l'écran, les boutons d'alimentations)
# 3. Ensuite sélectionner le nouveau plan
powercfg /list
powercfg /query 381b4222-f694-41f0-9685-ff5bb260df2e

#Pour set la résolution d'écran et le DPI
# 1. avoir un user qui s'est déjà connecté (pour avoir des infos dans regedit)
# 2. Récupérer son SID et trouver le USER dans HKU:\SID\Control Panel\Desktop
# 3. Modifier les paramètres
# 4. Redémarrer

#PATH FOR DISPLAY SETTINGS
$registryDPI = "HKCU:\Control Panel\Desktop"

Test-Path $registryDPI