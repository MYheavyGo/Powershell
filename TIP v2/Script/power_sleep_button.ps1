#POWERCFG

#Point PowerPlan et boutons d'alimentations
# 1. Dupliquer le schéma utiliser et récupérer le GUID
# 2. Ensuite sélectionner le nouveau plan
# 3. Modifier les paramètres voulues (grâce aux GUID) (comme le temps de mise en veille ou éteindre l'écran, les boutons d'alimentations)

#Récupération du PowerPlan utilisé (MODE WMI)
$plan = Get-WmiObject -Class Win32_PowerPlan -Namespace "root\cimv2\power" -Filter "isActive='true'"
$regex = [regex]"{(.*?)}$"
$planGUID = $regex.Match($plan.instanceID.ToString()).Groups[1].Value
#Write-Host $planGUID
$planGUIDNew = powercfg /duplicatescheme $planGUID
powercfg /S $planGUIDNew
powercfg /changename $planGUIDNew "PP4_Suspend_Off"
# Settings all parameter
# Bouton d'alimentation (AC, DC)
powercfg /setdcvalueindex $planGUIDNew 7648efa3-dd9c-4e3e-b566-50f929386280 001
powercfg /setacvalueindex $planGUIDNew 7648efa3-dd9c-4e3e-b566-50f929386280 001

# Bouton de mise en veille (AC, DC)
powercfg /setdcvalueindex $planGUIDNew 96996bc0-ad50-47ec-923b-6f41874dd9eb 001
powercfg /setacvalueindex $planGUIDNew 96996bc0-ad50-47ec-923b-6f41874dd9eb 001

# Turn off the Display (AC, DC)
powercfg /setdcvalueindex $planGUIDNew 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0x00000000
powercfg /setacvalueindex $planGUIDNew 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0x00000000

# Put the computer to sleep (AC, DC)
powercfg /setdcvalueindex $planGUIDNew 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 001
powercfg /setacvalueindex $planGUIDNew 96996bc0-ad50-47ec-923b-6f41874dd9eb 001