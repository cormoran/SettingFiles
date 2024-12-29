SetKeyDelay(0)

global is_pre_x := 0
global is_pre_spc := 0

target_to_disable() {
    if WinActive("ahk_class ConsoleWindowClass") ; Cygwin
        return true
    if WinActive("ahk_class MEADOW") ; Meadow
        return true
    if WinActive("ahk_class cygwin/x X rl-xterm-XTerm-0")
        return true
    if WinActive("ahk_class MozillaUIWindowClass") ; keysnail on Firefox
        return true
    if WinActive("ahk_class VMwareUnityHostWndClass")
        return true
    if WinActive("ahk_class Vim") ; GVIM
        return true
    if WinActive("ahk_exe TeamViewer.exe") ; TeamViewer
        return true
    if WinActive("ahk_exe Code.exe") ; Visual Studio Code
        return true
    if WinActive("ahk_exe idea64.exe") ; Intellij
        return true
    if WinActive("ahk_exe vncviewer.exe")
        return true
    if WinActive("ahk_exe WindowsTerminal.exe") ; WindowsTerminal
    {
        if WinActive("cmd - ssh")
            return true
        if WinActive("cmd")
            return false
        if WinActive("Windows PowerShell")
            return false
        return true
    }
    if WinActive("ahk_exe ApplicationFrameHost.exe")
        return true
    return false
}

is_command_prompt() {
    if WinActive("ahk_exe WindowsTerminal.exe") ; WindowsTerminal
        if WinActive("cmd")
            return true
    return false
}

delete_char() {
    Send("{Del}")
    global is_pre_spc := 0
}

delete_backward_char() {
    Send("{BS}")
    global is_pre_spc := 0
}

kill_line() {
    if is_command_prompt() {
        Send("^End")
    } else {
        Send("+{End}")
        Sleep(50) ;[ms] this value depends on your environment
        Send("^x")
    }
    global is_pre_spc := 0
}

open_line() {
    Send("{End}{Enter}{Up}")
    global is_pre_spc := 0
}

quit() {
    Send("{ESC}")
    global is_pre_spc := 0
}

newline() {
    Send("{Enter}")
    global is_pre_spc := 0
}

indent_for_tab_command() {
    Send("{Tab}")
    global is_pre_spc := 0
}

newline_and_indent() {
    Send("{Enter}{Tab}")
    global is_pre_spc := 0
}

isearch_forward() {
    Send("^f")
    global is_pre_spc := 0
}

isearch_backward() {
    Send("^f")
    global is_pre_spc := 0
}

kill_region() {
    Send("^x")
    global is_pre_spc := 0
}

kill_ring_save() {
    Send("^c")
    global is_pre_spc := 0
}

yank() {
    if is_command_prompt() {
        Send("+^v")
    } else {
        Send("^v")
    }
    global is_pre_spc := 0
}

undo() {
    Send("^z")
    global is_pre_spc := 0
}

find_file() {
    Send("^o")
    global is_pre_x := 0
}

save_buffer() {
    Send("^s")
    global is_pre_x := 0
}

kill_emacs() {
    Send("!{F4}")
    global is_pre_x := 0
}

move_beginning_of_line() {
    global
    if is_pre_spc
        Send("+{Home}")
    else
        Send("{Home}")
}

move_end_of_line() {
    global
    if is_pre_spc
        Send("+{End}")
    else
        Send("{End}")
}

previous_line() {
    global
    if is_pre_spc
        Send("+{Up}")
    else
        Send("{Up}")
}

next_line() {
    global
    if is_pre_spc
        Send("+{Down}")
    else
        Send("{Down}")
}

forward_char() {
    global
    if is_pre_spc
        Send("+{Right}")
    else
        Send("{Right}")
}

backward_char() {
    global
    if is_pre_spc
        Send("+{Left}")
    else
        Send("{Left}")
}

scroll_up() {
    global
    if is_pre_spc
        Send("+{PgUp}")
    else
        Send("{PgUp}")
}

scroll_down() {
    global
    if is_pre_spc
        Send("+{PgDn}")
    else
        Send("{PgDn}")
}

^x:: {
    if target_to_disable()
        Send("^x")
    else
        global is_pre_x := 1
}

^f:: {
    if target_to_disable()
        Send("^f")
    else {
        if is_pre_x
            find_file()
        else
            forward_char()
    }
}

^c:: {
    if target_to_disable()
        Send("^c")
    else {
        if is_pre_x
            kill_emacs()
        else
            Send("^c") ; To keep Ctrl+C copy work
    }
}

^d:: {
    if target_to_disable()
        Send("^d")
    else
        delete_char()
}

^h:: {
    if WinActive("ahk_exe Code.exe")
        delete_backward_char() ; workaround to support inputbox
    else {
        if target_to_disable()
            Send("^h")
        else
            delete_backward_char()
    }
}

^k:: {
    if target_to_disable()
        Send("^k")
    else
        kill_line()
}

^g:: {
    if target_to_disable()
        Send("^g")
    else
        quit()
}

^m:: {
    if target_to_disable()
        Send("^m")
    else
        newline()
}

^i:: {
    if target_to_disable()
        Send("^i")
    else
        indent_for_tab_command()
}

^s:: {
    if target_to_disable()
        Send("^s")
    else {
        if is_pre_x
            save_buffer()
        else
            isearch_forward()
    }
}

^r:: {
    if target_to_disable()
        Send("^r")
    else
        isearch_backward()
}

^w:: {
    if target_to_disable()
        Send("^w")
    else
        kill_region()
}

!w:: {
    if target_to_disable()
        Send("!w")
    else
        kill_ring_save()
}

^y:: {
    if target_to_disable()
        Send("^y")
    else
        yank()
}

^vk20:: {
    if target_to_disable()
        Send("^ ")
    else {
        if is_pre_spc
            global is_pre_spc := 0
        else
            global is_pre_spc := 1
    }
}

^@:: {
    if target_to_disable()
        Send("^@")
    else {
        if is_pre_spc
            global is_pre_spc := 0
        else
            global is_pre_spc := 1
    }
}

^a:: {
    if target_to_disable()
        Send("^a")
    else
        move_beginning_of_line()
}

^e:: {
    if target_to_disable()
        Send("^e")
    else
        move_end_of_line()
}

^p:: {
    if target_to_disable()
        Send("^p")
    else
        previous_line()
}

^n:: {
    if target_to_disable()
        Send("^n")
    else
        next_line()
}

^b:: {
    if target_to_disable()
        Send("^b")
    else
        backward_char()
}

^v:: {
    if target_to_disable()
        Send("^v")
    else
        scroll_down()
}

!v:: {
    if target_to_disable()
        Send("!v")
    else
        scroll_up()
}
