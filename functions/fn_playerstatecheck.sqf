/*
 *	This project is licensed under the GNU Affero GPL v3. Copyright © 2018 ArmaBwS.com
 *
 *	@file Name: fn_playerstatecheck.sqf
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

playerstatecheck = true;
survivalgameend = false;

restrictzonedamage = 0;
matchstart = false;

_damagezone1 = 0.0070; //142.85
_damagezone2 = 0.0080; //128
_damagezone3 = 0.0090; //111.11
_damagezone4 = 0.0100; //100
_damagezone5 = 0.0115; //86.95
_damagezone6 = 0.0130; //76.92
_damagezone7 = 0.0150; //66.66
_damagezone8 = 0.0175; //57.14
_damagezone9 = 0.0205; //48.78
_damagezone10 = 0.0250; //40
_damagezone11 = 0.0310; //32.25
_damagezone12 = 0.0390; //25.64
_damagezone13 = 0.0500; //20
_damagezone14 = 0.0700; //14.28
_damagezone15 = 0.1000; //10

restrictzonedamage1 = false;
restrictzonedamage2 = false;
restrictzonedamage3 = false;
restrictzonedamage4 = false;
restrictzonedamage5 = false;
restrictzonedamage6 = false;
restrictzonedamage7 = false;
restrictzonedamage8 = false;
restrictzonedamage9 = false;
restrictzonedamage10 = false;
restrictzonedamage11 = false;
restrictzonedamage12 = false;
restrictzonedamage13 = false;
restrictzonedamage14 = false;
restrictzonedamage15 = false;

checkplayerdied = true;

while {playerstatecheck} do {

	while {matchstart} do {
	
		player allowDamage true;
	
		if (player inArea "preparezone") then {
			player setDamage 1;
		};
		if (!(player inArea "restrictareacircle") && restrictzonedamage1) then {
			_playerdamage = damage player;
			_playerdamagenew = (_playerdamage) + _damagezone1;
			player setDamage _playerdamagenew;
		};
		if (!(player inArea "restrictareacircle") && restrictzonedamage2) then {
			_playerdamage = damage player;
			_playerdamagenew = (_playerdamage) + _damagezone2;
			player setDamage _playerdamagenew;
		};
		if (!(player inArea "restrictareacircle") && restrictzonedamage3) then {
			_playerdamage = damage player;
			_playerdamagenew = (_playerdamage) + _damagezone3;
			player setDamage _playerdamagenew;
		};
		if (!(player inArea "restrictareacircle") && restrictzonedamage4) then {
			_playerdamage = damage player;
			_playerdamagenew = (_playerdamage) + _damagezone4;
			player setDamage _playerdamagenew;
		};
		if (!(player inArea "restrictareacircle") && restrictzonedamage5) then {
			_playerdamage = damage player;
			_playerdamagenew = (_playerdamage) + _damagezone5;
			player setDamage _playerdamagenew;
		};
		if (!(player inArea "restrictareacircle") && restrictzonedamage6) then {
			_playerdamage = damage player;
			_playerdamagenew = (_playerdamage) + _damagezone6;
			player setDamage _playerdamagenew;
		};
		if (!(player inArea "restrictareacircle") && restrictzonedamage7) then {
			_playerdamage = damage player;
			_playerdamagenew = (_playerdamage) + _damagezone7;
			player setDamage _playerdamagenew;
		};
		if (!(player inArea "restrictareacircle") && restrictzonedamage8) then {
			_playerdamage = damage player;
			_playerdamagenew = (_playerdamage) + _damagezone8;
			player setDamage _playerdamagenew;
		};
		if (!(player inArea "restrictareacircle") && restrictzonedamage9) then {
			_playerdamage = damage player;
			_playerdamagenew = (_playerdamage) + _damagezone9;
			player setDamage _playerdamagenew;
		};
		if (!(player inArea "restrictareacircle") && restrictzonedamage10) then {
			_playerdamage = damage player;
			_playerdamagenew = (_playerdamage) + _damagezone10;
			player setDamage _playerdamagenew;
		};
		if (!(player inArea "restrictareacircle") && restrictzonedamage11) then {
			_playerdamage = damage player;
			_playerdamagenew = (_playerdamage) + _damagezone11;
			player setDamage _playerdamagenew;
		};
		if (!(player inArea "restrictareacircle") && restrictzonedamage12) then {
			_playerdamage = damage player;
			_playerdamagenew = (_playerdamage) + _damagezone12;
			player setDamage _playerdamagenew;
		};
		if (!(player inArea "restrictareacircle") && restrictzonedamage13) then {
			_playerdamage = damage player;
			_playerdamagenew = (_playerdamage) + _damagezone13;
			player setDamage _playerdamagenew;
		};
		if (!(player inArea "restrictareacircle") && restrictzonedamage14) then {
			_playerdamage = damage player;
			_playerdamagenew = (_playerdamage) + _damagezone14;
			player setDamage _playerdamagenew;
		};
		if (!(player inArea "restrictareacircle") && restrictzonedamage15) then {
			_playerdamage = damage player;
			_playerdamagenew = (_playerdamage) + _damagezone15;
			player setDamage _playerdamagenew;
		};
		_playerdamage = damage player;
		if (checkplayerdied && (_playerdamage >= 1)) then {
			_playername = name player;
			_playeruid = getPlayerUID player;
			_diaglogkill = format["[A3BG_LOG] %1 died (http://steamcommunity.com/profiles/%2)",_playername, _playeruid];
			[_diaglogkill] remoteExec ["A3BG_fnc_diaglogkill",0,false];
			checkplayerdied = false;
		};
		if (survivalgameend) then {
			"End1" call BIS_fnc_endMission;
			playerstatecheck = false;
			matchstart = false;
		};
		sleep 1;
	};
	sleep 0.3;
};