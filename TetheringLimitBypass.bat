@echo off
cls
:menu
echo.
echo =====================================
echo        Tethering Limit Bypass
echo =====================================
echo.
echo [1] Display IPv4 Protocol Configuration
echo [2] Display IPv6 Protocol Configuration
echo [3] Set IPv4 and IPv6 Packet TTL
echo [4] Exit
echo.
set /p choice=Enter your choice: 
if %choice% == 1 goto display_ipv4
if %choice% == 2 goto display_ipv6
if %choice% == 3 goto set_ttl
if %choice% == 4 exit
goto menu

:display_ipv4
cls
powershell.exe -Command "Get-NetIPv4Protocol | Out-String | Write-Host"
pause
goto menu

:display_ipv6
cls
powershell.exe -Command "Get-NetIPv6Protocol | Out-String | Write-Host"
pause
goto menu

:set_ttl
cls
echo Running commands with administrative privileges...
powershell.exe -Command "Start-Process cmd.exe -Verb runAs -ArgumentList '/c netsh int ipv4 set glob defaultcurhoplimit=65 & netsh int ipv6 set glob defaultcurhoplimit=65'"
echo Packet TTL has been set successfully.
pause
goto menu
