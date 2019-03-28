$Password = Read-Host -AsSecureString
New-LocalUser "Ppad-user" -Password $Password -FullName "Ppad-user" -Description "PolicePad Account."
Add-LocalGroupMember -Group "Users" -Member "Ppad-user"