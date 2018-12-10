_dir = _this select 3;
_displaysurface = _this select 0;
_slidesTotalBoard1 = 1;
/////////////////////////////////////////////////////////
if (_dir == "Next" && _displaysurface == board1) then {
	if (curSlideBoard1 < _slidesTotalBoard1) then { // curSlideBoard1 = current slide on Board 1
		curSlideBoard1 = curSlideBoard1 + 1;
		// Please make sure you understand that the naming convention for the slides has nothing to do with the naming of the variable curSlideBoard1...B2 and so on
		[board1, [0, format["slides\board1\slideA%1.jpg", curSlideBoard1]]] remoteExec ["setObjectTexture", 0, false]; // this executes the displayed slide function on the obj board1
//		[screen1, [0, format["slides\board1\slideA%1.jpg", curSlideBoard1]]] remoteExec ["setObjectTexture", 0, false]; // this executes the displayed slide function on the obj screen1 (preferably a laptop/display the instructor to look at)
	} else {
		curSlideBoard1 = 1;
		[board1, [0,"slides\board1\slideA1.jpg"]] remoteExec ["setObjectTexture", 0, false];
//		[screen1, [0,"slides\board1\slideA1.jpg"]] remoteExec ["setObjectTexture", 0, false];
		hint "End reached, looping to first slide";
	};
	publicVariable "curSlideBoard1";
};

if (_dir == "Back" && _displaysurface == board1) then {
	if (curSlideBoard1 > 1) then {
		curSlideBoard1 = curSlideBoard1 - 1;
		[board1, [0, format["slides\board1\slideA%1.jpg", curSlideBoard1]]] remoteExec ["setObjectTexture", 0, false];
//		[screen1, [0, format["slides\board1\slideA%1.jpg", curSlideBoard1]]] remoteExec ["setObjectTexture", 0, false];
    } else {
		curSlideBoard1 = _slidesTotalBoard1;
		[board1, [0,"slides\board1\slideA1.jpg"]] remoteExec ["setObjectTexture", 0, false];
//		[screen1, [0,"slides\board1\slideA1.jpg"]] remoteExec ["setObjectTexture", 0, false];
		hint "Beginning reached, looping to last slide";
	};
	publicVariable "curSlideBoard1";
};
/////////////////////////////////////////////////////////