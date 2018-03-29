/*
 *	This project is licensed under the GNU Affero GPL v3. Copyright © 2018 ArmaBwS.com
 *
 *	@file Name: statusBar.sqf
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
	_uid = getPlayerUID player;

	while {true} do
	{
		uisleep 0.5;
		
		_rscLayer = "RscStatusBar" call BIS_fnc_rscLayer;
		_rscLayer cutRsc ["RscStatusBar","PLAIN",1,false];

		if(isNull ((uiNamespace getVariable "RscStatusBar")displayCtrl 55554)) then
		{
			diag_log "[A3BG_LOG] statusbar is null create";
			disableSerialization;
			_rscLayer = "RscStatusBar" call BIS_fnc_rscLayer;
			_rscLayer cutRsc ["RscStatusBar","PLAIN",1,false];
		};
		
		//initialize variables and set values
		_unit = _this select 0;
		_serverFPS = round diag_fps;
		_pos = getPosATL player;
		_dir = round (getDir (vehicle player));
		_grid = mapGridPosition  player;
		_xx = (format[_grid]) select [0,3];
		_yy = (format[_grid]) select [3,3];
		
		
		//Display the information
		((uiNamespace getVariable "RscStatusBar")displayCtrl 55554) ctrlSetStructuredText
		parseText
		format
		["
			<t size='0.8' shadow='1' shadowColor='#000000' color='#FFFFFF'>FPS %1</t>
			<t size='0.8' shadow='1' shadowColor='#000000' color='#FFFFFF'>DIR %3</t>
			<t size='0.8' shadow='1' shadowColor='#000000' color='#FFFFFF'>GRID %2</t>",

			_serverFPS, 										//1
			format["%1%2",_xx,_yy], 							//2
			_dir 												//3
		];
	};
};
