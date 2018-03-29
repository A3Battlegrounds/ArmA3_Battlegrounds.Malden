/*
 *	This project is licensed under the GNU Affero GPL v3. Copyright © 2018 ArmaBwS.com
 *
 *	@file Name: hud.sqf
 *	@file Author: [BwS] R3V3NG3
 *
 *  This file is part of A3Battlegrounds.
 *
 *  A3Battlegrounds is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Affero General Public License as published
 *	by the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  A3Battlegrounds is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Affero General Public License for more details.
 *
 *  You should have received a copy of the GNU Affero General Public
 *	License along with A3Battlegrounds. If not, see <http://www.gnu.org/licenses/>.
 */

waitUntil {!(isNull (findDisplay 46))};

disableSerialization;

[] spawn
{
	//Create hud player lobby
	with uiNamespace do {	
		playerCountBox = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		playerCountBox ctrlSetPosition [ safezoneX + safezoneW - 0.245, safezoneY + 0.05, 0.06, 0.065];
		playerCountBox ctrlSetBackgroundColor [0, 0, 0, 0.8];
		playerCountBox ctrlCommit 0;
		
		playerTextBox = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		playerTextBox ctrlSetPosition [ safezoneX + safezoneW - 0.185, safezoneY + 0.05, 0.15, 0.065];
		playerTextBox ctrlSetBackgroundColor [0, 0, 0, 0.4]; 
		playerTextBox ctrlCommit 0;
		
		timeleftBox = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		timeleftBox ctrlSetPosition [ safezoneX + safezoneW - 0.245, safezoneY + 0.12, 0.21, 0.04];
		timeleftBox ctrlSetBackgroundColor [0, 0, 0, 0.8];
		timeleftBox ctrlCommit 0;
		
		playerHealthBackground = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		playerHealthBackground ctrlSetPosition [ safezoneX + (safezoneW / 2) - 0.24, safezoneY + safezoneH - 0.1, 0.5, 0.05];
		playerHealthBackground ctrlSetBackgroundColor [0, 0, 0, 0.8];
		playerHealthBackground ctrlCommit 0;
		
		playerHealthBar = findDisplay 46 ctrlCreate ["RscProgress", -1];
		playerHealthBar ctrlSetPosition [ safezoneX + (safezoneW / 2) - 0.24, safezoneY + safezoneH - 0.1, 0.5, 0.05];
		playerHealthBar ctrlSetTextColor [1, 1, 1, 0.9];
		playerHealthBar progressSetPosition 0;
		playerHealthBar ctrlCommit 0;
	};
	
	//Lobby
	waittimelobby = true;
	
	while {waittimelobby} do
	{		
		//Initialize variables and set values
		_timeleft = waittimer;
		_justPlayers = (allPlayers - entities "HeadlessClient_F") select {alive _x};
		_joined = count _justPlayers;
		
		_lobbyplayers = format ["<t size='1.5' font='PuristaSemiBold' align='center' shadow='0' color='#FFFFFF'>%1</t>", _joined];
		_lobbytext = format ["<t size='1.5' font='PuristaSemiBold' align='center' shadow='0' color='#FFFFFF'>JOINED</t>"];
		
		//Display the hud
		(uiNamespace getVariable "playerCountBox") ctrlSetStructuredText parseText _lobbyplayers;
		(uiNamespace getVariable "playerTextBox") ctrlSetStructuredText parseText _lobbytext;
		
		if (_timeleft == 0) exitWith {
			waittimelobby = false;
		};
		
		uiSleep 0.5;
	};
	
	waitUntil {matchstarted};
	
	removeMissionEventHandler ["Draw3D", TAGS];
	
	while {matchstarted} do
	{
		//Initialize variables and set values
		_justPlayers = (allPlayers - entities "HeadlessClient_F") select {alive _x};
		_playerleftAlive = count _justPlayers;
		
		_playerleftCount = format["<t size='1.5' font='PuristaSemiBold' align='center' shadow='0' color='#FFFFFF'>%1</t>", _playerleftAlive];
		_playerleftText = format["<t size='1.5' font='PuristaSemiBold' align='center' shadow='0' color='#FFFFFF'>ALIVE</t>"];
							
		//Display the hud
		(uiNamespace getVariable "playerCountBox") ctrlSetStructuredText parseText _playerleftCount;
		(uiNamespace getVariable "playerTextBox") ctrlSetStructuredText parseText _playerleftText;
		
		if (alive player) then {
			//Variables
			_damage = 1 - (damage player);
			
			(uiNamespace getVariable "playerHealthBar") ctrlSetTextColor [1, 1, 1, 0.9];
			if (_damage >= 0.1) then {(uiNamespace getVariable "playerHealthBar") ctrlSetTextColor [1, 1, 1, 0.9];};
			if (_damage < 0.1) then {(uiNamespace getVariable "playerHealthBar") ctrlSetTextColor [1, 0.1, 0.1, 0.9];};
			
			(uiNamespace getVariable "playerHealthBar") progressSetPosition _damage;
		}else{
			ctrlDelete (uiNamespace getVariable "playerHealthBackground");
			ctrlDelete (uiNamespace getVariable "playerHealthBar");
		};
		
		uiSleep 0.5;
	};
};