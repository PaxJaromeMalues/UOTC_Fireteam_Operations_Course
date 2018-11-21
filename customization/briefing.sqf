#include "core\briefingCore.sqf"
 
switch (side player) do {
 
    case west:
    {
	
		NEWTAB("Course Notes:")
		<br/>- Each Course (FTOps, FTP1 and FTP2) have their own distinct form up area. Follow the signs.
		<br/>- All Participants have damage enabled.
		<br/>- Players will respawn with their initial gear at the indicated respawn position.
		<br/>- When respawning, wait for orders at the respawn position.
		ENDTAB;

		NEWTAB("Command & Signal:")
		<br/><font color='#d21111' size='15'>1. Signal Operating Instructions Index in effect:</font>
		<br/>
		<br/><font size='14'>Short Range Radio Nets:</font>
		<br/>
		<br/> SR 1 Block 1 - 1`1 FT Alpha
		<br/> SR 1 Block 2 - 1`1 FT Bravo
		<br/> SR 2 Block 1 - 1`2 FT Alpha
		<br/> SR 2 Block 2 - 1`2 FT Bravo
		<br/> SR 3 Block 1 - Instructors
		<br/>
		<br/><font size='14'>Long Range Radio Nets:</font> 
		<br/>
		<br/> LR 1 - Ground 1
		<br/>
		<br/><font color='#d21111' size='15'>Number Combination:</font>
		<br/>UNDEFINED!
		<br/>
		<br/><font color='#d21111' size='15'>Authentication Password:</font>
		<br/>UNDEFINED!
		<br/>
		<br/><font color='#d21111' size='15'>8. Recognition Signals:</font>
		<br/>Red/Orange Smoke = enemy position (applied towards enemy units)
		<br/>White Smoke = concealment 
		<br/>Green Smoke = friendly position (applied towards friendly units)
		<br/>Yellow Smoke = Urgent Medical (applied towards friendly units)
		<br/>Blue Smoke = Broken Comms/COC (applied towards friendly units)
		ENDTAB;
 
    }; //End of west case
 
}; //End of switch

		NEWTAB("VI. Mission notes:") //This is shown for everyone
		<br/><font color='#FFA500' size='15'>RESPAWN</font>
		<br/>
		<br/>Respawn enabled - endless
		<br/>
		<br/><font color='#FFA500' size='15'>REVIVE</font>
		<br/>
		<br/>Disabled
		<br/>
		<br/><font color='#FFA500' size='15'>JIP</font>
		<br/>
		<br/><font size='14'>Blufor</font>
		<br/>JIP Transport
		<br/>
		<br/><font color='#FFA500' size='15'>END CONDITION</font>
		<br/>
		<br/><font size='14'>OPFOR VICTORY:</font>
		<br/>none
		<br/>
		<br/><font size='14'>BLUFOR VICTORY:</font>
		<br/>none
		<br/>
		<br/><font color='#FFA500' size='15'>USE OF ENEMY VEHICLE ASSETS</font>
		<br/>
		<br/>Prohibited. Following exceptions remain when in a survival-style situation: Jeeps and other non-special vehicles can be manned and operated for tactical advantage. This includes the usage of mounted standard weapon systems like M2/miniguns.
		<br/>
		<br/><font color='#FFA500' size='15'>ACE MEDICAL</font>
		<br/>
      	<br/>- Instructors are doctors
		<br/>
		<br/><font color='#FFA500' size='15'>TECHNICAL ASPECT</font>
		<br/>
        <br/>- View Distance:
        <br/>-- Player: 12000.
        <br/>-- AI: 2500.
        <br/>- ACRE Signal loss is turned on.
        <br/>- ACRE Occlusion is turned on.
        <br/>- ACRE radio interference is turned on.
        <br/>- ACRE AI HEARING PLAYERS IS ENABLED.
		<br/>
		<br/><font color='#FFA500' size='15'>CREDITS</font>
		<br/>
		<br/>Olsen Framework
		<br/>
		<br/>Briefing Layout Source: Perfk
		<br/>Altered by Pax
		<br/>
		<br/><font color='#FFA500' size='15'>Mission by:</font>
		<br/>PaxJaromeMalues
		<br/>
		ENDTAB;

		NEWTAB("Game Mastering")
		<br/> This mission is not designed for game mastering and should only be manipulated for technical, administrative or diagnostic purposes.
		<br/> Please DO NOT go into zeus, unless you REALLY have to.
		ENDTAB;
 
DISPLAYBRIEFING();
