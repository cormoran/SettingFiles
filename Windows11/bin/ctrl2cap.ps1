# Run as admin
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell.exe "-NoExit -NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# Set download URL and target path
$downloadUrl = "https://download.sysinternals.com/files/Ctrl2Cap.zip"
$zipPath = "$env:TEMP\Ctrl2Cap.zip"
$extractPath = "$env:TEMP\Ctrl2Cap"

# Download Ctrl2Cap
Invoke-WebRequest -Uri $downloadUrl -OutFile $zipPath

# Extract the zip file
Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force
dir $extractPath
# Install the driver
$ctrl2CapPath = Join-Path -Path $extractPath -ChildPath "ctrl2cap.exe"
cd $extractPath
& $ctrl2CapPath /install
cd ~/
# Clean up downloaded files
Remove-Item -Path $zipPath -Force
Remove-Item -Path $extractPath -Recurse -Force
