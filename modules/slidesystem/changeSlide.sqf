_dir = _this select 3;
_displaysurface = _this select 0;
_slidesTotal = 1;
/////////////////////////////////////////////////////////
if (_dir == "Next" && _displaysurface == screen1) then {
	if (curSlideB1 < _slidesTotal) then { // curSlideB1 = current slide on Board 1
		curSlideB1 = curSlideB1 + 1;
		// Please make sure you understand that the naming convention for the slides has nothing to do with the naming of the variable curSlideB1...B2 and so on
		[board1, [0, format["slides\board1\slideA%1.jpg", curSlideB1]]] remoteExec ["setObjectTexture", 0, false]; // this executes the displayed slide function on the obj board1
		[screen1, [0, format["slides\board1\slideA%1.jpg", curSlideB1]]] remoteExec ["setObjectTexture", 0, false]; // this executes the displayed slide function on the obj screen1 (preferably a laptop/display the instructor to look at)
	} else {
		curSlideB1 = 1;
		[board1, [0,"slides\board1\slideA1.jpg"]] remoteExec ["setObjectTexture", 0, false];
		[screen1, [0,"slides\board1\slideA1.jpg"]] remoteExec ["setObjectTexture", 0, false];
		hint "End reached, looping to first slide";
	};
	publicVariable "curSlideB1";
};

if (_dir == "Back" && _displaysurface == screen1) then {
	if (curSlideB1 > 1) then {
		curSlideB1 = curSlideB1 - 1;
		[board1, [0, format["slides\board1\slideA%1.jpg", curSlideB1]]] remoteExec ["setObjectTexture", 0, false];
		[screen1, [0, format["slides\board1\slideA%1.jpg", curSlideB1]]] remoteExec ["setObjectTexture", 0, false];
    } else {
		curSlideB1 = _slidesTotal;
		[board1, [0,"slides\board1\slideA1.jpg"]] remoteExec ["setObjectTexture", 0, false];
		[screen1, [0,"slides\board1\slideA1.jpg"]] remoteExec ["setObjectTexture", 0, false];
		hint "Beginning reached, looping to last slide";
	};
	publicVariable "curSlideB1";
};
/////////////////////////////////////////////////////////