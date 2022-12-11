GetLayout(ByRef Language := "")
{
    hWnd := WinExist("A")
    ThreadID := DllCall("GetWindowThreadProcessId", "Ptr",hWnd, "Ptr",0)
    KLID := DllCall("GetKeyboardLayout", "Ptr",ThreadID, "Ptr")
    KLID := Format("0x{:x}", KLID)
    Lang := "0x" A_Language
    Locale := KLID & Lang
    Info := KeyboardInfo()
    return Info.Layout[Locale], Language := Info.Language[Locale]
}

KeyboardInfo()
{
    static Out := {}
    if Out.Count()
        return Out
    Layout := {}
    loop reg, HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout\DosKeybCodes
    {
        RegRead Data
        Code := "0x" A_LoopRegName
        Layout[Code + 0] := Data
    }
    Language := {}
    loop reg, HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layouts, KVR
    {
        RegRead Data
        if ErrorLevel
            Name := "0x" A_LoopRegName
        else if (A_LoopRegName = "Layout Text")
            Language[Name + 0] := Data
    }
    return Out := { "Layout":Layout, "Language":Language }
}
