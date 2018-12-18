///////////////////////////////////////////////////////////////////////////////////////////
//Script to be called by inits or scripts for operating swivel and popup
//targets around a specified object "_center".
//params: [ShouldTargetsAutoPop?,WhichSwitchShouldRun?,WhatDistanceFromObject?,WhatObject?]
//By Pax
///////////////////////////////////////////////////////////////////////////////////////////
params [["_popenabled",false,[boolean]],["_execution","init",[string]],["_dist",25,[number]],["_center",initCenter,[objNull]]];

_targets = nearestObjects [position _center, ["TargetBase"], _dist];
_SwivelTargets = nearestObjects [position _center, ["Target_Swivel_01_base_F"], _dist];

switch (_execution) do {
	case "init": {
		{
			_x animate ["Terc",1]
		} forEach _targets;
		{
			_x setVariable ["BIS_poppingEnabled", false];
			_x animate ["Terc",1];
		} forEach _SwivelTargets;
  	};
	
	case "setup": {
		"setup called" remoteExec ["systemChat"];
		if (count _targets > 0) then {
			{ _x animate ["Terc",0];
				if (_popenabled) then {
					"popup first condition" remoteExec ["systemChat"];
					_x addEventHandler [
						"Hit", {
							(_this select 0) animate ["Terc",1];
							[{
								(_this select 0) animate ["Terc",0];
							},
							_this, 1 + (random 4)] call CBA_fnc_waitAndExecute;
						}
					]
				} else {
					"popup second condition" remoteExec ["systemChat"];
					_x addEventHandler [
						"Hit", {
							(_this select 0) animate ["Terc",1];
							(_this select 0) removeEventHandler ["Hit",0];
						}
					]
				};
			} forEach _targets;
		} else {
			"No compatible targets were found." remoteExec ["systemChat"];
		};
		if (count _SwivelTargets > 0) then {
			{ _x animate ["Terc",0];
				if (_popenabled) then {
					"swivle first condition" remoteExec ["systemChat"];
					_x addEventHandler [
						"HitPart", {
							((_this select 0) select 0) animate ["Terc",1];
							[{
								((_this select 0) select 0) animate ["Terc",0];
							},
							_this, 1 + (random 4)] call CBA_fnc_waitAndExecute;
						}
					]
				} else {
					"swivle second condition" remoteExec ["systemChat"];
					_x addEventHandler [
						"HitPart", {
							((_this select 0) select 0) animate ["Terc",1];
							((_this select 0) select 0) RemoveEventHandler ["HitPart",0];
						}
					]
				};
			} forEach _SwivelTargets;
		} else {
			"No compatible Swivels were found." remoteExec ["systemChat"];
		};
	};
	
	case "reset": {
		"reset called" remoteExec ["systemChat"];
		{
			_x removeEventHandler ["Hit",0];
			_x animate ["Terc",1];
		} forEach _targets;
		{
			_x animate ["Terc",1];
			_x RemoveEventHandler ["HitPart",0];
		} forEach _SwivelTargets;
	};
};