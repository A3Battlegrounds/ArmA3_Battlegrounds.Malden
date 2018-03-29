/*
 *	This project is licensed under the GNU Affero GPL v3. Copyright © 2018 ArmaBwS.com
 *
 *	@file Name: fn_endmatch.sqf
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

if(isDedicated)exitWith{};

_playerWinner = _this select 0;
_playerTotal = _this select 1;

sleep 3;

if (_playerWinner == player) then
{
	playSound "matchwin";

	//Create hud player left
	with uiNamespace do {	
		playerWinBox = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		playerWinBox ctrlSetPosition [ safezoneX, safezoneY, safezoneW, safezoneH];
		playerWinBox ctrlSetBackgroundColor [0, 0, 0, 0.8];
		playerWinBox ctrlCommit 0;
		
		playerWinName = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		playerWinName ctrlSetPosition [ safezoneX + 0.1, safezoneY + 0.1, 1.2, 0.2];
		playerWinName ctrlCommit 0;
		
		playerTotalRank = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		playerTotalRank ctrlSetPosition [ safezoneX + safezoneW - 0.5, safezoneY + 0.1, 0.4, 0.4];
		playerTotalRank ctrlCommit 0;
		
		playerWinMessage = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		playerWinMessage ctrlSetPosition [ safezoneX + 0.1, safezoneY + 0.24, 1.2, 0.2];
		playerWinMessage ctrlCommit 0;
		
		playerWinRank = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		playerWinRank ctrlSetPosition [ safezoneX + 0.1, safezoneY + 0.4, 1.2, 0.2];
		playerWinRank ctrlCommit 0;
	};

	_playerTotalRank = format["<t size='8.0' font='PuristaSemiBold' align='right' shadow='0' color='#FACC2E'>#1<t size='6.0' font='PuristaMedium' color='#FFFFFF'>/%1</t>", _playerTotal];
	_playerWin = format["<t size='2.5' font='PuristaSemiBold' align='left' shadow='0' color='#FFFFFF'>%1</t>", name _playerWinner];
	_winMessage = format["<t size='2.0' font='PuristaSemiBold' align='left' shadow='0' color='#FACC2E'>WINNER WINNER YOU ARE THE BEST</t>"];
	_playerRank = format["<t size='4.5' font='PuristaLight' align='left' shadow='0' color='#FFFFFF'>PLAYER RANK <t font='PuristaSemiBold'>#1</t>"];


	//Display Win Screen
	(uiNamespace getVariable "playerTotalRank") ctrlSetStructuredText parseText _playerTotalRank;
	(uiNamespace getVariable "playerWinName") ctrlSetStructuredText parseText _playerWin;
	(uiNamespace getVariable "playerWinMessage") ctrlSetStructuredText parseText _winMessage;
	(uiNamespace getVariable "playerWinRank") ctrlSetStructuredText parseText _playerRank;

	sleep 15;

	//////////////////////////////////////////////////
	// Remove All Control							//
	//////////////////////////////////////////////////
	//HUD
	ctrlDelete (uiNamespace getVariable "playerCountBox");	
	ctrlDelete (uiNamespace getVariable "playerTextBox");
	ctrlDelete (uiNamespace getVariable "timeleftBox");
	ctrlDelete (uiNamespace getVariable "playerHealthBackground");
	ctrlDelete (uiNamespace getVariable "playerHealthBar");

	//VEHICLE
	ctrlDelete (uiNamespace getVariable "playerVehiclePic");
	ctrlDelete (uiNamespace getVariable "vehicleSpeed");
	ctrlDelete (uiNamespace getVariable "vehicleFuelLevel");
	ctrlDelete (uiNamespace getVariable "vehicleFuelBackground");
	ctrlDelete (uiNamespace getVariable "vehicleFuelBar");
	ctrlDelete (uiNamespace getVariable "vehicleHullBack");
	ctrlDelete (uiNamespace getVariable "vehicleHull");
	ctrlDelete (uiNamespace getVariable "vehicleEngineBack");
	ctrlDelete (uiNamespace getVariable "vehicleEngine");
	ctrlDelete (uiNamespace getVariable "vehicleFuelBack");
	ctrlDelete (uiNamespace getVariable "vehicleFuel");
	ctrlDelete (uiNamespace getVariable "vehicleWheelBack");
	ctrlDelete (uiNamespace getVariable "vehicleWheel");

	//WEAPON
	ctrlDelete (uiNamespace getVariable "playerAmmoText");
	ctrlDelete (uiNamespace getVariable "playerWeaponPic");
	ctrlDelete (uiNamespace getVariable "weaponModeText");
	ctrlDelete (uiNamespace getVariable "playerGrenadePic");

	//Remove MiniMap
	(["myMiniMap"] call BIS_fnc_rscLayer) cutText ["", "PLAIN", 1, false];

	ctrlDelete (uiNamespace getVariable "playerWinBox");
	ctrlDelete (uiNamespace getVariable "playerTotalRank");
	ctrlDelete (uiNamespace getVariable "playerWinName");
	ctrlDelete (uiNamespace getVariable "playerWinMessage");
	ctrlDelete (uiNamespace getVariable "playerWinRank");
};

cutRsc ["RscEndGame", "BLACK OUT"];
