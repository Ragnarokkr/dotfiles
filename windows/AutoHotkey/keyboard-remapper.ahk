/*
 * keyboard-remapper.ahk
 * v0.1
 *
 * Remaps Linux keys on Apple PowerMax G4 italian layout keyboard
 * for Windows.
*/

#Requires AutoHotkey >=2.0-

; Remaps Apple PowerMax G4 keyboard <-> Windows
F16:: Send "{PrintScreen}"
^F16:: Send "{Ctrl PrintScreen}"
+F16:: Send "{Shift PrintScreen}"

; Remaps Linux shortcuts
<^>!<:: Send "«"
<^>!>:: Send "»"
<^>!ì:: Send "~"
<^>!':: Send "{U+0060}" ; `
<^>!c:: Send "{U+00A9}" ; ©
<^>!r:: Send "{U+00AE}" ; ®
