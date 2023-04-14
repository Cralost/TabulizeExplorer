; Loop to continuously watch when WE is opened
Loop
{
  WinWaitActive, ahk_class CabinetWClass
  ; Count WE windows
  WinGet, Count, Count, ahk_class CabinetWClass

  ; If 2 WE windows are opened, run the script
  if (Count == 2)
  {
    ; Get ahk_id of last opened window (second WE window)
    WinGet, WEWindowID, IDLast

    ; Get the path of the active Explorer window
    explorerHwnd := WinActive("ahk_class CabinetWClass")
    if (explorerHwnd)
    {
      for window in ComObjCreate("Shell.Application").Windows
      {
        if (window.hwnd==explorerHwnd)
        {
          sPath := window.Document.Folder.Self.Path
        }
      }
    }
    
    ; We can close second WE window now
    WinClose, ahk_id %WEWindowID%

    ; Focus on first WE window
    IfWinExist, ahk_class CabinetWClass
    {
        WinActivate, ahk_class CabinetWClass
        Sleep, 100
        ; Open new tab in WE (Ctrl + T)
        SendInput, ^t
        Sleep, 100
        ; Select address bar (Alt + D)
        SendInput, !d
        Sleep, 100
        ; Delete address bar (backspace)
        SendInput, {BS}
        Sleep, 100
        ; Insert path from original closed window
        SendInput, %sPath%
        Sleep, 100
        ; Submit (Enter)
        SendInput, {Enter}
    }
    Else
    {
        ; If now WE window is opened then open with path (this should not happen)
        Run, explorer.exe %sPath%
    }
  }
}