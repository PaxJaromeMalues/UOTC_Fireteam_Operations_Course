///////////////////////////////////////////////////////////////////////////////////////////
//Script to be called by inits or scripts for operating swivel and popup
//targets around a specified object "_center".
//params: [ShouldTargetsAutoPop?,WhichSwitchShouldRun?,WhatDistanceFromObject?,WhatObject?]
//By Pax
///////////////////////////////////////////////////////////////////////////////////////////
params [["_popenabled",false],["_execution","init"],["_dist",25],["_center",initCenter]];

_targets = nearestObjects [position _center, ["TargetBase"], _dist];
_SwivelTargets = nearestObjects [position _center, ["Target_Swivel_01_base_F"], _dist];

switch (_execution) do {
	case "init": {
		{
			_x setVariable ["nopop", true];
			_x animateSource ["terc",1]
		} forEach _targets;
		{
			_x setVariable ["BIS_poppingEnabled", false];
			_x animateSource ["terc",1];
		} forEach _SwivelTargets;
  	};
	
	case "setup": {
		"setup called" remoteExec ["systemChat"];
		if (_popenabled) then {
			"popup first condition" remoteExec ["systemChat"];
			{
				_x animateSource ["terc",0];
				_x addMPEventHandler [
					"MPHit", {
						"popup first condition EH before CBA" remoteExec ["systemChat"];
						(_this select 0) animateSource ["terc",1];
						[{
							(_this select 0) animateSource ["terc",0];
							"popup first condition EH in CBA" remoteExec ["systemChat"];
						},
						_this, 2 + (random 3)] call CBA_fnc_waitAndExecute;
					}
				] 
			} forEach _targets;
		} else {
			"popup second condition" remoteExec ["systemChat"];
			{
				_x animateSource ["terc",0];
				_x addMPEventHandler [
					"MPHit", {
						(_this select 0) animateSource ["terc",1];
						(_this select 0) removeEventHandler ["MPHit",0];
					}
				]
			} forEach _targets;
		};
		if (_popenabled) then {
			"swivel first condition" remoteExec ["systemChat"];
			{
				_x animateSource ["terc",0];
				_x addMPEventHandler [
					"MPHitPart", {
						((_this select 0) select 0) animateSource ["terc",1];
						[{
							((_this select 0) select 0) animateSource ["terc",0];
						},
						_this, 2 + (random 3)] call CBA_fnc_waitAndExecute;
					}
				] 
			} forEach _SwivelTargets;
		} else {
			"swivel second condition" remoteExec ["systemChat"];
			{
				_x animateSource ["terc",0];
				_x addMPEventHandler [
					"MPHitPart", {
						((_this select 0) select 0) animateSource ["terc",1];
						((_this select 0) select 0) removeEventHandler ["MPHit",0];
					}
				]
			} forEach _SwivelTargets;
		};
	};
	
	case "reset": {
		"reset called" remoteExec ["systemChat"];
		{
			_x removeEventHandler ["MPHit",0];
			_x animateSource ["terc",1];
		} forEach _targets;
		{
			_x animateSource ["terc",1];
			_x RemoveEventHandler ["MPHitPart",0];
		} forEach _SwivelTargets;
	};
};