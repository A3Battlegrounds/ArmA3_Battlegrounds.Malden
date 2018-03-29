/*
 *	This project is licensed under the GNU Affero GPL v3. Copyright © 2018 ArmaBwS.com
 *
 *	@file Name: fn_randomparachute.sqf
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

if(isDedicated)exitWith{};

cutText ["<t size='5' font='PuristaSemiBold' align='center' shadow='1' color='#FE2E2E'>PREPARE TO SURVIVE</t>", "BLACK OUT", -1, true, true];

//removeAllContainers player;
removeAllItemsWithMagazines player;
removeAllWeapons player;
removeBackpack player;
removeGoggles player;
//removeHeadgear player;
//removeUniform player;
removeVest player;

sleep 5;

_randomspawnzone = ["spawnzone_1","spawnzone_2"] call BIS_fnc_selectRandom;
_randomPos = [[[getMarkerPos _randomspawnzone, 4200],[]],["water","out"]] call BIS_fnc_randomPos;

//If the player is in a vehicle, eject it.
if (vehicle player != player) then 
{ 
	_veh = vehicle player;
	player action ["Eject", _veh];
	waitUntil {sleep 0.5; vehicle player == player}; //Wait until the player is out of the vehicle
	player action ["EngineOff", _veh];
};

player setpos [_randomPos select 0,_randomPos select 1,(_randomPos select 2) + 1500];

player addBackpack "B_Parachute";

cutText ["", "BLACK IN", -1, true, true];

matchstarted = true;
publicVariable "matchstarted";

randomnormalparachute = true;

while {randomnormalparachute} do {

	_AslPos = getPosATL player;
	_height = _AslPos select 2;
	
	if ((_height > 200) && (_height < 250)) then 
	{	
		player action ["OpenParachute", player];
		randomnormalparachute = false;
	};
};

//waitUntil {isTouchingGround player};

sleep 1;

player allowDamage true;