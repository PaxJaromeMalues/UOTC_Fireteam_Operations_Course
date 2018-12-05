if (player getVariable "isInstructor") then {

	waitUntil {
		(player == player)
	};
	[] spawn {
		sleep 0.01;
		CI addAction ["Reveal Arrows", {"reveal" execVM "customization\arrows.sqf"};];
		TI1 addAction ["Reveal Arrows", {"reveal" execVM "customization\arrows.sqf"};];
		TI2 addAction ["Reveal Arrows", {"reveal" execVM "customization\arrows.sqf"};];
	};
};