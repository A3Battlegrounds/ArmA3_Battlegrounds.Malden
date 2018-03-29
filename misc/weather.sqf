/*
 *	This project is licensed under the GNU Affero GPL v3. Copyright © 2018 ArmaBwS.com
 *
 *	@file Name: weather.sqf
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

while {true} do {
	_timeforecast = 1800 + (random 1800);
//	skipTime -24;
	_setfog1 = (random -0.1)+0.1;
	_setfog2 = (random -0.05)+0.05;
	if (_setfog1 > 0.06) then {_setfog2 = (random -0.04)+0.04;};
	60 setfog [_setfog1, _setfog2, random 100];
//	setwind [0, 0, true];
	_overcast = (random -1)+1;
	_timeforecast setOvercast _overcast;
	60 setWaves (random -0.5)+0.5;

	if (_overcast >= 0.7) then  {
		30 setRain (random -1)+1;
		30 setLightnings (random -1)+1;
		30 setWaves (random -0.5)+1;
		
		_windx = (random 10)-(random 10); 
		if (_windx > 0) then { 
			_windx = _windx + 5; 
		} else { 
			_windx = _windx - 5; 
		};
		_windy = (random 10)-(random 10); 
		if (_windy > 0) then { 
			_windy = _windy + 5; 
		} else { 
			_windy = _windy - 5; 
		};
		setwind [_windx, _windy, true];
	};

	_windy = (random 5)-(random 5); 
	_windx = (random 5)-(random 5); 
	setwind [_windx, _windy, true];
	
	//simulweatherSync;
//	forceWeatherChange;
	//sleep 60;
//	skipTime 24;
	sleep _timeforecast;
};
// note ไป override คลื่นและฟ้าผ่า
/*
//for check random
//_txt = (random -0.1)+0.1; hint format ["%1",_txt];
//_txt = nextWeatherChange; hint format ["%1",_txt];

_overcastforcast = overcastForecast;
_overcast = overcast;
_fog = fogParams;
_foglevel = fog;
_rainLevel = rain;
_lightningsVal = lightnings;
_waveIntensity = waves;
_windarray = wind;

hint format ["over1 - %1, over2 - %2, fog1 - %3, fog2 - %4, rain - %5,
			lightning - %6, wave - %7, wind - %8",_overcastforcast,_overcast,_fog,_foglevel,_rainLevel,
				_lightningsVal,_waveIntensity,_windarray];