$passwordString = 'PpadU$er01'
$passwordSecure = ConvertTo-SecureString $passwordString -AsPlainText -Force
New-LocalUser "Test" -Password $passwordSecure -FullName "Test" -Description "PolicePad Account."
Add-LocalGroupMember -Group "Users" -Member "Test"