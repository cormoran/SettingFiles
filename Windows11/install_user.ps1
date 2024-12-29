# script to apply all settings in this directory

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
# Show extension file in explorer
#
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -Value 0
#Stop-Process -Name explorer -Force
#Start-Process explorer



#
# Install applications with winget
#
#winget import .\winget\core.json
#winget import .\winget\languages.json
#winget import .\winget\development.json
#winget import .\winget\extra.json
