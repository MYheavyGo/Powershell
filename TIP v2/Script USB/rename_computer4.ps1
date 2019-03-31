add-type -assemblyName "Microsoft.VisualBasic"
$name = [Microsoft.VisualBasic.Interaction]::InputBox("Enter the PC Name on the label behind:", "Valeur")

Rename-Computer -NewName $name -Restart