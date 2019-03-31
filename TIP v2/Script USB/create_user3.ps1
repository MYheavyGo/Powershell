$password = [securestring]'PpadU$er01'
New-LocalUser "Test" -Password $password -FullName "Test" -Description "PolicePad Account."
Add-LocalGroupMember -Group "Users" -Member "Test"