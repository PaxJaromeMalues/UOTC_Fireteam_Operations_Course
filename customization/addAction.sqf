//Fnc_popup = compile preprocessFileLineNumbers "customization\popups.sqf";
/*if (!isDedicated) then {
	waitUntil { (player == player) };
	if (player getVariable "isInstructor") then {
		conrepboard addAction ["<t color='#FF2222'>Reveal Arrows",{"reveal" execVM "customization\arrows.sqf";}];
		conrepboard addAction ["<t color='#FF2222'>Hide Arrows",{"hide" execVM "customization\arrows.sqf";}];
		arBoard addAction ["<t color='#FF2222'>Raise Bunker Targets",{[true,"setup",15,bnkTgts] remoteExec ["Fnc_popup", 2];}];
		arBoard addAction ["<t color='#FF2222'>Lower Bunker Targets",{[false,"reset",15,bnkTgts] remoteExec ["Fnc_popup", 2];}];
		grnBoard addAction ["<t color='#FF2222'>Raise Trench Targets",{[false,"setup",15,grnTgts] remoteExec ["Fnc_popup", 2];}];
		grnBoard addAction ["<t color='#FF2222'>Lower Trench Targets",{[false,"reset",15,grnTgts] remoteExec ["Fnc_popup", 2];}];
		bldBoard addAction ["<t color='#FF2222'>Raise House Targets",{[false,"setup",15,hseTgts] remoteExec ["Fnc_popup", 2];}];
		bldBoard addAction ["<t color='#FF2222'>Lower House Targets",{[false,"reset",15,hseTgts] remoteExec ["Fnc_popup", 2];}];
		grnPraBoard addAction ["<t color='#FF2222'>Raise Practice Targets",{[false,"setup",3,grnPraTgts] remoteExec ["Fnc_popup", 2];}];
		grnPraBoard addAction ["<t color='#FF2222'>Lower Practice Targets",{[false,"reset",3,grnPraTgts] remoteExec ["Fnc_popup", 2];}];
	};
};
*/
if (!isDedicated) then {
//	params ["_player"];
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