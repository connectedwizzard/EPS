# ESP - Essential PowerShell Scripting
This repository contains a collection of PowerShell scripts for automating system administration tasks. The scripts are created using PowerShell and include features such as file management, backup and restore, and task scheduling. The repository is open-source for others to use and contribute to.
## telemetry-windows10.ps1
The script disables several components of Windows 10 that are responsible for collecting and sending telemetry data to Microsoft. This can help to increase privacy and reduce the amount of data sent to Microsoft.
### Extra: Recommendation for using ShutUp10 to disable additional telemetry
For even more telemetry removal, consider using the ShutUp10 anti-spy tool: [O&O ShutUp10++:](https://www.oo-software.com/en/shutup10).
## new-user.ps1
This PowerShell script allows you to create a new user account in Active Directory and add the user to a specified group. The script prompts you to enter the user's first name, last name, username, user description, and group name. It then generates a random password for the user and displays it in the output message.
## remote-status.ps1
The script is designed to test the connectivity of a list of computers in a CSV file. It reads the list of computer names from the input CSV file and attempts to ping each computer. If a computer responds to the ping, the script logs that it is online along with the date and time. If a computer fails to respond to the ping, the script logs that it is offline along with the date and time. If an error occurs during the ping test, the script logs the error along with the date and time. The script saves the log to a CSV file named computer_status.log for later reference.
## remote-update.ps1
This PowerShell script prompts the user for the path to a text file containing a list of target machines, connects to each machine using PowerShell Remoting, checks for available Windows updates, installs available updates, and reboots the machine if required. The list of target machines should be saved in a text file called computers_update.txt in the same directory as the script, with each machine name on a separate line. The script prompts the user for their credentials for each target machine.
