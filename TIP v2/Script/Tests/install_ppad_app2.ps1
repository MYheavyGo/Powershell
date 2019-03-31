Start-process C:\Temp\simpleinstall_v4.1.1\PP4_Install.bat
Start-Sleep 100
Add-AppxPackage .\PolicePad4_4.1.3.0_x64.appx -DependencyPath ".\Dependencies\x64\Microsoft.NET.CoreRuntime.1.1.appx", ".\Dependencies\x64\Microsoft.VCLibs.x64.14.00.appx"