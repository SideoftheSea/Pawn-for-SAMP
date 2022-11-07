//    #  #       # # #    # #      #   # # #   //
//    #    #     #   #    #   #        #   #   //
//    #    #     ### #    #  #     #   #   #   //
//    #   #      #   #    #   #    #   #   #   //
//    # #        #   #    #    #   #   # # #   //
//                      SCRIPT                 //
/////////////////////////////////////////////////




// Don't remove the credits!!
#include <a_samp>
#include <a_samp>
#define COLOR_LIGHTBLUE ( 0x33CCFFAA )
#define COLOR_YELLOW ( 0xFFFF00AA )
#define COLOR_RED ( 0xAA3333AA )

new caselev,clinfo;


public OnFilterScriptInit()
{

    print("******************************************");
    print("                                          ");
    print("                                          ");
    print("                ELEVATOR LS               ");
    print("                    By                    ");
    print("                   Qasim                  ");
    print("                    for                   ");
    print("            https:bg-roleplay.tk          ");
    print("******************************************");
   	caselev = CreateObject(2669, 1567.4233398438, -1634.6782226563, 13.896639823914, 0, 0, 270); // Elevator
	clinfo =  CreatePickup(1239,1,1562.7111,-1636.2948,13.5585); // Pickup Information
   

//-------------------------------------------------------------------------------------------
    
    CreateObject(1383, 1567.904296875, -1637.5500488281, -1.6610670089722, 0, 0, 0);
    CreateObject(974, 1561.6535644531, -1635.599609375, 27.379848480225, 90, 179.59649658203, 180.40350341797);
    CreateObject(970, 1562.9537353516, -1632.9342041016, 27.939142227173, 0, 0, 0);
    CreateObject(970, 1560.4147949219, -1632.9245605469, 27.939142227173, 0, 0, 0);
    CreateObject(970, 1558.3157958984, -1635.0493164063, 27.939142227173, 0, 0, 269.99996948242);
    CreateObject(1215, 1564.1802978516, -1633.2125244141, 27.951984405518, 0, 0, 0);
    CreateObject(1215, 1561.5998535156, -1633.2470703125, 27.951984405518, 0, 0, 0);
    CreateObject(1215, 1558.7445068359, -1633.1572265625, 27.951984405518, 0, 0, 0);
    CreateObject(1215, 1558.6159667969, -1635.1682128906, 27.951984405518, 0, 0, 0);
    CreateObject(1215, 1558.5804443359, -1636.8074951172, 27.951984405518, 0, 0, 0);
    CreateObject(1215, 1564.2353515625, -1636.0129394531, 13.123223304749, 0, 0, 0);
    CreateObject(1215, 1564.3372802734, -1633.5808105469, 13.121915817261, 0, 0, 0);
//------------------------------------------OBJECT---------------------------------

    return 1;
}

public OnPlayerConnect(playerid) return SendClientMessage(playerid,COLOR_LIGHTBLUE, "=> Elevator LSPD by Dario <=");


public OnPlayerCommandText(playerid, cmdtext[])
{
    if(!strcmp("/clifton", cmdtext, true))
	{
	    SendClientMessage(playerid, COLOR_LIGHTBLUE, "You have activated the elevator..");
		MoveObject(caselev, 1567.4233398438, -1634.6782226563, 28.62163734436,4);
		return 1;
	}

	if(!strcmp("/cliftoff", cmdtext, true))
	{
        SendClientMessage(playerid, COLOR_LIGHTBLUE, "You've disabled the elevator..");
	    MoveObject(caselev, 1567.4233398438, -1634.6782226563, 13.896639823914,4);
	    return 1;
	}


	if(!strcmp("/cliftstop", cmdtext, true)) return StopObject(caselev);
	return 0;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
    if(pickupid == clinfo) // Casino Elevator information
    {
    	GameTextForPlayer(playerid,"~B~/clifton - ~Y~to activate  ~G~/cliftoff ~B~to disable",10000,5);
    }

    return 1;
}

// ( c )  Copyright
//     ( 2012 )

// P.S.:  Don't remove the credits! :)
