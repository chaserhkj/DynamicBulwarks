/**
*  editMe
*
*  Defines all global config for the mission
*
*  Domain: Client, Server
**/

/* Attacker Waves */

// List_Bandits, List_ParaBandits, List_OPFOR, List_INDEP, List_NATO, List_Viper
HOSTILE_LEVEL_1 = List_Bandits;  // Wave 0 >
HOSTILE_LEVEL_2 = List_OPFOR;    // Wave 5 >
HOSTILE_LEVEL_3 = List_Viper;    // Wave 10 >

HOSTILE_MULTIPLIER = ("HOSTILE_MULTIPLIER" call BIS_fnc_getParamValue);  // How many hostiles per wave (waveCount x HOSTILE_MULTIPLIER)
HOSTILE_TEAM_MULTIPLIER = ("HOSTILE_TEAM_MULTIPLIER" call BIS_fnc_getParamValue) / 100;   // How many extra units are added per player
PISTOL_HOSTILES = ("PISTOL_HOSTILES" call BIS_fnc_getParamValue);  //What wave enemies stop only using pistols

// List_LocationMarkers, List_AllCities
BULWARK_LOCATIONS = List_CustomLoc;
BULWARK_RADIUS = ("BULWARK_RADIUS" call BIS_fnc_getParamValue);
BULWARK_MINSIZE = ("BULWARK_MINSIZE" call BIS_fnc_getParamValue);   // Spawn room must be bigger than x square metres
BULWARK_LANDRATIO = ("BULWARK_LANDRATIO" call BIS_fnc_getParamValue);
LOOT_HOUSE_DENSITY = ("LOOT_HOUSE_DENSITY" call BIS_fnc_getParamValue);

PLAYER_STARTWEAPON = if ("PLAYER_STARTWEAPON" call BIS_fnc_getParamValue == 1) then {true} else {false};
PLAYER_STARTMAP    = if ("PLAYER_STARTMAP" call BIS_fnc_getParamValue == 1) then {true} else {false};
PLAYER_STARTNVG    = if ("PLAYER_STARTNVG" call BIS_fnc_getParamValue == 1) then {true} else {false};

/* Loot Blacklist */
LOOT_BLACKLIST = [
    "example_item1",
    "example_item2",
    "example_item3"
];

/* Loot Spawn */
LOOT_WEAPON_POOL    = List_AllWeapons - LOOT_BLACKLIST;    // Classnames of Loot items as an array
LOOT_APPAREL_POOL   = List_AllClothes + List_Vests - LOOT_BLACKLIST;
LOOT_ITEM_POOL      = List_Optics + List_Items - LOOT_BLACKLIST;
LOOT_EXPLOSIVE_POOL = List_Mines - LOOT_BLACKLIST;
LOOT_STORAGE_POOL   = List_Backpacks - LOOT_BLACKLIST;

/* Random Loot */
LOOT_HOUSE_DISTRIBUTION = ("LOOT_HOUSE_DISTRIBUTION" call BIS_fnc_getParamValue);  // Every *th house will spwan loot.
LOOT_ROOM_DISTRIBUTION = ("LOOT_ROOM_DISTRIBUTION" call BIS_fnc_getParamValue);   // Every *th position, within that house will spawn loot.
LOOT_DISTRIBUTION_OFFSET = 0; // Offset the position by this number.
LOOT_SUPPLYDROP = ("LOOT_SUPPLYDROP" call BIS_fnc_getParamValue) / 100;        // Radius of supply drop
PARATROOP_COUNT = ("PARATROOP_COUNT" call BIS_fnc_getParamValue);
PARATROOP_CLASS = List_NATO;

/* Points */
SCORE_KILL = ("SCORE_KILL" call BIS_fnc_getParamValue);                 // Every kill
SCORE_HIT = ("SCORE_HIT" call BIS_fnc_getParamValue);                   // Every Bullet hit that doesn't result in a kill
SCORE_DAMAGE_BASE = ("SCORE_DAMAGE_BASE" call BIS_fnc_getParamValue);   // Extra points awarded for damage. 100% = SCORE_DAMAGE_BASE. 50% = SCORE_DAMAGE_BASE/2
SCORE_RANDOMBOX = 950;  // Cost to spin the box
SCORE_SPLIT_FACTOR = ("SCORE_SPLIT_FACTOR" call BIS_fnc_getParamValue) / 100;
SCORE_WAVE_REWARD = ("SCORE_WAVE_REWARD" call BIS_fnc_getParamValue);
SCORE_PRICE_FACTOR = ("SCORE_PRICE_FACTOR" call BIS_fnc_getParamValue) / 100;
BULWARK_SUPPORTITEMS = [
	[floor (SCORE_PRICE_FACTOR * 500),  "Fill Ammo",    "ammoFill"],
	[floor (SCORE_PRICE_FACTOR * 800),  "Medikit",       "medikit"],
    [floor (SCORE_PRICE_FACTOR * 800),  "Recon UAV",     "reconUAV"],
    [floor (SCORE_PRICE_FACTOR * 1950), "Paratroopers",  "paraDrop"],
    [floor (SCORE_PRICE_FACTOR * 5430), "Missle CAS",    "airStrike"],
    [floor (SCORE_PRICE_FACTOR * 5930), "Rage Stimpack", "ragePack"],
    [floor (SCORE_PRICE_FACTOR * 6666), "ARMAKART TM",   "armaKart"]
];

/* Price - Display Name - Class Name - Rotation When Held */
BULWARK_BUILDITEMS = [
    [floor (SCORE_PRICE_FACTOR * 50),   "Junk Barricade",       "Land_Barricade_01_4m_F",            0],
    [floor (SCORE_PRICE_FACTOR * 100),  "Short Sandbag Wall",   "Land_SandbagBarricade_01_half_F",   0],
    [floor (SCORE_PRICE_FACTOR * 150),  "Sandbag Barricade",    "Land_SandbagBarricade_01_hole_F",   0],
    [floor (SCORE_PRICE_FACTOR * 250),  "Tall Concrete Wall",   "Land_Mil_WallBig_4m_F",             0],
    [floor (SCORE_PRICE_FACTOR * 400),  "Ramp",                 "Land_VR_Slope_01_F",                0],
    [floor (SCORE_PRICE_FACTOR * 500),  "H Barrier",            "Land_HBarrier_3_F",                 0],
    [floor (SCORE_PRICE_FACTOR * 750),  "Ladder",               "Land_PierLadder_F",                 0],
    [floor (SCORE_PRICE_FACTOR * 800),  "Storage box small",    "Box_NATO_Support_F",                0],
    [floor (SCORE_PRICE_FACTOR * 1000), "Hallogen Lamp",        "Land_LampHalogen_F",              180],
    [floor (SCORE_PRICE_FACTOR * 1000), "Double H Barrier",     "Land_HBarrierWall4_F",              0],
    [floor (SCORE_PRICE_FACTOR * 2000), "Storage box large",    "Box_NATO_AmmoVeh_F",                0],
    [floor (SCORE_PRICE_FACTOR * 3000), "Machine Gun (raised)", "B_HMG_01_high_F",                   0],
	[floor (SCORE_PRICE_FACTOR * 4000), "GMG (raised)",			"B_GMG_01_high_F",                   0],
	[floor (SCORE_PRICE_FACTOR * 3500), "Static AT Launcher",   "B_static_AT_F",                     0],
    [floor (SCORE_PRICE_FACTOR * 3000), "Small Bunker",         "Land_BagBunker_Small_F",            0],
    [floor (SCORE_PRICE_FACTOR * 5000), "Guard Tower",          "Land_Cargo_Patrol_V3_F",          180]
];

/* Price - Display Name - Class Name */
BULWARK_MANPOWER = [
	[floor (SCORE_PRICE_FACTOR * 500),  "Crewman",               "B_crew_F"],
    [floor (SCORE_PRICE_FACTOR * 800),  "Rifleman",              "B_Soldier_F"],
	[floor (SCORE_PRICE_FACTOR * 800),  "Rifleman (AT)",         "B_soldier_LAT_F"],
	[floor (SCORE_PRICE_FACTOR * 800),  "Autorifleman",          "B_soldier_AR_F"],
	[floor (SCORE_PRICE_FACTOR * 800),  "Engineer",              "B_engineer_F"],
	[floor (SCORE_PRICE_FACTOR * 800),  "Sharpshooter",          "B_Sharpshooter_F"],
	[floor (SCORE_PRICE_FACTOR * 1000), "HeavyGunner",           "B_HeavyGunner_F"],
	[floor (SCORE_PRICE_FACTOR * 1000), "Repair Specialist",     "B_soldier_repair_F"],
	[floor (SCORE_PRICE_FACTOR * 1000), "Missile Specialist (AT)",     "B_soldier_AT_F"],
	[floor (SCORE_PRICE_FACTOR * 1000), "Sniper",                "B_sniper_F"]
];

/* Price - Display Name - Class Name */
BULWARK_VEHICLES = [
	[floor (SCORE_PRICE_FACTOR * 4000), "Hunter HMG",         "B_MRAP_01_hmg_F"],
	[floor (SCORE_PRICE_FACTOR * 4000), "Prowler AT",         "B_LSV_01_AT_F"],
	[floor (SCORE_PRICE_FACTOR * 7000), "IFV-6c Panther",     "B_APC_Tracked_01_rcws_F"],
	[floor (SCORE_PRICE_FACTOR * 7000), "Bobcat",		      "B_APC_Tracked_01_CRV_F"],
	[floor (SCORE_PRICE_FACTOR * 8000), "Rhino MGS",          "B_AFV_Wheeled_01_cannon_F"],
	[floor (SCORE_PRICE_FACTOR * 10000), "Rhino MGS UP",      "B_AFV_Wheeled_01_up_cannon_F"],
	[floor (SCORE_PRICE_FACTOR * 13000), "M2A1 Slammer",      "B_MBT_01_cannon_F"],
	[floor (SCORE_PRICE_FACTOR * 15000), "M2A1 Slammer UP",   "B_MBT_01_TUSK_F"],
	[floor (SCORE_PRICE_FACTOR * 20000), "Blackroot",   	  "B_Heli_Attack_01_dynamicLoadout_F"]
];

/* Time of Day*/
DAY_TIME_FROM = ("DAY_TIME_FROM" call BIS_fnc_getParamValue);
DAY_TIME_TO = ("DAY_TIME_TO" call BIS_fnc_getParamValue);

// Check for sneaky inverted configuration. FROM should always be before TO.
if (DAY_TIME_FROM > DAY_TIME_TO) then {
    DAY_TIME_FROM = DAY_TIME_TO - 2;
};

/* Starter MediKits */
BULWARK_MEDIKITS = ("BULWARK_MEDIKIT" call BIS_fnc_getParamValue);
