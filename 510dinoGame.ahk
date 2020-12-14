#include WindHumanMouse.ahk
#MaxThreadsPerHotkey 5
#SingleInstance Force
SetBatchLines -1

xcoord := 210
jumpcount := 0

f1::
	if WinExist("chrome://dino/ - Google Chrome")
		WinActivate ; use the window found above
	else
		Exitapp
	WinMove, chrome://dino/ - Google Chrome, , 71, 125, 974, 528
	Sleep, 1000
	return
	
	
	

f3::
	if WinExist("chrome://dino/ - Google Chrome")
		WinActivate ; use the window found above
	;SetTimer, Faster, 1300
	counter = 0
	Loop{
		PixelGetColor, EyesColor, %xcoord%, 348, RGB
		if (EyesColor == 0x535353 ){
			SetTimer, Jump, -1
		}
		PixelGetColor, EyesColor, %xcoord%, 353, RGB
		if (EyesColor == 0x535353 ){
			SetTimer, Jump, -1
		}
		ToolTip, Scanning %counter% `nJumps:  %jumpcount%
		counter += 1
	}
	return

f2::
	Exitapp
	return
	
	
return

Faster:
	xcoord += 1
	return

Jump:
	Loop{
		PixelGetColor, DinoTailColor, 56, 336, RGB
		if (DinoTailColor == 0x535353 ){
				Send {SPACE down}
				Send {SPACE up}
				jumpcount += 2
				xcoord += 1
				return
			}
	}
	return
		
	

