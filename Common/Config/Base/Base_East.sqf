_side = _this;

missionNamespace setVariable [format["CTI_%1_HQ", _side], "O_APC_Wheeled_02_rcws_F"];
missionNamespace setVariable [format["CTI_%1_Factories", _side], ["Barracks","Light","Heavy","Air"]];

missionNamespace setVariable [format["CTI_%1_Base_Template", _side], [
	[CTI_BARRACKS, 180, [-23,33]],
	[CTI_LIGHT, 180, [23,33]],
	[CTI_CONTROLCENTER, 0, [30,-40]],
	[CTI_HEAVY, 0, [-30,-40]],
	[CTI_AIR, 180, [-60,37]],
	[CTI_REPAIR, 180, [60,37]],
	[CTI_AMMO, 180, [80,37]]
]];

//--- Commander course of action ["Action", Parameter(s), Condition]
missionNamespace setVariable [format["CTI_%1_Commander_Path", _side], [
	["build-structures", CTI_BARRACKS, {true}],
	["build-structures", CTI_LIGHT, {true}],
	["build-structures", CTI_CONTROLCENTER, {true}],
	["upgrade", [CTI_UPGRADE_BARRACKS, 1], {true}],
	["upgrade", [CTI_UPGRADE_GEAR, 1], {true}],
	["upgrade", [CTI_UPGRADE_LIGHT, 1], {true}],
	["upgrade", [CTI_UPGRADE_TOWNS, 1], {true}],
	["upgrade", [CTI_UPGRADE_GEAR, 2], {true}],
	["build-structures", CTI_HEAVY, {true}],
	["build-structures", CTI_REPAIR, {true}],
	["build-structures", CTI_AMMO, {true}],
	["upgrade", [CTI_UPGRADE_HEAVY, 1], {true}],
	["upgrade", [CTI_UPGRADE_GEAR, 3], {true}],
	["build-structures", CTI_AIR, {true}],
	["upgrade", [CTI_UPGRADE_TOWNS, 2], {true}],
	["upgrade", [CTI_UPGRADE_AIR, 1], {true}],
	["upgrade", [CTI_UPGRADE_AIR_CM, 1], {true}],
	["upgrade", [CTI_UPGRADE_AIR_AT, 1], {true}],
	["upgrade", [CTI_UPGRADE_AIR_FFAR, 1], {true}],
	["upgrade", [CTI_UPGRADE_AIR_AA, 1], {true}],
	["upgrade", [CTI_UPGRADE_TOWNS, 3], {true}],
	["upgrade", [CTI_UPGRADE_SATELLITE, 1], {true}]
]];

//--- Structures
_headers = [];
_classes = [];
_prices = [];
_times = [];
_placements = [];
_specials = [];

/*
	Specials:
		- DMG_Alternative: Need to be used in case of bisterious buildings usage
				If a building is damaged, all the EH it had will bisteriously vanish... This "feature" will probably never get fixed so once again, we fix it ourself!
		- DMG_Reduce: Reduce the incoming damage on a building making it stronger if above 1.
*/
_headers = _headers 		+ [[CTI_BARRACKS, "Barracks", "Barracks"]];
_classes = _classes 		+ [["Land_Cargo_House_V1_F", "Land_Cargo_House_V1_ruins_F"]];
_prices = _prices 			+ [1000];
_times = _times 			+ [60];
_placements = _placements 	+ [[180, 15]];
_specials = _specials		+ [[["DMG_Reduce", 5]]];

_headers = _headers 		+ [[CTI_LIGHT, "Light Vehicle Factory", "Light"]];
_classes = _classes 		+ [["Land_i_Garage_V1_F", "Land_Garage_V1_ruins_F"]];
_prices = _prices 			+ [2000];
_times = _times 			+ [80];
_placements = _placements 	+ [[90, 20]];
_specials = _specials		+ [[["DMG_Alternative"], ["DMG_Reduce", 6]]];

_headers = _headers 		+ [[CTI_CONTROLCENTER, "Control Center", "CC"]];
_classes = _classes 		+ [["Land_i_House_Small_03_V1_F", "Land_House_Small_03_V1_ruins_F", ["Land_i_House_Small_03_V1_dam_F"]]];
_prices = _prices 			+ [3000];
_times = _times 			+ [90];
_placements = _placements 	+ [[180, 20]];
_specials = _specials		+ [[["DMG_Alternative"], ["DMG_Reduce", 72],["Connected"]]];

_headers = _headers 		+ [[CTI_HEAVY, "Heavy Vehicle Factory", "Heavy"]];
_classes = _classes 		+ [["Land_Cargo_HQ_V1_F", "Land_Cargo_HQ_V1_ruins_F"]];
_prices = _prices 			+ [3500];
_times = _times 			+ [120];
_placements = _placements 	+ [[90, 20]];
_specials = _specials		+ [[["DMG_Reduce", 7]]];

_headers = _headers 		+ [[CTI_AIR, "Aircraft Factory", "Air"]];
_classes = _classes 		+ [["Land_Radar_Small_F", "Land_Radar_Small_ruins_F"]];
_prices = _prices 			+ [8000];
_times = _times 			+ [140];
_placements = _placements 	+ [[90, 20]];
_specials = _specials		+ [[["DMG_Alternative"], ["DMG_Reduce", 12]]];

_headers = _headers 		+ [[CTI_AMMO, "Ammo Depot", "Ammo"]];
_classes = _classes 		+ [["Land_TBox_F", "Land_TBox_ruins_F"]];
_prices = _prices 			+ [500];
_times = _times 			+ [40];
_placements = _placements 	+ [[0, 20]];
_specials = _specials		+ [[["DMG_Alternative"], ["DMG_Reduce", 12]]];

_headers = _headers 		+ [[CTI_REPAIR, "Repair Depot", "Repair"]];
_classes = _classes 		+ [["Land_FuelStation_Build_F", "Land_FuelStation_Build_ruins_F"]];
_prices = _prices 			+ [600];
_times = _times 			+ [35];
_placements = _placements 	+ [[180, 20]];
_specials = _specials		+ [[["DMG_Alternative"], ["DMG_Reduce", 78]]];

_headers = _headers 		+ [[CTI_NAVAL, "Naval Yard", "Naval"]];
_classes = _classes 		+ [["Land_Lighthouse_small_F", "Land_Lighthouse_small_ruins_F"]];
_prices = _prices 			+ [1500];
_times = _times 			+ [35];
_placements = _placements 	+ [[180, 25]];
_specials = _specials		+ [[["DMG_Alternative"], ["DMG_Reduce", 8]]];

_headers = _headers 		+[[CTI_RADAR, "Air Radar", "Air Radar"]];
_classes =  _classes 		+[["Land_TTowerBig_1_F", "Land_TTowerBig_1_ruins_F"]];
_prices =  _prices 			+[8000];
_times =  _times 			+[120];
_placements =_placements 	+  [[180, 30]];
_specials = _specials		+ [[["DMG_Reduce", 1]]];

[_side, _headers, _classes, _prices, _times, _placements, _specials] call compile preprocessFileLineNumbers "Common\Config\Base\Set_Structures.sqf";

//--- Defenses
_headers = [];
_classes = [];
_prices = [];
_placements = [];
_categories = [];

_headers = _headers 		+ ["Lamp"];
_classes = _classes 		+ ["Land_LampHalogen_F"];
_prices = _prices 			+ [5];
_placements = _placements 	+ [[90, 15]];
_categories = _categories 	+ ["Fortification"];

_headers = _headers 		+ ["Empty Crate"];
_classes = _classes 		+ ["O_supplyCrate_F"];
_prices = _prices 			+ [5];
_placements = _placements 	+ [[0, 2]];
_categories = _categories 	+ ["Fortification"];


_headers = _headers 		+ ["Bunker (Small)"];
_classes = _classes 		+ ["Land_BagBunker_Small_F"];
_prices = _prices 			+ [15];
_placements = _placements 	+ [[0, 7]];
_categories = _categories 	+ ["Fortification"];

_headers = _headers 		+ ["Dome (Small)"];
_classes = _classes 		+ ["Land_Dome_Small_F"];
_prices = _prices 			+ [1500];
_placements = _placements 	+ [[0, 30]];
_categories = _categories 	+ ["Fortification"];

_headers = _headers 		+ ["Dome (Big)"];
_classes = _classes 		+ ["Land_Dome_Big_F"];
_prices = _prices 			+ [6000];
_placements = _placements 	+ [[0, 50]];
_categories = _categories 	+ ["Fortification"];

_headers = _headers 		+ ["Tower"];
_classes = _classes 		+ ["Land_Cargo_Patrol_V1_F"];
_prices = _prices 			+ [50];
_placements = _placements 	+ [[0, 15]];
_categories = _categories 	+ ["Fortification"];

_headers = _headers 		+ [["Shed (Roof)",[["RuinOnDestroyed", "Land_Shed_Big_ruins_F"], ["DMG_Reduce", 8]]]];
_classes = _classes 		+ ["Land_Shed_Big_F"];
_prices = _prices 			+ [40];
_placements = _placements 	+ [[0, 15]];
_categories = _categories 	+ ["Fortification"];

_headers = _headers 		+ [["Cargo Tower (big)",[["RuinOnDestroyed", "Land_Cargo_Tower_V1_ruins_F"], ["DMG_Reduce", 8]]]];
_classes = _classes 		+ ["Land_Cargo_Tower_V1_F"];
_prices = _prices 			+ [5000];
_placements = _placements 	+ [[0, 30]];
_categories = _categories 	+ ["Fortification"];

_headers = _headers 		+ [["Fence",[["CanAutoAlign", 7.5, 0]]]];
_classes = _classes 		+ ["Land_Mil_WiredFence_F"];
_prices = _prices 			+ [5];
_placements = _placements 	+ [[0, 7]];
_categories = _categories 	+ ["Fortification"];

_headers = _headers 		+ [["High Wall (Mil)",[["CanAutoAlign", 3.8, 0]]]];
_classes = _classes 		+ ["Land_Mil_WallBig_4m_F"];
_prices = _prices 			+ [20];
_placements = _placements 	+ [[0, 7]];
_categories = _categories 	+ ["Fortification"];

_headers = _headers 		+ [["High Wall (Concrete)",[["CanAutoAlign", 4.6, 0]]]];
_classes = _classes 		+ ["Land_CncWall4_F"];
_prices = _prices 			+ [20];
_placements = _placements 	+ [[0, 7]];
_categories = _categories 	+ ["Fortification"];

_headers = _headers 		+ ["Concrete Ramp"];
_classes = _classes 		+ ["Land_RampConcreteHigh_F"];
_prices = _prices 			+ [20];
_placements = _placements 	+ [[0, 7]];
_categories = _categories 	+ ["Fortification"];



_headers = _headers 		+ ["H-Barrier (Medium)"];
_classes = _classes 		+ ["Land_HBarrier_5_F"];
_prices = _prices 			+ [20];
_placements = _placements 	+ [[0, 7]];
_categories = _categories 	+ ["Fortification"];


_headers = _headers 		+ [["H-Barrier (Big)",[["CanAutoAlign", 6, 0]]]];
_classes = _classes 		+ ["Land_HBarrierBig_F"];
_prices = _prices 			+ [20];
_placements = _placements 	+ [[0, 7]];
_categories = _categories 	+ ["Fortification"];

_headers = _headers 		+ ["H-Barrier Wall (6)"];
_classes = _classes 		+ ["Land_HBarrierWall6_F"];
_prices = _prices 			+ [40];
_placements = _placements 	+ [[180, 7]];
_categories = _categories 	+ ["Fortification"];

_headers = _headers 		+ ["H-Barrier Coridor"];
_classes = _classes 		+ ["Land_HBarrierWall_corridor_F"];
_prices = _prices 			+ [20];
_placements = _placements 	+ [[90, 7]];
_categories = _categories 	+ ["Fortification"];

_headers = _headers 		+ ["H-Barrier Tower"];
_classes = _classes 		+ ["Land_HBarrierTower_F"];
_prices = _prices 			+ [40];
_placements = _placements 	+ [[0, 7]];

_categories = _categories 	+ ["Fortification"];

_headers = _headers 		+ [["FOB",[["RuinOnDestroyed", "Land_Medevac_house_V1_ruins_F"], ["FOB"],["Condition", {_cpt = if (isNil {CTI_P_SideLogic getVariable "cti_fobs"}) then {1000} else {count (CTI_P_SideLogic getVariable "cti_fobs")}; (_cpt < CTI_BASE_FOB_MAX) && (call CTI_CL_FNC_IsPlayerCommander || (!(call CTI_CL_FNC_IsPlayerCommander) && CTI_P_TeamsRequests_FOB > 0) || ( missionNamespace getVariable 'CTI_BASE_FOB_PERMISSION' ) == 0 )}]]]];
_classes = _classes 		+ ["Land_Medevac_house_V1_F"];
_prices = _prices 			+ [3000];
_placements = _placements 	+ [[180, 15]];
_categories = _categories 	+ ["Fortification"];

_headers = _headers 		+ ["MG Defense"];
_classes = _classes 		+ ["O_HMG_01_High_F"];
_prices = _prices 			+ [200];
_placements = _placements 	+ [[180, 15]];
_categories = _categories 	+ ["Defense"];

_headers = _headers 		+ ["GL Defense"];
_classes = _classes 		+ ["O_GMG_01_high_F"];
_prices = _prices 			+ [350];
_placements = _placements 	+ [[180, 15]];
_categories = _categories 	+ ["Defense"];

_headers = _headers 		+ ["AT Defense"];
_classes = _classes 		+ ["O_static_AT_F"];
_prices = _prices 			+ [900];
_placements = _placements 	+ [[180, 15]];
_categories = _categories 	+ ["Defense"];

_headers = _headers 		+ ["AA Defense"];
_classes = _classes 		+ ["O_static_AA_F"];
_prices = _prices 			+ [800];
_placements = _placements 	+ [[180, 15]];
_categories = _categories 	+ ["Defense"];
if !(MADE_FOR_STRATIS) then {
_headers = _headers 		+ ["Mortar"];
_classes = _classes 		+ ["O_Mortar_01_F"];
_prices = _prices 			+ [1000];
_placements = _placements 	+ [[180, 15]];
_categories = _categories 	+ ["Defense"];
};

_headers = _headers 		+ ["Camo net"];
_classes = _classes 		+ ["CamoNet_OPFOR_F"];
_prices = _prices 			+ [50];
_placements = _placements 	+ [[0, 15]];
_categories = _categories 	+ ["Fortification"];

_headers = _headers 		+ ["Camo net open"];
_classes = _classes 		+ ["CamoNet_OPFOR_open_F"];
_prices = _prices 			+ [50];
_placements = _placements 	+ [[0, 15]];
_categories = _categories 	+ ["Fortification"];

_headers = _headers 		+ ["Camo net vehicle"];
_classes = _classes 		+ ["CamoNet_OPFOR_big_F"];
_prices = _prices 			+ [50];
_placements = _placements 	+ [[0, 15]];
_categories = _categories 	+ ["Fortification"];


[_side, _headers, _classes, _prices, _placements, _categories] call compile preprocessFileLineNumbers "Common\Config\Base\Set_Defenses.sqf";
