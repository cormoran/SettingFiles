#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

#Include %A_ScriptDir%\emacs.ahk
#Include %A_ScriptDir%\IME.ahk
#Include %A_ScriptDir%\keyboard.ahk

; Avoid focusing menu with alt
*~LAlt::Send {Blind}{vk07}
*~RAlt::Send {Blind}{vk07}

; Change input mode to English with left alt
LAlt up::
IME_SET(0)
return
; Change input mode to Japanese with right alt
RAlt up::
IME_SET(1)
return

; For Japanse keyboard
#if GetLayout(Language := "") = "jp"
    ; 無変換/変換 to space
    SC07B::Space
    SC079::Space
    ; カタカナ ひらがな to Japanese (RAlt にしたいが unstable)
    SC070 up::
    IME_SET(1)
    return

    ;; 記号系を US 配列に

    @::[
    [::]
    ; plus & : to :;
    +SC027::
        Send, {SC028}
    return
    ; asta & : to '"
    SC028::+7
    +SC028::+2
    +2::
        Send, {@}
    return
    +6::
        Send, {^}
    return
    +7::
        Send, {&}
    return
    +8::
        Send, +{SC028}
    return
    +9::
        Send, +{8}
    return
    +0::
        Send, +{9}
    return
    ; \ & under score to ` ~
    SC073::+@
    +SC073::^
    ; -= to -_
    +-::+SC073
    ; ^~ to +=
    ^::+-
    +^::SC027
    ]::Enter
#if
