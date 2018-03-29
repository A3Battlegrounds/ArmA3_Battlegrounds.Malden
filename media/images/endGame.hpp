/*
 *	This project is licensed under the GNU Affero GPL v3. Copyright © 2018 ArmaBwS.com
 *
 *	@file Name: endGame.hpp
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

class RscEndGame
{
	idd = -1;
	duration = 10e10;
	onLoad = "uiNamespace setVariable ['RscEndGame', _this select 0];";
	fadein = 0;
	fadeout = 0;
	movingEnable = 0;
	objects[] = {};

	class controls
	{
		class logo: RscPicture
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
			fixedWidth = 0;
			shadow = 0;
			text = "media\images\battlegrounds.paa";
			x = safeZoneX + (safeZoneW * 0.5) - ((0.3 * safezoneW) / 2);
			y = safeZoneY + (safeZoneH * 0.53) - ((0.6 * safezoneH) / 2);
			w = 0.3 * safezoneW;
			h = 0.6 * safezoneH;
		};
	};
};
