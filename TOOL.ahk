
;Color Selector Written By Joseph#0501
;Edited By Arekusei
;Osrs Tool v0.1

#SingleInstance Force
SetBatchLines, -1

Menu Tray, Icon, pifmgr.DLL, 17

Gui, Font, s8, Verdana
Gui, +AlwaysOnTop +hwndGUIHwnd
Gui, Add, Progress, Section w50 h50 BackgroundBlack cWhite hwndProgress, 100
Gui, Add, Button, w50 gClear, Clear
Gui, Add, Edit, h250 ys w250 vText hwndMyEdit
Gui, Add, Text, xm, CTRL + Click to select color
Gui, Add, Text, xm, Alt + Drag Mouse to select coordinates 
counter = 0

Gui, Show,, OSRS Tool
SetTimer, GetColor, 50, ON
Return

GetColor:
	MouseGetPos, MouseX, MouseY, MouseWin
	PixelGetColor, Color, % MouseX, % MouseY, RGB
	GuiControl, % "+c" SubStr(Color, 3) , % Progress
Return



^LButton::
    Gui Submit, NoHide
    MouseGetPos, MouseX, MouseY, MouseWin
    PixelGetColor, Color, % MouseX, % MouseY, RGB
    Clipboard := Color
    Contents:=  text Color " MoveMouse`(" MouseX ", " MouseY "`)" "`n" 
    GuiControl,, % MyEdit, % Contents
    SetTimer, TP, -500
    ToolTip, Copied!

Return

tp:
    sleep 555
    ToolTip
Return

clear:
GuiControl,, % MyEdit
Return


GuiClose:
GuiEscape:
	ExitApp
Return






marker(X:=0, Y:=0, W:=0, H:=0)
{
T:=3, ; Thickness of the Border
w2:=W-T,
h2:=H-T

Gui marker: +LastFound +AlwaysOnTop -Caption +ToolWindow +E0x08000000 +E0x80020
Gui marker: Color, Red ;Color
Gui marker: Show, w%W% h%H% x%X% y%Y% NA

WinSet, Transparent, 150
WinSet, Region, 0-0 %W%-0 %W%-%H% 0-%H% 0-0 %T%-%T% %w2%-%T% %w2%-%h2% %T%-%h2% %T%-%T%
Return  
}


!LButton::
    
    WinGetPos XN, YN, , , A
    MouseGetPos x1, y1
    x1+=XN, y1+=YN
    While GetKeyState("LButton","P") {
       MouseGetPos x2, y2
       x2+=XN, y2+=YN
       x:= (x1<x2)?(x1):(x2)    ;x-coordinate of the top left corner
       y:= (y1<y2)?(y1):(y2)    ;y-coordinate of the top left corner
       
       w:= Abs(x2-x1), h:= Abs(y2-y1)
       ToolTip % "Coords " x - xn "," y - yn "  Dim " w "x" h
       
       marker(x, y, w, h)

    }
    Gui Submit, NoHide
    output := "click_box`(" x - xn ", " y - yn ", " x - xn + w ", " y - yn + h "`)"
    Contents:=   text output "`n" 
    GuiControl,, % MyEdit, % Contents
    clipboard := % x - xn ", " y - yn ", " x - xn + w ", " y - yn + h
    
    ToolTip
Return

	
	
~Shift & LButton::
    
    WinGetPos XN, YN, , , A
    MouseGetPos x1, y1
    x1+=XN, y1+=YN
    While GetKeyState("LButton","P") {
       MouseGetPos x2, y2
       x2+=XN, y2+=YN
       x:= (x1<x2)?(x1):(x2)    ;x-coordinate of the top left corner
       y:= (y1<y2)?(y1):(y2)    ;y-coordinate of the top left corner
       
       w:= Abs(x2-x1), h:= Abs(y2-y1)
       ToolTip % "Coords " x - xn "," y - yn "  Dim " w "x" h
       
       marker(x, y, w, h)

    }
    Gui Submit, NoHide
    output := "click_box`(" x - xn ", " y - yn ", " x - xn + w ", " y - yn + h "`)"
	
	if (Mod(counter, 3) == 0){
		output:= "Random`, draw`, 1`, 3`nif`(draw `=`= 1`)`n" output
	}else if(Mod(counter, 3) == 1){
		output:= "else if`(draw `=`= 2`)`n" output
	}else if(Mod(counter, 3) == 2){
		output:= "else`n" output "`n"
	}
	
    Contents:=   text output "`n" 
    GuiControl,, % MyEdit, % Contents
    clipboard := % x - xn ", " y - yn ", " x - xn + w ", " y - yn + h
	counter += 1
    
    ToolTip
Return
	

~RButton::
Gui, marker: Destroy
Return