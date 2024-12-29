;#Persistent
#SingleInstance
;#NoEnv
#UseHook
;#InstallKeybdHook
;#InstallMouseHook
;#HotkeyInterval 2000
;#MaxHotkeysPerInterval 200
ProcessSetPriority "High"
SendMode "Input"
; SetWorkingDir %A_ScriptDir%
SetTitleMatchMode 2

#Include "%A_ScriptDir%\emacs.ahk"
#Include "%A_ScriptDir%\IMEv2.ahk"
; #Include A_ScriptDir "\keyboard.ahk"
#Include "%A_ScriptDir%\tooltip.ahk"

; Avoid focusing menu with alt
LAlt:: Send("{Blind}{vk07}")
RAlt:: Send("{Blind}{vk07}")

; Change input mode to English with left alt
LAlt Up:: IME_SET(0)
LAlt & Tab::AltTab
LAlt & Shift::ShiftAltTab
; Change input mode to Japanese with right alt
RAlt Up:: IME_SET(1)
OnClipboardChange(TimerTooltip.Bind(, "Copied!", 1000))

; For Japanse keyboard
; Assuming left side of A is mapped to ctrl (by registory or keyboard layout)
; #if GetLayout(Language := "") = "jp"
;     SC07B::Send(" ")
;     SC079::Send(" ")
;     SC070 Up::IME_SET(1)

;     @::Send("[")
;     [::Send("]")
;     +SC027::Send("{SC028}")
;     SC028::Send("+7")
;     +SC028::Send("+2")
;     +2::Send("{@}")
;     +6::Send("{^}")
;     +7::Send("{&}")
;     +8::Send("+{SC028}")
;     +9::Send("+{8}")
;     +0::Send("+{9}")
;     SC073::Send("+@")
;     +SC073::Send("^")
;     +-::Send("+SC073")
;     ^::Send("+-")
;     +^::Send("SC027")
;     ]::Send("Enter")
; #if
