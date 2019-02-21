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
				_x setVariable ["BIS_leaningEnabled", false, true];
				_x setVariable ["BIS_poppingEnabled", false, true];
				_x animateSource ["popup_Source", 1];
			} else {
				_x setVariable ["nopop", true, true];
				_x animateSource ["terc", 1];
			};
		}forEach _targets;
	};
	
	case "setup": {
		//Make sure _targets are reset before running the setup phase (layerEightProtection)
		["reset", _distance, _centerObj] call Fnc_popup;
		//Inform Instructor who asked for setup that the command was received
		"Command received - Targets are being setup" remoteExec ["systemChat", remoteExecutedOwner];
		{
			if (typeOf _x isKindOf "Target_Swivel_01_base_F") then {
				//Is this target told to auto-pop?
				_x setVariable ["rePop", _popEnabled];
				//Raise the target
				_x animateSource ["popup_Source", 0];
				//Making sure leaning is enabled for the animation
				_x setVariable ["BIS_leaningEnabled", true, true];
				//Add Hit EH and store the EH ID on the target
				_x setVariable [
					"HitEH",
					_x addEventHandler [
						"HitPart", {
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
										"AUTOPOP" remoteExec ["systemChat", remoteExecutedOwner];
										sleep (1 + random 4);
										_this animateSource ["popup_Source", 0];
									}
								];
							//No auto-pop set
							} else {
								//Bin Hit EH
								"NOPOP" remoteExec ["systemChat", remoteExecutedOwner];
								((_this select 0) select 0) RemoveEventHandler ["HitPart",0];
								//Clean Shit up
								_target setVariable ["HitEH", nil];
								_target setVariable ["rePop", nil];
							};
						}
					]
				];
			} else {
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
			};
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
				if (typeOf _x isKindOf "Target_Swivel_01_base_F") then {
					_x removeEventHandler ["HitPart", _x getVariable "HitEH"];
					_x setVariable ["HitEH", nil];
					_x setVariable ["rePop", nil];
					_x setVariable ["BIS_leaningEnabled", false, true];
					_x animateSource ["popup_Source", 1];
				} else {
					_x removeEventHandler ["Hit", _x getVariable "HitEH"];
					_x setVariable ["HitEH", nil];
					_x setVariable ["rePop", nil];
					_x animateSource ["terc", 1];
				};
			};
			//Lower the targets
		} forEach _targets;
	};
};