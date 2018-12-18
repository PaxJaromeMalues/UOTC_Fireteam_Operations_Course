params ["_popenabled","_execution",["_dist",50,[1]],["_center",player,[objNull]]];

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
		if (count _targets > 0) then {
			{ _x animate ["Terc",0];
				playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\target_pop-up_small.wss", _x];
				if (_popenabled == true) then {
					_x addEventHandler [
						"Hit", {
							(_this select 0) animate ["Terc",1];
							[{
								playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\target_pop-up_small.wss", (_this select 0)];
								(_this select 0) animate ["Terc",0];
							},
							_this, 1 + (random 4)] call CBA_fnc_waitAndExecute;
						}
					]
				} else {
					_x addEventHandler [
						"Hit", {
							(_this select 0) animate ["Terc",1];
							(_this select 0) removeEventHandler ["Hit",0];
						}
					]
				};
			} forEach _targets;
		} else {
			systemChat "No compatible targets were found.";
		};
		if (count _SwivelTargets > 0) then {
			{ _x animate ["Terc",0];
			playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\target_pop-up_small.wss", _x];
				if (_popenabled == true) then {
					_x setVariable ["BIS_poppingEnabled", false];
					_x addEventHandler [
						"HitPart", {
							((_this select 0) select 0) animate ["Terc",1];
							[{
								playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\target_pop-up_small.wss", (_this select 0)];
								((_this select 0) select 0) animate ["Terc",0];
							},
							_this, 1 + (random 4)] call CBA_fnc_waitAndExecute;
						}
					]
				} else {
					_x setVariable ["BIS_poppingEnabled", false];
					_x addEventHandler [
						"HitPart", {
							((_this select 0) select 0) animate ["Terc",1];
							((_this select 0) select 0) RemoveEventHandler ["HitPart",0];
						}
					]
				};
			} forEach _SwivelTargets;
		} else {
			systemChat "No compatible swivels were found.";
		};
	};
	case "reset": {
		{
			_x removeEventHandler ["Hit",0];
			_x animate ["Terc",1];
			playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\target_pop-down_small.wss", _x];
		} forEach _targets;
		{
			_x animate ["Terc",1];
			_x setVariable ["BIS_poppingEnabled", false];
			_x RemoveEventHandler ["HitPart",0];
			playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\target_pop-down_small.wss", _x];
		} forEach _SwivelTargets;
	};
};