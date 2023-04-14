## Tabulize new Window Explorer window
This Autohotkey (frustration-solving) script was created to fix (hopefully just) a bug in new Windows 11 Windows Explorer tabs feature when new folder that is not open from WE (like from Desktop) is open in new WE window rather then new tab in existing window. 
This code is an AutoHotkey script that continuously watches for when a new Windows Explorer (WE) window is open. When two WE windows are open, it closes the second one and then opens the path as a new tab in first WE window. The script is useful for those who frequently use WE to navigate folders and files, and do not want WE to open new window each time.

This script is designed to work with Windows Explorer in Win 11 with new tabs feature (probably 22H2) and will not work with previous versions.

### Usage
To use this script, you need to have AutoHotkey installed on your Windows computer. Once installed, you can simply run the script by double-clicking on it. The script will run in the background and continuously watch for WE windows.

The script will detect that the two WE windows are opened and close the second one. It will then open a new WE tab with the same path as the closed window.

### How it Works
The script works by continuously looping and waiting for a WE window to be activated. Once a WE window is activated, it counts how many WE windows are currently open. If two WE windows are open, it gets the path of the new window and opens a new WE tab with the same path while closing extra WE window. 

The script uses the following steps to open the new WE tab:

1. Detect new window
2. Get path from new window
3. Close new window
4. Open a new tab in first WE (Ctrl + T)
5. Select the address bar (Alt + D)
6. Delete the current address (backspace)
7. Insert the path from the closed window
8. Submit the path (Enter)
9. If there is no WE window open, the script will try to open WE with the path of the first window. However, this should not happen as the script assumes that at least one WE window is always open.

#### Notes

- This script is designed to work with Windows Explorer in Win 11 with new tabs feature (probably 22H2) and will not work with other file explorers.
- How to run the script automatically when windows starts: https://jacks-autohotkey-blog.com/2020/12/14/auto-loading-autohotkey-scripts-when-booting-windows/#:~:text=After%20selecting%20an%20AutoHotkey%20script,same%20Hotkey%20combination%20removes%20it.
- Please keep in mind that I am amateur in regards of AHK so script might contain errors and might not be optimal solution - do not hasitate to let me know. 

#### Known bugs:
- Very occasionally, the path from closed window is opened in browser (observed when Chrome open) - cannot reliably reproduce.
