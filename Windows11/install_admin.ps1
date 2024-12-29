# Run as admin
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell.exe "-NoExit -NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

echo "* Running $PSCommandPath to apply cormoran's SettingFiles..."

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

#
# Install Ctrl2Cap
#
# Check registry for Ctrl2Cap installation
$registryKeyPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Ctrl2Cap"
echo "* Installing Ctrl2Cap"
if (Test-Path $registryKeyPath) {
    Write-Output "[SKIP] Ctrl2Cap is installed (Registry entry found)."
} else {
    & $PSScriptRoot\bin\ctrl2cap.ps1
}

#
# AutoHotKey startup
#
$StartupDirectory=$((Get-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" Startup).Startup)
echo " * Applying AutoHotKey auto-start"
if (!(Test-Path "$StartupDirectory\ahk.lnk")) {
    echo "  * Creating shortcut under $StartupDirectory"
    $WScriptShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WScriptShell.CreateShortcut("$StartupDirectory\ahk.lnk")
    $Shortcut.TargetPath = "$PSScriptRoot\AutoHotKey\main.ahk"
    $Shortcut.Save()
    echo "  [Done]"
} Else {
    echo "  [Skip]"
}
