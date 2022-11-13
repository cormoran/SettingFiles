#SingleInstance, Force
SendMode Input
; SetWorkingDir, %A_ScriptDir%

; Apply emacs setting
#Include emacs.ahk
; Import IME library
#Include IME.ahk

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
