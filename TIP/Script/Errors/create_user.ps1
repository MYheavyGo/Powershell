#Create a local User with the associated password
$Password = 'PpadU$er01'
New-LocalUser "Ppad-user" -Password $Password -FullName "PolicePad User" -Description "PolicePad Account."
Add-LocalGroupMember -Group "Users" -Member "Ppad-user"