TimerTooltip(type, str, delay) {
    ToolTip(str)
    SetTimer(remove_tooltip, -delay)
}

remove_tooltip(*) {
    ToolTip("")
}

remove_tooltip_all(*) {
    SetTimer(remove_tooltip, "Off")
    Loop 20 {
        ToolTip("", , , A_Index)
    }
}
