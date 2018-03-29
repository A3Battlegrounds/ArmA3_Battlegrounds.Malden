/*
 *	This project is licensed under the GNU Affero GPL v3. Copyright © 2018 ArmaBwS.com
 *
 *	@file Name: weapon.sqf
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
		playerAmmoText = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		playerAmmoText ctrlSetPosition [ safezoneX + (safezoneW / 2) - 0.24, safezoneY + safezoneH - 0.325, 0.5, 0.07];
		playerAmmoText ctrlSetBackgroundColor [0, 0, 0, 0];
		playerAmmoText ctrlCommit 0;
		
		playerWeaponPic = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		playerWeaponPic ctrlSetPosition [ safezoneX + (safezoneW / 2) - 0.24, safezoneY + safezoneH - 0.31, 0.5, 0.2];
		playerWeaponPic ctrlSetBackgroundColor [0, 0, 0, 0];
		playerWeaponPic ctrlCommit 0;
		
		weaponModeText = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		weaponModeText ctrlSetPosition [ safezoneX + (safezoneW / 2) - 0.19, safezoneY + safezoneH - 0.135, 0.4, 0.2];
		weaponModeText ctrlSetBackgroundColor [0, 0, 0, 0];
		weaponModeText ctrlCommit 0;
		
		playerGrenadePic = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
		playerGrenadePic ctrlSetPosition [ safezoneX + (safezoneW / 2) + 0.28, safezoneY + safezoneH - 0.1, 0.15, 0.1];
		playerGrenadePic ctrlSetBackgroundColor [0, 0, 0, 0];
		playerGrenadePic ctrlCommit 0;
	};
	
	_colourDefault = parseText "#FFFFFF";
	_colourEmpty = parseText "#FF0000";
	
	Fn_Gear_CompatibleMagazines = { 
		private _cls = configFile >> "CfgWeapons" >> _this; 
		private _res = []; 
		{
			_res pushBack (if (_x == "this") then {getArray(_cls >> "magazines")} else {getArray(_cls >> _x >> "magazines")}); 
		} forEach getArray(_cls >> "muzzles"); 
 
		_res 
	};
	
	Fn_Gear_IsThrowable = {  
		private _cfa = configFile >> "CfgAmmo" >> getText(configFile >> "CfgMagazines" >> _this >> "ammo"); 
		while {true} do {
			if (not isClass _cfa or {configName _cfa isEqualTo "GrenadeHand"}) exitWith {isClass _cfa};
	
			_cfa = inheritsFrom _cfa
		} 
	};
	
	while {true} do
	{		
		//Initialize variables and set values
		
		//Player
		_weapon = currentWeapon player;
		_weapontxt = getText (configFile >> "cfgWeapons" >> _weapon >> "displayName");
		_weaponpic = getText (configFile >> "cfgWeapons" >> _weapon >> "picture");
		_ammo = player ammo currentWeapon player;
		_CompatibleMagazines = _weapon call Fn_Gear_CompatibleMagazines;
		_CurrentCompatibleMag = _CompatibleMagazines select 0;
		_magazine = {_x in _CurrentCompatibleMag} count (magazines player);
		_weaponMode = currentWeaponMode player;
		_zeroing = currentZeroing player;
		_allgrenades = magazines player select {_x call Fn_Gear_IsThrowable};
		_grenade = {_x == currentThrowable player select 0} count _allgrenades;
		_currentgrenade = currentThrowable player select 0;
		_grenadepic = getText (configFile >> "CfgMagazines" >> _currentgrenade >> "picture");
		
		if ((_weapon == "") || (vehicle player != player)) then {
			_ammotext = "";
			(uiNamespace getVariable "playerAmmoText") ctrlSetStructuredText parseText _ammotext;
			
			_firemode = "";
			(uiNamespace getVariable "weaponModeText") ctrlSetStructuredText parseText _firemode;
			
			_weaponpict = "";
			(uiNamespace getVariable "playerWeaponPic") ctrlSetStructuredText parseText _weaponpict;
		}else{
			_colourAmmo = _colourDefault;
			_colourMagazine = _colourDefault;
			
			if (_ammo < 1) then {_colourAmmo = _colourEmpty;};
			
			if ((_ammo < 1) && (_magazine < 1)) then {
				_colourAmmo = _colourEmpty;
				_colourMagazine = _colourEmpty;
			};
		
			_ammotext = format ["<t size='1.6' font='PuristaSemiBold' align='center' shadow='1' color='%3'>%1 <t size='1.2' shadow='1' color='%4'>| %2</t>", _ammo, _magazine, _colourAmmo, _colourMagazine];
			(uiNamespace getVariable "playerAmmoText") ctrlSetStructuredText parseText _ammotext;
			
			_firemode = format ["<t size='0.8' font='PuristaMedium' align='left' shadow='1' color='#FFFFFF'>%1<t align='right'>%2 m</t>", _weaponMode, _zeroing];
			(uiNamespace getVariable "weaponModeText") ctrlSetStructuredText parseText _firemode;
			
			_weaponpict = format ["<img size='5.5' align='center' valign='top' shadow='1' image='%1'/>", _weaponpic];
			(uiNamespace getVariable "playerWeaponPic") ctrlSetStructuredText parseText _weaponpict;
		};
		
		if ((_grenade == 0) || (vehicle player != player)) then {
			_grenadepict = "";
			(uiNamespace getVariable "playerGrenadePic") ctrlSetStructuredText parseText _grenadepict;
		}else{
			_grenadepict = format ["<t size='1.2' font='PuristaSemiBold' align='left' valign='middle' shadow='1' color='#FFFFFF'><img size='2.0' shadow='1' image='%1'/> %2</t>", _grenadepic, _grenade];
			(uiNamespace getVariable "playerGrenadePic") ctrlSetStructuredText parseText _grenadepict;
		};

		uiSleep 0.1;
	};
};