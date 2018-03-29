/*
 *	This project is licensed under the GNU Affero GPL v3. Copyright © 2018 ArmaBwS.com
 *
 *	@file Name: fn_matcharea.sqf
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

if (!isServer) exitWith {};

_randomsize = _this select 0;
_greencirclesize = _this select 1;
_tasknumber = _this select 2;
//restriczonedamage = _this select 3;
_greenareatime = _this select 4;
_restrictareatime = _this select 5;
startmatch = _this select 6;

if (!startmatch) then
{	
	_greencircleareapos = [[[getMarkerPos "restrictareacircle", _randomsize],[]],["water","out"]] call BIS_fnc_randomPos;

	_greenareacircle = createMarker ["greenareacircle", _greencircleareapos];
	_greenareacircle setMarkerShape "ELLIPSE";
	_greenareacircle setMarkerSize [_greencirclesize, _greencirclesize];
	_greenareacircle setMarkerColor "ColorGreen";
	_greenareacircle setMarkerBrush "Solid";
	_greenareacircle setMarkerAlpha 0.3;
	
	_getin = "<t size='1.0' font='PuristaSemiBold' align='left' shadow='0' color='#FFFFFF'>New green circle marked!</t>";
	[_getin, 3] remoteExec ["A3BG_fnc_noticentertext",0,false];
	
	[civilian,[_tasknumber],["Get in Green circle area before force to die!","Get in Area!"],(getMarkerPos "greenareacircle"),0,0,false,"Move",true] call BIS_fnc_taskCreate;
};
	
//Airdrop
[_greenareatime] remoteExec ["A3BG_fnc_airdrop",0,false];

//Artillery
[_greenareatime] remoteExec ["A3BG_fnc_artillery",0,false];

greenareacircleactive = true;

while {greenareacircleactive} do {

	if (count allPlayers == 0) then {
		sleep 1;
		if (count allPlayers == 0) exitWith {
			diag_log "[A3BG_LOG] Restart Server. Attempting server shutdown.";
			_shutdownSuccess = A3BG_serverCommandPassword serverCommand "#restartserver";
		};
	};
	
	restriczonedamage = _this select 3;
	publicVariable "restrictzonedamage";
	
	_greenareatime = (_greenareatime) - 1;
	
	_tleft = _greenareatime;
	_hourleft = floor(_tleft / 3600);
	_minuteleft = floor(_tleft % 3600 / 60);
	_secondleft = _tleft % 60;

	if (_minuteleft < 10) then {_minuteleft = format ["0%1",_minuteleft];};
	if (_secondleft < 10) then {_secondleft = format ["0%1",_secondleft];};
	
	_timeleft = format["<t size='0.9' font='PuristaSemiBold' align='center' shadow='0' color='#FFFFFF'>%1:%2</t>", _minuteleft, _secondleft];
	[_timeleft] remoteExec ["A3BG_fnc_timeleft",0,false];

	
	_restricttimemarker = createMarker ["restricttimemarker", [_greencircleareapos select 0,(_greencircleareapos select 1) - _greencirclesize - 300]];
	_restricttimemarker setMarkerType "hd_join";
	_restricttimemarker setMarkerColor "ColorRed";
	_restricttimemarker setMarkerText (format ["%1 Seconds left",_greenareatime]);
	
	sleep 1;
	
	deleteMarker _restricttimemarker;
	
	if (_greenareatime == 300) then {
		_getin5left = "<t size='1.0' font='PuristaSemiBold' align='left' shadow='0' color='#FFFFFF'>In 5 minutes the area will updates!</t>";
		[_getin5left, 4] remoteExec ["A3BG_fnc_noticentertext",0,false];
	};
	if (_greenareatime == 240) then {
		_getin5left = "<t size='1.0' font='PuristaSemiBold' align='left' shadow='0' color='#FFFFFF'>In 4 minutes the area will updates!</t>";
		[_getin5left, 4] remoteExec ["A3BG_fnc_noticentertext",0,false];
	};
	if (_greenareatime == 180) then {
		_getin3mleft = "<t size='1.0' font='PuristaSemiBold' align='left' shadow='0' color='#FFFFFF'>In 3 minutes the area will updates!</t>";
		[_getin3mleft, 4] remoteExec ["A3BG_fnc_noticentertext",0,false];
	};
	if (_greenareatime == 120) then {
		_getin2mleft = "<t size='1.0' font='PuristaSemiBold' align='left' shadow='0' color='#FFFFFF'>In 2 minutes the area will updates!</t>";
		[_getin2mleft, 4] remoteExec ["A3BG_fnc_noticentertext",0,false];
	};
	if (_greenareatime == 60) then {
		_getin1mleft = "<t size='1.0' font='PuristaSemiBold' align='left' shadow='0' color='#FFFFFF'>In 1 minute the area will updates!</t>";
		[_getin1mleft, 4] remoteExec ["A3BG_fnc_noticentertext",0,false];
	};
	if (_greenareatime == 30) then {
		_getin30sleft = "<t size='1.0' font='PuristaSemiBold' align='left' shadow='0' color='#FFFFFF'>In 30 seconds the area will updates!</t>";
		[_getin30sleft, 2] remoteExec ["A3BG_fnc_noticentertext",0,false];
	};
	if (_greenareatime == 20) then {
		_getin20sleft = "<t size='1.0' font='PuristaSemiBold' align='left' shadow='0' color='#FFFFFF'>In 20 seconds the area will updates!</t>";
		[_getin20sleft, 2] remoteExec ["A3BG_fnc_noticentertext",0,false];
	};
	if (_greenareatime == 10) then {
		_getin10sleft = "<t size='1.0' font='PuristaSemiBold' align='left' shadow='0' color='#FFFFFF'>In 10 seconds the area will updates!</t>";
		[_getin10sleft, 2] remoteExec ["A3BG_fnc_noticentertext",0,false];
	};
	
	if (_greenareatime == 0) then {
		
		_markerpos1 = getMarkerPos "greenareacircle";
		_markerposx1 = _markerpos1 select 0;
		_markerposy1 = _markerpos1 select 1;

		_markerpos2 = getMarkerPos "restrictareacircle";
		_markerposx2 = _markerpos2 select 0;
		_markerposy2 = _markerpos2 select 1;
		
		_markerdisx = "";
		if (_markerposx1 > _markerposx2) then {
			_markerdisx = _markerposx1 - _markerposx2;
		} else { _markerdisx = _markerposx2 - _markerposx1; };

		_markerdisy = "";
		if (_markerposy1 > _markerposy2) then {
			_markerdisy = _markerposy1 - _markerposy2;;
		} else { _markerdisy = _markerposy2 - _markerposy1; };
		
		_markerdistime = "";
		_markerdistime = _randomsize / _restrictareatime / 35;
		_markerdisxd = _markerdisx / _restrictareatime / 35;
		_markerdisyd = _markerdisy / _restrictareatime / 35;
		
		_restrictionstart = "<t size='1.0' font='PuristaSemiBold' align='left' shadow='0' color='#FFFFFF'>Restriction area start!</t>";
		[_restrictionstart, 1] remoteExec ["A3BG_fnc_noticentertext",0,false];
		
		_restrictarea = format["<t size='0.9' font='PuristaSemiBold' align='center' shadow='0' color='#FF0000'>Restrict the area</t>"];
		[_restrictarea] remoteExec ["A3BG_fnc_timeleft",0,false];
		
		restrictingarea = true;
		
		while {restrictingarea} do {
		
			if ({alive _x} count allPlayers == 1) exitWith {};
			
			matchstart = true;
			publicVariable "matchstart";
			
			restrictzonedamage = _this select 3;
			publicVariable "restrictzonedamage";
			
			_markersize = getMarkerSize "restrictareacircle";
			_markerpos = getMarkerpos "restrictareacircle";
			
			_markerx = (_markersize select 0) - _markerdistime;
			_markery = (_markersize select 1) - _markerdistime;
			
			if (_markerposx1 > _markerposx2) then {
				_markerdisx = (_markerpos select 0) + _markerdisxd;
			} else { _markerdisx = (_markerpos select 0) - _markerdisxd; };
			if (_markerposy1 > _markerposy2) then {
				_markerdisy = (_markerpos select 1) + _markerdisyd;
			} else { _markerdisy = (_markerpos select 1) - _markerdisyd; };
			
			deleteMarker _restrictareacircle;

			_restrictareacircle = createMarker ["restrictareacircle", [_markerdisx,_markerdisy]];
			_restrictareacircle setMarkerShape "ELLIPSE";
			_restrictareacircle setMarkerSize [_markerx, _markery];
			_restrictareacircle setMarkerColor "ColorRed";
			_restrictareacircle setMarkerBrush "Border";
			
			if ((_markersize select 0) <= _greencirclesize) then 
			{
				deleteMarker _restrictareacircle;
				_restrictareacircle = createMarker ["restrictareacircle", getMarkerPos "greenareacircle"];
				_restrictareacircle setMarkerShape "ELLIPSE";
				_restrictareacircle setMarkerSize [_greencirclesize, _greencirclesize];
				_restrictareacircle setMarkerColor "ColorRed";
				_restrictareacircle setMarkerBrush "Border";
				
				restrictingarea = false;
			};
			sleep 0.025;
		};
		greenareacircleactive = false;
	};
	
	if ({alive _x} count allPlayers == 1) exitWith {
		restrictzonedamage = 0;
		publicVariable "restrictzonedamage";
	};
	
	matchstart = true;
	publicVariable "matchstart";
	
	restrictzonedamage = _this select 3;
	publicVariable "restrictzonedamage";
};

[_tasknumber, "Succeeded",false] call BIS_fnc_taskSetState;

if ({alive _x} count allPlayers == 1) exitWith
{
	//player allowDamage false;
	
	restrictzonedamage = 0;
	publicVariable "restrictzonedamage";
	
	survivalgameend = true;
	publicVariable "survivalgameend";
	
	_lastplayer = allPlayers select {{alive _x} count units _x > 0} select 0;
	_uid = getPlayerUID _lastplayer;
	_name = name _lastplayer;
	
	_lastplayer allowDamage false;
	
	systemChat format["Winner is %1 - Match Finished", _name];
	diag_log format ["[A3BG_LOG] The winner is %1 - http://steamcommunity.com/profiles/%2", _name, _uid];
						
	_playerWin = _lastplayer;
	[_playerWin, totalplayer] remoteExec ["A3BG_fnc_endmatch",0,false];
	
	sleep 25;
	
	diag_log "[A3BG_LOG] Restart Server. Attempting server shutdown.";
	_shutdownSuccess = A3BG_serverCommandPassword serverCommand "#restartserver";
};

sleep 5;

matchstart = true;
publicVariable "matchstart";
	
restrictzonedamage = _this select 3;
publicVariable "restrictzonedamage";