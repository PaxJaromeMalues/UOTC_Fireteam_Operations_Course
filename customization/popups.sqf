///////////////////////////////////////////////////////////////////////////////////////////
//Script to be called by inits or scripts for operating swivel and popup
//targets around a specified object "_centerObj".
//params: [ShouldTargetsAutoPop?,WhichSwitchShouldRun?,WhatDistanceFromObject?,WhatObject?]
//By Pax
///////////////////////////////////////////////////////////////////////////////////////////
params [
	["_execution", "init"],
	["_distance", 500],
	["_centerObj", initCenter],
	["_popEnabled", false]
];

_targets = nearestObjects [position _centerObj, ["TargetBase", "Target_Swivel_01_base_F"], _distance];

switch (toLower _execution) do {
	case "init": {
		{
			//isKindOf Swivel else isKindOf popup
			if (typeOf _x isKindOf "Target_Swivel_01_base_F") then {
				_x setVariable ["BIS_poppingEnabled", false, true];
			} else {
				_x setVariable ["nopop", true, true];
			};
			// Lower all targets defined in array _targets
			_x animateSource ["terc", 1];
		}forEach _targets;
	};
	
	case "setup": {
		//Make sure _targets are reset before running the setup phase (layerEightProtection)
		["reset", _distance, _centerObj] call Fnc_popup;
		//Inform Instructor who asked for setup that the command was received
		"Command received - Targets are being setup" remoteExec ["systemChat", remoteExecutedOwner];
		{
			//Is this target told to auto-pop?
			_x setVariable ["rePop", _popEnabled];
			//Raise the target
			_x animateSource ["terc", 0];
			//Add Hit EH and store the EH ID on the target
			_x setVariable [
				"HitEH",
				_x addEventHandler [
					"Hit", {
						params [
							"_target",
							"",
							"",
							""
						];
						//If auto-pop was set
						if (_target getVariable "rePop") then {
							_target setVariable [
								"rePopThread", _target spawn {
									sleep (1 + random 4);
									_this animateSource ["terc", 0];
								}
							];
						//No auto-pop set
						} else {
							//Bin Hit EH
							_target removeEventHandler ["Hit", _thisEventHandler];
							//Clean Shit up
							_target setVariable ["HitEH", nil];
							_target setVariable ["rePop", nil];
						};
					}
				]
			];
		} forEach _targets;
	};
	
	case "reset": {
		//Inform Instructor of action
		"Command received - Targets are being reset" remoteExec ["systemChat", remoteExecutedOwner];
		{
			//If the target for whatever reason still has an active EH:
			if !(isNil {_x getVariable "HitEH"}) then {
				//if auto-pop is set
				if (_x getVariable "rePop") then {
					//Is the target currently waiting to rePop?
					if (!isNil {_x getVariable "rePopThread"} && {!isNull (_x getVariable "rePopThread")}) then {
						//If it is waiting, terminate the Thread
						terminate (_x getVariable "rePopThread");
					};
					_x setVariable ["rePopThread", nil];
				};
				_x removeEventHandler ["Hit", _x getVariable "HitEH"];
				_x setVariable ["HitEH", nil];
				_x setVariable ["rePop", nil];
			};
			//Lower the targets
			_x animateSource ["terc", 1];
		} forEach _targets;
	};
}; 

/*
private _targets = nearestObjects [position _centerObj, ["TargetBase"], _distance];
private _SwivelTargets = nearestObjects [position _centerObj, ["Target_Swivel_01_base_F"], _distance];

switch (_execution) do {
	case "init": {
		{
			_x setVariable ["nopop", true];
			_x animateSource ["terc",1]
		} forEach _targets;
		{
			_x setVariable ["BIS_poppingEnabled", false];
//			_x setVariable ["BIS_leaningEnabled", false]; <-- aparently disables any animation physics, thx BI -.-
			_x animateSource ["terc",1];
		} forEach _SwivelTargets;
  	};
	
	case "setup": {
		"setup called" remoteExec ["systemChat"];
//	Normal Popuptargets
		if (_popEnabled) then {
			"popup first condition" remoteExec ["systemChat"];
			{
				_x setVariable ["nopop", false];
				_x animateSource ["terc",0];
				_x addEventHandler [
					"Hit", {
						"popup first condition EH animate" remoteExec ["systemChat"];
						(_this select 0) animateSource ["terc",1];
						(_this select 0) setVariable ["popdelay", 1 + (random 5)];
//						[{
//							(_this select 0) animateSource ["terc",0];
//							"popup first condition EH in CBA" remoteExec ["systemChat"];
//						},
//						[_this], 2 + (random 3)] call CBA_fnc_waitAndExecute;
					}
				] 
			} forEach _targets;
		} else {
			"popup second condition" remoteExec ["systemChat"];
			{
				_x animateSource ["terc",0];
				_x addEventHandler [
					"Hit", {
						(_this select 0) animateSource ["terc",1];
						(_this select 0) removeEventHandler ["Hit",0];
					}
				]
			} forEach _targets;
		};
//	Swivel targets
		if (_popEnabled) then {
			"swivel first condition" remoteExec ["systemChat"];
			{
				_x setVariable ["BIS_poppingEnabled", true];
				_x setVariable ["BIS_leaningEnabled", true];
				_x animateSource ["terc",0];
				_x addEventHandler [
					"HitPart", {
						((_this select 0) select 0) animateSource ["terc",1];
						((_this select 0) select 0) setVariable ["popdelay", 1 + (random 5)];
//						[{
//							((_this select 0) select 0) animateSource ["terc",0];
//						},
//						[_this], 2 + (random 3)] call CBA_fnc_waitAndExecute;
					}
				] 
			} forEach _SwivelTargets;
		} else {
			"swivel second condition" remoteExec ["systemChat"];
			{
				_x setVariable ["BIS_leaningEnabled", true];
				_x animateSource ["terc",0];
				_x addEventHandler [
					"HitPart", {
						((_this select 0) select 0) setVariable ["BIS_leaningEnabled", false];
						((_this select 0) select 0) animateSource ["terc",1];
						((_this select 0) select 0) removeEventHandler ["HitPart",0];
					}
				]
			} forEach _SwivelTargets;
		};
	};
	
	case "reset": {
		"reset called" remoteExec ["systemChat"];
		{
			_x setVariable ["nopop", true];
			_x removeEventHandler ["Hit",0];
			_x animateSource ["terc",1];
		} forEach _targets;
		{
			_x setVariable ["BIS_poppingEnabled", false];
			_x setVariable ["BIS_poppingEnabled", false];
			_x RemoveEventHandler ["HitPart",0];
			_x animateSource ["terc",1];
		} forEach _SwivelTargets;
	};
};
*/