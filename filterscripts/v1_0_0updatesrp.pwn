#define FILTERSCRIPT

#include <a_samp>
#include <zcmd>

#define COLOR_CHAT1 0xC2A2DAFF
#define COLOR_CHAT2 0xC2A2DAFF
#define COLOR_CHAT3 0xC2A2DAFF
#define COLOR_CHAT4 0xC2A2DAFF
#define COLOR_CHAT5 0xC2A2DAFF

#define COLOR_GREY					0xB4B5B7FF
#define COLOR_PURPLE				0xC2A2DAAA
#define COLOR_LIGHTRED 				0xFF6347AA
#define INVALID_COLLISION_TIMER_ID  -1
#define COLLISION_TIMER_INTERVAL    100
#define HPLOSS                      2
#define NOBELT                      7

new masked[MAX_PLAYERS];
new maskid[MAX_PLAYERS];
new oldpname[MAX_PLAYERS][MAX_PLAYER_NAME];

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
	if(masked[playerid])
	{
	    new string[128];
	    format(string, sizeof(string), "Masked_%d: %s", maskid[playerid], text);
	    ProxDetector(20.0, playerid, string, -1,-1,-1,-1,-1);
	    return 0;
	}
	return 1;
}

public OnPlayerConnect(playerid)
{
	if(playerCollisionTimerId[playerid] != INVALID_COLLISION_TIMER_ID)//ensures the timers are killed properly
	{
	    KillTimer(playerCollisionTimerId[playerid]);
	    playerCollisionTimerId[playerid] = INVALID_COLLISION_TIMER_ID;
	}
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	if(masked[playerid] == 1)
	{
		SetPlayerName(playerid, oldpname[playerid]);
		printf("%s", oldpname[playerid]);
	}
	return 1;
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

CMD:mask(playerid, params[])
{
	if(masked[playerid] == 0)
	{
		new string[128], maskname[20];
		masked[playerid] = 1;
		maskid[playerid] = random(200);
		format(string, sizeof(string), "%s puts on his mask.", PlayerName(playerid));
		ProxDetector(20.0, playerid, string, COLOR_CHAT1,COLOR_CHAT1,COLOR_CHAT1,COLOR_CHAT1,COLOR_CHAT1);
        format(maskname, sizeof(maskname), "Masked_%d", maskid[playerid]);
        GetPlayerName(playerid, oldpname[playerid], MAX_PLAYER_NAME);
        SetPlayerName(playerid, maskname);
		for(new i = 0; i < MAX_PLAYERS; i++) ShowPlayerNameTagForPlayer(i, playerid, false);
	}
	else
	{
		masked[playerid] = 0;
		new string[128];
		format(string, sizeof(string), "Masked_%d takes off his mask.", maskid[playerid]);
		ProxDetector(20.0, playerid, string, COLOR_CHAT1,COLOR_CHAT1,COLOR_CHAT1,COLOR_CHAT1,COLOR_CHAT1);
		SetPlayerName(playerid, oldpname[playerid]);
		for(new a = 0; a < MAX_PLAYERS; a++) ShowPlayerNameTagForPlayer(a, playerid, true);
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
