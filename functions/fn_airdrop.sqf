/*
 *	This project is licensed under the GNU Affero GPL v3. Copyright © 2018 ArmaBwS.com
 *
 *	@file Name: fn_airdrop.sqf
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

if (!isServer) exitWith {};

_sleepAirdrop = _this select 0;

_chuteType = "B_Parachute_02_F";	//parachute for blufor, for opfor and greenfor replace the 'B' with 'O' or 'G' respectively
_crateType = "Box_IND_AmmoVeh_F";	//ammocrate class for blufor, feel free to change to whichever box you desire
_smokeType = "SmokeShellGreen";  	//smoke shell color you want to use
_min_weapons = 3;    				//minimum number of weapons to spawn
_max_weapons = 10;    				//maximum number of weapons to spawn
_min_magazines = 4;    				//minimum number of mags to spawn
_max_magazines = 8;    				//maximum number of mags to spawn

_weaponlist = [
				"srifle_GM6_F",
				"srifle_GM6_camo_F",
				"arifle_Katiba_F",
				"arifle_Katiba_C_F",
				"srifle_LRR_F",
				"srifle_LRR_camo_F",
				"srifle_EBR_F",
				"arifle_Mk20_plain_F",
				"arifle_Mk20_F",
				"LMG_Mk200_F",
				"arifle_Mk20C_plain_F",
				"arifle_Mk20C_F",
				"arifle_MX_Black_F",
				"arifle_MX_F",
				"arifle_MX_SW_Black_F",
				"arifle_MX_SW_F",
				"arifle_MXC_Black_F",
				"arifle_MXC_F",
				"arifle_MXM_Black_F",
				"arifle_MXM_F",
				"srifle_DMR_01_F",
				"arifle_SDAR_F",
				"SMG_02_F",
				"arifle_TRG20_F",
				"arifle_TRG21_F",
				"SMG_01_F",
				"LMG_Zafir_F",
				"arifle_Katiba_F",
				"arifle_Katiba_C_F",
				"arifle_Mk20_plain_F",
				"arifle_Mk20_F",
				"arifle_Mk20C_plain_F",
				"arifle_Mk20C_F",
				"arifle_MX_Black_F",
				"arifle_MX_F",
				"arifle_MX_SW_Black_F",
				"arifle_MX_SW_F",
				"arifle_MXC_Black_F",
				"arifle_MXC_F",
				"arifle_MXM_Black_F",
				"arifle_MXM_F",
				"arifle_SDAR_F",
				"SMG_02_F",
				"arifle_TRG20_F",
				"arifle_TRG21_F",
				"SMG_01_F",
				"arifle_Katiba_F",
				"arifle_Katiba_C_F",
				"arifle_Mk20_plain_F",
				"arifle_Mk20_F",
				"arifle_Mk20C_plain_F",
				"arifle_Mk20C_F",
				"arifle_MX_Black_F",
				"arifle_MX_F",
				"arifle_MX_SW_Black_F",
				"arifle_MX_SW_F",
				"arifle_MXC_Black_F",
				"arifle_MXC_F",
				"arifle_SDAR_F",
				"SMG_02_F",
				"arifle_TRG20_F",
				"arifle_TRG21_F",
				"SMG_01_F",
				"arifle_Katiba_F",
				"arifle_Katiba_C_F",
				"arifle_Mk20_plain_F",
				"arifle_Mk20_F",
				"arifle_Mk20C_plain_F",
				"arifle_Mk20C_F",
				"arifle_MX_Black_F",
				"arifle_MX_F",
				"arifle_MX_SW_Black_F",
				"arifle_MX_SW_F",
				"arifle_MXC_Black_F",
				"arifle_MXC_F",
				"arifle_SDAR_F",
				"SMG_02_F",
				"arifle_TRG20_F",
				"arifle_TRG21_F",
				"SMG_01_F"
			];
				
_itemlist = [
				"FirstAidKit",
				"optic_DMS",
				"Medikit",
				"optic_Hamr",
				"optic_ACO_grn",
				"optic_DMS",
				"optic_Aco",
				"optic_ACO_grn_smg",
				"optic_SOS",
				"FirstAidKit",
				"optic_Aco_smg",
				"FirstAidKit",
				"optic_MRCO",
				"optic_Hamr",
				"optic_Arco",
				"optic_SOS",
				"optic_DMS",
				"FirstAidKit",
				"optic_DMS",
				"optic_LRPS",
				"optic_Holosight",
				"optic_Holosight_smg",
				"optic_MRCO",
				"optic_SOS",
				"optic_Hamr",
				"optic_MRCO",
				"Medikit",
				"optic_Hamr",
				"optic_DMS",
				"optic_Yorris",
				"muzzle_snds_B",
				"Medikit",
				"muzzle_snds_H",
				"optic_SOS",
				"FirstAidKit",
				"optic_Hamr",
				"muzzle_snds_M",
				"optic_MRCO",
				"Medikit",
				"muzzle_snds_H_MG",
				"optic_SOS",
				"FirstAidKit",
				"muzzle_snds_L",
				"muzzle_snds_acp",
				"optic_DMS",
				"FirstAidKit",
				"optic_Hamr",
				"optic_MRD",
				"HandGrenade",
				"optic_SOS",
				"FirstAidKit",
				"optic_ACO_grn",
				"optic_DMS",
				"optic_Aco",
				"optic_ACO_grn_smg",
				"optic_Hamr",
				"FirstAidKit",
				"optic_Aco_smg",
				"optic_DMS",
				"optic_Arco",
				"optic_Holosight",
				"optic_MRCO",
				"optic_Holosight_smg",
				"Medikit",
				"optic_MRCO",
				"FirstAidKit",
				"optic_SOS",
				"optic_Hamr",
				"optic_Yorris",
				"optic_MRCO",
				"optic_Hamr",
				"optic_MRD",
				"optic_ACO_grn",
				"optic_DMS",
				"FirstAidKit",
				"optic_Aco",
				"optic_ACO_grn_smg",
				"optic_MRCO",
				"optic_Aco_smg",
				"optic_Holosight",
				"FirstAidKit",
				"optic_Hamr",
				"optic_MRCO",
				"Medikit",
				"optic_DMS",
				"FirstAidKit"
			];


sleepAirdrop = (_sleepAirdrop / 2) - round(random (_sleepAirdrop / 2));

sleep sleepAirdrop;

_airdropPos = getMarkerPos "greenareacircle";

systemChat "Supply Airdrop incoming...";

_parachute = createVehicle [_chuteType, [(_airdropPos select 0), (_airdropPos select 1), ((_airdropPos select 2) + 300)], [], 0, 'FLY'];
_crate = createVehicle [_crateType, position _parachute, [], 0, 'NONE'];
_crate attachTo [_parachute, [0, 0, -0.6]];
_crate allowDamage false;

clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearbackpackCargoGlobal _crate;

/////////////////////////////////////////////
//Spawn Weapons Crate
/////////////////////////////////////////////
for "_i" from 1 to (ceil (random _max_weapons) + _min_weapons) do 
{
	_weapon = _weaponlist call BIS_fnc_selectRandom;
	_muzzle_class = (getArray (configFile >> "CfgWeapons" >> _weapon >> "muzzles")) select 1;
	_muzzle_magazines = [];

	if !(isNil {_muzzle_class}) then
	{	
		_muzzle_magazines = getArray (configFile >> "CfgWeapons" >> _weapon >> _muzzle_class >> "magazines")
	};
	_weapons_and_mags = [_weapon, (getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines")), _muzzle_magazines];

	_crate addWeaponCargoGlobal [(_weapons_and_mags select 0), 1];

	for "_i" from 1 to (ceil ((random _max_magazines) + _min_magazines)) do 
	{
		_crate addMagazineCargoGlobal [(selectRandom (_weapons_and_mags select 1)), 1];
	};
};

/////////////////////////////////////////////
//Spawn Items Crate
/////////////////////////////////////////////
_item1 = _itemlist call BIS_fnc_selectRandom;
_crate addItemCargoGlobal [_item1, random 3];

if (random 100 > 45) then
{
	_item2 = _itemlist call BIS_fnc_selectRandom;
	_crate addItemCargoGlobal [_item2, random 3];
};

waitUntil {position _crate select 2 < 1.5 || isNull _parachute};
detach _crate;
_crate setPos [position _crate select 0, position _crate select 1, 0];
_smoke = _smokeType createVehicle [getPos _crate select 0, getPos _crate select 1, 5];
_marker = createMarker [format["Airdrop%1", diag_tickTime], position _crate];
_marker setMarkerType "hd_objective";
_marker setMarkerColor "ColorRed";

systemChat "Supply Aidrop available for 180 seconds";

sleep 180;

deleteVehicle _crate;
deleteMarker _marker;