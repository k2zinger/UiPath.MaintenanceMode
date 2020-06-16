# Variables
$orchestratorURL = "";
$tenantName = "Host";
$userName = "admin";
$secureStringPassword = Get-Content "HostTenantPassword.txt" | ConvertTo-SecureString 
$credential = New-Object System.Management.Automation.PsCredential("admin",$secureStringPassword)
$password = $credential.GetNetworkCredential().password

# Authentication
$authUri = "$($orchestratorURL)/api/Account/Authenticate";
$authBody = "{`"tenancyName`": `"$($tenantName)`",`"usernameOrEmailAddress`": `"$($userName)`",`"password`": `"$($password)`"}";
Write-Host "Authenticating at $($authUri)";
$authResponse = Invoke-RestMethod -Uri $authUri -ContentType 'application/json' -Method Post -Body $authBody;

# Start Maintenance - Draining
$headers = @{Authorization = "Bearer $($authResponse.result)"}
$maintUri = "$($orchestratorURL)/api/Maintenance/Start?phase=Draining";
Write-Host "Starting Maintenance - Draining at $($maintUri)";
$maintResponse = Invoke-RestMethod -Uri $maintUri -ContentType 'application/json' -Method Post -Headers $headers;
Write-Host $maintResponse.result
