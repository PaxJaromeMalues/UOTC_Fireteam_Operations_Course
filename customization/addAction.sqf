if (!isDedicated) then {
	waitUntil { (player == player) };
	if (player getVariable "isInstructor") then {
		"" spawn { sleep 0.01;
			conrepboard addAction ["<t color='#FF0000'>Reveal Arrows",{"reveal" execVM "customization\arrows.sqf";}];
			conrepboard addAction ["<t color='#FF0000'>Hide Arrows",{"hide" execVM "customization\arrows.sqf";}];
			arBoard addAction ["<t color='#FF0000'>Raise Bunker Targets",{["true","setup",15,bnkTgts] execVM "customization\popups.sqf";}];
			arBoard addAction ["<t color='#FF0000'>Lower Bunker Targets",{["false","reset",15,bnkTgts] execVM "customization\popups.sqf";}];
			grnBoard addAction ["<t color='#FF0000'>Raise Trench Targets",{["false","setup",15,grnTgts] execVM "customization\popups.sqf";}];
			grnBoard addAction ["<t color='#FF0000'>Lower Trench Targets",{["false","reset",15,grnTgts] execVM "customization\popups.sqf";}];
			bldBoard addAction ["<t color='#FF0000'>Raise House Targets",{["false","setup",15,hseTgts] execVM "customization\popups.sqf";}];
			bldBoard addAction ["<t color='#FF0000'>Lower House Targets",{["false","reset",15,hseTgts] execVM "customization\popups.sqf";}];
			grnPraBoard addAction ["<t color='#FF0000'>Raise Practice Targets",{["false","setup",2,grnPraTgts] execVM "customization\popups.sqf";}];
			grnPraBoard addAction ["<t color='#FF0000'>Lower Practice Targets",{["false","reset",2,grnPraTgts] execVM "customization\popups.sqf";}];
		};
	};
};