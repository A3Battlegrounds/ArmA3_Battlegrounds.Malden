/*
 *	This project is licensed under the GNU Affero GPL v3. Copyright © 2018 ArmaBwS.com
 *
 *	@file Name: fn_initCompass.sqf
 *	@file Author: [BwS] R3V3NG3 - Credits: unknown_GTX
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

waitUntil {!isNull player};

[] spawn A3BG_fnc_showCompass;
