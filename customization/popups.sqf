///////////////////////////////////////////////////////////////////////////
//Script to be called by inits or scripts for managing popuptargets around
//a specific game logic
//Call as: [switchcase,radius,centerObject] execVM "customization\arrows.sqf";
//By Pax
///////////////////////////////////////////////////////////////////////////
params ["_execution",["_dist",50,[1]],["_center",player,[objNull]]];

_targets = nearestObjects [position _center, ["TargetBase"], _dist];
_SwivelTargets = nearestObjects [position _center, ["Target_Swivel_01_base_F"], _dist];

switch (_execution) do {
	case "init": {
		{_x animate ["Terc",1]} forEach _targets;
		{_x animate ["Terc",1]; _x setVariable ["BIS_poppingEnabled", false];} forEach _SwivelTargets;
    };
    case "setup": {
		if (count _targets > 0) then {
			{ _x animate ["Terc",0];
				playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\target_pop-up_small.wss", _x];
				_x addEventHandler [
					"Hit", {
						(_this select 0) animate ["Terc",1];
						(_this select 0) removeEventHandler ["Hit",0];
					}
				];
			} forEach _targets;
		} else {
			systemChat "No compatible targets were found.";
		};
		if (count _SwivelTargets > 0) then {
			{ _x animate ["Terc",0];
				_x setVariable ["BIS_poppingEnabled", false];
				playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\target_pop-up_small.wss", _x];
				_x addEventHandler [
					"HitPart", {
						((_this select 0) select 0) animate ["Terc",1];
						((_this select 0) select 0) RemoveEventHandler ["HitPart",0];
					}
				];
			} forEach _SwivelTargets;
		} else {
			systemChat "No compatible swivels were found.";
		};
	};
	case "reset": {
		{ _x animate ["Terc",1];
			playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\target_pop-down_small.wss", _x];
		} forEach _targets;
		{ _x animate ["Terc",1];
			_x setVariable ["BIS_poppingEnabled", false];
			playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\target_pop-down_small.wss", _x];
		} forEach _SwivelTargets;
	};
};