# UiPath.MaintenanceMode
Powershell scripts for managing UiPath Orchestrator Maintenance Mode
[https://docs.uipath.com/orchestrator/docs/maintenance-mode](https://docs.uipath.com/orchestrator/docs/maintenance-mode)

Maintenance Mode requires Host Tenant credentials, so a method has been added to store the host admin credentials encrypted in a text file.
**These credentials can only be decrypted by the Windows User who creates the credentials!**

## Configuration

> The `orchestratorURL` must be configured within each `Maintenance` file. (e.g. **https://server.domain.name**)

> `CreateEncryptedCredential.ps1` does not contain the `orchestratorURL` configuration.

## Scripts
`CreateEncryptedCredential.ps1`: Run this file to create a file with the encrypted credentials of the Host Tenant admin user.  The username should always be `admin`.  The file will be saved as `HostTenantPassword.txt`

`End-Maintenance.ps1`: Ends Maintenance Mode

`Get-Maintenance.ps1`: Obtains the current status of Maintenance Mode

`Start-Maintenance-Draining.ps1`: Starts Maintenance Mode with Phase=Draining and Stops all active jobs

`Start-Maintenance-Suspended.ps1`: Starts Maintenance Mode with Phase=Suspended and Kills all active jobs