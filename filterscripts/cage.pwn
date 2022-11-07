#define FILTERSCRIPT

#include <a_samp>

#define COLOR_RED 0xFF2100FF
#define COLOR_PINK 0xFF00FFFF

#define dcmd(%1,%2,%3) if ((strcmp((%3)[1], #%1, true, (%2)) == 0) && ((((%3)[(%2) + 1] == 0) && (dcmd_%1(playerid, "")))||(((%3)[(%2) + 1] == 32) && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1

new caged[MAX_PLAYERS];
new Float:CageInfoX[MAX_PLAYERS];
new Float:CageInfoY[MAX_PLAYERS];
new Float:CageInfoZ[MAX_PLAYERS];
new cage1[MAX_PLAYERS];
new cage2[MAX_PLAYERS];
new cage3[MAX_PLAYERS];
new cage4[MAX_PLAYERS];
new cage5[MAX_PLAYERS];
new cage6[MAX_PLAYERS];

//------------------------------------------------------------------------------

public OnFilterScriptInit()
{
        print("\n--------------------------------------");
        print(" Cage system by Qasim BadShah");
        print("--------------------------------------\n");
        return 1;
}

public OnFilterScriptExit()
{
        return 1;
}

//------------------------------------------------------------------------------

forward cagetimer(playerid);
public cagetimer(playerid)
{
        SetPlayerPos(playerid,CageInfoX[playerid],CageInfoY[playerid],CageInfoZ[playerid]+2);
}

//------------------------------------------------------------------------------

public OnPlayerSpawn(playerid)
{
    if(caged[playerid] == 1)
        {
            SetTimerEx("cagetimer",500,false,"u",playerid);
        }
        return 1;
}

//------------------------------------------------------------------------------

public OnPlayerCommandText(playerid, cmdtext[])
{
        dcmd(cage, 4, cmdtext);

        dcmd(kill, 4, cmdtext);
        return 0;
}
//##############################################################################
//######################################DCMD####################################
        dcmd_kill(playerid,params[])
        {
            #pragma unused params
            SetPlayerHealth(playerid,0);
            return 1;
        }
        dcmd_cage(playerid,params[])
        {
        if(IsPlayerAdmin(playerid))
            {
                new pID;
                if(sscanf(params,"u",pID)) return SendClientMessage(playerid,COLOR_RED,"USAGE: /cage [ID]");
                if(caged[pID] == 0)
                {

                        DestroyObject(cage1[pID]);
                        DestroyObject(cage2[pID]);
                        DestroyObject(cage3[pID]);
                        DestroyObject(cage4[pID]);
                        DestroyObject(cage5[pID]);
                        DestroyObject(cage6[pID]);

                        new string[128];
                        new Float:X, Float:Y, Float:Z;

                        GetPlayerPos(pID,X,Y,Z);
                        cage1[pID] = CreateObject(985, X, Y, Z+10, 0, 0, 0);
                                cage2[pID] = CreateObject(985, X+4 ,Y-4 , Z+10, 0, 0, 90);
                                cage3[pID] = CreateObject(985, X-4 , Y-4 , Z+10, 0, 0, 90);
                                cage4[pID] = CreateObject(985, X , Y-8 , Z+10, 0, 0, 0);
                                cage5[pID] = CreateObject(985, X , Y-4 , Z+8.2, 90, 0, 0);
                                cage6[pID] = CreateObject(985, X , Y-4 , Z+8.2, 90, 0, 180);

                                SetPlayerPos(pID,X,Y- 2,Z+15);
                                CageInfoX[pID]= X;
                                CageInfoY[pID]= Y-2;
                                CageInfoZ[pID]= Z+15;
                                caged[pID] = 1;
                                format(string,128,"[Admin] You have caged %s -> /cage <id> to uncage.",PlayerName(pID));
                                SendClientMessage(playerid,COLOR_RED,string);
                                new str[128];
                                format(str,128,"** ADMIN CAGE: %s (%i) has been caged",PlayerName(pID),pID);
                                SendClientMessageToAll(COLOR_PINK,str);
                                return 1;
                        }
                        else
                        {
                    DestroyObject(cage1[pID]);
                        DestroyObject(cage2[pID]);
                        DestroyObject(cage3[pID]);
                        DestroyObject(cage4[pID]);
                        DestroyObject(cage5[pID]);
                        DestroyObject(cage6[pID]);

                        SetPlayerPos(pID,CageInfoX[pID],CageInfoY[pID],CageInfoZ[pID]-10);
                        caged[pID] = 0;
                        new str[128];
                        format(str,128,"** ADMIN CAGE: %s (%i) has been uncaged",PlayerName(pID),pID);
                        SendClientMessageToAll(COLOR_PINK,str);
                        return 1;
                        }
                }
                else{SendClientMessage(playerid,COLOR_RED,"You can't use this command!"); return 1;}
        }


//------------------------------------------------------------------------------

stock PlayerName(playerid)
{
        new name[MAX_PLAYER_NAME];
        GetPlayerName(playerid,name,sizeof(name)); return name;
}

//##############################################################################
//######################################SSCANF##################################

stock sscanf(string[], format[], {Float,_}:...)
{
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
                stringPos++;
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
                                        stringPos++;
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
                                        stringPos++;
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

                                new changestr[16], changepos = 0, strpos = stringPos;
                                while(changepos < 16 && string[strpos] && string[strpos] != delim)
                                {
                                        changestr[changepos++] = string[strpos++];
                                }
                                changestr[changepos] = '\0';
                                setarg(paramPos,0,_:floatstr(changestr));
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
                                        new
                                                name[MAX_PLAYER_NAME];
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
                                stringPos--;
                                setarg(paramPos, i, '\0');
                        }
                        default:
                        {
                                continue;
                        }
                }
                while (string[stringPos] && string[stringPos] != delim && string[stringPos] > ' ')
                {
                        stringPos++;
                }
                while (string[stringPos] && (string[stringPos] == delim || string[stringPos] <= ' '))
                {
                        stringPos++;
                }
                paramPos++;
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
