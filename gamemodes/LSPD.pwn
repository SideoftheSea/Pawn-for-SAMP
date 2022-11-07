// This is a comment
// uncomment the line below if you want to write a filterscript
#define FILTERSCRIPT

#include <a_samp>
#include <streamer>

#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Blank Filterscript by your name here");
	print("--------------------------------------\n");
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

#else

main()
{
	print("\n----------------------------------");
	print(" Blank Gamemode by your name here");
	print("----------------------------------\n");
}

#endif

public OnGameModeInit()
{
	// Don't use these lines if it's a filterscript
	SetGameModeText("Blank Script");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	new tmpobjid;

	new opstinaintathlonezidg =CreateDynamicObject(19377, 630.03021, -113.12850, -75.60600,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonezid = CreateDynamicObject(19377, 666.62512, -84.33140, -73.28210,   0.00000, 0.00000, 80.00000);
	new opstinaintathlonezid1 =CreateDynamicObject(19377, 661.90118, -87.12520, -73.28210,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonezid2 =CreateDynamicObject(19377, 674.51343, -88.87746, -73.28210,   0.00000, 0.00000, 40.00000);
	new opstinaintathlonezid3 =CreateDynamicObject(19377, 677.41028, -95.12473, -73.28210,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonezid4 =CreateDynamicObject(19377, 674.45599, -103.24913, -73.28210,   0.00000, 0.00000, -40.00000);
	new opstinaintathlonezid5 =CreateDynamicObject(19377, 666.62512, -107.76390, -73.28210,   0.00000, 0.00000, -80.00000);
	new opstinaintathlonezid6 =CreateDynamicObject(19377, 661.90118, -104.71550, -73.28210,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonezid7 =CreateDynamicObject(19377, 661.89948, -104.47710, -83.67000,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonezid8 =CreateDynamicObject(19377, 661.89948, -87.37440, -83.67000,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonezid9 =CreateDynamicObject(19377, 665.36133, -82.62030, -75.60600,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonezid10 =CreateDynamicObject(19377, 658.46655, -82.61582, -71.57480,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonezid11 =CreateDynamicObject(19377, 648.95477, -82.61580, -71.57480,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonezid12 =CreateDynamicObject(19396, 652.40198, -82.66890, -78.29890,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonezid13 =CreateDynamicObject(19377, 660.61700, -77.86745, -75.60600,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonezid14 =CreateDynamicObject(19377, 655.88336, -73.11671, -75.60600,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonezid15 =CreateDynamicObject(19377, 646.28180, -73.11590, -75.60600,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonezid16 =CreateDynamicObject(19377, 644.20990, -77.89880, -75.60600,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonezid17 =CreateDynamicObject(19377, 636.65820, -73.11586, -75.60600,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonezid18 =CreateDynamicObject(19377, 628.73895, -76.77615, -75.60600,   0.00000, 0.00000, -40.00000);
	new opstinaintathlonezid19 =CreateDynamicObject(19377, 625.60681, -85.31715, -75.60600,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonezid20 =CreateDynamicObject(19377, 625.60681, -94.92460, -75.60600,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonezid21 =CreateDynamicObject(19377, 625.60681, -104.55610, -75.60600,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonezid22 =CreateDynamicObject(19377, 626.04303, -105.89893, -80.77422,   0.00000, 0.00000, 312.04071);
	new opstinaintathlonezid23 =CreateDynamicObject(19377, 628.85492, -109.00580, -80.77420,   0.00000, 0.00000, 312.04071);
	new opstinaintathlonezid24 =CreateDynamicObject(19377, 627.27020, -109.58454, -75.60600,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonezid25 =CreateDynamicObject(19377, 632.03192, -114.32162, -75.60600,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonezid26 =CreateDynamicObject(19377, 639.55231, -113.12850, -75.60600,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonezid27 =CreateDynamicObject(19377, 644.29022, -113.91904, -75.60600,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonezid28 =CreateDynamicObject(19377, 649.18329, -109.13893, -71.57480,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonezid29 =CreateDynamicObject(19377, 658.81219, -109.13890, -71.57480,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonezid30 =CreateDynamicObject(19377, 665.36127, -109.15321, -75.60600,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonezid31 =CreateDynamicObject(19396, 652.41138, -109.11591, -78.29891,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonezid32 =CreateDynamicObject(19377, 660.59772, -113.88275, -75.60600,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonezid33 =CreateDynamicObject(19377, 655.69916, -118.78771, -75.60600,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonezid34 =CreateDynamicObject(19377, 646.07312, -118.78770, -75.60600,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(opstinaintathlonezid, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid1, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid2, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid3, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid4, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid5, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid6, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid7, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid8, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid9, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid10, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid11, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid12, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid13, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid14, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid15, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid16, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid17, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid18, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid19, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid20, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid21, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid22, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid23, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid24, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid25, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid26, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid27, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid28, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid29, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid30, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid31, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid32, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid33, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezid34, 0, 3980, "cityhall_lan", "LAcityhwal1");
	SetDynamicObjectMaterial(opstinaintathlonezidg, 0, 3980, "cityhall_lan", "LAcityhwal1");
	new opstinaintathlonedrvo = CreateDynamicObject(19458, 666.77692, -85.29599, -79.12100,   -0.08000, 0.00000, 90.00000);
	new opstinaintathlonedrvo1 =CreateDynamicObject(19458, 666.68890, -83.63480, -77.44910,   0.00000, 90.00000, 90.00000);
	new opstinaintathlonedrvo2 =CreateDynamicObject(19461, 674.33673, -88.68752, -79.15932,   0.00000, 0.00000, 40.00000);
	new opstinaintathlonedrvo3 =CreateDynamicObject(19461, 661.90607, -87.11475, -79.15930,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonedrvo4 =CreateDynamicObject(19461, 677.39032, -95.51983, -77.07301,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonedrvo5 =CreateDynamicObject(19461, 674.41040, -103.29371, -79.15930,   0.00000, 0.00000, -40.00000);
	new opstinaintathlonedrvo6 =CreateDynamicObject(19458, 666.76172, -108.47266, -77.44910,   0.00000, 90.00000, 90.00000);
	new opstinaintathlonedrvo7 =CreateDynamicObject(19458, 666.74353, -106.80576, -79.12100,   -0.08000, 0.00000, 90.00000);
	new opstinaintathlonedrvo8 =CreateDynamicObject(19461, 661.91052, -104.72173, -79.15930,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonedrvo9 =CreateDynamicObject(19461, 661.87378, -104.72050, -80.79680,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonedrvo10 =CreateDynamicObject(19461, 665.29529, -109.14634, -80.79680,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonedrvo11 =CreateDynamicObject(19461, 665.34991, -82.66392, -80.79680,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonedrvo12 =CreateDynamicObject(19461, 661.87378, -87.16640, -80.79680,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonedrvo13 =CreateDynamicObject(19461, 660.60931, -77.90871, -80.79680,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonedrvo14 =CreateDynamicObject(19461, 658.58612, -73.13094, -80.79680,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonedrvo15 =CreateDynamicObject(19461, 649.06354, -73.14380, -80.79680,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonedrvo16 =CreateDynamicObject(19461, 644.21991, -77.98660, -80.79680,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonedrvo17 =CreateDynamicObject(19461, 644.20142, -78.01320, -80.79680,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonedrvo18 =CreateDynamicObject(19461, 639.38110, -73.12821, -80.79680,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonedrvo19 =CreateDynamicObject(19461, 629.78619, -73.12492, -80.79680,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonedrvo20 =CreateDynamicObject(19461, 628.74042, -76.78050, -80.79680,   0.00000, 0.00000, -40.00000);
	new opstinaintathlonedrvo21 =CreateDynamicObject(19461, 625.61047, -78.69132, -80.79680,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonedrvo22 =CreateDynamicObject(19461, 625.63580, -88.31848, -80.79680,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonedrvo23 =CreateDynamicObject(19461, 624.61279, -89.48550, -79.09740,   0.00000, 90.00000, 0.00000);
	new opstinaintathlonedrvo24 =CreateDynamicObject(19461, 626.26422, -89.49500, -80.75850,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonedrvo25 =CreateDynamicObject(19461, 621.54028, -84.73660, -80.75850,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonedrvo26 =CreateDynamicObject(19461, 626.26416, -99.08847, -80.75850,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonedrvo27 =CreateDynamicObject(19461, 624.61279, -99.11010, -79.09740,   0.00000, 90.00000, 0.00000);
	new opstinaintathlonedrvo28 =CreateDynamicObject(19461, 625.63300, -108.18704, -80.79680,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonedrvo29 =CreateDynamicObject(19461, 621.54034, -103.85158, -80.75850,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonedrvo30 =CreateDynamicObject(19461, 627.30493, -109.56429, -80.79680,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonedrvo31 =CreateDynamicObject(19461, 632.03607, -114.44640, -80.79680,   -0.08000, 0.00000, 0.00000);
	new opstinaintathlonedrvo32 =CreateDynamicObject(19461, 629.74561, -113.11581, -80.79680,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonedrvo33 =CreateDynamicObject(19461, 639.37738, -113.11460, -80.79680,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonedrvo34 =CreateDynamicObject(19461, 644.28583, -115.09500, -80.79680,   -0.08000, 0.00000, 0.00000);
	new opstinaintathlonedrvo35 =CreateDynamicObject(18762, 641.87567, -109.79960, -79.55340,   0.00000, 90.00000, 0.00000);
	new opstinaintathlonedrvo36 =CreateDynamicObject(18762, 636.87628, -109.79960, -79.55340,   0.00000, 90.00000, 0.00000);
	new opstinaintathlonedrvo37 =CreateDynamicObject(19461, 644.29199, -113.93302, -80.79680,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonedrvo38 =CreateDynamicObject(19461, 648.80786, -118.78540, -80.79680,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonedrvo39 =CreateDynamicObject(19461, 658.43280, -118.78391, -80.79680,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonedrvo40 =CreateDynamicObject(19461, 660.57996, -114.00549, -80.79680,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(opstinaintathlonedrvo, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo1, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo2, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo3, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo4, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo5, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo6, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo7, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo8, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo9, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo10, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo11, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo12, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo13, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo14, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo15, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo16, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo17, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo18, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo19, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo20, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo21, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo22, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo23, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo24, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo25, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo26, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo27, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo28, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo29, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo30, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo31, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo32, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo33, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo34, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo35, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo36, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo37, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo38, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo39, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonedrvo40, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	new opstinaintathlonezidb = CreateDynamicObject(19377, 628.68365, -109.85345, -75.60600,   0.00000, 0.00000, 40.00000);
	new opstinaintathlonezidb1 = CreateDynamicObject(19461, 625.61780, -94.48410, -79.24720,   0.00000, 0.00000, 0.00000);
	new opstinaintathlonezidb2 =CreateDynamicObject(19358, 640.21472, -83.54597, -78.33775,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonezidb3 =CreateDynamicObject(19358, 628.30621, -83.54600, -78.33780,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(opstinaintathlonezidb, 0, 9495, "vict_sfw", "newall10_seamless", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonezidb1, 0, 9495, "vict_sfw", "newall10_seamless", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonezidb2, 0, 9495, "vict_sfw", "newall10_seamless", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonezidb3, 0, 9495, "vict_sfw", "newall10_seamless", 0xFFFFFFFF);
	new athloneopstinaintstubovi = CreateDynamicObject(18980, 662.79163, -84.45060, -78.19510,   0.00000, 0.00000, 0.00000);
	new athloneopstinaintstubovi1 =CreateDynamicObject(18980, 650.32031, -95.88281, -78.19510,   0.00000, 0.00000, 0.00000);
	new athloneopstinaintstubovi2 =CreateDynamicObject(18980, 643.88342, -108.62588, -78.19510,   0.00000, 0.00000, 0.00000);
	new athloneopstinaintstubovi3 =CreateDynamicObject(18980, 643.30560, -104.42500, -78.19510,   0.00000, 0.00000, 0.00000);
	new athloneopstinaintstubovi4 =CreateDynamicObject(18980, 643.30560, -87.51801, -78.19510,   0.00000, 0.00000, 0.00000);
	new athloneopstinaintstubovi5 =CreateDynamicObject(18980, 643.81207, -83.19390, -78.19510,   0.00000, 0.00000, 0.00000);
	new athloneopstinaintstubovi6 =CreateDynamicObject(18980, 634.40680, -79.84310, -78.19510,   0.00000, 0.00000, 0.00000);
	new athloneopstinaintstubovi7 =CreateDynamicObject(18980, 662.73395, -107.59574, -78.19510,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(athloneopstinaintstubovi, 0,  6056, "venice_law", "stonewall_la", 0xFFFFFFFF);
	SetDynamicObjectMaterial(athloneopstinaintstubovi1, 0,  6056, "venice_law", "stonewall_la", 0xFFFFFFFF);
	SetDynamicObjectMaterial(athloneopstinaintstubovi2, 0,  6056, "venice_law", "stonewall_la", 0xFFFFFFFF);
	SetDynamicObjectMaterial(athloneopstinaintstubovi3, 0,  6056, "venice_law", "stonewall_la", 0xFFFFFFFF);
	SetDynamicObjectMaterial(athloneopstinaintstubovi4, 0,  6056, "venice_law", "stonewall_la", 0xFFFFFFFF);
	SetDynamicObjectMaterial(athloneopstinaintstubovi5, 0,  6056, "venice_law", "stonewall_la", 0xFFFFFFFF);
	SetDynamicObjectMaterial(athloneopstinaintstubovi6, 0,  6056, "venice_law", "stonewall_la", 0xFFFFFFFF);
	SetDynamicObjectMaterial(athloneopstinaintstubovi7, 0,  6056, "venice_law", "stonewall_la", 0xFFFFFFFF);
	new opstinaithloneintcrno = CreateDynamicObject(19089, 632.07318, -83.49660, -76.06700,   0.00000, 90.00000, 0.00000);
	new opstinaithloneintcrno1 =CreateDynamicObject(19089, 632.07690, -83.50200, -76.04700,   0.00000, 0.00000, 0.00000);
	new opstinaithloneintcrno2 =CreateDynamicObject(19089, 644.13342, -83.49210, -76.06700,   0.00000, 90.00000, 0.00000);
	new opstinaithloneintcrno3 =CreateDynamicObject(19089, 636.75488, -83.50200, -76.04700,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(opstinaithloneintcrno, 0, 2361, "shopping_freezers", "white", 0xFF000000);
	SetDynamicObjectMaterial(opstinaithloneintcrno1, 0, 2361, "shopping_freezers", "white", 0xFF000000);
	SetDynamicObjectMaterial(opstinaithloneintcrno2, 0, 2361, "shopping_freezers", "white", 0xFF000000);
	SetDynamicObjectMaterial(opstinaithloneintcrno3, 0, 2361, "shopping_freezers", "white", 0xFF000000);
	new opstinaathloneintpod = CreateDynamicObject(18981, 674.34088, -96.06480, -78.90170,   0.00000, 90.00000, 0.00000);
	new opstinaathloneintpod1 =CreateDynamicObject(18981, 649.38062, -96.06480, -80.41410,   0.00000, 90.00000, 0.00000);
	new opstinaathloneintpod2 =CreateDynamicObject(18981, 624.38440, -96.06480, -80.41410,   0.00000, 90.00000, 0.00000);
	new opstinaathloneintpod3 =CreateDynamicObject(18981, 649.41278, -71.05640, -80.41410,   0.00000, 90.00000, 0.00000);
	new opstinaathloneintpod4 =CreateDynamicObject(18981, 624.40436, -71.11646, -80.41410,   0.00000, 90.00000, 0.00000);
	new opstinaathloneintpod5 =CreateDynamicObject(18981, 624.38440, -121.02770, -80.41410,   0.00000, 90.00000, 0.00000);
	new opstinaathloneintpod6 =CreateDynamicObject(18981, 649.38062, -121.02770, -80.41410,   0.00000, 90.00000, 0.00000);
	SetDynamicObjectMaterial(opstinaathloneintpod, 0, 14594, "papaerchaseoffice", "ab_mottleGrey");
	SetDynamicObjectMaterial(opstinaathloneintpod1, 0, 14594, "papaerchaseoffice", "ab_mottleGrey");
	SetDynamicObjectMaterial(opstinaathloneintpod2, 0, 14594, "papaerchaseoffice", "ab_mottleGrey");
	SetDynamicObjectMaterial(opstinaathloneintpod3, 0, 14594, "papaerchaseoffice", "ab_mottleGrey");
	SetDynamicObjectMaterial(opstinaathloneintpod4, 0, 14594, "papaerchaseoffice", "ab_mottleGrey");
	SetDynamicObjectMaterial(opstinaathloneintpod5, 0, 14594, "papaerchaseoffice", "ab_mottleGrey");
	SetDynamicObjectMaterial(opstinaathloneintpod6, 0, 14594, "papaerchaseoffice", "ab_mottleGrey");
	new opstinaintathloneplafon = CreateDynamicObject(18981, 674.39478, -95.09790, -71.28810,   0.00000, 90.00000, 0.00000);
	new opstinaintathloneplafon1 =CreateDynamicObject(18981, 649.38062, -96.06480, -71.28810,   0.00000, 90.00000, 0.00000);
	new opstinaintathloneplafon2 =CreateDynamicObject(18981, 649.38062, -121.02770, -71.28810,   0.00000, 90.00000, 0.00000);
	new opstinaintathloneplafon3 =CreateDynamicObject(18981, 624.38440, -121.02770, -71.28810,   0.00000, 90.00000, 0.00000);
	new opstinaintathloneplafon4 =CreateDynamicObject(18981, 624.38440, -96.06480, -71.28810,   0.00000, 90.00000, 0.00000);
	new opstinaintathloneplafon5 =CreateDynamicObject(18981, 649.39362, -71.11540, -71.28810,   0.00000, 90.00000, 0.00000);
	new opstinaintathloneplafon6 =CreateDynamicObject(18981, 624.40442, -71.11650, -71.28810,   0.00000, 90.00000, 0.00000);
	SetDynamicObjectMaterial(opstinaintathloneplafon, 0, 10926, "shops_sfse", "bathtile01_int", 0xFF8B4C39);
	SetDynamicObjectMaterial(opstinaintathloneplafon1, 0, 10926, "shops_sfse", "bathtile01_int", 0xFF8B4C39);
	SetDynamicObjectMaterial(opstinaintathloneplafon2, 0, 10926, "shops_sfse", "bathtile01_int", 0xFF8B4C39);
	SetDynamicObjectMaterial(opstinaintathloneplafon3, 0, 10926, "shops_sfse", "bathtile01_int", 0xFF8B4C39);
	SetDynamicObjectMaterial(opstinaintathloneplafon4, 0, 10926, "shops_sfse", "bathtile01_int", 0xFF8B4C39);
	SetDynamicObjectMaterial(opstinaintathloneplafon5, 0, 10926, "shops_sfse", "bathtile01_int", 0xFF8B4C39);
	SetDynamicObjectMaterial(opstinaintathloneplafon6, 0, 10926, "shops_sfse", "bathtile01_int", 0xFF8B4C39);
	new opstinaathlonekancelarijep = CreateDynamicObject(19377, 649.02307, -77.40660, -76.02560,   0.00000, 90.00000, 90.00000);
	new opstinaathlonekancelarijep1 = CreateDynamicObject(19377, 658.60931, -77.40660, -76.02560,   0.00000, 90.00000, 90.00000);
	new opstinaathlonekancelarijep2 = CreateDynamicObject(19377, 649.26868, -114.41124, -76.02560,   0.00000, 90.00000, 90.00000);
	new opstinaathlonekancelarijep3 = CreateDynamicObject(19377, 658.90045, -114.43725, -76.02560,   0.00000, 90.00000, 90.00000);
	SetDynamicObjectMaterial(opstinaathlonekancelarijep, 0, 10926, "shops_sfse", "bathtile01_int", 0xFF8B4C39);
	SetDynamicObjectMaterial(opstinaathlonekancelarijep1, 0, 10926, "shops_sfse", "bathtile01_int", 0xFF8B4C39);
	SetDynamicObjectMaterial(opstinaathlonekancelarijep2, 0, 10926, "shops_sfse", "bathtile01_int", 0xFF8B4C39);
	SetDynamicObjectMaterial(opstinaathlonekancelarijep3, 0, 10926, "shops_sfse", "bathtile01_int", 0xFF8B4C39);
	new opstinaintathloneprozori = CreateDynamicObject(19466, 625.70062, -85.94160, -78.46710,   0.00000, 0.00000, 0.00000);
	new opstinaintathloneprozori1 =CreateDynamicObject(19358, 625.62653, -90.83600, -80.11360,   45.00000, 0.00000, 0.00000);
	new opstinaintathloneprozori2 =CreateDynamicObject(19358, 625.62653, -97.96420, -80.11360,   45.00000, 0.00000, 0.00000);
	new opstinaintathloneprozori3 =CreateDynamicObject(19466, 625.69885, -102.38997, -78.46712,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(opstinaintathloneprozori, 0, 3979, "civic01_lan", "sl_laglasswall2", 0xFF1E90FF);
	SetDynamicObjectMaterial(opstinaintathloneprozori1, 0, 3979, "civic01_lan", "sl_laglasswall2", 0xFF1E90FF);
	SetDynamicObjectMaterial(opstinaintathloneprozori2, 0, 3979, "civic01_lan", "sl_laglasswall2", 0xFF1E90FF);
	SetDynamicObjectMaterial(opstinaintathloneprozori3, 0, 3979, "civic01_lan", "sl_laglasswall2", 0xFF1E90FF);
	new opstinaintathlonestakla = CreateDynamicObject(19325, 628.75568, -83.49660, -78.12170,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonestakla1 =CreateDynamicObject(19325, 640.07196, -83.49660, -78.12170,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonestakla2 =CreateDynamicObject(19325, 647.57391, -82.70230, -78.12170,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonestakla3 =CreateDynamicObject(19325, 657.24365, -82.70232, -78.12170,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonestakla4 =CreateDynamicObject(19325, 657.31396, -109.11961, -78.12171,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonestakla5 =CreateDynamicObject(19325, 647.57391, -109.11960, -78.12170,   0.00000, 0.00000, 90.00000);
	new opstinaintathlonestakla6 =CreateDynamicObject(19325, 629.93542, -108.01970, -73.54840,   0.00000, 0.00000, 312.00000);
	new opstinaintathlonestakla7 =CreateDynamicObject(19325, 627.08929, -104.96125, -73.54842,   0.00000, 0.00000, 312.00000);
	new opstinaintathlonestakla8 =CreateDynamicObject(19325, 643.72156, -85.57745, -78.66464,   80.00000, 0.00000, 0.00000);
	new opstinaintathlonestakla9 =CreateDynamicObject(19325, 643.69373, -106.29720, -78.66460,   -80.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(opstinaintathlonestakla, 0, 2361, "lsmall_shops", "lsmall_window01", 0xFF1E90FF);
	SetDynamicObjectMaterial(opstinaintathlonestakla1, 0, 2361, "lsmall_shops", "lsmall_window01", 0xFF1E90FF);
	SetDynamicObjectMaterial(opstinaintathlonestakla2, 0, 2361, "lsmall_shops", "lsmall_window01", 0xFF1E90FF);
	SetDynamicObjectMaterial(opstinaintathlonestakla3, 0, 2361, "lsmall_shops", "lsmall_window01", 0xFF1E90FF);
	SetDynamicObjectMaterial(opstinaintathlonestakla4, 0, 2361, "lsmall_shops", "lsmall_window01", 0xFF1E90FF);
	SetDynamicObjectMaterial(opstinaintathlonestakla5, 0, 2361, "lsmall_shops", "lsmall_window01", 0xFF1E90FF);
	SetDynamicObjectMaterial(opstinaintathlonestakla6, 0, 2361, "lsmall_shops", "lsmall_window01", 0xFF1E90FF);
	SetDynamicObjectMaterial(opstinaintathlonestakla7, 0, 2361, "lsmall_shops", "lsmall_window01", 0xFF1E90FF);
	SetDynamicObjectMaterial(opstinaintathlonestakla8, 0, 2361, "lsmall_shops", "lsmall_window01", 0xFF1E90FF);
	SetDynamicObjectMaterial(opstinaintathlonestakla9, 0, 2361, "lsmall_shops", "lsmall_window01", 0xFF1E90FF);
	new opstinaintathloneplazma = CreateDynamicObject(2267, 628.30969, -83.41081, -77.97473,   0.00000, 0.00000, 180.00000);
	new opstinaintathloneplazma1 =CreateDynamicObject(2267, 640.22369, -83.43540, -77.97470,   0.00000, 0.00000, 180.00000);
	SetDynamicObjectMaterial(opstinaintathloneplazma, 1, 2361, "shopping_freezers", "white", 0xFF5B5959);
	SetDynamicObjectMaterial(opstinaintathloneplazma, 0, 2361, "shopping_freezers", "white", 0xFF000000);
	SetDynamicObjectMaterial(opstinaintathloneplazma1, 1, 2361, "shopping_freezers", "white", 0xFF5B5959);
	SetDynamicObjectMaterial(opstinaintathloneplazma1, 0, 2361, "shopping_freezers", "white", 0xFF000000);
	new opstinaintathlonezast = CreateDynamicObject(19458, 659.00098, -99.97622, -82.33400,   -40.00000, 0.00000, 90.00000);
	new opstinaintathlonezast1 =CreateDynamicObject(19458, 659.00098, -91.86590, -82.33400,   -40.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(opstinaintathlonezast, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	SetDynamicObjectMaterial(opstinaintathlonezast1, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF);
	new opstinaintathlonevrata = CreateDynamicObject(1491, 651.63452, -109.10800, -79.97020,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(opstinaintathlonevrata, 0, 1569, "adam_v_doort", "ws_guardhousedoor", 0xFFFFFFFF);
	new dodatakplafon = CreateDynamicObject(18981, 675.47900, -120.01958, -71.28810,   0.00000, 90.00000, 0.00000);
	SetDynamicObjectMaterial(dodatakplafon, 0, 3979, "civic01_lan", "sl_laglasswall2", 0xFF1E90FF);
	//ostaloopstinaint
	CreateDynamicObject(14394, 660.80750, -95.93260, -79.21160,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2030, 626.27869, -85.95230, -79.64500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2030, 626.22418, -90.97360, -79.64500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2030, 626.22418, -98.08510, -79.64500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2030, 626.27875, -102.44759, -79.64500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14409, 629.51630, -105.59517, -80.34965,   0.00000, 0.00000, 312.04074);
	CreateDynamicObject(2209, 642.74908, -109.54320, -79.95400,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2209, 640.54437, -109.54320, -79.95400,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2209, 638.32220, -109.54320, -79.95400,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2209, 636.17377, -109.54321, -79.95400,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(19089, 636.75488, -83.50200, -76.04700,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1897, 625.62518, -84.89540, -78.60280,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1897, 625.56738, -85.95110, -77.55540,   0.00000, -90.00000, -90.00000);
	CreateDynamicObject(1897, 625.62451, -103.59120, -78.60280,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1897, 625.57739, -102.36510, -77.55540,   0.00000, -90.00000, -90.00000);
	CreateDynamicObject(1897, 625.57739, -102.36510, -78.98882,   0.00000, -90.00000, -90.00000);
	CreateDynamicObject(1897, 625.63733, -101.36090, -78.60280,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1897, 625.63275, -87.19853, -78.60280,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1897, 625.56738, -85.95112, -78.98882,   0.00000, -90.00000, -90.00000);
	CreateDynamicObject(1897, 625.64496, -89.77599, -78.60280,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1897, 625.64124, -99.41479, -78.60280,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1897, 625.58588, -98.18000, -77.55680,   0.00000, -90.00000, -90.00000);
	CreateDynamicObject(1897, 625.58588, -95.95420, -77.55680,   0.00000, -90.00000, -90.00000);
	CreateDynamicObject(1897, 625.58588, -93.72840, -77.55680,   0.00000, -90.00000, -90.00000);
	CreateDynamicObject(1897, 625.58588, -91.52940, -77.55680,   0.00000, -90.00000, -90.00000);
	CreateDynamicObject(1897, 625.58588, -90.80700, -77.55680,   0.00000, -90.00000, -90.00000);
	CreateDynamicObject(957, 625.97467, -100.38590, -78.97880,   0.00000, 180.00000, 180.00000);
	CreateDynamicObject(957, 625.87830, -88.32170, -78.97880,   0.00000, 180.00000, 180.00000);
	CreateDynamicObject(957, 625.97467, -96.46550, -78.97880,   0.00000, 180.00000, 180.00000);
	CreateDynamicObject(957, 625.97467, -94.32830, -78.97880,   0.00000, 180.00000, 180.00000);
	CreateDynamicObject(957, 625.97467, -92.21470, -78.97880,   0.00000, 180.00000, 180.00000);
	CreateDynamicObject(970, 660.09564, -91.88626, -79.45350,   0.00000, -40.00000, 0.00000);
	CreateDynamicObject(970, 660.12927, -99.98650, -79.45350,   0.00000, -40.00000, 0.00000);
	CreateDynamicObject(2315, 650.34064, -95.89874, -78.09620,   -0.08000, 90.00000, 0.00000);
	CreateDynamicObject(2315, 650.30090, -95.89836, -79.51530,   -0.08000, -90.00000, 0.00000);
	CreateDynamicObject(2315, 643.34088, -87.54068, -78.09620,   -0.08000, 90.00000, 0.00000);
	CreateDynamicObject(2315, 643.29565, -87.54087, -79.51530,   -0.08000, -90.00000, 0.00000);
	CreateDynamicObject(2315, 643.28198, -104.42378, -79.51530,   -0.08000, -90.00000, 0.00000);
	CreateDynamicObject(2315, 643.33002, -104.44360, -78.09620,   -0.08000, 90.00000, 0.00000);
	CreateDynamicObject(2030, 643.32550, -104.08462, -79.64500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2030, 643.35559, -87.94286, -79.64500,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1811, 644.71716, -88.77499, -79.34870,   0.00000, 0.00000, 313.66730);
	CreateDynamicObject(1811, 642.44525, -89.24929, -79.34870,   0.00000, 0.00000, 254.05786);
	CreateDynamicObject(1811, 642.44653, -102.88531, -79.34870,   0.00000, 0.00000, 130.13995);
	CreateDynamicObject(1811, 644.31219, -103.08139, -79.34870,   0.00000, 0.00000, 63.86169);
	CreateDynamicObject(1811, 627.92981, -86.01850, -79.34870,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1811, 627.92981, -90.93860, -79.34870,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1811, 627.92981, -98.07280, -79.34870,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1811, 627.92981, -102.46020, -79.34870,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1811, 635.49139, -107.87420, -79.34870,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1811, 637.77881, -107.87420, -79.34870,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1811, 639.93292, -107.87420, -79.34870,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1811, 642.19196, -107.87415, -79.34870,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1806, 642.20758, -111.45820, -79.94030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, 658.63849, -74.89175, -79.94030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, 637.77881, -111.45820, -79.94030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, 635.49139, -111.45820, -79.94030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(640, 661.47388, -85.19040, -79.41490,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(640, 666.01703, -84.66341, -76.98325,   0.00000, 0.00000, 86.70212);
	CreateDynamicObject(640, 661.47388, -102.50950, -79.41490,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(640, 661.47388, -107.88960, -79.41490,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2816, 643.31097, -103.64680, -79.24140,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2816, 643.43970, -88.44480, -79.24140,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2253, 625.88348, -87.58610, -78.76670,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2253, 625.88348, -89.08930, -78.76670,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2253, 625.88348, -99.73520, -78.76670,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2253, 625.88348, -101.00310, -78.76670,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1817, 628.73590, -81.18795, -79.95783,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1817, 639.59589, -80.68150, -79.95780,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1817, 633.93317, -77.46697, -79.95783,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2290, 639.02917, -78.06230, -79.97610,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2290, 628.21399, -78.64378, -79.97610,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2290, 633.54919, -74.91982, -79.97610,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2252, 640.47894, -80.21136, -79.20330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2252, 634.89307, -76.97001, -79.20330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2252, 629.71106, -80.72469, -79.20330,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(948, 635.11871, -80.05130, -80.16160,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(948, 633.70306, -80.05126, -80.16164,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14455, 643.42993, -73.22305, -78.47224,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(640, 661.47388, -90.55080, -79.41490,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(640, 665.81433, -107.35336, -76.98325,   0.00000, 0.00000, 95.41958);
	CreateDynamicObject(948, 650.32709, -95.17343, -80.16160,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(948, 650.32709, -96.63380, -80.16160,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(948, 625.94635, -104.19146, -80.16160,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(948, 625.94598, -84.48155, -80.16160,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2894, 639.77661, -80.11692, -79.49731,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1533, 628.09088, -108.87543, -77.27138,   0.00000, 0.00000, 131.41745);
	CreateDynamicObject(1533, 627.10388, -107.73789, -77.27138,   0.00000, 0.00000, 130.70224);
	CreateDynamicObject(1533, 677.27008, -96.03189, -78.45134,   0.00000, 0.00000, 270.31757);
	CreateDynamicObject(1533, 677.26648, -94.53089, -78.45134,   0.00000, 0.00000, 270.31757);
	CreateDynamicObject(10932, 663.30194, -84.45351, -87.21690,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19893, 635.49139, -110.13210, -79.04570,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19893, 637.77881, -110.13210, -79.04570,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19893, 639.93292, -110.13210, -79.04570,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19893, 642.20758, -110.13210, -79.04570,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2161, 643.73938, -112.89420, -79.95420,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2163, 642.43500, -112.89024, -79.94180,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2167, 640.67438, -112.90337, -79.91360,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2164, 639.76129, -112.93200, -79.91360,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2164, 638.00177, -112.93200, -79.91360,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2164, 636.23688, -112.93200, -79.91360,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2894, 635.50372, -109.62946, -79.02720,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2690, 650.27289, -96.42448, -77.90593,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2690, 650.35260, -95.35569, -77.90590,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(11710, 627.05072, -107.76850, -74.53440,   0.00000, 0.00000, 311.42770);
	CreateDynamicObject(19787, 632.13702, -111.41712, -76.54530,   10.00000, 0.00000, 90.00000);
	CreateDynamicObject(2207, 653.07501, -116.12050, -79.93630,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1714, 652.13806, -117.80235, -79.96360,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1727, 653.59235, -114.47710, -79.93870,   0.00000, 0.00000, -40.00000);
	CreateDynamicObject(1727, 650.25983, -114.90266, -79.93870,   0.00000, 0.00000, 40.00000);
	CreateDynamicObject(2164, 645.68073, -118.63110, -79.96960,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2164, 647.46039, -118.60310, -79.96960,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(14455, 655.47131, -118.72634, -78.47220,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2163, 649.20062, -118.63110, -79.03260,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2162, 649.22919, -118.63110, -79.94440,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1726, 645.00787, -111.66827, -79.88450,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1726, 647.96295, -109.71831, -79.88450,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(14455, 660.54919, -117.95032, -78.47220,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19787, 644.38165, -114.48017, -76.94630,   10.00000, 0.00000, 90.00000);
	CreateDynamicObject(1817, 646.96698, -111.21815, -79.95780,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2253, 651.13812, -116.80521, -78.92980,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19893, 652.12128, -116.42018, -79.16170,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2894, 651.55731, -116.14957, -79.13648,   0.00000, 0.00000, 34.48423);
	CreateDynamicObject(2252, 646.42346, -110.77756, -79.20530,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14834, 660.15924, -109.59376, -79.66059,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2260, 650.11292, -118.20687, -78.18145,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2265, 650.80261, -118.13276, -78.72180,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(2262, 654.21777, -118.19831, -78.38730,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(18084, 652.33887, -117.73293, -78.05145,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(18084, 659.55408, -111.44402, -78.05140,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2828, 653.05249, -116.69225, -79.17720,   0.00000, 0.00000, 125.71690);
	CreateDynamicObject(2239, 644.72064, -112.29126, -79.86860,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(1569, 651.62665, -82.71125, -79.97024,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2181, 644.87842, -73.66960, -79.95080,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2181, 649.31622, -73.66960, -79.95080,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2181, 653.84491, -73.66960, -79.95080,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2181, 658.16254, -73.66959, -79.95080,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, 639.93292, -111.45820, -79.94030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, 654.34387, -74.89170, -79.94030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, 649.80573, -74.89170, -79.94030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, 645.43958, -74.89170, -79.94030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2164, 647.23346, -73.20974, -79.94410,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2164, 651.63318, -73.20970, -79.94410,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2164, 656.09192, -73.20970, -79.94410,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2181, 656.09192, -77.26020, -79.95080,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2181, 651.63318, -77.26020, -79.95080,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2181, 647.23352, -77.26020, -79.95080,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, 656.58954, -78.36084, -79.94030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, 652.16882, -78.36080, -79.94030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1806, 647.68329, -78.36080, -79.94030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2200, 644.01807, -117.68100, -79.94760,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(2241, 632.39355, -112.72945, -79.46980,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14439, 643.75452, -95.91390, -69.81030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14439, 663.96240, -95.91393, -69.81030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14439, 633.82617, 80.82190, -69.81030,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19158, 631.93738, -95.46360, -83.49860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19158, 652.39771, -95.46357, -83.49860,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2613, 650.15491, -117.48537, -79.91563,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2257, 661.79547, -103.99761, -76.41720,   0.00000, 40.00000, -90.00000);
	CreateDynamicObject(2257, 661.80475, -86.74609, -76.41720,   0.00000, -40.00000, -90.00000);
	CreateDynamicObject(2258, 635.58722, -73.23920, -76.56381,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2256, 644.01782, -77.68080, -76.56380,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(2010, 629.73047, -109.00214, -79.91438,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2010, 626.11053, -80.70605, -79.91438,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2010, 643.97717, -82.38253, -79.91438,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2010, 662.51752, -106.49671, -78.38544,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2010, 662.41052, -85.78848, -78.38544,   0.00000, 0.00000, 0.00000);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/mycommand", cmdtext, true, 10) == 0)
	{
		SetPlayerPos(playerid, 1206.6467, -1314.2941, 796.7880);
		SetPlayerInterior(playerid, 3);
		SetPlayerVirtualWorld(playerid, 4);
		return 1;
	}
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

