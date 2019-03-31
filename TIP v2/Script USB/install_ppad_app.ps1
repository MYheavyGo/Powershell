$PolicePad = 'd:\PolicePad4_4.1.3_appx\*'
$Destination = 'c:\temp\'
Copy-Item $PolicePad -Destination $Destination
Add-AppxPackage $Destination\PolicePad4_4.1.3.0_x64.appx -DependencyPath ".\Dependencies\x64\Microsoft.NET.CoreRuntime.1.1.appx", ".\Dependencies\x64\Microsoft.VCLibs.x64.14.00.appx"