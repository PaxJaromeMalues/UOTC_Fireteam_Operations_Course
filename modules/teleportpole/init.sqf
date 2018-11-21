["Teleport Pole", "Allows to define multiple objects and teleport to set marker", "Starfox64, Pax"] call FNC_RegisterModule;

if (!isDedicated) then {

  waitUntil { (player == player) };
  
	"" spawn {

		sleep 0.01;
		
		//pole addAction
		pole1 addAction ["Teleport LFX3", "modules\teleportpole\teleport.sqf", ["marker_4"]];
		pole2 addAction ["Teleport LFX2", "modules\teleportpole\teleport.sqf", ["marker_3"]];
	
		};

};