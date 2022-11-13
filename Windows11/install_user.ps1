# script to apply all settings in this directory


# Run as admin
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell.exe "-NoExit -NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

echo "* Running $PSCommandPath to apply cormoran's SettingFiles..."
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned


#
# powershell profile
#
$RcScriptPath="bin\profile.ps1"
$TextToWrite="if (Test-Path $PSScriptRoot\$RcScriptPath) { . $PSScriptRoot\$RcScriptPath }"
$ProfileDirectory=$(Split-Path -Path $Profile.CurrentUserAllHosts)
echo " * Applying $RcScriptPath auto-load to $($Profile.CurrentUserAllHosts)"
if (!(Test-Path $ProfileDirectory)) {
    echo "  * Creating Directory $ProfileDirectory"
    New-Item $ProfileDirectory -ItemType Directory -Force > $null
}
If (!(Test-Path $Profile.CurrentUserAllHosts) -Or !($(Get-Content $Profile.CurrentUserAllHosts) -match "^$([Regex]::Escape($TextToWrite))$")) {
    echo "  * Inserting $RcScriptPath auto-load script"
    Add-Content $Profile.CurrentUserAllHosts $TextToWrite
    echo "  [Done]"
} Else {
    echo "  [Skip]"
}

#
# Install applications with winget
#
winget import .\winget\core.json
winget import .\winget\languages.json
winget import .\winget\development.json
