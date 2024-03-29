# Run as admin
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell.exe "-NoExit -NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

echo "* Running $PSCommandPath to setup windows as server..."

#
# Setup sshd
#
# Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
# Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
# Start-Service sshd
# Set-Service -Name sshd -StartupType 'Automatic'
# # Confirm the Firewall rule is configured. It should be created automatically by setup. Run the following to verify
# if (!(Get-NetFirewallRule -Name "OpenSSH-Server-In-TCP" -ErrorAction SilentlyContinue | Select-Object Name, Enabled)) {
#     Write-Output "Firewall Rule 'OpenSSH-Server-In-TCP' does not exist, creating it..."
#     New-NetFirewallRule -Name 'OpenSSH-Server-In-TCP' -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
# } else {
#     Write-Output "Firewall rule 'OpenSSH-Server-In-TCP' has been created and exists."
# }
$sshd_config = $(Get-Content $env:programdata\ssh\sshd_config) -replace "#PasswordAuthentication yes","PasswordAuthentication no"
Write-Output $sshd_config | Out-File $env:programdata\ssh\sshd_config -Encoding default
Restart-Service sshd
# put public key to $env:programdata/ssh/administrators_authorized_keys for admins
#                   ~\.ssh=authorized_keys for non admins
