# Run as admin
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell.exe "-NoExit -NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

echo "* Running $PSCommandPath to apply cormoran's SettingFiles..."

#
# AutoHotKey startup
#
$StartupDirectory=$((Get-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" Startup).Startup)
echo " * Applying AutoHotKey auto-start"
if (!(Test-Path "$StartupDirectory\main.ahk")) {
    echo "  * Creating symbolic link under $StartupDirectory"
    New-Item -ItemType SymbolicLink -Path "$StartupDirectory\main.ahk" -Target "$PSScriptRoot\AutoHotKey\main.ahk"
    echo "  [Done]"
} Else {
    echo "  [Skip]"
}
