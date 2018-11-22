//AUTHOR: Pax'Jarome Malues
//OFWvUsed: 3.3.3

#define package "uotc_loadout_west_"

SET_GROUP(ifak_all)
	["ACE_fieldDressing",3,"uniform"] call FNC_AddItem;
	["ACE_elasticBandage",3,"uniform"] call FNC_AddItem;
	["ACE_packingBandage",3,"uniform"] call FNC_AddItem;
	["ACE_quikclot",3,"uniform"] call FNC_AddItem;
	["ACE_morphine",1,"uniform"] call FNC_AddItem;
	["ACE_epinephrine",1,"uniform"] call FNC_AddItem;
	["ACE_tourniquet",2,"uniform"] call FNC_AddItem;
END_GROUP;

SET_GROUP(uniforms)
	["rhs_uniform_cu_ocp"] call FNC_AddItem; //Uniform
	["rhsusf_iotv_ocp_Squadleader"] call FNC_AddItem; //Vest
	["rhsusf_assault_eagleaiii_coy"] call FNC_AddItem; //BackPack
	["tin_helmet_uotc_beret"] call FNC_AddItem; //HeadGear
END_GROUP;

SET_GROUP(uniforms_pt)
	["rhs_uniform_cu_ocp"] call FNC_AddItem; //Uniform
	["rhsusf_assault_eagleaiii_coy"] call FNC_AddItem; //BackPack
	["rhsusf_ach_helmet_headset_ocp"] call FNC_AddItem; //Head
END_GROUP;

SET_GROUP(items_all)
	["ItemMap"] call FNC_AddItem;
	["ItemCompass"] call FNC_AddItem;
	["ItemWatch"] call FNC_AddItem;
	["ACE_MapTools", 1, "vest"] call FNC_AddItem;
	["ACE_earplugs"] call FNC_AddItem;
	["ACE_CableTie"] call FNC_AddItem;
END_GROUP;

SET_GROUP(radios)
	["ACRE_PRC343",1,"vest"] call FNC_AddItem;
	["ACRE_PRC152",1,"vest"] call FNC_AddItem;
END_GROUP;

SET_GROUP(radios_pt)
	["ACRE_PRC343",1,"vest"] call FNC_AddItem;
END_GROUP;

SET_GROUP(sidearm_all)
	["rhsusf_weap_m9"] call FNC_AddItem;
	["rhsusf_mag_15Rnd_9x19_JHP",3] call FNC_AddItem;
END_GROUP;

SET_GROUP(primary)
	["rhs_weap_m4a1_blockII"] call FNC_AddItem;
	["rhsusf_acc_SF3P556"] call FNC_AddItem;
	["rhsusf_acc_M952V"] call FNC_AddItem;
	["rhsusf_acc_ACOG3"] call FNC_AddItem;
	["rhs_mag_30Rnd_556x45_M855A1_Stanag",10] call FNC_AddItem;
	["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",4] call FNC_AddItem;
END_GROUP;

//////////////
//CASES SPAWN
//////////////

case (package + "TI"): {
	
	ADD_GROUP(uniforms);
	ADD_GROUP(ifak_all);
	
	["ACE_microDAGR",1, "uniform"] call FNC_AddItem;
	["ACE_personalAidKit",6, "vest"] call FNC_AddItem;
	
	ADD_GROUP(items_all);
	ADD_GROUP(radios);
	
	["Rangefinder"] call FNC_AddItem;
	
	ADD_GROUP(sidearm_all);
	ADD_GROUP(primary);
	
};

case (package + "FTL"): {
	
	ADD_GROUP(uniforms_pt);
	["rhsusf_spcs_ocp_teamleader"] call FNC_AddItem; //Vest
	
	ADD_GROUP(ifak_all);
	ADD_GROUP(items_all);
	ADD_GROUP(radios_pt);
	
	["Binocular", 1] call FNC_AddItem;
	
	ADD_GROUP(sidearm_all);
	
	["rhs_weap_m4a1_blockII"] call FNC_AddItem; //Primary rifle
	["rhsusf_acc_ACOG_3d"] call FNC_AddItem; //Red dot sight
	["rhsusf_acc_SFMB556"] call FNC_AddItem;
	["rhsusf_acc_anpeq16a_light"] call FNC_AddItem;
	["rhsusf_acc_harris_bipod"] call FNC_AddItem;
	["rhs_mag_30Rnd_556x45_M855A1_Stanag",10] call FNC_AddItem; //Magazines
	["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",4] call FNC_AddItem; //Tracer magazines
	
};

case (package + "AR"): {
	
	ADD_GROUP(uniforms_pt);
	["rhsusf_spcs_ocp_saw"] call FNC_AddItem; //Vest
	
	ADD_GROUP(ifak_all);
	ADD_GROUP(items_all);
	ADD_GROUP(radios_pt);
	ADD_GROUP(sidearm_all);
	
	["rhs_weap_m249_pip_S_para"] call FNC_AddItem; //Primary rifle
	["rhsusf_acc_ELCAN"] call FNC_AddItem; //Red dot sight
	["ACE_muzzle_mzls_L"] call FNC_AddItem;
	["rhsusf_acc_M952V"] call FNC_AddItem;
	["rhsusf_200Rnd_556x45_mixed_soft_pouch",5] call FNC_AddItem; //Magazines
	
};

case (package + "GRN"): {
	
	ADD_GROUP(uniforms_pt);
	["rhsusf_spcs_ocp_grenadier"] call FNC_AddItem; //Vest
	
	ADD_GROUP(ifak_all);
	ADD_GROUP(items_all);
	ADD_GROUP(radios_pt);
	ADD_GROUP(sidearm_all);
	
	["rhs_weap_m4a1_m320"] call FNC_AddItem; //Primary rifle
	["rhsusf_acc_compm4"] call FNC_AddItem; //Red dot sight
	["rhsusf_acc_SFMB556"] call FNC_AddItem;
	["rhsusf_acc_anpeq16a_light"] call FNC_AddItem;
	["rhs_mag_30Rnd_556x45_M855A1_Stanag", 8] call FNC_AddItem; //Magazines
	["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", 2] call FNC_AddItem; //Tracer magazines
	["rhs_mag_M433_HEDP",6] call FNC_AddItem;
	["rhs_mag_m713_Red",2] call FNC_AddItem;
	["rhs_mag_m714_White",2] call FNC_AddItem;
	["rhs_mag_m715_Green",2] call FNC_AddItem;
	["rhs_mag_m716_yellow",2] call FNC_AddItem;
	["rhs_mag_M441_HE",6] call FNC_AddItem;
	["rhs_mag_M397_HET",2] call FNC_AddItem;
	
};

case (package + "RMAT"): {
	
	ADD_GROUP(uniforms_pt);
	["rhsusf_spcs_ocp_rifleman"] call FNC_AddItem; //Vest
	
	ADD_GROUP(ifak_all);
	ADD_GROUP(items_all);
	ADD_GROUP(radios_pt);
	ADD_GROUP(sidearm_all);
	
	["rhs_weap_m72a7"] call FNC_AddItem;
	["rhs_m72a7_mag",1,"vest"] call FNC_AddItem;
	
	["rhs_weap_m4a1_mstock_grip"] call FNC_AddItem; //Primary rifle
	["rhsusf_acc_compm4"] call FNC_AddItem; //Red dot sight
	["rhsusf_acc_SFMB556"] call FNC_AddItem;
	["rhsusf_acc_anpeq16a_light"] call FNC_AddItem;
	["rhsusf_acc_grip1"] call FNC_AddItem;
	["rhs_mag_30Rnd_556x45_M855A1_Stanag",8] call FNC_AddItem; //Magazines
	["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2] call FNC_AddItem; //Tracer magazines
	["rhs_mag_M433_HEDP",2,"backpack"] call FNC_AddItem;
	["rhs_mag_M441_HE",2,"backpack"] call FNC_AddItem;
	["rhsusf_200Rnd_556x45_mixed_soft_pouch",1,"backpack"] call FNC_AddItem;

};