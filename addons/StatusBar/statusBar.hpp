/*
 *	This project is licensed under the GNU Affero GPL v3. Copyright © 2018 ArmaBwS.com
 *
 *	@file Name: statusBar.hpp
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

class RscStatusBar
{
	idd = -1;
	duration = 10e10;
	onLoad = "uiNamespace setVariable ['RscStatusBar', _this select 0];";
	fadein = 0;
	fadeout = 0;
	movingEnable = 0;
	objects[] = {};

	class controls
	{
		class statusBarText
		{
			idc = 55554;
			x = safezoneX + ((safezoneW / 2) - 0.5);
			y = safezoneY + safezoneH - 0.04);
			w = 1.0;
			h = 0.04;
			shadow = 2;
			font = "PuristaMedium";
			size = 0.040;
			type = 13;
			style = 2;
			text = "";

			class Attributes
			{
				align = "center";
				color = "#ffffff";
				font = "PuristaMedium";
			};
		};
	};
};