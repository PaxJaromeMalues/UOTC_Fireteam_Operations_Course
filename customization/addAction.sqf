B2ND_popup = compile loadFile "customization\popups.sqf";
if (!isDedicated) then {
	waitUntil { (player == player) };
	if (player getVariable "isInstructor") then {
		conrepboard addAction ["<t color='#FF0000'>Reveal Arrows",{"reveal" execVM "customization\arrows.sqf";}];
		conrepboard addAction ["<t color='#FF0000'>Hide Arrows",{"hide" execVM "customization\arrows.sqf";}];
		arBoard addAction ["<t color='#FF0000'>Raise Bunker Targets",{[true,"setup",15,bnkTgts] remoteExec ["B2ND_popup", 2];}];
		arBoard addAction ["<t color='#FF0000'>Lower Bunker Targets",{[false,"reset",15,bnkTgts] remoteExec ["B2ND_popup", 2];}];
		grnBoard addAction ["<t color='#FF0000'>Raise Trench Targets",{[false,"setup",15,grnTgts] remoteExec ["B2ND_popup", 2];}];
		grnBoard addAction ["<t color='#FF0000'>Lower Trench Targets",{[false,"reset",15,grnTgts] remoteExec ["B2ND_popup", 2];}];
		bldBoard addAction ["<t color='#FF0000'>Raise House Targets",{[false,"setup",15,hseTgts] remoteExec ["B2ND_popup", 2];}];
		bldBoard addAction ["<t color='#FF0000'>Lower House Targets",{[false,"reset",15,hseTgts] remoteExec ["B2ND_popup", 2];}];
		grnPraBoard addAction ["<t color='#FF0000'>Raise Practice Targets",{[false,"setup",2,grnPraTgts] remoteExec ["B2ND_popup", 2];}];
		grnPraBoard addAction ["<t color='#FF0000'>Lower Practice Targets",{[false,"reset",2,grnPraTgts] remoteExec ["B2ND_popup", 2];}];
	};
};