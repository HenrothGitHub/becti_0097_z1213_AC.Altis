// Categories of weapon types
CTI_WEAP_ARRAY_LIST=[ "ATGM" , "A2AM" , "ROCKETS" , "BOMBS" ];

CTI_WEAP_ATGM_INDEX=0;
CTI_WEAP_A2AM_INDEX=1;
CTI_WEAP_ROCKETS_INDEX=2;
CTI_WEAP_BOMBS_INDEX=3;

// Buy menu Icon IDC's
CTI_WEAP_ATGM_IDC=110110;
CTI_WEAP_A2AM_IDC=110111;
CTI_WEAP_ROCKETS_IDC=110112;
CTI_WEAP_BOMBS_IDC=110113;

// Buy lock icon IDC's
CTI_WEAP_ATGM_RESEARCH_LOCKED_IDC=110210;
CTI_WEAP_A2AM_RESEARCH_LOCKED_IDC=110211;
CTI_WEAP_ROCKETS_RESEARCH_LOCKED_IDC=110212;
CTI_WEAP_BOMBS_RESEARCH_LOCKED_IDC=110213;


// Cost scaling values
CTI_WEAP_ATGM_COSTSCALE = 2.5;
CTI_WEAP_A2AM_COSTSCALE = 0.85;
CTI_WEAP_ROCKETS_COSTSCALE = 0.35;
CTI_WEAP_BOMBS_COSTSCALE = 1.25;

// Magazine types for each weapon category
CTI_ATGM_BASED_MAGAZINES = [ "6Rnd_Missile_AGM_02_F" , "24Rnd_PG_missiles" , "12Rnd_PG_missiles" , "8Rnd_LG_scalpel" , "4Rnd_Missile_AGM_01_F" , "6Rnd_LG_scalpel" ];
CTI_A2AM_BASED_MAGAZINES = [ "2Rnd_Missile_AA_03_F" , "4Rnd_AAA_missiles" , "2Rnd_Missile_AA_04_F" ];
CTI_ROCKETS_BASED_MAGAZINES = [ "7Rnd_Rocket_04_HE_F" , "7Rnd_Rocket_04_AP_F" , "38Rnd_80mm_rockets" , "20Rnd_Rocket_03_HE_F" , "20Rnd_Rocket_03_AP_F" ,"24Rnd_missiles" ];
CTI_BOMBS_BASED_MAGAZINES = [ "4Rnd_Bomb_04_F" , "2Rnd_Bomb_03_F" , "2Rnd_GBU12_LGB" ];


// Code for revamped version of aircraft


// ***************************
// BLUFOR - Vehicle loadout options
// ***************************


// ***************************
// Plane - Wipeout
// ***************************
CTI_LOADOUT_B_Plane_CAS_01_F_MNT_OPTIONS = 
[
	"Standard - Configuration" ,
	[	
		[ 
			"Gatling_30mm_Plane_CAS_01_F" , 
			[ 
				[ "1000Rnd_Gatling_30mm_Plane_CAS_01_F" , "2000" ]
			] ,
			"gatling_25mm" , 
			[ 
				[ "1000Rnd_25mm_shells" , "1500" ] ,
				[ "300Rnd_25mm_shells" , "500" ]
			] 
		],
		[ 
			"Missile_AA_04_Plane_CAS_01_F" ,
			[ 
				[ "2Rnd_Missile_AA_04_F" , "4000" ]
			] 
		] ,
		[ 
			"Missile_AGM_02_Plane_CAS_01_F" , 
			[ 
				[ "6Rnd_Missile_AGM_02_F" , "30000" ]
			] 
		] ,
		[ "Bomb_04_Plane_CAS_01_F" , 
			[ 
				[ "4Rnd_Bomb_04_F" , "6000" ]
			] 
		],
		[ 
			"Rocket_04_HE_Plane_CAS_01_F" , 
			[ 
				[ "7Rnd_Rocket_04_HE_F" , "2500" ]
			] 
		] ,
		[ 
			"Rocket_04_AP_Plane_CAS_01_F" , 
			[ 
				[ "7Rnd_Rocket_04_AP_F" , "2500" ]
			] 
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	],
	"Air Interceptor - Mix 1" ,
	[
		[ 
			"Gatling_30mm_Plane_CAS_01_F" , 
			[ 
				[ "1000Rnd_Gatling_30mm_Plane_CAS_01_F" , "2000" ]
			] ,
			"gatling_25mm" , 
			[ 
				[ "1000Rnd_25mm_shells" , "1500" ] ,
				[ "300Rnd_25mm_shells" , "500" ]
			] 
		],
		[ "GBU12BombLauncher" ,
			[ 
				[ "2Rnd_GBU12_LGB" , "4000" ]
			] 
		] ,
		[ "missiles_SCALPEL" , 
			[ 
				[ "6Rnd_LG_scalpel" , "30000" ]
			] 
		] ,
		[ "missiles_Zephyr" , 
			[ 
				[ "4Rnd_GAA_missiles" , "8000" ]
			] 
		] ,
		[ "Rocket_04_HE_Plane_CAS_01_F" , 
			[ 
				[ "7Rnd_Rocket_04_HE_F" , "2500" ]
			] 
		] ,
		[ "Rocket_04_AP_Plane_CAS_01_F" , 
			[ 
				[ "7Rnd_Rocket_04_AP_F" , "2500" ]
			] 
		],
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	]
];

// ***************************
// Plane - UAV (CAS)
// ***************************
CTI_LOADOUT_B_UAV_02_CAS_F_MNT_OPTIONS = 
[
	"Anti Tank - Configurations" ,
	[	
		[ 
			"missiles_SCALPEL" , 
			[ 
				[ "2Rnd_LG_scalpel" , "10000" ]
			]
		] ,
		[ "Laserdesignator_mounted" , 
			[
				[ "Laserbatteries" , "500" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	] ,
	"Anti Air - Configurations" ,
	[	
		[ 
			"Missile_AA_04_Plane_CAS_01_F" , 
			[ 
				[ "2Rnd_Missile_AA_04_F" , "4000" ]
			] ,
			"Missile_AA_03_Plane_CAS_02_F" , 
			[ 
				[ "2Rnd_Missile_AA_03_F" , "4000" ]
			] ,
			"missiles_ASRAAM" , 
			[ 
				[ "2Rnd_AAA_missiles" , "4000" ]
			]
		] ,
		[ "Laserdesignator_mounted" , 
			[
				[ "Laserbatteries" , "500" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	] ,
	"Anti Ground - Configurations" ,
	[	
		[ 
			"Mk82BombLauncher" , 
			[ 
				[ "2Rnd_Mk82" , "3000" ]
			] ,	
			"GBU12BombLauncher" , 
			[ 
				[ "2Rnd_GBU12_LGB" , "4000" ]
			]
		] ,
		[ "Laserdesignator_mounted" , 
			[
				[ "Laserbatteries" , "500" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	]
];



// ***************************
// Plane - UAV
// ***************************
CTI_LOADOUT_B_UAV_02_F_MNT_OPTIONS = 
[
	"Anti Tank - Configurations" ,
	[	
		[ 
			"missiles_SCALPEL" , 
			[ 
				[ "2Rnd_LG_scalpel" , "10000" ]
			]
		] ,
		[ "Laserdesignator_mounted" , 
			[
				[ "Laserbatteries" , "500" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	] ,
	"Anti Air - Configurations" ,
	[	
		[ 
			"Missile_AA_04_Plane_CAS_01_F" , 
			[ 
				[ "2Rnd_Missile_AA_04_F" , "4000" ]
			] ,
			"Missile_AA_03_Plane_CAS_02_F" , 
			[ 
				[ "2Rnd_Missile_AA_03_F" , "4000" ]
			] ,
			"missiles_ASRAAM" , 
			[ 
				[ "2Rnd_AAA_missiles" , "4000" ]
			]
		] ,
		[ "Laserdesignator_mounted" , 
			[
				[ "Laserbatteries" , "500" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	] ,
	"Anti Ground - Configurations" ,
	[	
		[ 
			// Doesn't work
			// "Bomb_03_Plane_CAS_02_F" , 
			// [ 
				// [ "2Rnd_Bomb_03_F" , "3000" ]
			// ] ,
			"Mk82BombLauncher" , 
			[ 
				[ "2Rnd_Mk82" , "3000" ]
			] ,	
			"GBU12BombLauncher" , 
			[ 
				[ "2Rnd_GBU12_LGB" , "4000" ]
			]
		] ,
		[ "Laserdesignator_mounted" , 
			[
				[ "Laserbatteries" , "500" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	]
];


// ***************************
// Heli - Littlebird
// ***************************

CTI_LOADOUT_B_Heli_Light_01_F_MNT_OPTIONS = 
[
	"Standard - configuration" ,
	[
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	]
];

// ***************************
// Heli - Pawnee
// ***************************

CTI_LOADOUT_B_Heli_Light_01_armed_F_MNT_OPTIONS = 
[
	"Standard - configuration" ,
	[	
		[ "M134_minigun" , 
			[ 
				[ "5000Rnd_762x51_Belt" , "350" ]
			]
		] ,
		[ "missiles_DAR" , 
			[
				[ "24Rnd_missiles" , "3000" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	]
];

// ***************************
// Heli - Blackhawk
// ***************************
CTI_LOADOUT_B_Heli_Transport_01_F_MNT_OPTIONS = 
[
	"Standard - configuration" ,
	[	
		// [ "LMG_Minigun" , 
			// [ 
				// [ "2000Rnd_65x39_Belt_Tracer_Red" , "500" , [1] ]
			// ]
		// ] ,		
		[ "LMG_Minigun2" , 
			[ 
				[ "2000Rnd_65x39_Belt_Tracer_Red" , "600" , [2] ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" , [-1] ] ,
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" , [-1] ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" , [-1] ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" , [-1] ]
			]
		]
	]
];

// ***************************
// Heli - Blackfoot
// ***************************
CTI_LOADOUT_B_Heli_Attack_01_F_MNT_OPTIONS = 
[
	"Standard - configuration" ,
	[	
		[ "gatling_20mm" , 
			[ 
				[ "1000Rnd_20mm_shells" , "1500" ]
			]
		] ,		
		[ "missiles_ASRAAM" , 
			[ 
				[ "4Rnd_AAA_missiles" , "8000" ]
			]
		] ,
		[ "missiles_DAGR" , 
			[ 
				[ "24Rnd_PG_missiles" , "20000" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" , [-1] ] ,
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" , [-1] ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" , [-1] ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" , [-1] ]
			]
		]
	]
];

// ***************************
// OPFOR ( east ) - Vehicle loadout options
// ***************************

// ***************************
// Heli - Orac unarmed
// ***************************

CTI_LOADOUT_O_Heli_Light_02_unarmed_F_MNT_OPTIONS = 
[
	"Standard - configuration" ,
	[
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	]
];

// ***************************
// Heli - Orca armed
// ***************************

CTI_LOADOUT_O_Heli_Light_02_F_MNT_OPTIONS = 
[
	"Standard - configuration" ,
	[	
		[ "LMG_Minigun_heli" , 
			[ 
				[ "2000Rnd_65x39_Belt_Tracer_Green" , "500" ]
			]
		] ,
		[ "missiles_DAGR" , 
			[
				[ "12Rnd_PG_missiles" , "10000" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	]
];


// ***************************
// Heli - Kajman ( Camo )
// ***************************

CTI_LOADOUT_O_Heli_Attack_02_F_MNT_OPTIONS = 
[
	"Standard - configuration" ,
	[	
		[ "gatling_30mm" , 
			[ 
				[ "250Rnd_30mm_APDS_shells" , "500" ]
			]
		] ,		
		[ "gatling_30mm" , 
			[ 
				[ "250Rnd_30mm_HE_shells" , "750" ]
			]
		] ,		
		[ "missiles_SCALPEL" , 
			[ 
				[ "8Rnd_LG_scalpel" , "30000" ]
			]
		] ,
		[ "rockets_Skyfire" , 
			[ 
				[ "38Rnd_80mm_rockets" , "3000" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" , [-1] ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" , [-1] ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" , [-1] ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" , [-1] ]
			]
		]
	]
];

// ***************************
// Heli - Kajman ( Black )
// ***************************

CTI_LOADOUT_O_Heli_Attack_02_black_F_MNT_OPTIONS = 
[
	"Standard - configuration" ,
	[	
		[ "gatling_30mm" , 
			[ 
				[ "250Rnd_30mm_APDS_shells" , "500" ]
			]
		] ,
		[ "gatling_30mm" , 
			[ 
				[ "250Rnd_30mm_HE_shells" , "750" ]
			]
		] ,			
		[ "missiles_SCALPEL" , 
			[ 
				[ "8Rnd_LG_scalpel" , "30000" ]
			]
		] ,
		[ "rockets_Skyfire" , 
			[ 
				[ "38Rnd_80mm_rockets" , "3000" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" , [-1] ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" , [-1] ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" , [-1] ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" , [-1] ]
			]
		]
	]
];

// ***************************
// Plane - Typhoon
// ***************************

CTI_LOADOUT_O_Plane_CAS_02_F_MNT_OPTIONS = 
[
	"Standard - configuration" ,
	[	
		[ "Cannon_30mm_Plane_CAS_02_F" , 
			[ 
				[ "500Rnd_Cannon_30mm_Plane_CAS_02_F" , "1000" ]
			]
		] ,		
		[ "Missile_AA_03_Plane_CAS_02_F" , 
			[ 
				[ "2Rnd_Missile_AA_03_F" , "4000" ]
			]
		] ,
		[ "Missile_AGM_01_Plane_CAS_02_F" , 
			[ 
				[ "4Rnd_Missile_AGM_01_F" , "20000" ]
			]
		] ,
		[ "Bomb_03_Plane_CAS_02_F" , 
			[ 
				[ "2Rnd_Bomb_03_F" , "4000" ]
			]
		] ,
		[ "Rocket_03_HE_Plane_CAS_02_F" , 
			[ 
				[ "20Rnd_Rocket_03_HE_F" , "3000" ]
			]
		] ,
		[ "Rocket_03_AP_Plane_CAS_02_F" , 
			[ 
				[ "20Rnd_Rocket_03_AP_F" , "3000" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	]
];

// ***************************
// Plane - UAV (CAS)
// ***************************

CTI_LOADOUT_O_UAV_02_CAS_F_MNT_OPTIONS = 
[
	"Anti Tank - Configurations" ,
	[	
		[ 
			"missiles_SCALPEL" , 
			[ 
				[ "2Rnd_LG_scalpel" , "10000" ]
			]
		] ,
		[ "Laserdesignator_mounted" , 
			[
				[ "Laserbatteries" , "500" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	] ,
	"Anti Air - Configurations" ,
	[	
		[ 
			"Missile_AA_04_Plane_CAS_01_F" , 
			[ 
				[ "2Rnd_Missile_AA_04_F" , "4000" ]
			] ,
			"Missile_AA_03_Plane_CAS_02_F" , 
			[ 
				[ "2Rnd_Missile_AA_03_F" , "4000" ]
			] ,
			"missiles_ASRAAM" , 
			[ 
				[ "2Rnd_AAA_missiles" , "4000" ]
			]
		] ,
		[ "Laserdesignator_mounted" , 
			[
				[ "Laserbatteries" , "500" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	] ,
	"Anti Ground - Configurations" ,
	[	
		[ 
			// Doesn't work
			// "Bomb_03_Plane_CAS_02_F" , 
			// [ 
				// [ "2Rnd_Bomb_03_F" , "3000" ]
			// ] ,
			"Mk82BombLauncher" , 
			[ 
				[ "2Rnd_Mk82" , "3000" ]
			] ,	
			"GBU12BombLauncher" , 
			[ 
				[ "2Rnd_GBU12_LGB" , "4000" ]
			]
		] ,
		[ "Laserdesignator_mounted" , 
			[
				[ "Laserbatteries" , "500" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	]
];

// ***************************
// Plane - UAV
// ***************************
CTI_LOADOUT_O_UAV_02_F_MNT_OPTIONS = 
[
	"Anti Tank - Configurations" ,
	[	
		[ 
			"missiles_SCALPEL" , 
			[ 
				[ "2Rnd_LG_scalpel" , "10000" ]
			]
		] ,
		[ "Laserdesignator_mounted" , 
			[
				[ "Laserbatteries" , "500" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	] ,
	"Anti Air - Configurations" ,
	[	
		[ 
			"Missile_AA_04_Plane_CAS_01_F" , 
			[ 
				[ "2Rnd_Missile_AA_04_F" , "4000" ]
			] ,
			"Missile_AA_03_Plane_CAS_02_F" , 
			[ 
				[ "2Rnd_Missile_AA_03_F" , "4000" ]
			] ,
			"missiles_ASRAAM" , 
			[ 
				[ "2Rnd_AAA_missiles" , "4000" ]
			]
		] ,
		[ "Laserdesignator_mounted" , 
			[
				[ "Laserbatteries" , "500" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	] ,
	"Anti Ground - Configurations" ,
	[	
		[ 
			// Doesn't work
			// "Bomb_03_Plane_CAS_02_F" , 
			// [ 
				// [ "2Rnd_Bomb_03_F" , "3000" ]
			// ] ,
			"Mk82BombLauncher" , 
			[ 
				[ "2Rnd_Mk82" , "3000" ]
			] ,	
			"GBU12BombLauncher" , 
			[ 
				[ "2Rnd_GBU12_LGB" , "4000" ]
			]
		] ,
		[ "Laserdesignator_mounted" , 
			[
				[ "Laserbatteries" , "500" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	]
];

// //WIPEOPUT MOUNTING POINTS
// CTI_LOADOUT_B_Plane_CAS_01_F_MAPPING = [ "CTI_LOADOUT_B_Plane_CAS_01_F_MNT_PT1" , "CTI_LOADOUT_B_Plane_CAS_01_F_MNT_PT2" , "CTI_LOADOUT_B_Plane_CAS_01_F_MNT_PT3" ];

// // Gatling gun options
// CTI_LOADOUT_B_Plane_CAS_01_F_MNT_PT1 = 
// [
	// [ 	"Standard - 30mm" ,
		// [ "Gatling_30mm_Plane_CAS_01_F" , 
			// [ 
				// [ "1000Rnd_Gatling_30mm_Plane_CAS_01_F" , "3500" ]
			// ] 
		// ]
	// ],
	// [ "Avenger - 25mm" ,
		// [ "gatling_25mm" , 
			// [ 
				// [ "1000Rnd_25mm_shells" , "2000" ] ,
				// [ "300Rnd_25mm_shells" , "1000" ]
			// ] 
		// ]
	// ]
// ];



// ***************************
// Ressistance - Vehicle loadout options
// ***************************

// Mohawk transport helicopter
CTI_LOADOUT_I_Heli_Transport_02_F_MNT_OPTIONS = 
[
	"Standard - configuration" ,
	[	
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	]
];

// Hellcat
CTI_LOADOUT_I_Heli_light_03_F_MNT_OPTIONS = 
[
	"Standard - configuration" ,
	[	
		[ "M134_minigun" , 
			[ 
				[ "5000Rnd_762x51_Belt" , "500" ]
			]
		] ,		
		[ "missiles_DAR" , 
			[ 
				[ "24Rnd_missiles" , "3000" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	]
];

// Hellcat unarmed
CTI_LOADOUT_I_Heli_light_03_unarmed_F_MNT_OPTIONS = 
[
	"Standard - configuration" ,
	[	
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	]
];

// Buzzard ( CAS )
CTI_LOADOUT_I_Plane_Fighter_03_CAS_F_MNT_OPTIONS = 
[
	"Standard - configuration" ,
	[	
		[ "Twin_Cannon_20mm" , 
			[ 
				[ "300Rnd_20mm_shells" , "750" ]
			]
		] ,	
		[ "missiles_SCALPEL" , 
			[ 
				[ "2Rnd_LG_scalpel" , "10000" ]
			]
		] ,	
		[ "missiles_ASRAAM" , 
			[ 
				[ "2Rnd_AAA_missiles" , "4000" ]
			]
		] ,	
		[ "GBU12BombLauncher" , 
			[ 
				[ "2Rnd_GBU12_LGB_MI10" , "3000" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	]
];


// Buzzard ( AA )
CTI_LOADOUT_I_Plane_Fighter_03_AA_F_MNT_OPTIONS = 
[
	"Standard - configuration" ,
	[	
		[ "Twin_Cannon_20mm" , 
			[ 
				[ "300Rnd_20mm_shells" , "750" ]
			]
		] ,	
		[ "missiles_ASRAAM" , 
			[ 
				[ "2Rnd_AAA_missiles" , "4000" ]
			]
		] ,	
		[ "missiles_Zephyr" , 
			[ 
				[ "4Rnd_GAA_missiles" , "8000" ]
			]
		] ,	
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	]
];

// ***************************
// Plane - UAV (CAS)
// ***************************

CTI_LOADOUT_I_UAV_02_F_MNT_OPTIONS = 
[
	"Anti Tank - Configurations" ,
	[	
		[ 
			"missiles_SCALPEL" , 
			[ 
				[ "2Rnd_LG_scalpel" , "10000" ]
			]
		] ,
		[ "Laserdesignator_mounted" , 
			[
				[ "Laserbatteries" , "500" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	] ,
	"Anti Air - Configurations" ,
	[	
		[ 
			"Missile_AA_04_Plane_CAS_01_F" , 
			[ 
				[ "2Rnd_Missile_AA_04_F" , "4000" ]
			] ,
			"Missile_AA_03_Plane_CAS_02_F" , 
			[ 
				[ "2Rnd_Missile_AA_03_F" , "4000" ]
			] ,
			"missiles_ASRAAM" , 
			[ 
				[ "2Rnd_AAA_missiles" , "4000" ]
			]
		] ,
		[ "Laserdesignator_mounted" , 
			[
				[ "Laserbatteries" , "500" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	] ,
	"Anti Ground - Configurations" ,
	[	
		[ 
			"Mk82BombLauncher" , 
			[ 
				[ "2Rnd_Mk82" , "3000" ]
			] ,	
			"GBU12BombLauncher" , 
			[ 
				[ "2Rnd_GBU12_LGB" , "4000" ]
			]
		] ,
		[ "Laserdesignator_mounted" , 
			[
				[ "Laserbatteries" , "500" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	]
];


// ***************************
// Plane - UAV (CAS)
// ***************************

CTI_LOADOUT_I_UAV_02_CAS_F_MNT_OPTIONS = 
[
	"Anti Tank - Configurations" ,
	[	
		[ 
			"missiles_SCALPEL" , 
			[ 
				[ "2Rnd_LG_scalpel" , "10000" ]
			]
		] ,
		[ "Laserdesignator_mounted" , 
			[
				[ "Laserbatteries" , "500" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	] ,
	"Anti Air - Configurations" ,
	[	
		[ 
			"Missile_AA_04_Plane_CAS_01_F" , 
			[ 
				[ "2Rnd_Missile_AA_04_F" , "4000" ]
			] ,
			"Missile_AA_03_Plane_CAS_02_F" , 
			[ 
				[ "2Rnd_Missile_AA_03_F" , "4000" ]
			] ,
			"missiles_ASRAAM" , 
			[ 
				[ "2Rnd_AAA_missiles" , "4000" ]
			]
		] ,
		[ "Laserdesignator_mounted" , 
			[
				[ "Laserbatteries" , "500" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	] ,
	"Anti Ground - Configurations" ,
	[	
		[ 
			"Mk82BombLauncher" , 
			[ 
				[ "2Rnd_Mk82" , "3000" ]
			] ,	
			"GBU12BombLauncher" , 
			[ 
				[ "2Rnd_GBU12_LGB" , "4000" ]
			]
		] ,
		[ "Laserdesignator_mounted" , 
			[
				[ "Laserbatteries" , "500" ]
			]
		] ,
		[ "CMFlareLauncher" , 
			[
				[ "120Rnd_CMFlare_Chaff_Magazine" , "500" ] ,
				[ "168Rnd_CMFlare_Chaff_Magazine" , "1000" ] ,
				[ "192Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
				[ "240Rnd_CMFlare_Chaff_Magazine" , "2000" ]
			]
		]
	]
];


// *******************************
// Research mapping
// *******************************

CTI_ALM_AA_RESEARCHED_MAGAZINES =
[
	"2Rnd_AAA_missiles" ,
	"2Rnd_AAA_missiles_MI02" ,
	"4Rnd_AAA_missiles" ,
	"4Rnd_AAA_missiles_MI02" ,
	"4Rnd_GAA_missiles" ,
	"1Rnd_GAA_missiles" ,
	"2Rnd_Missile_AA_04_F" ,
	"2Rnd_Missile_AA_03_F"
];

CTI_ALM_ATGM_RESEARCHED_MAGAZINES =
[
	"24Rnd_PG_missiles" ,
	"12Rnd_PG_missiles" ,
	"2Rnd_LG_scalpel" ,
	"8Rnd_LG_scalpel" ,
	"6Rnd_LG_scalpel" ,
	"2Rnd_GAT_missiles" ,
	"5Rnd_GAT_missiles" ,
	"4Rnd_Titan_long_missiles" ,
	"1Rnd_GAT_missiles" ,
	"6Rnd_Missile_AGM_02_F" ,
	"4Rnd_Missile_AGM_01_F"
];


CTI_ALM_FFAR_RESEARCHED_MAGAZINES =
[
	"14Rnd_80mm_rockets" ,
	"38Rnd_80mm_rockets" ,
	"7Rnd_Rocket_04_HE_F" ,
	"7Rnd_Rocket_04_AP_F" ,
	"20Rnd_Rocket_03_HE_F" ,
	"20Rnd_Rocket_03_AP_F"
];

CTI_ALM_CM_RESEARCHED_MAGAZINES =
[
	"60Rnd_CMFlareMagazine" ,
	"120Rnd_CMFlareMagazine" ,
	"240Rnd_CMFlareMagazine" ,
	"60Rnd_CMFlare_Chaff_Magazine" ,
	"120Rnd_CMFlare_Chaff_Magazine" ,
	"240Rnd_CMFlare_Chaff_Magazine" ,
	"192Rnd_CMFlare_Chaff_Magazine" ,
	"168Rnd_CMFlare_Chaff_Magazine" ,
	"300Rnd_CMFlare_Chaff_Magazine"
];


// // Flares
// CTI_LOADOUT_B_Plane_CAS_01_F_MNT_PT3 = 
// [ 
	// [ 	"Flare options" ,
		// [ "CMFlareLauncher" , 
			// [ "120Rnd_CMFlare_Chaff_Magazine" , "1500" ] ,
			// [ "168Rnd_CMFlare_Chaff_Magazine" , "3500" ] ,
			// [ "192Rnd_CMFlare_Chaff_Magazine" , "4000" ] ,
			// [ "240Rnd_CMFlare_Chaff_Magazine" , "5000" ]
		// ]
	// ]
// ];



// //Buzzard AA MOUNTING POINTS
// CTI_LOADOUT_B_Plane_CAS_01_F_MAPPING = [ "CANNONGUNS" , "2POINTMOUNT" , "4POINTMOUNT" , "FLARE" ];

// //Buzzard CAS
// CTI_LOADOUT_B_Plane_CAS_01_F_MAPPING = [ "CANNONGUNS" , "2POINTMOUNT" , "2POINTMOUNT" , "2POINTMOUNT" , "FLARE" ];

// //Typhoon
// CTI_LOADOUT_B_Plane_CAS_01_F_MAPPING = [ "GATLINGGUNS" , "2POINTMOUNT" , "6POINTMOUNT" , "4POINTMOUNT" , "7ROCKETMOUNTR" , "7ROCKETMOUNTL" , "FLARE" ];

// GATLINGGUNS_MOUNT_OPTIONS = 
// [ 
	// [ "Gatling_30mm_Plane_CAS_01_F" , 
		// [ "1000Rnd_Gatling_30mm_Plane_CAS_01_F" ] 
	// ] 
// ];

// 2POINTMOUNT_MOUNT_OPTIONS = [ "2Rnd_LG_scalpel" , "2Rnd_GAT_missiles" , "4Rnd_GAA_missiles" ,"4Rnd_Titan_long_missiles" ,"2Rnd_GBU12_LGB" , "2Rnd_GBU12_LGB_MI10" , "2Rnd_Mk82" , "2Rnd_Mk82_MI08" ,"2Rnd_Missile_AA_04_F" ,"2Rnd_Missile_AA_03_F" ,"2Rnd_Bomb_03_F" ];
// 6POINTMOUNT_MOUNT_OPTIONS = [ "6Rnd_LG_scalpel" ,"6Rnd_Missile_AGM_02_F" , ];
// 7ROCKETMOUNTR_MOUNT_OPTIONS = [ "7Rnd_Rocket_04_HE_F" ];
// 7ROCKETMOUNTL_MOUNT_OPTIONS = [ "7Rnd_Rocket_04_AP_F" , "4Rnd_Bomb_04_F" ];
// 4POINTMOUNT_MOUNT_OPTIONS = [ "4Rnd_GAA_missiles" , "4Rnd_Missile_AGM_01_F" ];
// FLARE_MOUNT_OPTIONS = [ "60Rnd_CMFlareMagazine" , "120Rnd_CMFlareMagazine" , "240Rnd_CMFlareMagazine" , "60Rnd_CMFlare_Chaff_Magazine" , "120Rnd_CMFlare_Chaff_Magazine" , "240Rnd_CMFlare_Chaff_Magazine" , "192Rnd_CMFlare_Chaff_Magazine" , "168Rnd_CMFlare_Chaff_Magazine" , "300Rnd_CMFlare_Chaff_Magazine" ];




//weapons[] = {"Gatling_30mm_Plane_CAS_01_F","Missile_AA_04_Plane_CAS_01_F","Missile_AGM_02_Plane_CAS_01_F","Rocket_04_HE_Plane_CAS_01_F","Rocket_04_AP_Plane_CAS_01_F","Bomb_04_Plane_CAS_01_F","CMFlareLauncher"};





