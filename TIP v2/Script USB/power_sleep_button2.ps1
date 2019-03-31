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
$planGUIDNew = New-Guid
powercfg /duplicatescheme $planGUID $planGUIDNew
powercfg /S $planGUIDNew
powercfg /changename $planGUIDNew "PP4_Suspend_Off"
# Settings all parameter
# Lid close Action (AC, DC)
powercfg /setdcvalueindex $planGUIDNew SUB_BUTTONS LIDACTION 000
powercfg /setacvalueindex $planGUIDNew SUB_BUTTONS LIDACTION 000

# Bouton d'alimentation (AC, DC)
powercfg /setdcvalueindex $planGUIDNew SUB_BUTTONS PBUTTONACTION 000
powercfg /setacvalueindex $planGUIDNew SUB_BUTTONS PBUTTONACTION 000

# Bouton de mise en veille (AC, DC)
powercfg /setdcvalueindex $planGUIDNew SUB_BUTTONS SBUTTONACTION 000
powercfg /setacvalueindex $planGUIDNew SUB_BUTTONS SBUTTONACTION 000

# Turn off the Display (AC, DC)
powercfg /setdcvalueindex $planGUIDNew SUB_VIDEO VIDEOIDLE 0x0000000
powercfg /setacvalueindex $planGUIDNew SUB_VIDEO VIDEOIDLE 0x0000000

# Adaptive brightness (AC, DC)
powercfg /setdcvalueindex $planGUIDNew SUB_VIDEO ADAPTBRIGHT 000
powercfg /setacvalueindex $planGUIDNew SUB_VIDEO ADAPTBRIGHT 000

# display britghness (AC, DC)
powercfg /setdcvalueindex $planGUIDNew SUB_VIDEO aded5e82-b909-4619-9949-f5d71dac0bcb 0x00000050
powercfg /setacvalueindex $planGUIDNew SUB_VIDEO aded5e82-b909-4619-9949-f5d71dac0bcb 0x00000050

# Put the computer to sleep (AC, DC)
powercfg /setdcvalueindex $planGUIDNew SUB_SLEEP STANDBYIDLE 0x00000000
powercfg /setacvalueindex $planGUIDNew SUB_SLEEP STANDBYIDLE 0x00000000

# Hibernate (AC, DC)
powercfg /setdcvalueindex $planGUIDNew SUB_SLEEP HIBERNATEIDLE 0x00000000
powercfg /setacvalueindex $planGUIDNew SUB_SLEEP HIBERNATEIDLE 0x00000000

# Low Battery Percent (AC, DC)
powercfg /setdcvalueindex $planGUIDNew SUB_BATTERY BATLEVELLOW 00F
powercfg /setacvalueindex $planGUIDNew SUB_BATTERY BATLEVELLOW 00F

# Critical Battery Notification (AC, DC)
powercfg /setdcvalueindex $planGUIDNew SUB_BATTERY BATFLAGSCRIT 001
powercfg /setacvalueindex $planGUIDNew SUB_BATTERY BATFLAGSCRIT 001

# Critical Battery Percent (AC, DC)
powercfg /setdcvalueindex $planGUIDNew SUB_BATTERY BATLEVELCRIT 005
powercfg /setacvalueindex $planGUIDNew SUB_BATTERY BATLEVELCRIT 005