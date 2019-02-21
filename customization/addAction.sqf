if (!isDedicated) then {
	if (player getVariable ["isInstructor", false]) then {
		conrepboard addAction ["<t color='#FF2222'>Reveal Arrows",{"reveal" execVM "customization\arrows.sqf";}];
		conrepboard addAction ["<t color='#FF2222'>Hide Arrows",{"hide" execVM "customization\arrows.sqf";}];
		arBoard addAction ["<t color='#FF2222'>Raise Bunker Targets",{["setup",15,bnkTgts,true] remoteExec ["Fnc_popup", 2];}];
		arBoard addAction ["<t color='#FF2222'>Lower Bunker Targets",{["reset",15,bnkTgts,false] remoteExec ["Fnc_popup", 2];}];
		grnBoard addAction ["<t color='#FF2222'>Raise Trench Targets",{["setup",15,grnTgts,false] remoteExec ["Fnc_popup", 2];}];
		grnBoard addAction ["<t color='#FF2222'>Lower Trench Targets",{["reset",15,grnTgts,false] remoteExec ["Fnc_popup", 2];}];
		bldBoard addAction ["<t color='#FF2222'>Raise House Targets",{["setup",15,hseTgts,false] remoteExec ["Fnc_popup", 2];}];
		bldBoard addAction ["<t color='#FF2222'>Lower House Targets",{["reset",15,hseTgts,false] remoteExec ["Fnc_popup", 2];}];
		grnPraBoard addAction ["<t color='#FF2222'>Raise Practice Targets",{["setup",3,grnPraTgts,false] remoteExec ["Fnc_popup", 2];}];
		grnPraBoard addAction ["<t color='#FF2222'>Lower Practice Targets",{["reset",3,grnPraTgts,false] remoteExec ["Fnc_popup", 2];}];
	};
};