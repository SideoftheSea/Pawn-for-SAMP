/*--------------------------------------------------------------------------------------*\
!		RentSystem © by Hauke Marquardt aka |-|auke				 					 !
!----------------------------------------------------------------------------------------!
! You are not allowed to delete the Compyrights and change the names of the variables.   !
! Du darfst die Copyrights nicht entfernen, und die Namen der Variablen nicht ändern !	 !
!----------------------------------------------------------------------------------------!
!		  Please visit my Site at: http://www.1000zet.net			 					 !
!	      Bitte besuch´doch mal meine Seite: http://www.1000zet.net			 			 !
-----------------------------------------------------------------------------------------!
!																						 !
!		 Support and Informations: hauke.marquardt@1000zet.net                           !
!	        Support und Informationen:  hauke.marquardt@1000zet.net                      !
\*--------------------------------------------------------------------------------------*/
#include <a_samp>
/***************************** Einstellungen *******************************/
//================================================
// Gib hier die Koordinaten des Kaufpickups ein
new Float:RentPlaceX=1297.5469;
new Float:RentPlaceY=-1865.2034;
new Float:RentPlaceZ=13.5469;
//================================================
// Die Zeit, in Minuten, für die man ein Auto / Motorrad mietet.
new RentMinutes= 10;
//================================================
// Wenn beim Pickupaufnehmen das Mietmenü kommen soll,
// "true" einsetzten. Ansonsten "false"
//================================================
// Mit "//" auskommentieren, wenn man Autos stehlen darf.
//================================================
// "//" Wegmachen, wenn man Autos stehlen darf.
// #define AllowStealing
//================================================
// Bei Liveansicht "true" eingeben. Wenn man eine Liste
// möchte, "false" einsetzten.
new bool:LiveView= true;
//================================================
// Wenn das Auto beim Anfang den Mietens abgeschlossen sein
// soll, setze "true" ein. Wenn nicht, benutze "false"
new bool:LockCheck= false;
/***************************************************************************/
forward OrderCar(playerid,CarNumber,CarColor);
forward CarCountDown();
forward PLiveView(playerid,Nummer,CarColor);
forward PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z);
new PlayerCarID[MAX_PLAYERS]=999;
new PlayerCar[MAX_PLAYERS];
new PlayerCount[MAX_PLAYERS];
new ChoosenColor[MAX_PLAYERS];
new bool:RentedCar[MAX_PLAYERS];
new bool:CarLocked[MAX_PLAYERS];
new ShowCar[MAX_PLAYERS];
new PlayerShowCar[MAX_PLAYERS];
new IsLiveViewing[MAX_PLAYERS]=0;
new Text:CarRent[MAX_PLAYERS];
new RentedCars=0;
new CarSpawn= 1;
new Pickup;
new Float:ShowCarSpawnX=745.7913,Float:ShowCarSpawnY=-1373.2169,Float:ShowCarSpawnZ=25.5163,Float:ShowCarSpawnRot=208.1557;
new Float:CarSpawns[4][4]=
{
	{757.2670,-1333.6682,13.3656,178.7771},
	{752.1066,-1333.6682,13.3649,180.8010},
	{746.8506,-1333.6682,13.3671,179.9579},
	{741.2214,-1333.6682,13.3660,180.5529}
};
new Cars[11][256]=
{
    {604,500,"Glendale"},      		// Glendale Shit
    {421,700,"Washington"},     	// Washington
    {419,850,"Esperanto"},      	// Esperanto
    {551,950,"Merit"},          	// Merit
    {410,950,"Manana"},				// Manana
	{401,890,"Bravura"},			// Bravura
	{405,1200,"Sentinel"},			// Sentinel
	{439,1200,"Stallion"},          // Stallion
	{560,1300,"Sultan"},     		// Sultan
	{533,1350,"Felitzer"},          // Felitzer
	{480,1400,"Comet"}              // Comet
};
new SportCars[8][256]=
{
	{489,1000,"Club"},              // Club
    {496,1400,"Blista Compact"},	// Blista Compact
    {576,1500,"Tornado"},           // Tornado
    {475,1850,"Sabre"},         	// Sabre
    {429,2000,"Bangshee Banger"},	// Bangshee Banger
    {402,3000,"Buffalo"},	       	// Buffalo
    {451,3200,"Turismo"},      	 	// Turismo
	{411,3400,"Infernus"}       	// Infernus
};
new Bikes[7][256]=
{
	{481,50,"BMX"},                 // BMX
	{462,300,"Fraggio"},            // Fraggio
	{468,450,"Sanchez"},            // Sanchez
	{461,600,"PCJ-600"},            // PCJ-600
	{463,650,"Freeway"},            // Freeway
	{522,800,"NRG 500"},            // NRG 500
	{586,1000,"Wayfarer"}           // Wayfarer
};

public OnFilterScriptInit()
{
	SetTimer("CarCountDown",60000,1);
	Pickup=CreatePickup(1210,1,RentPlaceX,RentPlaceY,RentPlaceZ);
	for(new i = 0;i<MAX_PLAYERS;i++)
	{
		CarRent[i] = TextDrawCreate(493.0,127.000000,"CarRent");
		TextDrawAlignment(CarRent[i],0);
		TextDrawBackgroundColor(CarRent[i],0x000000FF);
		TextDrawFont(CarRent[i],1);
		TextDrawLetterSize(CarRent[i],0.23,1.4);
		TextDrawColor(CarRent[i],0x2F5426FF);
		TextDrawSetProportional(CarRent[i],1);
		TextDrawSetShadow(CarRent[i],1);
		TextDrawSetOutline(CarRent[i],1);
	}
	return 1;
}
public OnPlayerConnect(playerid)
{
    SetPlayerMapIcon(playerid, 98, RentPlaceX, RentPlaceY, RentPlaceZ, 55, 0);
	return 1;
}
public OnPlayerDisconnect(playerid, reason)
{
	DestroyVehicle(PlayerCar[playerid]);
	PlayerCarID[playerid]=999;
	PlayerCar[playerid]=0;
	PlayerCount[playerid]=RentMinutes;
	ChoosenColor[playerid]=0;
	CarLocked[playerid]=true;
	RentedCars-=1;
	return 1;
}
public OnPlayerSpawn(playerid)
{
	PlayerCount[playerid]=RentMinutes;
	CarLocked[playerid]=LockCheck;
	return 1;
}
public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/lockcar", cmdtext, true, 10) == 0)
	{
		if(CarLocked[playerid] == false)
		{
			SendClientMessage(playerid,0xFFFF33FF,"Vehicle Locked");
			CarLocked[playerid] = true;
		}
		else
		{
			SendClientMessage(playerid,0xFFFF33FF,"Vehicle Unlocked");
			CarLocked[playerid] = false;
		}
		return 1;
	}
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	for(new ID=0;ID<MAX_PLAYERS;ID++)
	{
	    if(PlayerCarID[ID] == vehicleid && vehicleid != 999)
	    {
	        if(CarLocked[ID] == true)
	        {
				TogglePlayerControllable(playerid,0);
				TogglePlayerControllable(playerid,1);
	            new name[MAX_PLAYER_NAME],ErrorMessage[128];
	            GetPlayerName(ID,name,MAX_PLAYER_NAME);
	            format(ErrorMessage,128,"*INFO* This vehicle is being rented by %s",name);
	            SendClientMessage(playerid,0xCCCCCCFF,ErrorMessage);
			}
			else if(CarLocked[ID] == false)
			{
			    if(ID != playerid)
			    {
			   		new name[MAX_PLAYER_NAME],ErrorMessage[128];
	        		GetPlayerName(ID,name,MAX_PLAYER_NAME);
	        		format(ErrorMessage,128,"*INFO* You have stolen %s's rented car",name);
	        		SendClientMessage(playerid,0xCCCCCCFF,ErrorMessage);
				}
				else
			    {
			        new ErrorMessage[128];
	        		format(ErrorMessage,128,"*INFO* You only have %d minutes for this rented car.",PlayerCount[playerid]);
	        		SendClientMessage(playerid,0xCCCCCCFF,ErrorMessage);
			    }
			}
		}
	}
	return 1;
}
public OnPlayerPickUpPickup(playerid, pickupid)
{
	if(pickupid == Pickup)
	{
	    ShowPlayerDialog(playerid,900,DIALOG_STYLE_LIST,"Vehicle Colors","Black\nBlue\nRed\nGreen\nYellow\nPink\nGray\nLight Blue\nLight Red\nLight Green\nLight Gray\nWhite","Select","Cancel");
	}
	return 1;
}
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(IsLiveViewing[playerid]==1)
	    {
	        if(newkeys == KEY_LOOK_RIGHT || newkeys == KEY_ANALOG_RIGHT)
  				{
							new CAR=PlayerShowCar[playerid]+=1;
							new string[246];
							DestroyVehicle(ShowCar[playerid]);
							ShowCar[playerid]=CreateVehicle(Cars[CAR][0],ShowCarSpawnX,ShowCarSpawnY,ShowCarSpawnZ,ShowCarSpawnRot,ChoosenColor[playerid],ChoosenColor[playerid],-1);
		      				SetVehicleVirtualWorld(ShowCar[playerid],99+playerid);
		        			format(string,sizeof(string),"~r~===== RENTAL MENU =====~n~~y~Vehicle: ~w~%s~n~~g~Price: ~w~$%d/%dMin.~n~~n~~g~Numpad 4 and 6~n~Vehicle Changes~n~ENTER to buy~n~Tab to cancel",Cars[CAR][2],Cars[CAR][1],RentMinutes);
		                    TextDrawSetString(CarRent[playerid],string);
				}
            if(newkeys == KEY_LOOK_LEFT || newkeys == KEY_ANALOG_LEFT)
  				{
							new CAR=PlayerShowCar[playerid]-=1;
				    		new string[246];
				    		DestroyVehicle(ShowCar[playerid]);
							ShowCar[playerid]=CreateVehicle(Cars[CAR][0],ShowCarSpawnX,ShowCarSpawnY,ShowCarSpawnZ,ShowCarSpawnRot,ChoosenColor[playerid],ChoosenColor[playerid],-1);
		      				SetVehicleVirtualWorld(ShowCar[playerid],99+playerid);
		        			format(string,sizeof(string),"~r~===== RENTAL MENU =====~n~~y~Vehicle: ~w~%s~n~~g~Price: ~w~$%d/%dMin.~n~~n~~g~Numpad 4 and 6~n~Vehicle Changes~n~ENTER to buy~n~Tab to cancel",Cars[CAR][2],Cars[CAR][1],RentMinutes);
		                    TextDrawSetString(CarRent[playerid],string);
				}
            if(newkeys == 16)
	   		 	{
	   		 	    GivePlayerMoney(playerid,-Cars[PlayerShowCar[playerid]][1]);
	   		 	    SetCameraBehindPlayer(playerid);
	   		 	    SetPlayerVirtualWorld(playerid,0);
	   		 	    IsLiveViewing[playerid]=0;
	   		 	    TogglePlayerControllable(playerid,1);
	   		 	    DestroyVehicle(ShowCar[playerid]);
	   		 	    TextDrawHideForPlayer(playerid,CarRent[playerid]);
	   		 	    OrderCar(playerid,Cars[PlayerShowCar[playerid]][0],ChoosenColor[playerid]);
	   		 	    PlayerShowCar[playerid]=0;
				}
            if(newkeys == KEY_ACTION) //Tab
  				{
  		    		SetCameraBehindPlayer(playerid);
  		    		DestroyVehicle(ShowCar[playerid]);
					SetPlayerVirtualWorld(playerid,0);
					TextDrawHideForPlayer(playerid,CarRent[playerid]);
					TogglePlayerControllable(playerid,1);
					IsLiveViewing[playerid]=0;
	   		 	    PlayerShowCar[playerid]=0;
	   		 	    DestroyVehicle(ShowCar[playerid]);
	   		 	    SetPlayerPos(playerid,RentPlaceX,RentPlaceY,RentPlaceZ);
  				}
		}
	if(IsLiveViewing[playerid]==2)
	    {
	        if(newkeys == KEY_LOOK_RIGHT || newkeys == KEY_ANALOG_RIGHT)
  				{
							new CAR=PlayerShowCar[playerid]+=1;
							new string[246];
							DestroyVehicle(ShowCar[playerid]);
							ShowCar[playerid]=CreateVehicle(SportCars[CAR][0],ShowCarSpawnX,ShowCarSpawnY,ShowCarSpawnZ,ShowCarSpawnRot,ChoosenColor[playerid],ChoosenColor[playerid],-1);
		      				SetVehicleVirtualWorld(ShowCar[playerid],99+playerid);
		        			format(string,sizeof(string),"~r~===== RENTAL MENU =====~n~~y~Vehicle: ~w~%s~n~~g~Price: ~w~$%d/%dMin.~n~~n~~g~Numpad 4 and 6~n~Vehicle Changes~n~ENTER to buy~n~Tab to cancel",SportCars[CAR][2],SportCars[CAR][1],RentMinutes);
		                    TextDrawSetString(CarRent[playerid],string);
				}
            if(newkeys == KEY_LOOK_LEFT || newkeys == KEY_ANALOG_LEFT)
  				{
							new CAR=PlayerShowCar[playerid]-=1;
				    		new string[246];
				    		DestroyVehicle(ShowCar[playerid]);
							ShowCar[playerid]=CreateVehicle(SportCars[CAR][0],ShowCarSpawnX,ShowCarSpawnY,ShowCarSpawnZ,ShowCarSpawnRot,ChoosenColor[playerid],ChoosenColor[playerid],-1);
		      				SetVehicleVirtualWorld(ShowCar[playerid],99+playerid);
		        			format(string,sizeof(string),"~r~===== RENTAL MENU =====~n~~y~Vehicle: ~w~%s~n~~g~Price: ~w~$%d/%dMin.~n~~n~~g~Numpad 4 and 6~n~Vehicle Changes~n~ENTER to buy~n~Tab to cancel",SportCars[CAR][2],SportCars[CAR][1],RentMinutes);
		                    TextDrawSetString(CarRent[playerid],string);
				}
            if(newkeys == 16)
	   		 	{
	   		 	    GivePlayerMoney(playerid,-SportCars[PlayerShowCar[playerid]][1]);
	   		 	    SetCameraBehindPlayer(playerid);
	   		 	    SetPlayerVirtualWorld(playerid,0);
	   		 	    IsLiveViewing[playerid]=0;
	   		 	    TogglePlayerControllable(playerid,1);
	   		 	    DestroyVehicle(ShowCar[playerid]);
	   		 	    TextDrawHideForPlayer(playerid,CarRent[playerid]);
	   		 	    OrderCar(playerid,SportCars[PlayerShowCar[playerid]][0],ChoosenColor[playerid]);
	   		 	    PlayerShowCar[playerid]=0;
				}
            if(newkeys == KEY_ACTION) //Tab
  				{
  		    		SetCameraBehindPlayer(playerid);
  		    		DestroyVehicle(ShowCar[playerid]);
					SetPlayerVirtualWorld(playerid,0);
					TextDrawHideForPlayer(playerid,CarRent[playerid]);
					TogglePlayerControllable(playerid,1);
					IsLiveViewing[playerid]=0;
	   		 	    PlayerShowCar[playerid]=0;
	   		 	    DestroyVehicle(ShowCar[playerid]);
	   		 	    SetPlayerPos(playerid,RentPlaceX,RentPlaceY,RentPlaceZ);
  				}
		}
	if(IsLiveViewing[playerid]==3)
	    {
	        if(newkeys == KEY_LOOK_RIGHT || newkeys == KEY_ANALOG_RIGHT)
  				{
							new CAR=PlayerShowCar[playerid]+=1;
							new string[246];
							DestroyVehicle(ShowCar[playerid]);
							ShowCar[playerid]=CreateVehicle(Bikes[CAR][0],ShowCarSpawnX,ShowCarSpawnY,ShowCarSpawnZ,ShowCarSpawnRot,ChoosenColor[playerid],ChoosenColor[playerid],-1);
		      				SetVehicleVirtualWorld(ShowCar[playerid],99+playerid);
		        			format(string,sizeof(string),"~r~===== RENTAL MENU =====~n~~y~Vehicle: ~w~%s~n~~g~Price: ~w~$%d/%dMin.~n~~n~~g~Numpad 4 and 6~n~Vehicle Changes~n~ENTER to buy~n~Tab to cancel",Bikes[CAR][2],Bikes[CAR][1],RentMinutes);
		                    TextDrawSetString(CarRent[playerid],string);
				}
            if(newkeys == KEY_LOOK_LEFT || newkeys == KEY_ANALOG_LEFT)
  				{
							new CAR=PlayerShowCar[playerid]-=1;
				    		new string[246];
				    		DestroyVehicle(ShowCar[playerid]);
							ShowCar[playerid]=CreateVehicle(Bikes[CAR][0],ShowCarSpawnX,ShowCarSpawnY,ShowCarSpawnZ,ShowCarSpawnRot,ChoosenColor[playerid],ChoosenColor[playerid],-1);
		      				SetVehicleVirtualWorld(ShowCar[playerid],99+playerid);
		        			format(string,sizeof(string),"~r~===== RENTAL MENU =====~n~~y~Vehicle: ~w~%s~n~~g~Price: ~w~$%d/%dMin.~n~~n~~g~Numpad 4 and 6~n~Vehicle Changes~n~ENTER to buy~n~Tab to cancel",Bikes[CAR][2],Bikes[CAR][1],RentMinutes);
		                    TextDrawSetString(CarRent[playerid],string);
				}
            if(newkeys == 16)
	   		 	{
	   		 	    GivePlayerMoney(playerid,-Bikes[PlayerShowCar[playerid]][1]);
	   		 	    SetCameraBehindPlayer(playerid);
	   		 	    SetPlayerVirtualWorld(playerid,0);
	   		 	    IsLiveViewing[playerid]=0;
	   		 	    TogglePlayerControllable(playerid,1);
	   		 	    DestroyVehicle(ShowCar[playerid]);
	   		 	    TextDrawHideForPlayer(playerid,CarRent[playerid]);
	   		 	    OrderCar(playerid,Bikes[PlayerShowCar[playerid]][0],ChoosenColor[playerid]);
	   		 	    PlayerShowCar[playerid]=0;
				}
            if(newkeys == KEY_ACTION) //Tab
  				{
  		    		SetCameraBehindPlayer(playerid);
  		    		DestroyVehicle(ShowCar[playerid]);
					SetPlayerVirtualWorld(playerid,0);
					TextDrawHideForPlayer(playerid,CarRent[playerid]);
					TogglePlayerControllable(playerid,1);
					IsLiveViewing[playerid]=0;
	   		 	    PlayerShowCar[playerid]=0;
	   		 	    DestroyVehicle(ShowCar[playerid]);
	   		 	    SetPlayerPos(playerid,RentPlaceX,RentPlaceY,RentPlaceZ);
  				}
		}
	return 1;
}
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid==900)
	    {
	        if(response)
	            {
	                if(listitem==0){ChoosenColor[playerid]=0;}
	                else if(listitem==1){ChoosenColor[playerid]=125;}
					else if(listitem==2){ChoosenColor[playerid]=3;}
                    else if(listitem==3){ChoosenColor[playerid]=44;}
					else if(listitem==4){ChoosenColor[playerid]=6;}
					else if(listitem==5){ChoosenColor[playerid]=126;}
					else if(listitem==6){ChoosenColor[playerid]=13;}
					else if(listitem==7){ChoosenColor[playerid]=7;}
                    else if(listitem==8){ChoosenColor[playerid]=70;}
					else if(listitem==9){ChoosenColor[playerid]=16;}
					else if(listitem==10){ChoosenColor[playerid]=8;}
					else if(listitem==11){ChoosenColor[playerid]=1;}
					ShowPlayerDialog(playerid,901,DIALOG_STYLE_LIST,"Car Rental","Regular Cars		Price: 500$ to 1400$\nSport Cars		Price: 1000$ to 3400$\nBikes			Price: 50$ - 1000$","Select", "Cancel");
				}
		}
	if(dialogid==901)
	    {
	        if(response)
	            {
	                if(listitem==0)
	                    {
	                        if(LiveView==true)
	                            {
	                                PLiveView(playerid,1,ChoosenColor[playerid]);
	                                return 1;
	                            }
	                        ShowPlayerDialog(playerid,902,DIALOG_STYLE_LIST,"Car Rental","Damaged Glendale	Price: 500$\nWashington	Price: 700$\nEsperanto	Price: 850$\nMerit		Price: 950$\nManana		Price: 950$\nBravura	Price: 890$\nSentinel	Price: 1200$\nStallion		Price: 1200$\nSultan		Price: 1300$\nFelitzer		Price: 1350$\nComet		Price: 1400$","Select","Cancel");
	                    }
	                else if(listitem==1)
	                    {
                     		if(LiveView==true)
	                            {
	                                PLiveView(playerid,2,ChoosenColor[playerid]);
	                                return 1;
	                            }
	                        ShowPlayerDialog(playerid,903,DIALOG_STYLE_LIST,"Car Rental","Club			Price: 1000$\nBlista Compact		Price: 1400$\nTornado		Price: 1500$\nSabre			Price: 1850$\nBangshee Banger	Price: 2000$\nBuffalo			Price: 3000$\nTurismo		Price: 3200$\nInfernus		Price: 3400$","Select","Cancel");
	                    }
					else if(listitem==2)
					    {
         					if(LiveView==true)
	                            {
	                                PLiveView(playerid,3,ChoosenColor[playerid]);
	                                return 1;
	                            }
					        ShowPlayerDialog(playerid,904,DIALOG_STYLE_LIST,"Car Rental","Fraggio			Price: 50$\nBMX			Price: 300$\nSanchez		Price: 450$\nPCJ-600		Price: 600$\nFreeway 		Price: 650$\nNRG 500		Price: 800$\nWayfarer		Price: 1000$\n","Select","Cancel");
					    }
	            }
	        else
	            {
	                SendClientMessage(playerid,0x999999FF,"Cancelled Rent");
	            }
	    }
	if(dialogid==902)
	    {
	        new Text[256];
	        if(response)
	            {
	                if(GetPlayerMoney(playerid) >= Cars[listitem][1])
	                    {
	                		OrderCar(playerid,Cars[listitem][0],ChoosenColor[playerid]);
	                		GivePlayerMoney(playerid,-Cars[listitem][1]);
	                		format(Text,sizeof(Text),"You have rented a %s for $%d with %d minutes",Cars[listitem][2],Cars[listitem][1],RentMinutes);
	                		SendClientMessage(playerid,0x00FF00FF,Text);
						}
					else
					    {
					        SendClientMessage(playerid,0xFF6600FF,"You do not have enough money");
					    }
	            }
			else
				{
				    SendClientMessage(playerid,0x999999FF,"Cancelled Rent");
				}
	    }
	if(dialogid==903)
	    {
	        new Text[256];
	        if(response)
	            {
	                if(GetPlayerMoney(playerid) >= SportCars[listitem][1])
	                    {
	                		OrderCar(playerid,SportCars[listitem][0],ChoosenColor[playerid]);
	                		GivePlayerMoney(playerid,-SportCars[listitem][1]);
	                		format(Text,sizeof(Text),"You have rented a %s for $%d with %d minutes",SportCars[listitem][2],SportCars[listitem][1],RentMinutes);
	                		SendClientMessage(playerid,0x00FF00FF,Text);
						}
					else
					    {
					        SendClientMessage(playerid,0xFF6600FF,"You do not have enough money");
					    }
	            }
			else
				{
				    SendClientMessage(playerid,0x999999FF,"Cancelled Rent");
				}
	    }
	if(dialogid==904)
	    {
	        new Text[256];
	        if(response)
	            {
	                if(GetPlayerMoney(playerid) >= Bikes[listitem][1])
	                    {
	                		OrderCar(playerid,Bikes[listitem][0],ChoosenColor[playerid]);
	                		GivePlayerMoney(playerid,-Bikes[listitem][1]);
	                		format(Text,sizeof(Text),"You have rented a %s for $%d with %d minutes",Bikes[listitem][2],Bikes[listitem][1],RentMinutes);
	                		SendClientMessage(playerid,0x00FF00FF,Text);
						}
					else
					    {
					        SendClientMessage(playerid,0xFF6600FF,"You do not have enough money");
					    }
	            }
			else
				{
				    SendClientMessage(playerid,0x999999FF,"Cancelled Rent");
				}
	    }
	return 1;
}
public OrderCar(playerid,CarNumber,CarColor)
{
	if(RentedCar[playerid]==true){SendClientMessage(playerid,0xFF6600FF,"You already have a rented car.");return 1;}
    if(CarSpawn == 1){PlayerCar[playerid]=CreateVehicle(CarNumber,CarSpawns[0][0],CarSpawns[0][1],CarSpawns[0][2],CarSpawns[0][3],CarColor,CarColor,-1);CarSpawn=2;}
    else if(CarSpawn == 2){PlayerCar[playerid]=CreateVehicle(CarNumber,CarSpawns[0][0],CarSpawns[0][1],CarSpawns[0][2],CarSpawns[0][3],CarColor,CarColor,-1);CarSpawn=3;}
    else if(CarSpawn == 3){PlayerCar[playerid]=CreateVehicle(CarNumber,CarSpawns[0][0],CarSpawns[0][1],CarSpawns[0][2],CarSpawns[0][3],CarColor,CarColor,-1);CarSpawn=4;}
    else if(CarSpawn == 4){PlayerCar[playerid]=CreateVehicle(CarNumber,CarSpawns[0][0],CarSpawns[0][1],CarSpawns[0][2],CarSpawns[0][3],CarColor,CarColor,-1);CarSpawn=1;}
    PutPlayerInVehicle(playerid,PlayerCar[playerid],0);
    PlayerCarID[playerid]=GetPlayerVehicleID(playerid);
	RentedCar[playerid]=true;
	RentedCars+=1;
	return 1;
}
public CarCountDown()
	{
		for(new i=0;i<MAX_PLAYERS;i++)
	    	{
				if(IsPlayerConnected(i) && RentedCar[i] != false)
				    {
				        PlayerCount[i] -= 1;
				        if(PlayerCount[i] == 1)
							{
							    SendClientMessage(i,0xFF6600FF,"Your rental car expires in 1 minute");
							}
				        else if(PlayerCount[i] == 0)
				            {
				                new Float:PlayerX, Float:PlayerY, Float:PlayerZ;
				                GetPlayerPos(i,PlayerX,PlayerY,PlayerZ);
				                RemovePlayerFromVehicle(i);
				                SetPlayerPos(i,PlayerX,PlayerY,PlayerZ);
				                DestroyVehicle(PlayerCar[i]);
				                PlayerCount[i]=RentMinutes;
				                PlayerCarID[i]=999;
				                RentedCar[i]=false;
				                SendClientMessage(i,0xFF6600FF,"Your rental car has expired");
							}
					}
			}
	}
public PLiveView(playerid,Nummer,CarColor)
	{
	    if(Nummer == 1)
	        {
	            new string[246];
	            PlayerShowCar[playerid]=0;
	            TogglePlayerControllable(playerid, 0);
      			SetPlayerVirtualWorld(playerid,99+playerid);
      			SetPlayerCameraPos(playerid,753.8704,-1380.7031,25.6922);
				SetPlayerCameraLookAt(playerid,750.2994,-1377.7664,25.6922);
				ShowCar[playerid]=CreateVehicle(Cars[0][0],ShowCarSpawnX,ShowCarSpawnY,ShowCarSpawnZ,ShowCarSpawnRot,CarColor,CarColor,-1);
      			SetVehicleVirtualWorld(ShowCar[playerid],99+playerid);
        		format(string,sizeof(string),"~r~===== RENTAL MENU =====~n~~y~Vehicle: ~w~%s~n~~g~Price: ~w~$%d/%dMin.~n~~n~~g~Numpad 4 and 6~n~Vehicle Changes~n~ENTER to buy~n~Tab to cancel",Cars[0][2],Cars[0][1],RentMinutes);
          		IsLiveViewing[playerid]=1;
				TextDrawShowForPlayer(playerid,CarRent[playerid]);
				TextDrawSetString(CarRent[playerid],string);
		    }
		else if(Nummer == 2)
		    {
	            new string[246];
	            PlayerShowCar[playerid]=0;
	            TogglePlayerControllable(playerid, 0);
      			SetPlayerVirtualWorld(playerid,99+playerid);
      			SetPlayerCameraPos(playerid,753.8704,-1380.7031,25.6922);
				SetPlayerCameraLookAt(playerid,750.2994,-1377.7664,25.6922);
				ShowCar[playerid]=CreateVehicle(SportCars[0][0],ShowCarSpawnX,ShowCarSpawnY,ShowCarSpawnZ,ShowCarSpawnRot,CarColor,CarColor,-1);
      			SetVehicleVirtualWorld(ShowCar[playerid],99+playerid);
        		format(string,sizeof(string),"~r~===== RENTAL MENU =====~n~~y~Vehicle: ~w~%s~n~~g~Price: ~w~$%d/%dMin.~n~~n~~g~Numpad 4 and 6~n~Vehicle Changes~n~ENTER to buy~n~Tab to cancel",SportCars[0][2],SportCars[0][1],RentMinutes);
          		IsLiveViewing[playerid]=2;
				TextDrawShowForPlayer(playerid,CarRent[playerid]);
				TextDrawSetString(CarRent[playerid],string);
		    }
		else if(Nummer == 3)
		    {
	            new string[246];
	            PlayerShowCar[playerid]=0;
	            TogglePlayerControllable(playerid, 0);
      			SetPlayerVirtualWorld(playerid,99+playerid);
      			SetPlayerCameraPos(playerid,753.8704,-1380.7031,25.6922);
				SetPlayerCameraLookAt(playerid,750.2994,-1377.7664,25.6922);
				ShowCar[playerid]=CreateVehicle(Bikes[0][0],ShowCarSpawnX,ShowCarSpawnY,ShowCarSpawnZ,ShowCarSpawnRot,CarColor,CarColor,-1);
      			SetVehicleVirtualWorld(ShowCar[playerid],99+playerid);
        		format(string,sizeof(string),"~r~===== RENTAL MENU =====~n~~y~Vehicle: ~w~%s~n~~g~Price: ~w~$%d/%dMin.~n~~n~~g~Numpad 4 and 6~n~Vehicle Changes~n~ENTER to buy~n~Tab to cancel",Bikes[0][2],Bikes[0][1],RentMinutes);
          		IsLiveViewing[playerid]=3;
				TextDrawShowForPlayer(playerid,CarRent[playerid]);
				TextDrawSetString(CarRent[playerid],string);
		    }
	}
public PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z)
{
    if(IsPlayerConnected(playerid))
	{
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		tempposx = (oldposx -x);
		tempposy = (oldposy -y);
		tempposz = (oldposz -z);
		if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
		{
			return 1;
		}
	}
	return 0;
}
