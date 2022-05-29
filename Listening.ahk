#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance ignore

SetNumLockState, AlwaysOn
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff

SetTitleMatchMode, 2

InputBox, tempo_fb2k, Tempo (em minutos) da Audição, Tempo (em minutos) da Audição, , , , , , , ,15

run, "%A_ScriptDir%\foobar2000\foobar2000.exe"

if (tempo_fb2k > 0){
Sleep, 500
Loop, %tempo_fb2k%{
ToolTip, %A_Index%m de %tempo_fb2k%m → Audição, 0, 0,
Sleep, 60000
}
}
ToolTip,,0,0,

Sleep, 300

if WinExist("ahk_exe foobar2000.exe"){
WinClose ; Use the window found by WinExist.
}

Sleep, 2000

FileAppend,, %A_ScriptDir%\registro_listening\%tempo_fb2k%m_Listening %A_YYYY%-%A_MM%-%A_DD%-%A_Hour%%A_Min%.txt

Sleep, 5000
ExitApp 


Pause::
if (WinExist("a1b2c3d4e5f6g71234567")){
Sleep, 100
}else{
if WinExist("ahk_exe foobar2000.exe"){
WinClose ; Use the window found by WinExist.
}
ExitApp
}