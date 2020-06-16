# Create Encrypted Credential
Write-Host "Input HOST Tenant username (admin) and password (will be stored in an encrypted text file)" -BackgroundColor Red -ForegroundColor White
(get-credential).password | ConvertFrom-SecureString | set-content "HostTenantPassword.txt"
