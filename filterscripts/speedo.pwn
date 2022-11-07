// This is a comment
// uncomment the line below if you want to write a filterscript
//#define FILTERSCRIPT

#include <a_samp>
#include <zcmd>


#define METRES_TO_FEET(%0) \
	( ( %0 ) / 0.3047999995367040007042099189296 )

new PlayerText: vehName[MAX_PLAYERS];
new PlayerText: vehHealth[MAX_PLAYERS];
new PlayerText: vehKMH[MAX_PLAYERS];
new PlayerText: vehMPH[MAX_PLAYERS];
new PlayerText: vehAlt[MAX_PLAYERS];
new PlayerText: vehOdo[MAX_PLAYERS];
new PlayerText: vehFuel[MAX_PLAYERS];
new Float: DistanceFromStart [MAX_VEHICLES];
new Float: old_veh_pos [MAX_VEHICLES][3];

forward OnPlayerExitVehicle(playerid, vehicleid);
forward timer_update();
forward timer_refuel(playerid);
new isrefuelling[MAX_PLAYERS] = 0;
new fuel[MAX_VEHICLES];
new Engine[MAX_PLAYERS] = 0;

new aVehicleNames[212][] = {	// Vehicle Names - Betamaster
	{"Landstalker"},
	{"Bravura"},
	{"Buffalo"},
	{"Linerunner"},
	{"Perrenial"},
	{"Sentinel"},
	{"Dumper"},
	{"Firetruck"},
	{"Trashmaster"},
	{"Stretch"},
	{"Manana"},
	{"Infernus"},
	{"Voodoo"},
	{"Pony"},
	{"Mule"},
	{"Cheetah"},
	{"Ambulance"},
	{"Leviathan"},
	{"Moonbeam"},
	{"Esperanto"},
	{"Taxi"},
	{"Washington"},
	{"Bobcat"},
	{"Mr Whoopee"},
	{"BF Injection"},
	{"Hunter"},
	{"Premier"},
	{"Enforcer"},
	{"Securicar"},
	{"Banshee"},
	{"Predator"},
	{"Bus"},
	{"Rhino"},
	{"Barracks"},
	{"Hotknife"},
	{"Trailer 1"}, //artict1
	{"Previon"},
	{"Coach"},
	{"Cabbie"},
	{"Stallion"},
	{"Rumpo"},
	{"RC Bandit"},
	{"Romero"},
	{"Packer"},
	{"Monster"},
	{"Admiral"},
	{"Squalo"},
	{"Seasparrow"},
	{"Pizzaboy"},
	{"Tram"},
	{"Trailer 2"}, //artict2
	{"Turismo"},
	{"Speeder"},
	{"Reefer"},
	{"Tropic"},
	{"Flatbed"},
	{"Yankee"},
	{"Caddy"},
	{"Solair"},
	{"Berkley's RC Van"},
	{"Skimmer"},
	{"PCJ-600"},
	{"Faggio"},
	{"Freeway"},
	{"RC Baron"},
	{"RC Raider"},
	{"Glendale"},
	{"Oceanic"},
	{"Sanchez"},
	{"Sparrow"},
	{"Patriot"},
	{"Quad"},
	{"Coastguard"},
	{"Dinghy"},
	{"Hermes"},
	{"Sabre"},
	{"Rustler"},
	{"ZR-350"},
	{"Walton"},
	{"Regina"},
	{"Comet"},
	{"BMX"},
	{"Burrito"},
	{"Camper"},
	{"Marquis"},
	{"Baggage"},
	{"Dozer"},
	{"Maverick"},
	{"News Chopper"},
	{"Rancher"},
	{"FBI Rancher"},
	{"Virgo"},
	{"Greenwood"},
	{"Jetmax"},
	{"Hotring"},
	{"Sandking"},
	{"Blista Compact"},
	{"Police Maverick"},
	{"Boxville"},
	{"Benson"},
	{"Mesa"},
	{"RC Goblin"},
	{"Hotring Racer A"}, //hotrina
	{"Hotring Racer B"}, //hotrinb
	{"Bloodring Banger"},
	{"Rancher"},
	{"Super GT"},
	{"Elegant"},
	{"Journey"},
	{"Bike"},
	{"Mountain Bike"},
	{"Beagle"},
	{"Cropdust"},
	{"Stunt"},
	{"Tanker"}, //petro
	{"Roadtrain"},
	{"Nebula"},
	{"Majestic"},
	{"Buccaneer"},
	{"Shamal"},
	{"Hydra"},
	{"FCR-900"},
	{"NRG-500"},
	{"HPV1000"},
	{"Cement Truck"},
	{"Tow Truck"},
	{"Fortune"},
	{"Cadrona"},
	{"FBI Truck"},
	{"Willard"},
	{"Forklift"},
	{"Tractor"},
	{"Combine"},
	{"Feltzer"},
	{"Remington"},
	{"Slamvan"},
	{"Blade"},
	{"Freight"},
	{"Streak"},
	{"Vortex"},
	{"Vincent"},
	{"Bullet"},
	{"Clover"},
	{"Sadler"},
	{"Firetruck LA"}, //firela
	{"Hustler"},
	{"Intruder"},
	{"Primo"},
	{"Cargobob"},
	{"Tampa"},
	{"Sunrise"},
	{"Merit"},
	{"Utility"},
	{"Nevada"},
	{"Yosemite"},
	{"Windsor"},
	{"Monster A"}, //monstera
	{"Monster B"}, //monsterb
	{"Uranus"},
	{"Jester"},
	{"Sultan"},
	{"Stratum"},
	{"Elegy"},
	{"Raindance"},
	{"RC Tiger"},
	{"Flash"},
	{"Tahoma"},
	{"Savanna"},
	{"Bandito"},
	{"Freight Flat"}, //freiflat
	{"Streak Carriage"}, //streakc
	{"Kart"},
	{"Mower"},
	{"Duneride"},
	{"Sweeper"},
	{"Broadway"},
	{"Tornado"},
	{"AT-400"},
	{"DFT-30"},
	{"Huntley"},
	{"Stafford"},
	{"BF-400"},
	{"Newsvan"},
	{"Tug"},
	{"Trailer 3"}, //petrotr
	{"Emperor"},
	{"Wayfarer"},
	{"Euros"},
	{"Hotdog"},
	{"Club"},
	{"Freight Carriage"}, //freibox
	{"Trailer 3"}, //artict3
	{"Andromada"},
	{"Dodo"},
	{"RC Cam"},
	{"Launch"},
	{"LS Police Car"},// (LSPD)
	{"SF Police Car"},// (SFPD)
	{"LV Police Car"},// (LVPD)
	{"Police Ranger"},
	{"Picador"},
	{"S.W.A.T. Van"},
	{"Alpha"},
	{"Phoenix"},
	{"Glendale"},
	{"Sadler"},
	{"Luggage Trailer A"}, //bagboxa
	{"Luggage Trailer B"}, //bagboxb
	{"Stair Trailer"}, //tugstair
	{"Boxville"},
	{"Farm Plow"}, //farmtr1
	{"Utility Trailer"} //utiltr1
};

#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
	for(new i=0;i<MAX_VEHICLES;i++) {
	    fuel[i] = 100;  //setting fuel for vehicles
	}
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
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
		vehName[i] = CreatePlayerTextDraw(i, 55.799999, 436, "_");
		PlayerTextDrawLetterSize(i, vehName[i], 0.3, 0.999);
		PlayerTextDrawAlignment(i, vehName[i], 2);
		PlayerTextDrawColor(i, vehName[i], -1);
		PlayerTextDrawSetOutline(i, vehName[i], 1);
		PlayerTextDrawFont(i, vehName[i], 1);
		PlayerTextDrawUseBox(i, vehName[i], 1);
		PlayerTextDrawBoxColor(i, vehName[i], 0x1C1B1677);

		vehHealth[i] = CreatePlayerTextDraw(i, 135.799999, 436, "_");
		PlayerTextDrawBackgroundColor(i, vehHealth[i], 255);
		PlayerTextDrawFont(i, vehHealth[i], 1);
		PlayerTextDrawAlignment(i, vehHealth[i], 2);
		PlayerTextDrawLetterSize(i, vehHealth[i], 0.3, 0.999);
		PlayerTextDrawColor(i, vehHealth[i], -1);
		PlayerTextDrawSetOutline(i, vehHealth[i], 1);
		PlayerTextDrawSetProportional(i, vehHealth[i], 1);

		vehKMH[i] = CreatePlayerTextDraw(i, 200.799999, 436, "_");
		PlayerTextDrawLetterSize(i, vehKMH[i], 0.3, 0.999);
		PlayerTextDrawAlignment(i, vehKMH[i], 2);
		PlayerTextDrawColor(i, vehKMH[i], -1);
		PlayerTextDrawSetOutline(i, vehKMH[i], 1);
		PlayerTextDrawFont(i, vehKMH[i], 1);

		vehMPH[i] = CreatePlayerTextDraw(i, 245.799999, 436, "_");
		PlayerTextDrawLetterSize(i, vehMPH[i], 0.3, 0.999);
		PlayerTextDrawAlignment(i, vehMPH[i], 2);
		PlayerTextDrawColor(i, vehMPH[i], -1);
		PlayerTextDrawSetOutline(i, vehMPH[i], -1);
		PlayerTextDrawFont(i, vehMPH[i], 1);

		vehAlt[i] = CreatePlayerTextDraw(i, 310.799999, 436, "_");
		PlayerTextDrawLetterSize(i, vehAlt[i], 0.3, 0.999);
		PlayerTextDrawAlignment(i, vehAlt[i], 2);
		PlayerTextDrawColor(i, vehAlt[i], -1);
		PlayerTextDrawSetOutline(i, vehAlt[i], 1);
		PlayerTextDrawFont(i, vehAlt[i], 1);

		vehOdo[i] = CreatePlayerTextDraw(i, 415.799999, 436, "_");
		PlayerTextDrawLetterSize(i, vehOdo[i], 0.3, 0.999);
		PlayerTextDrawAlignment(i, vehOdo[i], 2);
		PlayerTextDrawColor(i, vehOdo[i], -1);
		PlayerTextDrawSetOutline(i, vehOdo[i], 1);
		PlayerTextDrawFont(i, vehOdo[i], 1);

		vehFuel[i] = CreatePlayerTextDraw(i, 505.799999, 436, "_");
		PlayerTextDrawLetterSize(i, vehFuel[i], 0.3, 0.999);
		PlayerTextDrawAlignment(i, vehFuel[i], 2);
		PlayerTextDrawColor(i, vehFuel[i], -1);
		PlayerTextDrawSetOutline(i, vehFuel[i], 1);
		PlayerTextDrawFont(i, vehFuel[i], 1);

	}
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			PlayerTextDrawDestroy(i, vehName[i]);
    		PlayerTextDrawDestroy(i, vehHealth[i]);
    		PlayerTextDrawDestroy(i, vehMPH[i]);
			PlayerTextDrawDestroy(i, vehKMH[i]);
			PlayerTextDrawDestroy(i, vehAlt[i]);
			PlayerTextDrawDestroy(i, vehOdo[i]);
			PlayerTextDrawDestroy(i, vehFuel[i]);
		}

	}
	return 1;
}

CMD:refuel(playerid, params[])
{
	if (!IsPlayerAtRefuelStation(playerid)) return SendClientMessage(playerid,0xFFC800FF,"You're not at an fuel station!");
    if (!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid,0xFFC800FF,"You are not in an vehicle!"); //if a player isnt in a vehicle, it stops here
    if (isrefuelling[playerid]) return SendClientMessage(playerid,0xFFC800FF,"You are already refuelling!"); //if a player is already refuelling, it stops here
    if (GetPlayerMoney(playerid) - 20 <0) return SendClientMessage(playerid,0xFFC800FF,"You dont have enough money!"); //if a player doesnt have $80 anymore, it stops here
    GivePlayerMoney(playerid, -20); //Sets the player's cash -$80
    SetCameraBehindPlayer(playerid); //Sets the camera behind the player (looks better because the player will be frozen for a few secs)
    isrefuelling[playerid] = 1; //setting isrefuelling to 1 so the player cant spam /refuel
    PlayerTextDrawSetString(playerid, vehFuel[playerid],"Refuelling..."); //changing textdraw to /refuel
    SetTimerEx("timer_refuel",4500,false,"i",playerid); //setting refueltimer
    return 1;
}

CMD:engine(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{

    new lights, alarm, doors, bonnet, boot, objective;
	new vehicleid = GetPlayerVehicleID(playerid);

	if (Engine[playerid] == 0)
	{
	SetVehicleParamsEx(vehicleid, 1, lights, alarm, doors, bonnet, boot, objective);
	SendClientMessage(playerid, -1, "Vehicle Engine {32CD32}ON");
	DistanceFromStart [GetPlayerVehicleID (playerid)] = 0.0;
	Engine[playerid] = 1;

	}else{
	SetVehicleParamsEx(vehicleid, 0, lights, alarm, doors, bonnet, boot, objective);
	SendClientMessage(playerid, -1, "Vehicle Engine {FF0000}OFF");
	Engine[playerid] = 0;
	}

	}else{
	SendClientMessage(playerid, -1, "You Need To Be Driving A Vehicle To Use This Command.");
	}

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
		// Do something here
		return 1;
	}
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	PlayerTextDrawShow(playerid, vehName[playerid]);
	PlayerTextDrawShow(playerid, vehKMH[playerid]);
	PlayerTextDrawShow(playerid, vehMPH[playerid]);
	PlayerTextDrawShow(playerid, vehHealth[playerid]);
	PlayerTextDrawShow(playerid, vehAlt[playerid]);
	PlayerTextDrawShow(playerid, vehOdo[playerid]);
	PlayerTextDrawShow(playerid, vehFuel[playerid]);
	return 1;
}


public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(oldstate == PLAYER_STATE_DRIVER && newstate != PLAYER_STATE_PASSENGER || oldstate == PLAYER_STATE_PASSENGER && newstate != PLAYER_STATE_DRIVER)
	{
		Engine[playerid] = 0;
	    PlayerTextDrawHide(playerid, vehName[playerid]);
		PlayerTextDrawHide(playerid, vehKMH[playerid]);
		PlayerTextDrawHide(playerid, vehMPH[playerid]);
		PlayerTextDrawHide(playerid, vehHealth[playerid]);
		PlayerTextDrawHide(playerid, vehAlt[playerid]);
        PlayerTextDrawHide(playerid, vehOdo[playerid]);
        PlayerTextDrawHide(playerid, vehFuel[playerid]);
	}
    new vName[50], vehid = GetPlayerVehicleID(playerid);
    if(oldstate-1 && newstate) PlayerTextDrawHide(playerid, vehName[playerid]);
	else if(newstate-1) PlayerTextDrawShow(playerid, vehName[playerid]), format(vName, sizeof(vName), "~p~%s", aVehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid)) - 400]), PlayerTextDrawSetString(playerid, vehName[playerid], vName);

	if(oldstate-1 && newstate) PlayerTextDrawHide(playerid, vehKMH[playerid]);
	else if(newstate-1) PlayerTextDrawShow(playerid, vehKMH[playerid]);

 	if(oldstate-1 && newstate) PlayerTextDrawHide(playerid, vehHealth[playerid]);
	else if(newstate-1) PlayerTextDrawShow(playerid, vehHealth[playerid]);

 	if(oldstate-1 && newstate) PlayerTextDrawHide(playerid, vehMPH[playerid]);
	else if(newstate-1) PlayerTextDrawShow(playerid, vehMPH[playerid]);

	if(oldstate-1 && newstate) PlayerTextDrawHide(playerid, vehAlt[playerid]);
	else if(newstate-1) PlayerTextDrawShow(playerid, vehAlt[playerid]);

	if(oldstate-1 && newstate) PlayerTextDrawHide(playerid, vehOdo[playerid]);
	else if(newstate-1) PlayerTextDrawShow(playerid, vehOdo[playerid]), GetVehiclePos (vehid, old_veh_pos [vehid][0], old_veh_pos [vehid][1], old_veh_pos [vehid][2]);

	if(oldstate-1 && newstate) PlayerTextDrawHide(playerid, vehFuel[playerid]);
	else if(newstate-1) PlayerTextDrawShow(playerid, vehFuel[playerid]);
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

forward SpeedometerRefresh();
public SpeedometerRefresh()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(IsPlayerInAnyVehicle(i))
			{
	    		// Getting the vehicles speed in km/h
     			new string[128],vehicleid,Float:speed_x,Float:speed_y,Float:speed_z,Float:final_speed,final_speed_int;
  				new altstring[25];
  				new Float: x, Float: y, Float: z;
  				vehicleid = GetPlayerVehicleID(i);
  				GetVehicleVelocity(vehicleid,speed_x,speed_y,speed_z);
				final_speed = floatsqroot(((speed_x*speed_x)+(speed_y*speed_y)))*180.00;
				final_speed_int = floatround(final_speed,floatround_round);// 175 KM/H In LV Police Car
				format(string, sizeof(string), "~b~KMH: ~w~%d", final_speed_int);
				PlayerTextDrawSetString(i, vehKMH[i], string);

				GetVehicleVelocity(vehicleid,speed_x,speed_y,speed_z);
				final_speed = floatsqroot(((speed_x*speed_x)+(speed_y*speed_y)))*112.00;
				final_speed_int = floatround(final_speed,floatround_round);// 109 MP/H In LV Police Car
				format(string, sizeof(string), "~b~MPH: ~w~%d", final_speed_int);
				PlayerTextDrawSetString(i, vehMPH[i], string);

				// Getting the vehicles health (shown as percentage)
				new vhealthtd[32], Float:vHealth;
        		GetVehicleHealth(GetPlayerVehicleID(i), vHealth);

        		format(vhealthtd, sizeof(vhealthtd), "~b~Health: ~w~%.1f%", vHealth / 10);
        		PlayerTextDrawSetString(i, vehHealth[i], vhealthtd);

				new vid;
				vid = GetPlayerVehicleID(i);
        		GetVehiclePos(vid, x, y, z);
        		format(altstring, sizeof(altstring), "~b~Altitude: ~w~ %d FT", floatround( METRES_TO_FEET( z ) ));
				PlayerTextDrawSetString(i, vehAlt[i], altstring);

				new Float: vehpos [3];
				GetVehiclePos (vid, vehpos [0], vehpos [1], vehpos [2]);
				vehpos [0] = vehpos [0] - old_veh_pos [vid][0];
				vehpos [1] = vehpos [1] - old_veh_pos [vid][1];
				vehpos [2] = vehpos [2] - old_veh_pos [vid][2];
				GetVehiclePos (vid, old_veh_pos [vid][0], old_veh_pos [vid][1], old_veh_pos [vid][2]);
				new Float: distance = floatsqroot (vehpos [0] * vehpos [0] + vehpos [1] * vehpos [1] + vehpos [2] * vehpos [2]);

				DistanceFromStart [vid] = DistanceFromStart [vid] + distance * 4 / 5;

				format(string, sizeof(string), "~b~Odometer: ~w~ %0.3f km", DistanceFromStart [vid] / 1000);
				PlayerTextDrawSetString(i, vehOdo[i], string);

				if(fuel[vid] >= 25)
				{
					format(string,sizeof string,"~b~Fuel: ~w~%i%", fuel[vid]);
					PlayerTextDrawSetString(i, vehFuel[i], string);
				}
				else
				{
				    format(string,sizeof string,"~b~Fuel: ~r~%i%", fuel[vid]);
					PlayerTextDrawSetString(i, vehFuel[i], string);
				}
			}
		}
	}
	return 1;
}

stock IsPlayerAtRefuelStation(playerid)
{
    if (IsPlayerInRangeOfPoint(playerid,10,655.5993,-564.9833,16.3359)) return 1; //Dilimore
    if (IsPlayerInRangeOfPoint(playerid,10,1940.2126,-1772.3523,13.3906)) return 1; //random
    return 0;
}

public timer_update()
{
    for(new i=0;i<MAX_PLAYERS;i++) {
        if (isrefuelling[i]) return 0;
        new vid = GetPlayerVehicleID(i);
        if (GetPlayerVehicleSeat(i) == 0)
		{
		    if(Engine[i] == 1)
		    {
				fuel[vid] = fuel[vid] - 1;
				if (fuel[vid]<1)
				{
					fuel[vid] = 0;
					new veh = GetPlayerVehicleID(i);
					new engine,lights,alarm,doors,bonnet,boot,objective;
					GetVehicleParamsEx(veh,engine,lights,alarm,doors,bonnet,boot,objective);
					SetVehicleParamsEx(veh,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
				    GameTextForPlayer(i,"~r~You are out of ~w~fuel~r~!",5000,4);
				    Engine[i] = 0;
				}
			}
		}
		new string[128];
		format(string,sizeof string,"~b~Fuel: ~w~%i%", fuel[vid]);
		PlayerTextDrawSetString(i, vehFuel[i],string);

	}
	return 1;
}

public timer_refuel(playerid)
{
	new string[50];
	new veh = GetPlayerVehicleID(playerid);
	if(Engine[playerid] == 1)
	{
		new engine,lights,alarm,doors,bonnet,boot,objective;
		GetVehicleParamsEx(veh,engine,lights,alarm,doors,bonnet,boot,objective);
		SetVehicleParamsEx(veh,VEHICLE_PARAMS_OFF,lights,alarm,doors,bonnet,boot,objective);
		Engine[playerid] = 0;
	}
	fuel[veh] = fuel[veh] = 100;
	isrefuelling[playerid] = 0;
	format(string,sizeof string,"~b~Fuel: ~w~%i%",fuel[veh]);
	PlayerTextDrawSetString(playerid, vehFuel[playerid],string);
}
