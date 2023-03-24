# Prompt the user for the path to the text file containing the list of target machines
$ComputersFile = Read-Host "Enter the path to the text file containing the list of target machines"

# Read the list of target machines from the text file
$Computers = Get-Content $ComputersFile

# Loop through each computer in the list and perform Windows Update actions
foreach ($Computer in $Computers) {

    # Connect to the remote computer using PowerShell Remoting
    $Session = New-PSSession -ComputerName $Computer

    # Import the Windows Update module and check for available updates
    Import-Module PSWindowsUpdate
    Get-WindowsUpdate -ComputerName $Computer -Credential (Get-Credential) -Verbose

    # Install available updates
    Install-WindowsUpdate -ComputerName $Computer -Credential (Get-Credential) -Verbose

    # Reboot the computer if required by the updates
    if (Get-WURebootStatus -ComputerName $Computer -Verbose) {
        Restart-Computer -ComputerName $Computer -Credential (Get-Credential) -Force -Verbose
    }
    else {
        Write-Output "No reboot required for $Computer"
    }

    # Disconnect from the remote session
    Remove-PSSession $Session
}
