/*-------
Makes targets pop up at the user's command. Targets go down after being hit,
and return back with user action. Because swivel targets have a different
script assigned to them that works differently from all other targets, 
they are handled separately in the script. If you don't plan
to use swivel targets at all, feel free to delete the corresponding part
of the code.
-------*/

params [["_dist",50,[1]],["_center",player,[objNull]]];					//in params
_targets = nearestObjects [position _center, ["TargetBase"], _dist];	//take all nearby practice targets
if (count _targets < 1) exitWith {
	systemChat "No compatible targets were found.";						//exit if no targets have been found
};
{_x animate ["Terc",1];} forEach _targets;								//get all targets to upright pos
//systemChat "Ready.";


//swivel targets start here

_SwivelTargets = nearestObjects [position _center, ["Target_Swivel_01_base_F"], _dist];		//swivel targets work differently
if (count _SwivelTargets < 1) exitWith {
	//systemChat "No swivel targets were found.";
};
{_x animate ["Terc",1]; _x setVariable ["BIS_poppingEnabled", false];} forEach _SwivelTargets;	//nopop has no effect, it's poppingEnabled now

//systemChat "Swivel ready.";



