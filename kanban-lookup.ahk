#Requires AutoHotkey v2.0
#SingleInstance Force

VERSION := "1.0.1"

!k:: {
    ClipSaved := A_Clipboard
    A_Clipboard := ""
    Send("^c")
    if !ClipWait(1) {
        A_Clipboard := ClipSaved
        TrayTip "Kanban Lookup", "No text selected.", 2
        return
    }

    sel := A_Clipboard
    A_Clipboard := ClipSaved

    ; Strip whitespace + quotes from front and back
    trimChars := " `t`r`n" . Chr(34) . "'"
    sel := Trim(sel, trimChars)

    if (sel = "") {
        TrayTip "Kanban Lookup", "No usable text selected.", 2
        return
    }

    catalog := "O:\_PRODUCTION\LOGISTICS\SUPPLY ORDER SYSTEM\FOTO z katalogů_s duplikáty"

    extensions := [".jpg", ".png", ".jpeg"]
    for ext in extensions {
        targetFile := catalog "\" sel ext
        if FileExist(targetFile) {
            Run targetFile
            return
        }
    }

    TrayTip "Kanban Lookup", "Selected PN is not in kanban catalogue", 2
}
