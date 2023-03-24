# Prompt the user for the path to the CSV file containing the computer names
$CSVPath = Read-Host "Enter the path to the CSV file containing the computer names"

# Define the path for the log file
$LogPath = "$PSScriptRoot\computer_status.log"

# Clear any existing log file
Clear-Content $LogPath

# Import the CSV file and loop through each computer name
try {
    $Computers = Import-Csv -Path $CSVPath -ErrorAction Stop
    foreach ($Computer in $Computers) {

        # Get the computer name from the CSV file
        $ComputerName = $Computer.ComputerName

        # Test the connection to the computer
        try {
            $Online = Test-Connection -ComputerName $ComputerName -Count 1 -Quiet -ErrorAction Stop
            if ($Online) {
                Write-Output "$ComputerName is online"
                Add-Content $LogPath "$ComputerName,Online,$((Get-Date).ToString())"
            } else {
                Write-Output "$ComputerName is offline"
                Add-Content $LogPath "$ComputerName,Offline,$((Get-Date).ToString())"
            }
        } catch {
            Write-Output "Error testing connection to $ComputerName: $_"
            Add-Content $LogPath "$ComputerName,Error,$((Get-Date).ToString()),$_"
        }
    }
} catch {
    Write-Output "Error importing CSV file: $_"
    Add-Content $LogPath "Error,Error,$((Get-Date).ToString()),$_"
}
