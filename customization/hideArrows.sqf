params [["_dist",50,[1]],["_center",player,[objNull]]];	
_arrows = nearestObjects [position _center, ["Sign_Arrow_Large_F"], _dist];
if (count _arrows < 1) exitWith {
	//systemChat "No compatible targets were found.";						//exit if no targets have been found
};
{_x hideObject true;} forEach _arrows;