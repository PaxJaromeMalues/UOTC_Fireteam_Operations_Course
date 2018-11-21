["Slide System", "Allows to define multiple boards and displaying of the slides in the root '/slides/board%n' directory", "ACE, BlackHawk, Pax"] call FNC_RegisterModule;

if (!isDedicated) then {

  waitUntil { (player == player) };
  
  if (player getVariable "isInstructor") then {
    
		"" spawn {
	
			sleep 0.01;

			//Current Slide values for boards
			curSlideB1 = 1;
			
			//board addAction
			screen1 addAction ["Next Slide", "modules\slidesystem\changeSlide.sqf", "Next"];
			screen1 addAction ["Previous Slide", "modules\slidesystem\changeSlide.sqf", "Back"];
	
		};
    
	};

};