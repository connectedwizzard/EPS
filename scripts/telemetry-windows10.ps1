# Disable Telemetry Services in Windows 10

# Set registry keys to disable telemetry
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -Type DWord
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Value 0 -Type DWord

# Stop and disable related services
Stop-Service -Name DiagTrack, dmwappushservice
Set-Service -Name DiagTrack, dmwappushservice -StartupType Disabled

# Delete related scheduled tasks
Get-ScheduledTask -TaskPath "\Microsoft\Windows\Application Experience" | Where-Object {$_.TaskName -eq "Microsoft Compatibility Appraiser"} | Unregister-ScheduledTask -Confirm:$false
Get-ScheduledTask -TaskPath "\Microsoft\Windows\Autochk" | Where-Object {$_.TaskName -eq "Proxy"} | Unregister-ScheduledTask -Confirm:$false
Get-ScheduledTask -TaskPath "\Microsoft\Windows\Customer Experience Improvement Program" | Where-Object {$_.TaskName -eq "Consolidator"} | Unregister-ScheduledTask -Confirm:$false
Get-ScheduledTask -TaskPath "\Microsoft\Windows\Customer Experience Improvement Program" | Where-Object {$_.TaskName -eq "KernelCeipTask"} | Unregister-ScheduledTask -Confirm:$false
Get-ScheduledTask -TaskPath "\Microsoft\Windows\DiskDiagnostic" | Where-Object {$_.TaskName -eq "Microsoft-Windows-DiskDiagnosticDataCollector"} | Unregister-ScheduledTask -Confirm:$false
Get-ScheduledTask -TaskPath "\Microsoft\Windows\Location" | Where-Object {$_.TaskName -eq "Windows-Location-Based-Service"} | Unregister-ScheduledTask -Confirm:$false
Get-ScheduledTask -TaskPath "\Microsoft\Windows\Shell" | Where-Object {$_.TaskName -eq "FamilySafetyMonitor"} | Unregister-ScheduledTask -Confirm:$false

# Restart the computer to apply changes
Restart-Computer -Force
