#define framework

#include "core\script_macros.hpp"
#include "core\init.sqf" //DO NOT REMOVE
#include "customization\settings.sqf" //DO NOT REMOVE
#include "core\dia\debug\dia_debug.sqf" //DO NOT REMOVE

#include "customization\addAction.sqf" //give instructors control over all popuptargets

//Following code is apparently necessary to make swivels somewhat working in multiplayer
if (!isDedicated) then {
	{
		_x setVariable ["BIS_exitScript", false, true];
	} forEach entities [
		["Target_Swivel_01_ground_F", "Land_Target_Swivel_01_F"],[]
	];
};

Fnc_popup = compile preprocessFileLineNumbers "customization\popups.sqf";

if (isServer) then {

	"hide" execVM "customization\arrows.sqf";

//	[false,"init",500,initCenter] remoteExec ["Fnc_popup", 2];

	_nul = [] spawn {
		waitUntil {time > 0};
		[] call Fnc_popup;
	};

	"" call FNC_StartingCount; //DO NOT REMOVE

	[] spawn { //Spawns code running in parallel

		while {!FW_MissionEnded} do { //Loops while the mission is not ended
			
			#include "customization\endConditions.sqf" //DO NOT REMOVE
			
			//The time limit in minutes variable called FW_TimeLimit is set in customization/settings.sqf, to disable the time limit set it to 0
			if ((time / 60) >= FW_TimeLimit && FW_TimeLimit != 0) exitWith { //It is recommended that you do not remove the time limit end condition 
				
				FW_TimeLimitMessage call FNC_EndMission;
				
			};
		};	
	};
};

#include "modules\modules.sqf" //DO NOT REMOVE
#include "core\postChecks.sqf" //DO NOT REMOVE