///////////////////////////////////////////////////////////////////////////
//Script to be called by inits or scripts for hiding and revealing objects
//called as: "hide" or "reveal" execVM "customization\arrows.sqf";
//By Pax
///////////////////////////////////////////////////////////////////////////
if (!isDedicated) then {
	_execution = _this;
	_dist = 50;
	_centerObject = arrowMarkers;
	_arrows = nearestObjects [position _centerObject, ["Sign_Arrow_Large_F"], _dist];

	switch (_execution) do {
		case "hide": {
			if (count _arrows < 1) exitWith {};
			{_x hideObject true;} forEach _arrows;
		};
		case "reveal": {
			if (count _arrows < 1) exitWith {};
			{_x hideObject false;} forEach _arrows;
			systemChat "Arrows are now revealed";
		};
	};
};