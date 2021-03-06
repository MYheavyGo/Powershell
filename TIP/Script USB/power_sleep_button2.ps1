#POWERCFG

#Point PowerPlan et boutons d'alimentations
# 1. Dupliquer le sch�ma utiliser et r�cup�rer le GUID
# 2. Ensuite s�lectionner le nouveau plan
# 3. Modifier les param�tres voulues (gr�ce aux GUID) (comme le temps de mise en veille ou �teindre l'�cran, les boutons d'alimentations)

#R�cup�ration du PowerPlan utilis� (MODE WMI)
$plan = Get-WmiObject -Class Win32_PowerPlan -Namespace "root\cimv2\power" -Filter "isActive='true'"
$regex = [regex]"{(.*?)}$"
$planGUID = $regex.Match($plan.instanceID.ToString()).Groups[1].Value
#Write-Host $planGUID
$planGUIDNew = powercfg /duplicatescheme $planGUID
powercfg /S $planGUIDNew
powercfg /changename $planGUIDNew "PP4_Suspend_Off"
# Settings all parameter
# Bouton d'alimentation (AC, DC)
powercfg /setdcvalueindex $planGUIDNew 7648efa3-dd9c-4e3e-b566-50f929386280 1
powercfg /setacvalueindex $planGUIDNew 7648efa3-dd9c-4e3e-b566-50f929386280 1

# Bouton de mise en veille (AC, DC)
powercfg /setdcvalueindex $planGUIDNew 96996bc0-ad50-47ec-923b-6f41874dd9eb 1
powercfg /setacvalueindex $planGUIDNew 96996bc0-ad50-47ec-923b-6f41874dd9eb 1

# Turn off the Display (AC, DC)
powercfg /setdcvalueindex $planGUIDNew 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0
powercfg /setacvalueindex $planGUIDNew 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0

# Put the computer to sleep (AC, DC)
powercfg /setdcvalueindex $planGUIDNew 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 1
powercfg /setacvalueindex $planGUIDNew 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 1

# Hibernate (AC, DC)
powercfg /setdcvalueindex $planGUIDNew 9d7815a6-7ee4-497e-8888-515a05f02364 1
powercfg /setacvalueindex $planGUIDNew 9d7815a6-7ee4-497e-8888-515a05f02364 1

# Adaptive brightness (AC, DC)
powercfg /setdcvalueindex $planGUIDNew fbd9aa66-9553-4097-ba44-ed6e9d65eab8 1
powercfg /setacvalueindex $planGUIDNew fbd9aa66-9553-4097-ba44-ed6e9d65eab8 1

# display britghness (AC, DC)
powercfg /setdcvalueindex $planGUIDNew aded5e82-b909-4619-9949-f5d71dac0bcb 1
powercfg /setacvalueindex $planGUIDNew aded5e82-b909-4619-9949-f5d71dac0bcb 1

# Low Battery Notification (AC, DC)
powercfg /setdcvalueindex $planGUIDNew 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 1
powercfg /setacvalueindex $planGUIDNew 96996bc0-ad50-47ec-923b-6f41874dd9eb 1

# Low Battery Percent (AC, DC)
powercfg /setdcvalueindex $planGUIDNew 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 1
powercfg /setacvalueindex $planGUIDNew 96996bc0-ad50-47ec-923b-6f41874dd9eb 1

# Critical Battery Notification (AC, DC)
powercfg /setdcvalueindex $planGUIDNew 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 1
powercfg /setacvalueindex $planGUIDNew 96996bc0-ad50-47ec-923b-6f41874dd9eb 1

# Critical Battery Percent (AC, DC)
powercfg /setdcvalueindex $planGUIDNew 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 1
powercfg /setacvalueindex $planGUIDNew 96996bc0-ad50-47ec-923b-6f41874dd9eb 1