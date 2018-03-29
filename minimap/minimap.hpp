/*
 *	This project is licensed under the GNU Affero GPL v3. Copyright © 2018 ArmaBwS.com
 *
 *	@file Name: minimap.hpp
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

class RscPicture
{
	access = 0;
	type = CT_STATIC;
	idc = -1;
	style = 48;//ST_PICTURE
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "TahomaB";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
};

class myMap
{
	idd = 20000;
	duration = 1e10;
	fadein = 0;
	fadeout = 0;

	class controlsBackground
	{		
		class theMiniMap: RscMapControl
		{

			idc = 38555;
			type = 101;
			style = 48;
			moveOnEdges = 0;
			x = safeZoneX + safeZoneW * 0.86;
			y = safeZoneY + safeZoneH * 0.76;
			w = 0.12 * safeZoneW;
			h = 0.2 * safeZoneH;

			onDraw = "_this call fnc_updateMiniMap";
		};
		
		class Border: RscPicture
		{
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = safeZoneX + safeZoneW * 0.8595;
			y = safeZoneY + safeZoneH * 0.759;
			w = 0.121 * safeZoneW;
			h = 0.2025 * safeZoneH;
			colorText[] = {0, 0, 0, 0.8};// whatever gives you a thrill 
		};
	};
	
	class controls
	{
		class Picture: RscPicture
		{
			text = "\A3\ui_f\data\Map\VehicleIcons\iconman_ca.paa";
			x = safeZoneX + (safeZoneW * 0.86) + ((0.12 * safeZoneW) / 2) - ((0.015 * safeZoneW) / 2);
			y = safeZoneY + (safeZoneH * 0.76) + ((0.2 * safeZoneH) / 2) - ((0.025 * safeZoneH) / 2);
			w = 0.015 * safeZoneW;
			h = 0.025 * safeZoneH;
			colorText[] = {0.506, 0.969, 0.953, 1};// whatever gives you a thrill 
		};
	};
};