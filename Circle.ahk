#include WindHumanMouse.ahk
#SingleInstance Force
return

1::
loop , 100 {
;Withdraw

Random, draw, 1, 3
if(draw == 1)
click_box(1064, 625, 1074, 634)
else if(draw == 2)
click_box(1081, 622, 1090, 633)
else
click_box(1075, 639, 1092, 652)

Random, draw, 1, 3
if(draw == 1)
click_box(932, 574, 950, 591)
else if(draw == 2)
click_box(951, 575, 963, 595)
else
click_box(938, 586, 951, 599)

Random, draw, 1, 3
if(draw == 1)
click_box(233, 389, 261, 415)
else if(draw == 2)
click_box(250, 375, 263, 397)
else
click_box(245, 419, 264, 436)

Random, draw, 1, 3
if(draw == 1)
click_box(600, 546, 616, 561)
else if(draw == 2)
click_box(612, 553, 626, 566)
else
click_box(621, 560, 638, 577)

Random, draw, 1, 3
if(draw == 1)
click_box(559, 497, 574, 512)
else if(draw == 2)
click_box(567, 516, 575, 522)
else
click_box(578, 497, 590, 516)

Random, draw, 1, 3
if(draw == 1)
click_box(609, 503, 619, 516)
else if(draw == 2)
click_box(621, 504, 633, 514)
else
click_box(617, 515, 634, 525)
}
return

2::
ExitApp
return


click_box(x1, y1, x2, y2) {
	ToolTip
	BlockInput, MouseMove
	x += target_random(x1,(x1+x2)/2,x2)
	y += target_random(y1,(y1+y2)/2,y2)
	MoveMouse(x, y)
	MouseMove, %x%, %y%, 50
	Sleep, rand_range(20,40)
	MouseClick, Left
	Sleep, rand_range(20,40)
	BlockInput, MouseMoveOff
}

rand_range(min, max) {
	Random, r, %min%, %max%
	return r
}

target_random(min, target, max){
	Random, lower, min, target
	Random, upper, target, max
	Random, weighted, lower, upper
	Return, weighted
}

RemoveToolTip:
Tooltip
return