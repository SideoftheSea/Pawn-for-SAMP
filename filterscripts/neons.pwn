//-_-_-_-_-_-_-_-_-_-_-_-_This is my original release!!-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
//-_-_-_-_-_-_-_-_-_-_-_-_-_- {PakistaniBaba} _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
//-_-_-_-_-_-_-_-_-_-_-_-_- Nick : {Qasim BadShah}-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_
//-_-_-_-_-_-_-_-_-_-_-_-Mail ID : QASIM.TANOLI.353@FACEBOK.COM-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
//-_-_-_-_-_-_-_-_-_-_-_-_-_-Dont Take Credits :@-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

#define FILTERSCRIPT
#define COLOR_WHITE 0xFFFFFFA//A
#define COLOR_REALRED 0xFF6347AA
#define COLOR_LIGHTRED 0xFF0606FF
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_LIGHTGREEN 0x9ACD32AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_ORANGE          0xF97804FF
#define COLOR_RED 0xFF808085
#include <a_samp>
#define NEON 1 
#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
    print("\n Neon System \n");
	return 1;
}

#endif
public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/neons", cmdtext, true, 10) == 0)
	{
		if(IsPlayerInAnyVehicle(playerid))
 		{
  			if(GetPlayerState(playerid) == PLAYER_STATE_PASSENGER)
			{
				SendClientMessage(playerid, COLOR_WHITE, "You are not the driver");
				return 1;
			}
			ShowPlayerDialog(playerid, NEON, DIALOG_STYLE_LIST, "PB {FFFFFF}Neon Shop {{336600}Pakistani{FFFFFF}Baba{FFFFFF}}", "Blue\nRed\nGreen\nWhite\nPink\nYellow\nPolice Strobe\nInterior Lights\nBack Neon\nFront Neon\nUndercover Roof Light\nRemove All Neon","Add","Close");
		}
		else
		{
		    SendClientMessage(playerid, COLOR_WHITE, "You are not in a vehicle");
		}
		return 1;
	}
	return 0;
}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == NEON)
	{
	if(response)
	{
		if(listitem == 0)
		{
			//blue
			SetPVarInt(playerid, "Status", 1);
			SetPVarInt(playerid, "neon", CreateObject(18648,0,0,0,0,0,0));
			SetPVarInt(playerid, "neon1", CreateObject(18648,0,0,0,0,0,0));
			AttachObjectToVehicle(GetPVarInt(playerid, "neon"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
			AttachObjectToVehicle(GetPVarInt(playerid, "neon1"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_YELLOW, "PB Neon Status : Neon Installed");
		}
		if(listitem == 1)
		{
			//red
			SetPVarInt(playerid, "Status", 1);
			SetPVarInt(playerid, "neon2", CreateObject(18647,0,0,0,0,0,0));
			SetPVarInt(playerid, "neon3", CreateObject(18647,0,0,0,0,0,0));
			AttachObjectToVehicle(GetPVarInt(playerid, "neon2"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
			AttachObjectToVehicle(GetPVarInt(playerid, "neon3"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_YELLOW, "PB Neon Status : Neon Installed");
		}
		if(listitem == 2)

		{
			//green
			SetPVarInt(playerid, "Status", 1);
			SetPVarInt(playerid, "neon4", CreateObject(18649,0,0,0,0,0,0));
			SetPVarInt(playerid, "neon5", CreateObject(18649,0,0,0,0,0,0));
			AttachObjectToVehicle(GetPVarInt(playerid, "neon4"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
			AttachObjectToVehicle(GetPVarInt(playerid, "neon5"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_YELLOW, "PB Neon Status : Neon Installed");
		}
		if(listitem == 3)

		{
			//white
			SetPVarInt(playerid, "Status", 1);
			SetPVarInt(playerid, "neon6", CreateObject(18652,0,0,0,0,0,0));
			SetPVarInt(playerid, "neon7", CreateObject(18652,0,0,0,0,0,0));
			AttachObjectToVehicle(GetPVarInt(playerid, "neon6"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
			AttachObjectToVehicle(GetPVarInt(playerid, "neon7"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_YELLOW, "PB Neon Status : Neon Installed");
		}
		if(listitem == 4)
		{
			//pink
			SetPVarInt(playerid, "Status", 1);
			SetPVarInt(playerid, "neon8", CreateObject(18651,0,0,0,0,0,0));
			SetPVarInt(playerid, "neon9", CreateObject(18651,0,0,0,0,0,0));
			AttachObjectToVehicle(GetPVarInt(playerid, "neon8"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
			AttachObjectToVehicle(GetPVarInt(playerid, "neon9"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_YELLOW, "PB Neon Status : Neon Installed");
		}
		if(listitem == 5)
  		{
			//yellow
			SetPVarInt(playerid, "Status", 1);
			SetPVarInt(playerid, "neon10", CreateObject(18650,0,0,0,0,0,0));
			SetPVarInt(playerid, "neon11", CreateObject(18650,0,0,0,0,0,0));
			AttachObjectToVehicle(GetPVarInt(playerid, "neon10"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
			AttachObjectToVehicle(GetPVarInt(playerid, "neon11"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_YELLOW, "PB Neon Status : Neon Installed");
		}
		if(listitem == 6)
		{
			//police
			SetPVarInt(playerid, "Status", 1);
			SetPVarInt(playerid, "neon12", CreateObject(18646,0,0,0,0,0,0));
			SetPVarInt(playerid, "neon13", CreateObject(18646,0,0,0,0,0,0));
			AttachObjectToVehicle(GetPVarInt(playerid, "neon12"), GetPlayerVehicleID(playerid), -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
			AttachObjectToVehicle(GetPVarInt(playerid, "neon13"), GetPlayerVehicleID(playerid), 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
			SendClientMessage(playerid, COLOR_YELLOW, "PB Neon Status : Neon Installed");
		}
		if(listitem == 7)
		{
			SetPVarInt(playerid, "Status", 1);
			SetPVarInt(playerid, "interior", CreateObject(18646,0,0,0,0,0,0));
			SetPVarInt(playerid, "interior1", CreateObject(18646,0,0,0,0,0,0));
			AttachObjectToVehicle(GetPVarInt(playerid, "interior"), GetPlayerVehicleID(playerid), 0, -0.0, 0, 2.0, 2.0, 3.0);
			AttachObjectToVehicle(GetPVarInt(playerid, "interior1"), GetPlayerVehicleID(playerid), 0, -0.0, 0, 2.0, 2.0, 3.0);
			SendClientMessage(playerid, COLOR_YELLOW, "PB Neon Status : Interior Lights Installed");
		}
		if(listitem == 8)
		{
			//back
			SetPVarInt(playerid, "Status", 1);
			SetPVarInt(playerid, "back", CreateObject(18646,0,0,0,0,0,0));
			SetPVarInt(playerid, "back1", CreateObject(18646,0,0,0,0,0,0));
			AttachObjectToVehicle(GetPVarInt(playerid, "back"), GetPlayerVehicleID(playerid), -0.0, -1.5, -1, 2.0, 2.0, 3.0);
			AttachObjectToVehicle(GetPVarInt(playerid, "back1"), GetPlayerVehicleID(playerid), -0.0, -1.5, -1, 2.0, 2.0, 3.0);
			SendClientMessage(playerid, COLOR_YELLOW, "PB Neon Status : Back Neon Installed");
		}
		if(listitem == 9)
		{
			//front
			SetPVarInt(playerid, "Status", 1);
			SetPVarInt(playerid, "front", CreateObject(18646,0,0,0,0,0,0));
			SetPVarInt(playerid, "front1", CreateObject(18646,0,0,0,0,0,0));
			AttachObjectToVehicle(GetPVarInt(playerid, "front"), GetPlayerVehicleID(playerid), -0.0, 1.5, -0.6, 2.0, 2.0, 3.0);
			AttachObjectToVehicle(GetPVarInt(playerid, "front1"), GetPlayerVehicleID(playerid), -0.0, 1.5, -0.6, 2.0, 2.0, 3.0);
			SendClientMessage(playerid, COLOR_YELLOW, "PB Neon Status : Front Neon Installed");
		}
		if(listitem == 10)
		{
			//undercover
			SetPVarInt(playerid, "Status", 1);
			SetPVarInt(playerid, "undercover", CreateObject(18646,0,0,0,0,0,0));
			SetPVarInt(playerid, "undercover1", CreateObject(18646,0,0,0,0,0,0));
			AttachObjectToVehicle(GetPVarInt(playerid, "undercover"), GetPlayerVehicleID(playerid), -0.5, -0.2, 0.8, 2.0, 2.0, 3.0);
			AttachObjectToVehicle(GetPVarInt(playerid, "undercover1"), GetPlayerVehicleID(playerid), -0.5, -0.2, 0.8, 2.0, 2.0, 3.0);
			SendClientMessage(playerid, COLOR_YELLOW, "PB Neon Status : Undercover lights Installed");
		}
		if(listitem == 11)
		{
			//remove neon
			DestroyObject(GetPVarInt(playerid, "neon"));
			DeletePVar(playerid, "Status");
			DestroyObject(GetPVarInt(playerid, "neon1"));
			DeletePVar(playerid, "Status");
			DestroyObject(GetPVarInt(playerid, "neon2"));
			DeletePVar(playerid, "Status");
			DestroyObject(GetPVarInt(playerid, "neon3"));
			DeletePVar(playerid, "Status");
			DestroyObject(GetPVarInt(playerid, "neon4"));
			DeletePVar(playerid, "Status");
			DestroyObject(GetPVarInt(playerid, "neon5"));
			DeletePVar(playerid, "Status");
			DestroyObject(GetPVarInt(playerid, "neon6"));
			DeletePVar(playerid, "Status");
			DestroyObject(GetPVarInt(playerid, "neon7"));
			DeletePVar(playerid, "Status");
			DestroyObject(GetPVarInt(playerid, "neon8"));
			DeletePVar(playerid, "Status");
			DestroyObject(GetPVarInt(playerid, "neon9"));
			DeletePVar(playerid, "Status");
			DestroyObject(GetPVarInt(playerid, "neon10"));
			DeletePVar(playerid, "Status");
			DestroyObject(GetPVarInt(playerid, "neon11"));
			DeletePVar(playerid, "Status");
			DestroyObject(GetPVarInt(playerid, "neon12"));
			DeletePVar(playerid, "Status");
			DestroyObject(GetPVarInt(playerid, "neon13"));
			DeletePVar(playerid, "Status");
			DestroyObject(GetPVarInt(playerid, "interior"));
			DeletePVar(playerid, "Status");
			DestroyObject(GetPVarInt(playerid, "interior1"));
			DeletePVar(playerid, "Status");
			DestroyObject(GetPVarInt(playerid, "back"));
			DeletePVar(playerid, "Status");
			DestroyObject(GetPVarInt(playerid, "back1"));
			DeletePVar(playerid, "Status");
			DestroyObject(GetPVarInt(playerid, "front"));
			DeletePVar(playerid, "Status");
			DestroyObject(GetPVarInt(playerid, "front1"));
			DeletePVar(playerid, "Status");
			DestroyObject(GetPVarInt(playerid, "undercover"));
			DeletePVar(playerid, "Status");
			DestroyObject(GetPVarInt(playerid, "undercover1"));
			DeletePVar(playerid, "Status");
	        GameTextForPlayer(playerid, "~g~Neon was deleted from your vehicle",3500,5);
			SendClientMessage(playerid, COLOR_LIGHTRED, "PB Neon Status : Neon Un-Installed");
		}
		}
 	}
	return 1;
}
