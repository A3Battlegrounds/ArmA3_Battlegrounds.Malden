/*
 *	This project is licensed under the GNU Affero GPL v3. Copyright © 2018 ArmaBwS.com
 *
 *	@file Name: init.sqf
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
	
#define DEBUG false

//Config Terrain
setTerrainGrid 40;
setViewDistance 750;
setObjectViewDistance [750,50];


//Nametags
execVM "scripts\nametags.sqf";

externalConfigFolder = "A3Battlegrounds_settings";

if (isServer) then {
	call compile preprocessFileLineNumbers (externalConfigFolder + "\config.sqf");
};

[DEBUG] call compile preprocessFileLineNumbers "badmin\globalCompile.sqf";

if (!isDedicated) then
{
	if (hasInterface) then // Normal player
	{
		execVM "badmin\client\init.sqf";
	}
};

if (isServer) then
{
	diag_log "[A3BG_LOG] bAdmin - Initializing";
	[] execVM "badmin\server\init.sqf";
};

PlugsIN = 2;     			 //Set 'EARPLUGS REMOVED' as init value 

fnc_keyPressed = {
	private _handled = false;
	
	

	switch (_this) do {
		//Key U
		case 22: {
			nul = [] execVM "badmin\client\systems\adminPanel\checkAdmin.sqf";
		};
		
		//Key 4
		case 5: {
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};
		
		//Key 5
		case 6: {
			switch (PlugsIN) do {
				case 1: {
					PlugsIN = 2;
					2 fadeSound 1; 
					
					ctrlDelete (uiNamespace getVariable "earplugsBack");
				};
				case 2: {
					PlugsIN = 1;
					2 fadeSound 0.1;
					
					with uiNamespace do {	
						earplugsBack = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
						earplugsBack ctrlSetPosition [safezoneX + safezoneW - 0.105, safezoneY + (safezoneH / 2) - 0.2, 0.1, 0.125];
						earplugsBack ctrlSetBackgroundColor [0, 0, 0, 0];
						earplugsBack ctrlCommit 0;
					};
					
					_earplugsIcon = format["<img size='2.5' align='center' shadow='0' image='media\images\earplugs.paa'/>"];
					(uiNamespace getVariable "earplugsBack") ctrlSetStructuredText parseText _earplugsIcon;
				};
				default { };
			};
		};
		
		// Key 0
		case 11: {
			if (isNil "AR_active") then {AR_active = false;};
			if (AR_active) exitWith {AR_active = false; _handled = true;};

			if (!isNull objectParent player) exitWith {};
			if (surfaceIsWater (getPos player)) exitWith {};

			AR_active = true;
			AR_weapon = currentWeapon player;
			AR_animation = switch (true) do {
				case (AR_weapon isEqualTo ""): {"AmovPercMevaSnonWnonDf"};
				case (AR_weapon isEqualTo (primaryWeapon player)): {"AmovPercMevaSlowWrflDf"};
				case (AR_weapon isEqualTo (secondaryWeapon player)): {"AmovPercMevaSlowWrflDf"};
				case (AR_weapon isEqualTo (handgunWeapon player)): {"AmovPercMevaSlowWpstDf"};
			};

			player playMoveNow AR_animation;

			player addEventHandler ["AnimChanged", {
				if ((!AR_active) || {!((currentWeapon player) isEqualTo AR_weapon)} || {!isNull objectParent player} || {surfaceIsWater (getPos player)}) exitWith {
					player removeEventHandler ["AnimChanged", _thisEventHandler];

					AR_weapon = currentWeapon player;
					AR_animation = switch (true) do {
						case (AR_weapon isEqualTo ""): {"AmovPercMstpSnonWnonDnon"};
						case (AR_weapon isEqualTo (primaryWeapon player)): {"AmovPercMstpSlowWrflDnon"};
						case (AR_weapon isEqualTo (secondaryWeapon player)): {"AmovPercMevaSlowWlnrDf"};
						case (AR_weapon isEqualTo (handgunWeapon player)): {"AmovPercMstpSlowWpstDnon"};
					};

					player playMoveNow AR_animation;

					AR_active = false;
					AR_weapon = nil;
					AR_animation = nil;
				};

				player playMoveNow AR_animation;
			}];

			_handled = true;
		};
	};
	
	_handled
};

waituntil {!isnull (finddisplay 46)};
(findDisplay 46) displayAddEventHandler ["KeyDown","_this select 1 call fnc_keyPressed;false;"];

fnc_updateMiniMap = {
	_map = _this select 0;
	_map ctrlMapAnimAdd [0, 0.08, player];
	ctrlMapAnimCommit _map;
};

waitUntil { time > 0 };

//Show MiniMap
(["myMiniMap"] call BIS_fnc_rscLayer) cutRsc ["myMap", "PLAIN", 1, false];

//Compass
execVM "functions\fn_initCompass.sqf";


