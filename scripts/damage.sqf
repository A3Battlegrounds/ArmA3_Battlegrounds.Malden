/*
 *	This project is licensed under the GNU Affero GPL v3. Copyright © 2018 ArmaBwS.com
 *
 *	@file Name: damage.sqf
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

player addEventHandler ["HandleDamage", {
	params ["_unit", "_hitSelection", "_damage", "_source", "_projectile", "_hitPartIndex", "_instigator", "_hitPoint"];

	// Damage multipliers.  The damage of each projectile will be multiplied by this number.
	private _damageMultiplierHead = 0.6;
	private _damageMultiplierBody = 0.5;
	private _damageMultiplierLimbs = 0.15;
	private _damageMultiplierHands = 0.15;
	private _damageMultiplierOverall = 0.5;

	// Damage limits.  Each projectile will be limited to a max of this much damage.
	private _limitHead = 1.0;
	private _limitBody = 0.35;
	private _limitLimbs = 0.1;
	private _limitHands = 0.1;
	private _limitOverall = 0.35;

	private _oldDamage = 0;
	if (_hitSelection isEqualTo "") then {_oldDamage = damage _unit} else {_oldDamage = _unit getHit _hitSelection};
	private _newDamage = _damage - _oldDamage max 0;
	private _incomingDamage = _newDamage;
	private _playerHealth = damage _unit;
	private _playerName = name _unit;

	// Infantry selections
	// Keep in mind that if revive is enabled then incapacitation may occur at around 0.7 damage.
	// "": The overall damage that determines the damage value of the unit. Unit dies at damage equal to or above 1
	// "face_hub": Unit dies at damage equal to or above 1
	// "neck": Unit dies at damage equal to or above 1
	// "head": Unit dies at damage equal to or above 1
	// "pelvis": Unit dies at damage equal to or above 1
	// "spine1": Unit dies at damage equal to or above 1
	// "spine2": Unit dies at damage equal to or above 1
	// "spine3": Unit dies at damage equal to or above 1
	// "body": Unit dies at damage equal to or above 1
	// "arms": Unit doesn't die with damage to this part
	// "hands": Unit doesn't die with damage to this part
	// "legs": Unit doesn't die with damage to this part

	// Do any other damage calculations here
	// _damage is the previous damage plus any new damage and will be applied
	// as the total damage the unit has for this selection once this EH returns

	// Only modify damage if it is a known projectile (leave falling damage etc alone)
	if (_newDamage > 0 && !(_projectile isEqualTo "")) then {
		// Reduce damage by damage multiplier
		private _damageMultiplier = _damageMultiplierBody;
		private _upperLimit = _limitBody;
		switch (_hitSelection) do {
			case "face_hub";
			case "head": {
				_damageMultiplier = _damageMultiplierHead;
				_upperLimit = _limitHead;
			};
			case "arms";
			case "hands"; {
				_damageMultiplier = _damageMultiplierHands; //0.15
				_upperLimit = _limitHands; //0.1
			};
			case "legs": {
				_damageMultiplier = _damageMultiplierLimbs; //0.15
				_upperLimit = _limitLimbs; //0.1
			};
			case "": {
				_damageMultiplier = _damageMultiplierOverall;
				_upperLimit = _limitOverall;
			};
			default { 
				_damageMultiplier = _damageMultiplierBody;
				_upperLimit = _limitBody;
			};
		};
		_newDamage = _newDamage * _damageMultiplier;

		// Place an upper limit on projectile damage done at once
		if (_newDamage > _upperLimit) then {
			_newDamage = _upperLimit;
		};

		_damage = _oldDamage + _newDamage;
	}else{
		if (vehicle player != player) then { //Player is in a vehicle
			_damage;
		}else{
			_damage = damage _unit;
		};
	};
	
	if ((_unit gethit "legs") > _limitLimbs) then {
		_unit sethit ["legs", 0];
	};
	
	if ((_unit gethit "hands") > _limitHands) then {
		_unit sethit ["hands", 0];
	};
	
	//systemchat format["Target: %1 | Health: %2 | selection: %3 | oldTotal: %4 | newTotal: %5 | incomingDmg: %6 | appliedDmg: %7", _playerName, _playerHealth, _hitSelection, _oldDamage, _damage, _incomingDamage, _newDamage];

	_damage
}];