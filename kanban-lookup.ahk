#Requires AutoHotkey v2.0
#SingleInstance Force

VERSION := "1.0.0"
A_IconTip := "Kanban Lookup v" VERSION

; Alt+K = Open picture from Kanban catalogue
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
    ; Includes: space, tab, CR/LF, double-quote, single-quote
    sel := Trim(sel, " `t`r`n""'")

    if (sel = "") {
        TrayTip "Kanban Lookup", "No usable text selected.", 2
        return
    }

    catalog := "O:\_PRODUCTION\LOGISTICS\SUPPLY ORDER SYSTEM\FOTO z katalogů_s duplikáty"

    ; Try multiple extensions (keep only ".jpg" if you want)
    extensions := [".jpg", ".png", ".jpeg"]

    for ext in extensions {
        targetFile := catalog "\" sel ext
        if FileExist(targetFile) {
            Run targetFile
            return  ; no popup when found/opened
        }
    }

    TrayTip "Kanban Lookup", "Selected PN is not in kanban catalogue", 2
}
