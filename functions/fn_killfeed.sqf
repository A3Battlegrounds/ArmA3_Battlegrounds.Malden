/*
 *	This project is licensed under the GNU Affero GPL v3. Copyright © 2018 ArmaBwS.com
 *
 *	@file Name: fn_killfeed.sqf
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

MessageDuration = 10; // Time in seconds the message stays on the screen.

_id = (_this select 0);
_killer = _id select 0;
_victim = _id select 1;
_killWeapon = _id select 2;
_distance = _id select 3;
_pic = _id select 4;

if ((name player) == _killer) then 
{
	_popup = format [
						"<t size='0.6' font='PuristaSemiBold' align='center' shadow='1' color='#FFFFFF' shadowColor='#000000'>You killed %1 with %2</t>",
						_victim,
						_killWeapon
					];
					
	[_popup, [safezoneX + 0.4 * safezoneW, 0.5], [safezoneY + 0.85 * safezoneH, 1], MessageDuration, 0, 0, 7017] spawn bis_fnc_dynamicText;
};

if ((name player) == _victim) then 
{
	_popup = format [
						"<t size='0.6' font='PuristaSemiBold' align='center' shadow='1' color='#FFFFFF' shadowColor='#000000'>You were killed by %1 with %2</t>",
						_killer,
						_killWeapon
					];
					
	[_popup, [safezoneX + 0.4 * safezoneW, 0.5], [safezoneY + 0.85 * safezoneH, 1], MessageDuration, 0, 0, 7017] spawn bis_fnc_dynamicText;
};

_killfeedtopright = format[
							"<t size='0.5' font='PuristaSemiBold' align='right' shadow='1' color='#FFFFFF'>%1  </t>
							<img size='0.5' font='PuristaSemiBold' align='right' shadow='1' image='%3'/>
							<t size='0.5' font='PuristaSemiBold' align='right' shadow='1' color='#EF4F43'>  %2</t>",
							_killer,
							_victim,
							_pic
						];
						
[_killfeedtopright, [safezoneX + (safezoneW - 0.6), 0.5], [safezoneY + 0.37, 0.2], MessageDuration, 0.2, 0, 7002] spawn BIS_fnc_dynamicText;
