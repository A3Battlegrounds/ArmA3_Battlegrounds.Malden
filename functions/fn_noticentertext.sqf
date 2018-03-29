/*
 *	This project is licensed under the GNU Affero GPL v3. Copyright © 2018 ArmaBwS.com
 *
 *	@file Name: fn_noticentertext.sqf
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

if(isDedicated)exitWith{};

_messagetoptext = _this select 0;
_iconColor = _this select 1;

MessageDuration = 10; // Time in seconds the message stays on the screen.

playSound "notification";

ctrlDelete (uiNamespace getVariable "iconBox");
ctrlDelete (uiNamespace getVariable "textBox");
ctrlDelete (uiNamespace getVariable "textText");

//Create Notification
with uiNamespace do {	
	iconBox = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
	iconBox ctrlSetPosition [safezoneX + (safezoneW / 2) - 0.25, safezoneY + 0.25, 0.06, 0.075];
	iconBox ctrlSetBackgroundColor [0, 0, 0, 1];
	iconBox ctrlCommit 0;
	
	textBox = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
	textBox ctrlSetPosition [safezoneX + (safezoneW / 2) - 0.19, safezoneY + 0.25, 0.44, 0.075];
	textBox ctrlSetBackgroundColor [0, 0, 0, 0.8]; 
	textBox ctrlCommit 0;
	
	textText = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
	textText ctrlSetPosition [safezoneX + (safezoneW / 2) - 0.19, safezoneY + 0.265, 0.44, 0.075];
	textText ctrlSetBackgroundColor [0, 0, 0, 0]; 
	textText ctrlCommit 0;
};
	
//Red
if (_iconColor == 1) then {
	(uiNamespace getVariable "iconBox") ctrlSetBackgroundColor [0.996, 0.18, 0.18, 1];
};

//Orange
if (_iconColor == 2) then {
	(uiNamespace getVariable "iconBox") ctrlSetBackgroundColor [0.996, 0.604, 0.18, 1];
};

//Green
if (_iconColor == 3) then {
	(uiNamespace getVariable "iconBox") ctrlSetBackgroundColor [0.18, 0.996, 0.18, 1];
};

//Yellow
if (_iconColor == 4) then {
	(uiNamespace getVariable "iconBox") ctrlSetBackgroundColor [0.969, 0.996, 0.18, 1];
};


(uiNamespace getVariable "textText") ctrlSetStructuredText parseText _messagetoptext;
	
uiSleep MessageDuration;

ctrlDelete (uiNamespace getVariable "iconBox");
ctrlDelete (uiNamespace getVariable "textBox");
ctrlDelete (uiNamespace getVariable "textText");
