#define FILTERSCRIPT

#include <a_samp>
#include <zcmd>
#include <TextMenu>
#include <j_inventory_v2>

/* WEAPONRY */
#define DIALOG_SHOP 	 	0
#define DIALOG_HANDGUNS 	1
#define DIALOG_SMACHINE		2
#define DIALOG_SHOTGUNS   	3
#define DIALOG_A_RIFLES   	4
#define DIALOG_RIFLES     	5

/* AMMNUNITION */
#define DIALOG_ASHOP		6
#define DIALOG_AHANDGUNS	7
#define DIALOG_ASMACHINES	8
#define DIALOG_ASHOTGUNS	9
#define DIALOG_AARIFLES		10
#define DIALOG_ARIFLES 		11

#define COLOR_CHAT1 0xF9B7FFAA
#define COLOR_CHAT2 0xE6A9ECAA
#define COLOR_CHAT3 0xC38EC7AA
#define COLOR_CHAT4 0xD2B9D3AA
#define COLOR_CHAT5 0xC6AEC7AA

#define COLOR_GREY					0xB4B5B7FF
#define COLOR_PURPLE				0xC2A2DAAA
#define COLOR_LIGHTRED 				0xFF6347AA
#define INVALID_COLLISION_TIMER_ID  -1
#define COLLISION_TIMER_INTERVAL    100
#define HPLOSS                      2
#define NOBELT                      7

new hasEquipped[MAX_PLAYERS];
new weapequip[MAX_PLAYERS];

new playerCollisionTimerId[MAX_PLAYERS];
new Float:prevVehicleHealth[MAX_PLAYERS];
new SeatBelt[MAX_PLAYERS];

forward MotorBike(vehicleid);
forward PlayerCollisionChecker(playerid, vehicleid, Float:previous_hp);
forward OnPlayerCollide(playerid, vehicleid, Float:vehicle_health_loss);


// Items
/*new ItemArray [] [] =
{
	{1, "IMI Desert Eagle"},
	{2, "M1911"},
	{3, "Heckler & Koch MP5"},
	{4, "Tec-9"},
	{5, "Uzi"},
	{6, "Franchi SPAS-12"},
	{7, "Sawed-off Shotgun"},
	{8, "Winchester M1897"},
	{9, "M4A1 Carbine"},
	{10, "AK-47 Assault Rifle"},
	{11, "Arctic Warfare Magnum"},
	{12, "Remington 700"},

	{13, ".50 Action Express"},
	{14, ".45 ACP"},
	{15, "9x19mm Parabellum"},
	{16, "12-gauge Shell"},
	{17, "5.56x45mm NATO"},
	{18, "7.62x39mm"},
	{19, ".338 Lapua Magnum"},
	{20, ".223 Remington"}

};*/

forward public ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5);
public ProxDetector(Float:radi, playerid, string[],col1,col2,col3,col4,col5)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:posx, Float:posy, Float:posz;
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		//radi = 2.0; //Trigger Radius
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) && (GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i)))
			{
				GetPlayerPos(i, posx, posy, posz);
				tempposx = (oldposx -posx);
				tempposy = (oldposy -posy);
				tempposz = (oldposz -posz);
				//printf("DEBUG: X:%f Y:%f Z:%f",posx,posy,posz);
				if (((tempposx < radi/16) && (tempposx > -radi/16)) && ((tempposy < radi/16) && (tempposy > -radi/16)) && ((tempposz < radi/16) && (tempposz > -radi/16)))
				{
					SendClientMessage(i, col1, string);
				}
				else if (((tempposx < radi/8) && (tempposx > -radi/8)) && ((tempposy < radi/8) && (tempposy > -radi/8)) && ((tempposz < radi/8) && (tempposz > -radi/8)))
				{
					SendClientMessage(i, col2, string);
				}
				else if (((tempposx < radi/4) && (tempposx > -radi/4)) && ((tempposy < radi/4) && (tempposy > -radi/4)) && ((tempposz < radi/4) && (tempposz > -radi/4)))
				{
					SendClientMessage(i, col3, string);
				}
				else if (((tempposx < radi/2) && (tempposx > -radi/2)) && ((tempposy < radi/2) && (tempposy > -radi/2)) && ((tempposz < radi/2) && (tempposz > -radi/2)))
				{
					SendClientMessage(i, col4, string);
				}
				else if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
				{
					SendClientMessage(i, col5, string);
				}
			}
		}
	}//not connected
	return 1;
}

stock PlayerAction(playerid, string[])
{
	SetPlayerChatBubble(playerid, string, COLOR_CHAT1, 20.0, 2000);
	ProxDetector(30.0, playerid, string, COLOR_CHAT1,COLOR_CHAT2,COLOR_CHAT3,COLOR_CHAT4,COLOR_CHAT5);
	return 1;
}

stock PlayerName(playerid)
{

	new
		sz_playerName[MAX_PLAYER_NAME],
		i_pos;

	GetPlayerName(playerid, sz_playerName, MAX_PLAYER_NAME);
	while ((i_pos = strfind(sz_playerName, "_", false, i_pos)) != -1) sz_playerName[i_pos] = ' ';
	return sz_playerName;
}

public OnPlayerUseItem(playerid,ItemName[])
{
	if(!strcmp(ItemName,"IMI Desert Eagle",true))
	{
		SetPlayerEmptyWeapon(playerid, 24);
		SendClientMessage(playerid, -1, "You have equipped your IMI Desert Eagle. Don't forget to load it with .50 Action Express ammunition");
		new string[50];
		format(string, sizeof(string), "%s has equipped an empty weapon.",PlayerName(playerid));
		PlayerAction(playerid, string);
		RemoveItem(playerid, "IMI Desert Eagle", 1);
	}
	if(!strcmp(ItemName,"M1911",true))
	{
		SetPlayerEmptyWeapon(playerid, 22);
		SendClientMessage(playerid, -1, "You have equipped your M1911. Don't forget to load it with .45 ACP ammunition");
		new string[50];
		format(string, sizeof(string), "%s has equipped an empty weapon.",PlayerName(playerid));
		PlayerAction(playerid, string);
		RemoveItem(playerid, "M1911", 1);
	}
	if(!strcmp(ItemName,"Heckler & Koch MP5",true))
	{
		SetPlayerEmptyWeapon(playerid, 29);
		SendClientMessage(playerid, -1, "You have equipped your Heckler & Koch MP5. Don't forget to load it with 9x19mm Parabellum ammunition");
		new string[50];
		format(string, sizeof(string), "%s has equipped an empty weapon.",PlayerName(playerid));
		PlayerAction(playerid, string);
		RemoveItem(playerid, "Heckler & Koch MP5", 1);
	}
	if(!strcmp(ItemName,"Tec-9",true))
	{
		SetPlayerEmptyWeapon(playerid, 32);
		SendClientMessage(playerid, -1, "You have equipped your Tec-9. Don't forget to load it with 9x19mm Parabellum ammunition");
		new string[50];
		format(string, sizeof(string), "%s has equipped an empty weapon.",PlayerName(playerid));
		PlayerAction(playerid, string);
		RemoveItem(playerid, "Tec-9", 1);
	}
	if(!strcmp(ItemName,"Uzi",true))
	{
		SetPlayerEmptyWeapon(playerid, 28);
		SendClientMessage(playerid, -1, "You have equipped your Uzi. Don't forget to load it with 9x19mm Parabellum ammunition");
		new string[50];
		format(string, sizeof(string), "%s has equipped an empty weapon.",PlayerName(playerid));
		PlayerAction(playerid, string);
		RemoveItem(playerid, "Uzi", 1);
	}
	if(!strcmp(ItemName,"SPAS-12",true))
	{
		SetPlayerEmptyWeapon(playerid, 27);
		SendClientMessage(playerid, -1, "You have equipped your Franchi SPAS-12. Don't forget to load it with 12 gauge shells");
		new string[50];
		format(string, sizeof(string), "%s has equipped an empty weapon.",PlayerName(playerid));
		PlayerAction(playerid, string);
		RemoveItem(playerid, "SPAS-12", 1);
	}
	if(!strcmp(ItemName,"Winchester M1897",true))
	{
		SetPlayerEmptyWeapon(playerid, 25);
		SendClientMessage(playerid, -1, "You have equipped your Winchester M1897. Don't forget to load it with 12 gauge shells");
		new string[50];
		format(string, sizeof(string), "%s has equipped an empty weapon.",PlayerName(playerid));
		PlayerAction(playerid, string);
		RemoveItem(playerid, "Winchester M1897", 1);
	}
	if(!strcmp(ItemName,"Sawed-off Shotgun",true))
	{
		SetPlayerEmptyWeapon(playerid, 26);
		SendClientMessage(playerid, -1, "You have equipped your Sawed-off Shotgun. Don't forget to load it with 12 gauge shells");
		new string[50];
		format(string, sizeof(string), "%s has equipped an empty weapon.",PlayerName(playerid));
		PlayerAction(playerid, string);
		RemoveItem(playerid, "Sawed-off Shotgun", 1);
	}
	if(!strcmp(ItemName,"M4A1 Carbine",true))
	{
		SetPlayerEmptyWeapon(playerid, 31);
		SendClientMessage(playerid, -1, "You have equipped your M4A1 Carbine. Don't forget to load it with 5.56x45mm NATO ammunition");
		new string[50];
		format(string, sizeof(string), "%s has equipped an empty weapon.",PlayerName(playerid));
		PlayerAction(playerid, string);
		RemoveItem(playerid, "M4A1 Carbine", 1);
	}
	if(!strcmp(ItemName,"Ak-47 Assault Rifle",true))
	{
		SetPlayerEmptyWeapon(playerid, 30);
		SendClientMessage(playerid, -1, "You have equipped your AK-47 Assault Rifle. Don't forget to load it with 7.62x39mm ammunition");
		new string[50];
		format(string, sizeof(string), "%s has equipped an empty weapon.",PlayerName(playerid));
		PlayerAction(playerid, string);
		RemoveItem(playerid, "Ak-47 Assault Rifle", 1);
	}
	if(!strcmp(ItemName,"Arctic Warfare Magnum",true))
	{
		SetPlayerEmptyWeapon(playerid, 34);
		SendClientMessage(playerid, -1, "You have equipped your Arctic Warfare Magnum. Don't forget to load it with .338 Lapua Magnum ammunition");
		new string[50];
		format(string, sizeof(string), "%s has equipped an empty weapon.",PlayerName(playerid));
		PlayerAction(playerid, string);
		RemoveItem(playerid, "Arctic Warfare Magnum", 1);
	}
	if(!strcmp(ItemName,"Remington 700",true))
	{
		SetPlayerEmptyWeapon(playerid, 33);
		SendClientMessage(playerid, -1, "You have equipped your Remington 700. Don't forget to load it with .223 Remington ammunition");
		new string[50];
		format(string, sizeof(string), "%s has equipped an empty weapon.",PlayerName(playerid));
		PlayerAction(playerid, string);
		RemoveItem(playerid, "Remington 700", 1);
	}


	if(!strcmp(ItemName,".50 Action Express",true))
	{
		if(hasEquipped[playerid] == 1 && weapequip[playerid] == 24)
		{
			SendClientMessage(playerid, -1, "You have loaded your IMI Desert Eagle with 10 rounds of .50 Action Express ammunition.");
			new string[50];
			format(string, sizeof(string), "%s has loaded his empty weapon with ammunition.", PlayerName(playerid));
			PlayerAction(playerid, string);
			RemoveItem(playerid, ".50 Action Express", 1);
			GivePlayerWeapon(playerid, weapequip[playerid], 10);
		}
		else return ERRORMSG(playerid, "You're not equipped with a compatible weapon to use this item.");
	}
	if(!strcmp(ItemName,".45 ACP",true))
	{
		if(hasEquipped[playerid] == 1 && weapequip[playerid] == 22)
		{
			SendClientMessage(playerid, -1, "You have loaded your M1911 with 10 rounds of .45 ACP ammunition.");
			new string[50];
			format(string, sizeof(string), "%s has loaded his empty weapon with ammunition.", PlayerName(playerid));
			PlayerAction(playerid, string);
			RemoveItem(playerid, ".45 ACP", 1);
			GivePlayerWeapon(playerid, weapequip[playerid], 10);
		}
		else return ERRORMSG(playerid, "You're not equipped with a compatible weapon to use this item.");
	}
	if(!strcmp(ItemName,"9x19mm Parabellum",true))
	{
		if(hasEquipped[playerid] == 1 && weapequip[playerid] ==  29)
		{
			SendClientMessage(playerid, -1, "You have loaded your Heckler & Koch MP5 with a magazine of 30 9x19mm Parabellum ammunition.");
			new string[50];
			format(string, sizeof(string), "%s has loaded his empty weapon with ammunition.", PlayerName(playerid));
			PlayerAction(playerid, string);
			RemoveItem(playerid, "9x19mm Parabellum", 1);
			GivePlayerWeapon(playerid, weapequip[playerid], 30);
		}
		else if(hasEquipped[playerid] == 1 && weapequip[playerid] ==  28)
		{
			SendClientMessage(playerid, -1, "You have loaded your Uzi with a magazine of 30 9x19mm Parabellum ammunition.");
			new string[50];
			format(string, sizeof(string), "%s has loaded his empty weapon with ammunition.", PlayerName(playerid));
			PlayerAction(playerid, string);
			RemoveItem(playerid, "9x19mm Parabellum", 1);
			GivePlayerWeapon(playerid, weapequip[playerid], 30);
		}
		else if(hasEquipped[playerid] == 1 && weapequip[playerid] ==  32)
		{
			SendClientMessage(playerid, -1, "You have loaded your Tec-9 with a magazine of 30 9x19mm Parabellum ammunition.");
			new string[50];
			format(string, sizeof(string), "%s has loaded his empty weapon with ammunition.", PlayerName(playerid));
			PlayerAction(playerid, string);
			RemoveItem(playerid, "9x19mm Parabellum", 1);
			GivePlayerWeapon(playerid, weapequip[playerid], 30);
		}
		else return ERRORMSG(playerid, "You're not equipped with a compatible weapon to use this item.");
	}
	if(!strcmp(ItemName,"12 gauge shell",true))
	{
		if(hasEquipped[playerid] == 1 && weapequip[playerid] == 27)
		{
			SendClientMessage(playerid, -1, "You have loaded your Franchi SPAS 12 with 14 shells of 12 gauge ammunition.");
			new string[50];
			format(string, sizeof(string), "%s has loaded his empty weapon with ammunition.", PlayerName(playerid));
			PlayerAction(playerid, string);
			RemoveItem(playerid, "12 gauge shell", 1);
			GivePlayerWeapon(playerid, weapequip[playerid], 14);
		}
		if(hasEquipped[playerid] == 1 && weapequip[playerid] == 26)
		{
			SendClientMessage(playerid, -1, "You have loaded your Sawed-off Shotgun with 14 shells of 12 gauge ammunition.");
			new string[50];
			format(string, sizeof(string), "%s has loaded his empty weapon with ammunition.", PlayerName(playerid));
			PlayerAction(playerid, string);
			RemoveItem(playerid, "12 gauge shell", 1);
			GivePlayerWeapon(playerid, weapequip[playerid], 14);
		}
		if(hasEquipped[playerid] == 1 && weapequip[playerid] == 25)
		{
			SendClientMessage(playerid, -1, "You have loaded your Winchester M1897 with 14 shells of 12 gauge ammunition.");
			new string[50];
			format(string, sizeof(string), "%s has loaded his empty weapon with ammunition.", PlayerName(playerid));
			PlayerAction(playerid, string);
			RemoveItem(playerid, "12 gauge shell", 1);
			GivePlayerWeapon(playerid, weapequip[playerid], 14);
		}
		else return ERRORMSG(playerid, "You're not equipped with a compatible weapon to use this item.");
	}
	if(!strcmp(ItemName,"5.56x45mm NATO",true))
	{
		if(hasEquipped[playerid] == 1 && weapequip[playerid] == 31)
		{
			SendClientMessage(playerid, -1, "You have loaded your M4A1 Carbine with a magazine of 50 5.56x45mm NATO ammunition.");
			new string[50];
			format(string, sizeof(string), "%s has loaded his empty weapon with ammunition.", PlayerName(playerid));
			PlayerAction(playerid, string);
			RemoveItem(playerid, "5.56x45mm NATO", 1);
			GivePlayerWeapon(playerid, weapequip[playerid], 50);
		}
		else return ERRORMSG(playerid, "You're not equipped with a compatible weapon to use this item.");
	}
	if(!strcmp(ItemName,"7.62x39mm",true))
	{
		if(hasEquipped[playerid] == 1 && weapequip[playerid] == 30)
		{
			SendClientMessage(playerid, -1, "You have loaded your Ak47 Assault Rifle with a magazine of 50 7.62x39mm ammunition.");
			new string[50];
			format(string, sizeof(string), "%s has loaded his empty weapon with ammunition.", PlayerName(playerid));
			PlayerAction(playerid, string);
			RemoveItem(playerid, "7.62x39mm", 1);
			GivePlayerWeapon(playerid, weapequip[playerid], 50);
		}
		else return ERRORMSG(playerid, "You're not equipped with a compatible weapon to use this item.");
	}
	if(!strcmp(ItemName,".338 Lapua Magnum",true))
	{
		if(hasEquipped[playerid] == 1 && weapequip[playerid] == 34)
		{
			SendClientMessage(playerid, -1, "You have loaded your Arctic Warfare Magnum with 10 rounds of .338 Lapua Magnum ammunition.");
			new string[50];
			format(string, sizeof(string), "%s has loaded his empty weapon with ammunition.", PlayerName(playerid));
			PlayerAction(playerid, string);
			RemoveItem(playerid, ".338 Lapua Magnum", 1);
			GivePlayerWeapon(playerid, weapequip[playerid], 10);
		}
		else return ERRORMSG(playerid, "You're not equipped with a compatible weapon to use this item.");
	}
	if(!strcmp(ItemName,".223 Remington",true))
	{
		if(hasEquipped[playerid] == 1 && weapequip[playerid] == 33)
		{
			SendClientMessage(playerid, -1, "You have loaded your Remington 700 with 10 rounds of .223 Remington ammunition.");
			new string[50];
			format(string, sizeof(string), "%s has loaded his empty weapon with ammunition.", PlayerName(playerid));
			PlayerAction(playerid, string);
			RemoveItem(playerid, ".223 Remington", 1);
			GivePlayerWeapon(playerid, weapequip[playerid], 10);
		}
		else return ERRORMSG(playerid, "You're not equipped with a compatible weapon to use this item.");
	}

	return 0;
}

stock SetPlayerEmptyWeapon( playerid, weaponid )
{
	SetPlayerAttachedObject(playerid,1,GetWeaponModel(weaponid),6);
	weapequip[playerid] = weaponid;
	return 1;
}

stock GetWeaponModel(weaponid)
{
	switch(weaponid)
	{
	    case 1: return 331;
		case 2..8: return weaponid+331;
      	case 9:  return 341;
		case 10..15: return weaponid+311;
		case 16..18: return weaponid+326;
		case 22..29: return weaponid+324;
		case 30,31: return weaponid+325;
		case 32: return 372;
		case 33..45: return weaponid+324;
		case 46:return 371;
	}
	return 0;
}

public OnFilterScriptInit()
{
	print("\n--------------------------------------");
	print(" Weapon Shop with Textdraw Menus");
	print("--------------------------------------\n");
	
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	hasEquipped[playerid] = 1;
	if(playerCollisionTimerId[playerid] != INVALID_COLLISION_TIMER_ID)//ensures the timers are killed properly
	{
	    KillTimer(playerCollisionTimerId[playerid]);
	    playerCollisionTimerId[playerid] = INVALID_COLLISION_TIMER_ID;
	}
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	SaveInventory(playerid);
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	InventoryOnDialogResponse(playerid, dialogid, response, inputtext);
	return 0;
}

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid)
{
    return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
	{
		if(playerCollisionTimerId[playerid] != INVALID_COLLISION_TIMER_ID)
		    KillTimer(playerCollisionTimerId[playerid]);// extra security purposes

		new vehicle_id = GetPlayerVehicleID(playerid);
		new Float:vehicle_health;

		GetVehicleHealth(vehicle_id, vehicle_health);
		prevVehicleHealth[playerid] = vehicle_health; // to prevent possible glitches

		// start timer, player is certainly in a vehicle
		playerCollisionTimerId[playerid] = SetTimerEx("PlayerCollisionChecker", COLLISION_TIMER_INTERVAL, true, "ii", playerid, vehicle_id);
	}
	if( (newstate != oldstate) && (oldstate == PLAYER_STATE_DRIVER || oldstate == PLAYER_STATE_PASSENGER) )
	{
	    // player is definitely out of vehicle (but was in vehicle previously)
	    KillTimer(playerCollisionTimerId[playerid]);
	    playerCollisionTimerId[playerid] = INVALID_COLLISION_TIMER_ID;
	    SeatBelt[playerid]=0;
	    new string[100];
	    format(string, 100, "%s unbuckled his seat belt", PlayerName(playerid));
		PlayerAction(playerid,string);
	}
	return 1;
}

public MotorBike(vehicleid)
{	new pModel=GetVehicleModel(vehicleid);
    if(pModel==581 || pModel==509 || pModel==481 || pModel==462 || pModel==521 || pModel==463 || pModel==510 || pModel==522 || pModel==461 || pModel==448 || pModel==471 || pModel==468 || pModel==586) { return 1; }
    return 0;
}

public PlayerCollisionChecker(playerid, vehicleid)
{
	new Float:newhp;
	GetVehicleHealth(vehicleid, newhp);

	if(prevVehicleHealth[playerid] - newhp > 0)
	{
	    OnPlayerCollide(playerid, vehicleid, prevVehicleHealth[playerid] - newhp);
	}
    prevVehicleHealth[playerid] = newhp;
	return 1;
}

public OnPlayerCollide(playerid, vehicleid, Float:vehicle_health_loss)
{
	new Float:pHP;
	if(SeatBelt[playerid]==0)
	{
		GetPlayerHealth(playerid,pHP);
		return SetPlayerHealth(playerid,pHP-NOBELT);
	}
	else if(SeatBelt[playerid]==1)
	{
	    GetPlayerHealth(playerid,pHP);
	    return SetPlayerHealth(playerid,pHP-HPLOSS);
	}
	return 1;
}

public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
    if(response)
    {
        printf("%f,%f,%f,%f,%f,%f,%f,%f,%f",fOffsetX,fOffsetY,fOffsetZ,fRotX,fRotY,fRotZ,fScaleX,fScaleY,fScaleZ);
    }
    else
    {
        SendClientMessage(playerid,-1, "Attached object edition not saved.");
    }
    return 1;
}

CMD:sb(playerid)
{
	if(MotorBike(GetPlayerVehicleID(playerid))){ return SendClientMessage(playerid,COLOR_GREY,"Bikes don't have seat belts you dummy!"); }
	new string[180];
	if(SeatBelt[playerid] == 0)
	{
		format(string, sizeof(string), "%s buckled his seat belt", PlayerName(playerid));
	    SeatBelt[playerid]=1;
	    PlayerAction(playerid,string);
	}
	else if(SeatBelt[playerid] == 1)
	{
	    format(string, sizeof(string), "%s unbuckled his seat belt", PlayerName(playerid));
	    SeatBelt[playerid]=0;
	    PlayerAction(playerid,string);
	}
	return 1;
}

CMD:inv(playerid)
{
	ShowInventory(playerid);
	return 1;
}

CMD:buygun(playerid)
{
	static Shop[450],bool:form = true;
	if(form)
	{
	   	strcat(Shop," ~r~1-~w~ Handguns~n~");
	   	strcat(Shop," ~r~2-~w~ Sub-Machine Guns~n~");
	   	strcat(Shop," ~r~3-~w~ Shotguns~n~");
	   	strcat(Shop," ~r~4-~w~ Assault Rifles~n~");
	   	strcat(Shop," ~r~5-~w~ Rifles~n~");
	    form = false;
	}
	TextMenuShowForPlayer(playerid,DIALOG_SHOP,"Weapon Shop",Shop,5);
	return 1;
}

CMD:buyammo(playerid)
{
	static Shop[450],bool:form = true;
	if(form)
	{
	   	strcat(Shop," ~r~1-~w~ Handgun Ammunitions~n~");
	   	strcat(Shop," ~r~2-~w~ Sub-Machine Gun Ammunitions~n~");
	   	strcat(Shop," ~r~3-~w~ Shotgun Shells~n~");
	   	strcat(Shop," ~r~4-~w~ Assault Rifle Ammunitions~n~");
	   	strcat(Shop," ~r~5-~w~ Rifle Ammunitions~n~");
	    form = false;
	}
	TextMenuShowForPlayer(playerid,DIALOG_ASHOP,"Ammunition Shop",Shop,5);
	return 1;
}

public OnTextMenuResponse(playerid,menuid,listitem)
{		
	if(menuid == DIALOG_SHOP)
	{
		switch(listitem)
		{
			case DIALOG_HANDGUNS:
			{
				static Handguns[350],bool:form = true;
				if(form)
				{
				   	strcat(Handguns," ~r~1-~w~ IMI Desert Eagle (~g~$1500~w~)~n~"); //Deagle
				   	strcat(Handguns," ~r~3-~w~ M1911 (~g~$500~w~)"); //Colt45
				   	form = false;
				}
			    TextMenuShowForPlayer(playerid,DIALOG_HANDGUNS,"Handguns",Handguns,2);
			}
			case DIALOG_SMACHINE:
			{
				static sMachines[350],bool:form = true;
				if(form)
				{
				   	strcat(sMachines," ~r~1-~w~ Heckler & Koch MP5 (~g~$3000~w~)~n~"); //MP5
				   	strcat(sMachines," ~r~2-~w~ Tec-9 (~g~$1500~w~)~n~"); //Tec9
				   	strcat(sMachines," ~r~3-~w~ UZI (~g~$1500~w~)"); //Uzi
				   	form = false;
				}
			    TextMenuShowForPlayer(playerid,DIALOG_SMACHINE,"Sub-Machine Guns",sMachines,3);
			}
			case DIALOG_SHOTGUNS:
			{
				static Shotguns[350],bool:form = true;
				if(form)
				{
				   	strcat(Shotguns," ~r~1-~w~ Franchi SPAS-12 (~g~$5000~w~)~n~"); //SPAS12
				   	strcat(Shotguns," ~r~2-~w~ Sawed-off Shotgun (~g~$3500~w~)~n~");
				   	strcat(Shotguns," ~r~3-~w~ Winchester M1897 (~g~$2500~w~)"); //Shotgun
				   	form = false;
				}
			    TextMenuShowForPlayer(playerid,DIALOG_SHOTGUNS,"Shotguns",Shotguns,3);
			}
			case DIALOG_A_RIFLES:
			{
				static AssaultRifles[220],bool:form = true;
				if(form)
				{
				   	strcat(AssaultRifles," ~r~1-~w~ M4 Carbine (~g~$4000~w~)~n~"); //M4
				   	strcat(AssaultRifles," ~r~2-~w~ AK-47 (~g~$3500~w~)~n~"); //AK
				   	form = false;
				}
			    TextMenuShowForPlayer(playerid,DIALOG_A_RIFLES,"Assault Rifles",AssaultRifles,2);
			}
			case DIALOG_RIFLES:
			{
				static Rifles[220],bool:rif = true;
				if(rif)
				{
				   	strcat(Rifles," ~r~1-~w~ Arctic Warfare Magnum (~g~$4500~w~)~n~"); //Sniper
				   	strcat(Rifles," ~r~2-~w~ Remington 700 (~g~$2000~w~)~n~"); //Country Rifle
				   	rif = false;
				}
				TextMenuShowForPlayer(playerid,DIALOG_RIFLES,"Rifles",Rifles,2);
			}
 		}
	}
 	if(menuid == DIALOG_HANDGUNS)
 	{
 	    switch(listitem)
 	    {
			case 1:
			{
			    if(GetPlayerMoney(playerid) < 1500) return ERRORMSG(playerid,"You need $1500 in order to buy this weapon.");
				GivePlayerMoney(playerid,-1500);
				AddItem(playerid, "IMI Desert Eagle", 1);
			}
			case 2:
			{
			    if(GetPlayerMoney(playerid) < 500) return ERRORMSG(playerid,"You need $500 in order to buy this weapon.");
				GivePlayerMoney(playerid,-500);
				AddItem(playerid, "M1911", 1);
			}
 	    }
 	}
 	if(menuid == DIALOG_SMACHINE)
 	{
 	    switch(listitem)
 	    {
			case 1:
			{
			    if(GetPlayerMoney(playerid) < 3000) return ERRORMSG(playerid,"You need $3000 in order to buy this weapon.");
				GivePlayerMoney(playerid,-3000);
				AddItem(playerid, "Heckler & Koch MP5", 1);
			}
			case 2:
			{
			    if(GetPlayerMoney(playerid) < 1500) return ERRORMSG(playerid,"You need $1500 in order to buy this weapon.");
				GivePlayerMoney(playerid,-1500);
				AddItem(playerid, "Tec-9", 1);
			}
			case 3:
			{
			    if(GetPlayerMoney(playerid) < 1500) return ERRORMSG(playerid,"You need $1500 in order to buy this weapon.");
				GivePlayerMoney(playerid,-1500);
				AddItem(playerid, "Uzi", 1);
			}
 	    }
 	}
 	if(menuid == DIALOG_SHOTGUNS)
 	{
 	    switch(listitem)
 	    {
			case 1:
			{
			    if(GetPlayerMoney(playerid) < 5000) return ERRORMSG(playerid,"You need $5000 in order to buy this weapon.");
				GivePlayerMoney(playerid,-5000);
				AddItem(playerid, "SPAS-12", 1);
			}
			case 2:
			{
			    if(GetPlayerMoney(playerid) < 3500) return ERRORMSG(playerid,"You need $3500 in order to buy this weapon.");
				GivePlayerMoney(playerid,-3500);
				AddItem(playerid, "Sawed-off Shotgun", 1);
			}
			case 3:
			{
			    if(GetPlayerMoney(playerid) < 2500) return ERRORMSG(playerid,"You need $2500 in order to buy this weapon.");
				GivePlayerMoney(playerid,-2500);
				AddItem(playerid, "Winchester M1897", 1);
			}
 	    }
 	}
 	if(menuid == DIALOG_A_RIFLES)
 	{
 	    switch(listitem)
 	    {
			case 1:
			{
			    if(GetPlayerMoney(playerid) < 4000) return ERRORMSG(playerid,"You need $4000 in order to buy this weapon.");
				GivePlayerMoney(playerid,-4000);
				AddItem(playerid, "M4A1 Carbine", 1);
			}
			case 2:
			{
			    if(GetPlayerMoney(playerid) < 3500) return ERRORMSG(playerid,"You need $3500 in order to buy this weapon.");
				GivePlayerMoney(playerid,-3500);
				AddItem(playerid, "Ak-47 Assault Rifle", 1);
			}
 	    }
 	}
 	if(menuid == DIALOG_RIFLES)
 	{
 	    switch(listitem)
 	    {
			case 1:
			{
			    if(GetPlayerMoney(playerid) < 4500) return ERRORMSG(playerid,"You need $4500 in order to buy this weapon.");
				GivePlayerMoney(playerid,-4500);
				AddItem(playerid, "Arctic Warfare Magnum", 1);
			}
			case 2:
			{
			    if(GetPlayerMoney(playerid) < 2000) return ERRORMSG(playerid,"You need $2000 in order to buy this weapon.");
				GivePlayerMoney(playerid,-2000);
				AddItem(playerid, "Remington 700", 1);
			}
 	    }
 	}

 	if(menuid == DIALOG_ASHOP)
	{
		switch(listitem)
		{
			case DIALOG_HANDGUNS:
			{
				static Handguns[350],bool:form = true;
				if(form)
				{
				   	strcat(Handguns," ~r~1-~w~ .50 Action Express (~g~$35~w~/10 bullets)~n~"); //Deagle
				   	strcat(Handguns," ~r~3-~w~ .45 ACP (~g~$20~w~/10 bullets)"); //Colt45
				   	form = false;
				}
			    TextMenuShowForPlayer(playerid,DIALOG_AHANDGUNS,"Handguns",Handguns,2);
			}
			case DIALOG_SMACHINE:
			{
				static sMachines[350],bool:form = true;
				if(form)
				{
				   	strcat(sMachines," ~r~1-~w~ 9x19mm Parabellum (~g~$60~w~/30 bullets)"); //SMachines
				   	form = false;
				}
			    TextMenuShowForPlayer(playerid,DIALOG_ASMACHINES,"Sub-Machine Guns",sMachines,1);
			}
			case DIALOG_SHOTGUNS:
			{
				static Shotguns[350],bool:form = true;
				if(form)
				{
				   	strcat(Shotguns," ~r~1-~w~ 12-gauge (~g~$70~w~/14 shells)"); //SPAS12
				   	form = false;
				}
			    TextMenuShowForPlayer(playerid,DIALOG_ASHOTGUNS,"Shotguns",Shotguns,1);
			}
			case DIALOG_A_RIFLES:
			{
				static AssaultRifles[220],bool:form = true;
				if(form)
				{
				   	strcat(AssaultRifles," ~r~1-~w~ 5.56x45mm NATO (~g~$150~w~/50 bullets)~n~"); //M4
				   	strcat(AssaultRifles," ~r~2-~w~ 7.62x39mm (~g~$150~w~/50 bullets)"); //AK
				   	form = false;
				}
			    TextMenuShowForPlayer(playerid,DIALOG_AARIFLES,"Assault Rifles",AssaultRifles,2);
			}
			case DIALOG_RIFLES:
			{
				static Rifles[220],bool:rif = true;
				if(rif)
				{
				   	strcat(Rifles," ~r~1-~w~ .338 Lapua Magnum (~g~100~w~/10 bullets)~n~"); //Sniper
				   	strcat(Rifles," ~r~2-~w~ .223 Remington (~g~$80~w~/10 bullets)~n~"); //Country Rifle
				   	rif = false;
				}
				TextMenuShowForPlayer(playerid,DIALOG_ARIFLES,"Rifles",Rifles,2);
			}
 		}
	}
 	if(menuid == DIALOG_AHANDGUNS)
 	{
 	    switch(listitem)
 	    {
			case 1:
			{
			    if(GetPlayerMoney(playerid) < 36) return ERRORMSG(playerid,"You need $35 in order to buy this ammunition pack.");
				GivePlayerMoney(playerid,-35);
				AddItem(playerid, ".50 Action Express", 1);
			}
			case 2:
			{
			    if(GetPlayerMoney(playerid) < 36) return ERRORMSG(playerid,"You need $20 in order to buy this ammunition pack.");
				GivePlayerMoney(playerid,-20);
				AddItem(playerid, ".45 ACP", 1);
			}
 	    }
 	}
 	if(menuid == DIALOG_ASMACHINES)
 	{
 	    switch(listitem)
 	    {
			case 1:
			{
			    if(GetPlayerMoney(playerid) < 61) return ERRORMSG(playerid,"You need $60 in order to buy this ammunition pack.");
				GivePlayerMoney(playerid,-60);
				AddItem(playerid, "9x19mm Parabellum", 1);
			}
 	    }
 	}
 	if(menuid == DIALOG_ASHOTGUNS)
 	{
 	    switch(listitem)
 	    {
			case 1:
			{
			    if(GetPlayerMoney(playerid) < 71) return ERRORMSG(playerid,"You need $70 in order to buy this ammunition pack.");
				GivePlayerMoney(playerid,-70);
				AddItem(playerid, "12 gauge shell", 1);
			}
 	    }
 	}
 	if(menuid == DIALOG_AARIFLES)
 	{
 	    switch(listitem)
 	    {
			case 1:
			{
			    if(GetPlayerMoney(playerid) < 151) return ERRORMSG(playerid,"You need $150 in order to buy this ammunition pack.");
				GivePlayerMoney(playerid,-150);
				AddItem(playerid, "5.56x45mm NATO", 1);
			}
			case 2:
			{
			    if(GetPlayerMoney(playerid) < 151) return ERRORMSG(playerid,"You need $150 in order to buy this ammunition pack.");
				GivePlayerMoney(playerid,-150);
				AddItem(playerid, "7.62X39mm", 1);
			}
 	    }
 	}
 	if(menuid == DIALOG_ARIFLES)
 	{
 	    switch(listitem)
 	    {
			case 1:
			{
			    if(GetPlayerMoney(playerid) < 101) return ERRORMSG(playerid,"You need $100 in order to buy this ammunition pack.");
				GivePlayerMoney(playerid,-100);
				AddItem(playerid, ".338 Lapua Magnum", 1);
			}
			case 2:
			{
			    if(GetPlayerMoney(playerid) < 81) return ERRORMSG(playerid,"You need $80 in order to buy this ammunition pack.");
				GivePlayerMoney(playerid,-80);
				AddItem(playerid, ".223 Remington", 1);
			}
 	    }
 	}
  	return 1;
}

stock ERRORMSG(playerid,msg[])
{
	new error[128];
	format(error,128,"{FF0000}[ERROR]:{FFFFFF} %s",msg);
	return SendClientMessage(playerid,-1,error);
}

stock sscanf(string[], format[], {Float,_}:...)
{
	new name[MAX_PLAYER_NAME];
	#if defined isnull
		if (isnull(string))
	#else
		if (string[0] == 0 || (string[0] == 1 && string[1] == 0))
	#endif
		{
			return format[0];
		}
	#pragma tabsize 4
	new
		formatPos = 0,
		stringPos = 0,
		paramPos = 2,
		paramCount = numargs(),
		delim = ' ';
	while (string[stringPos] && string[stringPos] <= ' ')
	{
		stringPos+= 1;
	}
	while (paramPos < paramCount && string[stringPos])
	{
		switch (format[formatPos++])
		{
			case '\0':
			{
				return 0;
			}
			case 'i', 'd':
			{
				new
					neg = 1,
					num = 0,
					ch = string[stringPos];
				if (ch == '-')
				{
					neg = -1;
					ch = string[++stringPos];
				}
				do
				{
					stringPos+= 1;
					if ('0' <= ch <= '9')
					{
						num = (num * 10) + (ch - '0');
					}
					else
					{
						return -1;
					}
				}
				while ((ch = string[stringPos]) > ' ' && ch != delim);
				setarg(paramPos, 0, num * neg);
			}
			case 'h', 'x':
			{
				new
					num = 0,
					ch = string[stringPos];
				do
				{
					stringPos+= 1;
					switch (ch)
					{
						case 'x', 'X':
						{
							num = 0;
							continue;
						}
						case '0' .. '9':
						{
							num = (num << 4) | (ch - '0');
						}
						case 'a' .. 'f':
						{
							num = (num << 4) | (ch - ('a' - 10));
						}
						case 'A' .. 'F':
						{
							num = (num << 4) | (ch - ('A' - 10));
						}
						default:
						{
							return -1;
						}
					}
				}
				while ((ch = string[stringPos]) > ' ' && ch != delim);
				setarg(paramPos, 0, num);
			}
			case 'c':
			{
				setarg(paramPos, 0, string[stringPos++]);
			}
			case 'f':
			{
				setarg(paramPos, 0, _:floatstr(string[stringPos]));
			}
			case 'p':
			{
				delim = format[formatPos++];
				continue;
			}
			case '\'':
			{
				new
					end = formatPos - 1,
					ch;
				while ((ch = format[++end]) && ch != '\'') {}
				if (!ch)
				{
					return -1;
				}
				format[end] = '\0';
				if ((ch = strfind(string, format[formatPos], false, stringPos)) == -1)
				{
					if (format[end + 1])
					{
						return -1;
					}
					return 0;
				}
				format[end] = '\'';
				stringPos = ch + (end - formatPos);
				formatPos = end + 1;
			}
			case 'u':
			{
				new
					end = stringPos - 1,
					id = 0,
					bool:num = true,
					ch;
				while ((ch = string[++end]) && ch != delim)
				{
					if (num)
					{
						if ('0' <= ch <= '9')
						{
							id = (id * 10) + (ch - '0');
						}
						else
						{
							num = false;
						}
					}
				}
				if (num && IsPlayerConnected(id))
				{
					setarg(paramPos, 0, id);
				}
				else
				{
					#if !defined foreach
						#define foreach(%1,%2) for (new %2 = 0; %2 < MAX_PLAYERS; %2++) if (IsPlayerConnected(%2))
						#define __SSCANF_FOREACH__
					#endif
					string[end] = '\0';
					num = false;
					id = end - stringPos;
					foreach (Player, playerid)
					{
						GetPlayerName(playerid, name, sizeof (name));
						if (!strcmp(name, string[stringPos], true, id))
						{
							setarg(paramPos, 0, playerid);
							num = true;
							break;
						}
					}
					if (!num)
					{
						setarg(paramPos, 0, INVALID_PLAYER_ID);
					}
					string[end] = ch;
					#if defined __SSCANF_FOREACH__
						#undef foreach
						#undef __SSCANF_FOREACH__
					#endif
				}
				stringPos = end;
			}
			case 's', 'z':
			{
				new
					i = 0,
					ch;
				if (format[formatPos])
				{
					while ((ch = string[stringPos++]) && ch != delim)
					{
						setarg(paramPos, i++, ch);
					}
					if (!i)
					{
						return -1;
					}
				}
				else
				{
					while ((ch = string[stringPos++]))
					{
						setarg(paramPos, i++, ch);
					}
				}
				stringPos -= 1;
				setarg(paramPos, i, '\0');
			}
			default:
			{
				continue;
			}
		}
		while (string[stringPos] && string[stringPos] != delim && string[stringPos] > ' ')
		{
			stringPos+= 1;
		}
		while (string[stringPos] && (string[stringPos] == delim || string[stringPos] <= ' '))
		{
			stringPos+= 1;
		}
		paramPos+= 1;
	}
	do
	{
		if ((delim = format[formatPos++]) > ' ')
		{
			if (delim == '\'')
			{
				while ((delim = format[formatPos++]) && delim != '\'') {}
			}
			else if (delim != 'z')
			{
				return delim;
			}
		}
	}
	while (delim > ' ');
	return 0;
}
