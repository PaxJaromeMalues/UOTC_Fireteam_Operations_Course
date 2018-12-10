["Teleport Pole", "Allows to define multiple objects and teleport to set marker", "Starfox64, Pax"] call FNC_RegisterModule;

if (!isDedicated) then {

  waitUntil { (player == player) };
  
	"" spawn {

		sleep 0.01;
		
		//pole addAction
		pole1 addAction ["Fireteam Drills", "modules\teleportpole\teleport.sqf", ["marker_26"]];
		pole2 addAction ["Classroom", "modules\teleportpole\teleport.sqf", ["marker_33"]];
	
	};

};