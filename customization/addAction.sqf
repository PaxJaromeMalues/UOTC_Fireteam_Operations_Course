if (player getVariable "isInstructor") then {

	waitUntil {
		(player == player)
	};
	[] spawn {
		sleep 0.01;
		player addAction ["Reveal Arrows",{"reveal" execVM "customization\arrows.sqf";}];
		player addAction ["Hide Arrows",{"hide" execVM "customization\arrows.sqf";}];
	};
};