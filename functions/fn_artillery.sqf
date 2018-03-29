/*
 *	This project is licensed under the GNU Affero GPL v3. Copyright © 2018 ArmaBwS.com
 *
 *	@file Name: fn_artillery.sqf
 *	@file Author: [BwS] R3V3NG3 - Credits: ALIAS
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

//Variables
_areapos_art 	= getMarkerPos "greenareacircle";
_areasize_art	= getMarkerSize "greenareacircle";
_randompos_art	= random(_areasize_art select 0);
_radius_art		= (_areasize_art select 0) / 10;
_nr_art			= 15;
_freq_art		= 0.1;
_sizesafe		= _areasize_art select 0;

if (_sizesafe < 350) exitWith {};

_sleepArtillery = _this select 0;

sleepArtillery = (_sleepArtillery / 2) - round(random (_sleepArtillery / 2)) + 20;

//Random Wait
sleep sleepArtillery;

_target_art	= [(_areapos_art select 0) - _randompos_art, (_areapos_art select 1) - _randompos_art, 50];

systemChat "Artillery Fire incoming in 30 seconds...";

_arti_name_marker1 = format["ArtZone%1", diag_tickTime];
_arti_name_marker2 = format["ArtMarker%1", diag_tickTime];

_arti_marker1 = createMarker [_arti_name_marker1, [(_areapos_art select 0) - _randompos_art, (_areapos_art select 1) - _randompos_art, 0]];
_arti_marker1 setMarkerShape "ELLIPSE";
_arti_marker1 setMarkerBrush "SOLID";
_arti_marker1 setMarkerSize [_radius_art, _radius_art];
_arti_marker1 setMarkerColor "ColorRed";

_arti_marker2 = createMarker [_arti_name_marker2, [(_areapos_art select 0) - _randompos_art, (_areapos_art select 1) - _randompos_art, 0]];
_arti_marker2 setMarkerType "KIA";
_arti_marker2 setMarkerColor "ColorRed";

_artiposX = (_areapos_art select 0) - _randompos_art;
_artiposY = (_areapos_art select 1) - _randompos_art;
diag_log format["[A3BG_LOG] Artillery Fire - Pos: [%1, %2] - Radius: %3 - Nbr Art: %4 - Freq: %5 sec", _artiposX, _artiposY, _radius_art, _nr_art, _freq_art];

_art_voice = "land_helipadempty_f" createVehicle getpos player;

sleep 30;

while {_nr_art > 0} do
{
	_rel_Pos = _target_art;
	_random_radiusX = round(random(_radius_art * 2)) - _radius_art;
	_random_radiusY = round(random(_radius_art * 2)) - _radius_art;
	
	_art_voice setPos _rel_Pos;
	_fluier = ["fluier_1", "fluier_2", "fluier_3", "fluier_4", "fluier_5", "fluier_6", "fluier_7", "fluier_8", "fluier_9", "fluier_91", "fluier_92", "fluier_93"] call BIS_fnc_selectRandom;	
	[_art_voice, [_fluier, 500]] remoteExec ["say3d"];
	
	sleep 2 + random 0.5;
	
	_bomb = "Bomb_03_F" createVehicle [(_rel_Pos select 0) + _random_radiusX, (_rel_Pos select 1) + _random_radiusY, 0];
	
	sleep 0.5 + random 0.5;
	
	_bombi = "M_Mo_82mm_AT_LG" createVehicle [(_rel_Pos select 0) + _random_radiusX, (_rel_Pos select 1) + _random_radiusY, 0];
	
	waituntil {!isnull _bombi};
	
	_nr_art = _nr_art - 1;
	
	sleep _freq_art;		
};

diag_log "[A3BG_LOG] Artillery Fire - End - Delete Marker";

sleep 1;

deleteMarker _arti_name_marker1;
deleteMarker _arti_name_marker2;
