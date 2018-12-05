if (!isDedicated) then {
	waitUntil { (player == player) };
	if (player getVariable "isInstructor") then {
		"" spawn { sleep 0.01;
			conrepboard addAction ["<t color='#FF0000'>Reveal Arrows",{"reveal" execVM "customization\arrows.sqf";}];
			conrepboard addAction ["<t color='#FF0000'>Hide Arrows",{"hide" execVM "customization\arrows.sqf";}];
			arBoard addAction ["<t color='#FF0000'>Raise Bunker Targets",{["setup",15,bnkTgts] execVM "customization\popups.sqf";}];
			arBoard addAction ["<t color='#FF0000'>Lower Bunker Targets",{["reset",15,bnkTgts] execVM "customization\popups.sqf";}];
			grnBoard addAction ["<t color='#FF0000'>Raise Trench Targets",{["setup",15,grnTgts] execVM "customization\popups.sqf";}];
			grnBoard addAction ["<t color='#FF0000'>Lower Trench Targets",{["reset",15,grnTgts] execVM "customization\popups.sqf";}];
			bldBoard addAction ["<t color='#FF0000'>Raise House Targets",{["setup",15,hseTgts] execVM "customization\popups.sqf";}];
			bldBoard addAction ["<t color='#FF0000'>Lower House Targets",{["reset",15,hseTgts] execVM "customization\popups.sqf";}];
		};
	};
};