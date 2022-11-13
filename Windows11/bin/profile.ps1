# script to (re)setup powershell, intended to be loaded from $Profile.CurrentUserAllHosts.
echo "* Applying $PSCommandPath..."

function ssh () {
    # Change window title for auto-hotkey logic in Windows Terminal
    $CurrentTitle=$host.UI.RawUI.WindowTitle
    $host.UI.RawUI.WindowTitle = "ssh"
    C:\Windows\System32\OpenSSH\ssh.exe $args
    $host.UI.RawUI.WindowTitle = $CurrentTitle
}


echo " [Ready to Code!]"

