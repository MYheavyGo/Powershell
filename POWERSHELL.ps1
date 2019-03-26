$startTime = Get-Date
Get-WmiObject -Class Win32_PowerPlan -Namespace "root\cimv2\power" | Select-Object ElementName, IsActive | Format-Table
$elapsedTime = (Get-Date) - $startTime

$totalTime = "{0:HH:mm:ss,fff}" -f ([datetime]$elapsedTime.Ticks)
Write-Host $totalTime

$startTime = Get-Date
Get-CimInstance -Class Win32_PowerPlan -Name "root\cimv2\power" | Select-Object ElementName, IsActive | Format-Table
$elapsedTime = (Get-Date) - $startTime

$totalTime = "{0:HH:mm:ss,fff}" -f ([datetime]$elapsedTime.Ticks)
Write-Host $totalTime

powercfg /list
powercfg /query 381b4222-f694-41f0-9685-ff5bb260df2e

# PATH FOR DISPLAY SETTINGS
$registryDPI = "HKCU:\Control Panel\Desktop"

Test-Path $registryDPI