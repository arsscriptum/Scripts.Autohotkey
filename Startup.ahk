;############################################################################## 
;#############   START OF SCRIPT  ############################################# 
;############################################################################## 

!c::
Run rundll32.exe shell32.dll`,Control_RunDLL desk.cpl`,`, 3  ; Opens Control Panel > Display Properties > Settings
return

!r::
Run, https://www.reddit.com
return

!t::
Run, C:\Programs\Shims\term.exe
return

!n::
MsgBox, Start Noise
SetTimer,MAKENOISE,30000
Return

!v::
Gosub,SETMICVOLUME
Return




MAKENOISE:

MouseMove, 1, 1, 1, R
MouseMove, -1, 1, 1, R
DllCall("SetCursorPos", "int", 100, "int", 400)  ; The first number is the X-coordinate and the second is the Y (relative to the screen).


PixelGetColor, backcolour, 184, 41

DisplayTextBack("MAKING NOISE")

DisplayTextBack(text){
   Gui, +AlwaysOnTop +ToolWindow -SysMenu -Caption
   ;Gui, Margin, %xpos%, %ypos%
   Gui, Color, aaaacc ;changes background color
   Gui +LastFound  ; Make the GUI window the last found window for use by the line below.
WinSet, TransColor, aaaacc
   Gui, Font, 000000 s40 wbold, Tahoma ;changes font color, size and font
   Gui, Add, Text, x0 y0, %text% ;the text to display
   Gui, Show, NoActivate, Xn: 0, Yn: 0

   sleep, 500
   Gui, Destroy
   }

return


SETMICVOLUME:
MsgBox, This is VOLUME
SoundGet,micvol,Microphone:2,Volume
If micvol=0
{
  ToolTip,Mic is On
  If 0=0
    SoundSet,100,Microphone:2,Volume
  Else
    SoundSet,%1%,Microphone:2,Volume
}
Else
{
  ToolTip,Mic is Off
  SoundSet,0,Microphone:2,Volume
}

;############################################################################## 
;#############    END OF SCRIPT                 ############################### 
;############################################################################## 
