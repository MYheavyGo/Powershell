$computerName = Get-WmiObject Win32_ComputerSystem 
[System.Reflection.Assembly]LoadWithPartialName('Microsoft.VisualBasic')  Out-Null 
$name = [Microsoft.VisualBasic.Interaction]InputBox(Enter Desired Computer Name )
$computername.rename($name)