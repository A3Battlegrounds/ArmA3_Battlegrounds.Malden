/*
 *	This project is licensed under the GNU Affero GPL v3. Copyright © 2018 ArmaBwS.com
 *
 *	@file Name: vehicle.sqf
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
		playerVehiclePic = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		playerVehiclePic ctrlSetPosition [ safezoneX + 0.005, safezoneY + safezoneH - 0.14, 0.2, 0.15];
		playerVehiclePic ctrlSetBackgroundColor [0, 0, 0, 0];
		playerVehiclePic ctrlCommit 0;
		
		vehicleSpeed = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		vehicleSpeed ctrlSetPosition [ safezoneX + 0.2, safezoneY + safezoneH - 0.145, 0.237, 0.05];
		vehicleSpeed ctrlSetBackgroundColor [0, 0, 0, 0];
		vehicleSpeed ctrlCommit 0;
		
		vehicleFuelLevel = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		vehicleFuelLevel ctrlSetPosition [ safezoneX + 0.2, safezoneY + safezoneH - 0.098, 0.237, 0.022];
		vehicleFuelLevel ctrlSetTextColor [0, 0, 0, 0];
		vehicleFuelLevel ctrlCommit 0;
		
		vehicleFuelBackground = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		vehicleFuelBackground ctrlSetPosition [ safezoneX + 0.21, safezoneY + safezoneH - 0.07, 0.217, 0.015];
		vehicleFuelBackground ctrlSetBackgroundColor [0, 0, 0, 0.8];
		vehicleFuelBackground ctrlCommit 0;
		
		vehicleFuelBar = findDisplay 46 ctrlCreate ["RscProgress", -1];
		vehicleFuelBar ctrlSetPosition [ safezoneX + 0.21, safezoneY + safezoneH - 0.07, 0.217, 0.015];
		vehicleFuelBar ctrlSetTextColor [0.996, 0.604, 0.18, 0.9];
		vehicleFuelBar progressSetPosition 0;
		vehicleFuelBar ctrlCommit 0;
		
		vehicleHullBack = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		vehicleHullBack ctrlSetPosition [ safezoneX + 0.21, safezoneY + safezoneH - 0.047, 0.05, 0.035];
		vehicleHullBack ctrlSetBackgroundColor [0, 0, 0, 0.8];
		vehicleHullBack ctrlCommit 0;
		
		vehicleHull = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		vehicleHull ctrlSetPosition [ safezoneX + 0.21, safezoneY + safezoneH - 0.047, 0.05, 0.035];
		vehicleHull ctrlSetBackgroundColor [1, 1, 1, 0.9];
		vehicleHull ctrlCommit 0;
		
		vehicleEngineBack = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		vehicleEngineBack ctrlSetPosition [ safezoneX + 0.265, safezoneY + safezoneH - 0.047, 0.05, 0.035];
		vehicleEngineBack ctrlSetBackgroundColor [0, 0, 0, 0.8];
		vehicleEngineBack ctrlCommit 0;
		
		vehicleEngine = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		vehicleEngine ctrlSetPosition [ safezoneX + 0.265, safezoneY + safezoneH - 0.047, 0.05, 0.035];
		vehicleEngine ctrlSetBackgroundColor [1, 1, 1, 0.9];
		vehicleEngine ctrlCommit 0;
		
		vehicleFuelBack = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		vehicleFuelBack ctrlSetPosition [ safezoneX + 0.32, safezoneY + safezoneH - 0.047, 0.05, 0.035];
		vehicleFuelBack ctrlSetBackgroundColor [0, 0, 0, 0.8];
		vehicleFuelBack ctrlCommit 0;
		
		vehicleFuel = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		vehicleFuel ctrlSetPosition [ safezoneX + 0.32, safezoneY + safezoneH - 0.047, 0.05, 0.035];
		vehicleFuel ctrlSetBackgroundColor [1, 1, 1, 0.9];
		vehicleFuel ctrlCommit 0;
		
		vehicleWheelBack = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		vehicleWheelBack ctrlSetPosition [ safezoneX + 0.375, safezoneY + safezoneH - 0.047, 0.05, 0.035];
		vehicleWheelBack ctrlSetBackgroundColor [0, 0, 0, 0.8];
		vehicleWheelBack ctrlCommit 0;
		
		vehicleWheel = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		vehicleWheel ctrlSetPosition [ safezoneX + 0.375, safezoneY + safezoneH - 0.047, 0.05, 0.035];
		vehicleWheel ctrlSetBackgroundColor [1, 1, 1, 0.9];
		vehicleWheel ctrlCommit 0;
	};
	
	while {true} do
	{		
		//Initialize variables and set values
		
		//Vehicle
		_vehicleClass = typeOf vehicle player;
		_vehicletxt = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "displayName");
		_vehiclepic = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "picture");
		_vehicleSpeed = round(speed vehicle player);
		_vehicleFuel = fuel vehicle player;
		_vehicleHeight = round (getPosATL player select 2);
		
		_wheel1 = (vehicle player) gethit "wheel_1_1_steering";
		_wheel2 = (vehicle player) gethit "wheel_1_2_steering";
		_wheel3 = (vehicle player) gethit "wheel_2_1_steering";
		_wheel4 = (vehicle player) gethit "wheel_2_2_steering";
		_hull = (vehicle player) getHitPointDamage "hitHull";
		_fuel = (vehicle player) getHitPointDamage "hitFuel";
		_engine = (vehicle player) getHitPointDamage "hitEngine";
		
		_colorWheel = [1,1,1,0.9];
		if (((_wheel1 >= 0) && (_wheel1 <= 0.4)) || ((_wheel2 >= 0) && (_wheel2 <= 0.4)) || ((_wheel3 >= 0) && (_wheel3 <= 0.4)) || ((_wheel4 >= 0) && (_wheel4 <= 0.4))) then {_colorWheel = [1,1,1,0.9];};
		if (((_wheel1 > 0.4) && (_wheel1 <= 0.8)) || ((_wheel2 > 0.4) && (_wheel2 <= 0.8)) || ((_wheel3 > 0.4) && (_wheel3 <= 0.8)) || ((_wheel4 > 0.4) && (_wheel4 <= 0.8))) then {_colorWheel = [0.996,0.604,0.18,0.9];};
		if (_wheel1 > 0.8 || _wheel2 > 0.8 || _wheel3 > 0.8 || _wheel4 > 0.8) then {_colorWheel = [1,0,0,0.9];};
		
		_colorHull = [1,1,1,0.9];
		if ((_hull >= 0) && (_hull <= 0.4)) then {_colorHull = [1,1,1,0.9];};
		if ((_hull > 0.4) && (_hull <= 0.8)) then {_colorHull = [0.996,0.604,0.18,0.9];};
		if (_hull > 0.8) then {_colorHull = [1,0,0,0.9];};
		
		_colorFuel = [1,1,1,0.9];
		if ((_fuel >= 0) && (_fuel <= 0.4)) then {_colorFuel = [1,1,1,0.9];};
		if ((_fuel > 0.4) && (_fuel <= 0.8)) then {_colorFuel = [0.996,0.604,0.18,0.9];};
		if (_fuel > 0.8) then {_colorFuel = [1,0,0,0.9];};
		
		_colorEngine = [1,1,1,0.9];
		if ((_engine >= 0) && (_engine <= 0.4)) then {_colorEngine = [1,1,1,0.9];};
		if ((_engine > 0.4) && (_engine <= 0.8)) then {_colorEngine = [0.996,0.604,0.18,0.9];};
		if (_engine > 0.8) then {_colorEngine = [1,0,0,0.9];};
		
		if (vehicle player != player) then {
			_vehiclepict = format ["<img size='3.0' align='center' shadow='1' image='%1'/>", _vehiclepic];
			(uiNamespace getVariable "playerVehiclePic") ctrlSetStructuredText parseText _vehiclepict;
			
			if (_vehicleClass == "Steerable_Parachute_F") then {
				_speedVehicle = format ["<t size='1.2' font='PuristaMedium' align='left' shadow='1' color='#FFFFFF'>%1 <t size='0.8' shadow='1'>km/h<t size='0.8' align='right' shadow='1'>ALT: %2 m</t>", _vehicleSpeed, _vehicleHeight];
				(uiNamespace getVariable "vehicleSpeed") ctrlSetStructuredText parseText _speedVehicle;
			
				(uiNamespace getVariable "vehicleFuelBackground") ctrlSetBackgroundColor [0, 0, 0, 0];
				(uiNamespace getVariable "vehicleFuelBar") ctrlSetTextColor [0.996, 0.604, 0.18, 0];
				(uiNamespace getVariable "vehicleFuelBar") progressSetPosition 0;

				(uiNamespace getVariable "vehicleHullBack") ctrlSetBackgroundColor [0, 0, 0, 0];
				(uiNamespace getVariable "vehicleEngineBack") ctrlSetBackgroundColor [0, 0, 0, 0];
				(uiNamespace getVariable "vehicleFuelBack") ctrlSetBackgroundColor [0, 0, 0, 0];
				(uiNamespace getVariable "vehicleWheelBack") ctrlSetBackgroundColor [0, 0, 0, 0];
			}else{
				_speedVehicle = format ["<t size='1.2' font='PuristaMedium' align='left' shadow='1' color='#FFFFFF'>%1 <t size='0.8' shadow='1'>km/h</t>", _vehicleSpeed];
				(uiNamespace getVariable "vehicleSpeed") ctrlSetStructuredText parseText _speedVehicle;
				
				_fuellevel = format ["<t size='0.6' font='PuristaMedium' align='left' shadow='1' color='#FF0000'>E<t align='right' shadow='1' color='#FFFFFF'>F</t>"];
				(uiNamespace getVariable "vehicleFuelLevel") ctrlSetStructuredText parseText _fuellevel;
			
				(uiNamespace getVariable "vehicleFuelBackground") ctrlSetBackgroundColor [0, 0, 0, 0.8];
				(uiNamespace getVariable "vehicleFuelBar") ctrlSetTextColor [0.996, 0.604, 0.18, 0.9];
				(uiNamespace getVariable "vehicleFuelBar") progressSetPosition _vehicleFuel;

				_hulltxt = format ["<t size='0.6' align='center' color='#000000'>HULL</t>"];
				(uiNamespace getVariable "vehicleHull") ctrlSetStructuredText parseText _hulltxt;
				(uiNamespace getVariable "vehicleHullBack") ctrlSetBackgroundColor [0, 0, 0, 0.8];
				(uiNamespace getVariable "vehicleHull") ctrlSetBackgroundColor _colorHull;
				
				_enginetxt = format ["<t size='0.6' align='center' color='#000000'>ENG</t>"];
				(uiNamespace getVariable "vehicleEngine") ctrlSetStructuredText parseText _enginetxt;
				(uiNamespace getVariable "vehicleEngineBack") ctrlSetBackgroundColor [0, 0, 0, 0.8];
				(uiNamespace getVariable "vehicleEngine") ctrlSetBackgroundColor _colorEngine;
				
				_fueltxt = format ["<t size='0.6' align='center' color='#000000'>FUEL</t>"];
				(uiNamespace getVariable "vehicleFuel") ctrlSetStructuredText parseText _fueltxt;
				(uiNamespace getVariable "vehicleFuelBack") ctrlSetBackgroundColor [0, 0, 0, 0.8];
				(uiNamespace getVariable "vehicleFuel") ctrlSetBackgroundColor _colorFuel;
				
				_wheeltxt = format ["<t size='0.6' align='center' color='#000000'>WHL</t>"];
				(uiNamespace getVariable "vehicleWheel") ctrlSetStructuredText parseText _wheeltxt;
				(uiNamespace getVariable "vehicleWheelBack") ctrlSetBackgroundColor [0, 0, 0, 0.8];
				(uiNamespace getVariable "vehicleWheel") ctrlSetBackgroundColor _colorWheel;
			};
		}else{
			_vehiclepict = "";
			(uiNamespace getVariable "playerVehiclePic") ctrlSetStructuredText parseText _vehiclepict;
			
			_speedVehicle = "";
			(uiNamespace getVariable "vehicleSpeed") ctrlSetStructuredText parseText _speedVehicle;
			
			_fuellevel = "";
			(uiNamespace getVariable "vehicleFuelLevel") ctrlSetStructuredText parseText _fuellevel;
			
			(uiNamespace getVariable "vehicleFuelBackground") ctrlSetBackgroundColor [0, 0, 0, 0];
			(uiNamespace getVariable "vehicleFuelBar") ctrlSetTextColor [0, 0, 0, 0];
			(uiNamespace getVariable "vehicleFuelBar") progressSetPosition 0;
			
			_hulltxt = "";
			(uiNamespace getVariable "vehicleHull") ctrlSetStructuredText parseText _hulltxt;
			(uiNamespace getVariable "vehicleHullBack") ctrlSetBackgroundColor [0, 0, 0, 0];
			(uiNamespace getVariable "vehicleHull") ctrlSetBackgroundColor [0, 0, 0, 0];

			_enginetxt = "";
			(uiNamespace getVariable "vehicleEngine") ctrlSetStructuredText parseText _enginetxt;
			(uiNamespace getVariable "vehicleEngineBack") ctrlSetBackgroundColor [0, 0, 0, 0];
			(uiNamespace getVariable "vehicleEngine") ctrlSetBackgroundColor [0, 0, 0, 0];

			_fueltxt = "";
			(uiNamespace getVariable "vehicleFuel") ctrlSetStructuredText parseText _fueltxt;
			(uiNamespace getVariable "vehicleFuelBack") ctrlSetBackgroundColor [0, 0, 0, 0];
			(uiNamespace getVariable "vehicleFuel") ctrlSetBackgroundColor [0, 0, 0, 0];

			_wheeltxt = "";
			(uiNamespace getVariable "vehicleWheel") ctrlSetStructuredText parseText _wheeltxt;
			(uiNamespace getVariable "vehicleWheelBack") ctrlSetBackgroundColor [0, 0, 0, 0];
			(uiNamespace getVariable "vehicleWheel") ctrlSetBackgroundColor [0, 0, 0, 0];
		};
		
		uiSleep 0.1;
	};
};