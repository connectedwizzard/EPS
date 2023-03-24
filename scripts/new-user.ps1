# Prompt the user to enter their information
$firstName = Read-Host "Enter first name"
$lastName = Read-Host "Enter last name"
$username = Read-Host "Enter username"
$passwordLength = 8
$description = Read-Host "Enter user description"
$ou = "OU=Users,DC=example,DC=com"
$groupName = Read-Host "Enter group name to add the user to"

# Generate a random password
$alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
$password = -join ($alphabet | Get-Random -Count $passwordLength)

# Create the new user account
New-ADUser -Name "$firstName $lastName" -SamAccountName $username -AccountPassword $password -Description $description -Path $ou -Enabled $true

# Display the generated password to the user
Write-Host "User $username has been created with password: $password"

# Add the user to a specific group
Add-ADGroupMember -Identity $groupName -Members $username
