# Define the default password for users
$PASSWORD_FOR_USERS = "P@ssw0rd123"

# Set the number of user accounts to create
$NUMBER_OF_ACCOUNTS_TO_CREATE = 50

# Convert the password to a secure string
$PasswordSecure = ConvertTo-SecureString $PASSWORD_FOR_USERS -AsPlainText -Force

# Define the OU where users will be created
$OU = "OU=_USERS,DC=yourdomain,DC=local"

# Create the OU if it doesn't exist
if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '_USERS'" -ErrorAction SilentlyContinue)) {
    New-ADOrganizationalUnit -Name "_USERS" -Path "DC=yourdomain,DC=local"
}

# Function to generate random names
function generate-random-name {
    $consonants = @("b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z")
    $vowels = @("a", "e", "i", "o", "u")
    $name = ""
    $length = Get-Random -Minimum 3 -Maximum 7

    for ($i = 0; $i -lt $length; $i++) {
        if ($i % 2 -eq 0) {
            $name += $consonants | Get-Random
        } else {
            $name += $vowels | Get-Random
        }
    }
    return $name.Substring(0, 1).ToUpper() + $name.Substring(1)
}

# Loop to create the specified number of users
for ($i = 1; $i -le $NUMBER_OF_ACCOUNTS_TO_CREATE; $i++) {
    $FirstName = generate-random-name
    $LastName = generate-random-name
    $Username = "$($FirstName.ToLower()).$($LastName.ToLower())"
    
    Write-Host "Creating user: $Username"
    
    # Create the user in Active Directory
    New-ADUser -Name "$FirstName $LastName" `
               -GivenName $FirstName `
               -Surname $LastName `
               -SamAccountName $Username `
               -UserPrincipalName "$Username@Redsdomain.com" `
               -Path $OU `
               -AccountPassword $PasswordSecure `
               -PasswordNeverExpires $true `
               -Enabled $true `
               -PassThru
}