/*
 *	This project is licensed under the GNU Affero GPL v3. Copyright © 2018 ArmaBwS.com
 *
 *	@file Name: ammoCrate.sqf
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
 
_min_magazines = 30;    			//minimum number of mags to spawn
_max_magazines = 50;    			//maximum number of mags to spawn
_min_backpack = 10;    				//minimum number of bags to spawn
_max_backpack = 20;    				//maximum number of bags to spawn
_sleep_time = 60;

matchstarted = false;
 
_magazinelist = [
					"5Rnd_127x108_Mag",
					"5Rnd_127x108_APDS_Mag",
					"HandGrenade",
					"MiniGrenade",
					"7Rnd_408_Mag",
					"20Rnd_762x51_Mag",
					"200Rnd_65x39_cased_Box",
					"200Rnd_65x39_cased_Box_Tracer",
					"150Rnd_762x54_Box",
					"150Rnd_762x54_Box_Tracer",
					"100Rnd_65x39_caseless_mag",
					"HandGrenade",
					"MiniGrenade",
					"100Rnd_65x39_caseless_mag_Tracer",
					"30Rnd_65x39_caseless_green_mag_Tracer",
					"30Rnd_556x45_Stanag",
					"30Rnd_556x45_Stanag_Tracer_Red",
					"30Rnd_556x45_Stanag_Tracer_Green",
					"30Rnd_556x45_Stanag_Tracer_Yellow",
					"30Rnd_556x45_Stanag_red",
					"HandGrenade",
					"MiniGrenade",
					"30Rnd_556x45_Stanag_green",
					"30Rnd_65x39_caseless_mag",
					"30Rnd_65x39_caseless_mag_Tracer",
					"11Rnd_45ACP_Mag",
					"9Rnd_45ACP_Mag",
					"6Rnd_45ACP_Cylinder",
					"30Rnd_9x21_Mag",
					"30Rnd_9x21_Red_Mag",
					"30Rnd_9x21_Yellow_Mag",
					"30Rnd_9x21_Green_Mag",
					"16Rnd_9x21_Mag",
					"16Rnd_9x21_red_Mag",
					"16Rnd_9x21_green_Mag",
					"16Rnd_9x21_yellow_Mag",
					"HandGrenade",
					"MiniGrenade",
					"10Rnd_762x54_Mag",
					"30Rnd_9x21_Mag_SMG_02",
					"30Rnd_9x21_Mag_SMG_02_Tracer_Red",
					"30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",
					"30Rnd_9x21_Mag_SMG_02_Tracer_Green",
					"30Rnd_45ACP_Mag_SMG_01",
					"30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
					"HandGrenade",
					"MiniGrenade",
					"30Rnd_45ACP_Mag_SMG_01_Tracer_Red",
					"30Rnd_45ACP_Mag_SMG_01_Tracer_Green",
					"30Rnd_65x39_caseless_green",
					"30Rnd_65x39_caseless_green_mag_Tracer",
					"30Rnd_556x45_Stanag",
					"30Rnd_556x45_Stanag_Tracer_Red",
					"30Rnd_556x45_Stanag_Tracer_Green",
					"HandGrenade",
					"MiniGrenade",
					"30Rnd_556x45_Stanag_Tracer_Yellow",
					"30Rnd_556x45_Stanag_red",
					"30Rnd_556x45_Stanag_green",
					"30Rnd_65x39_caseless_mag",
					"30Rnd_65x39_caseless_mag_Tracer",
					"11Rnd_45ACP_Mag",
					"9Rnd_45ACP_Mag",
					"6Rnd_45ACP_Cylinder",
					"HandGrenade",
					"MiniGrenade",
					"30Rnd_9x21_Mag",
					"30Rnd_9x21_Red_Mag",
					"30Rnd_9x21_Yellow_Mag",
					"30Rnd_9x21_Green_Mag",
					"16Rnd_9x21_Mag",
					"16Rnd_9x21_red_Mag",
					"16Rnd_9x21_green_Mag",
					"16Rnd_9x21_yellow_Mag",
					"10Rnd_762x54_Mag",
					"HandGrenade",
					"MiniGrenade",
					"30Rnd_9x21_Mag_SMG_02",
					"30Rnd_9x21_Mag_SMG_02_Tracer_Red",
					"30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",
					"30Rnd_9x21_Mag_SMG_02_Tracer_Green",
					"30Rnd_45ACP_Mag_SMG_01",
					"30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
					"30Rnd_45ACP_Mag_SMG_01_Tracer_Red",
					"30Rnd_45ACP_Mag_SMG_01_Tracer_Green",
					"HandGrenade",
					"MiniGrenade",
					"30Rnd_65x39_caseless_green",
					"30Rnd_65x39_caseless_green_mag_Tracer",
					"30Rnd_556x45_Stanag",
					"30Rnd_556x45_Stanag_Tracer_Red",
					"30Rnd_556x45_Stanag_Tracer_Green",
					"30Rnd_556x45_Stanag_Tracer_Yellow",
					"30Rnd_556x45_Stanag_red",
					"HandGrenade",
					"MiniGrenade",
					"30Rnd_556x45_Stanag_green",
					"30Rnd_65x39_caseless_mag",
					"30Rnd_65x39_caseless_mag_Tracer",
					"11Rnd_45ACP_Mag",
					"9Rnd_45ACP_Mag",
					"6Rnd_45ACP_Cylinder",
					"30Rnd_9x21_Mag",
					"HandGrenade",
					"MiniGrenade",
					"30Rnd_9x21_Red_Mag",
					"30Rnd_9x21_Yellow_Mag",
					"30Rnd_9x21_Green_Mag",
					"16Rnd_9x21_Mag",
					"16Rnd_9x21_red_Mag",
					"16Rnd_9x21_green_Mag",
					"16Rnd_9x21_yellow_Mag",
					"10Rnd_762x54_Mag",
					"HandGrenade",
					"MiniGrenade",
					"30Rnd_9x21_Mag_SMG_02",
					"30Rnd_9x21_Mag_SMG_02_Tracer_Red",
					"30Rnd_9x21_Mag_SMG_02_Tracer_Yellow",
					"30Rnd_9x21_Mag_SMG_02_Tracer_Green",
					"30Rnd_45ACP_Mag_SMG_01",
					"30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
					"30Rnd_45ACP_Mag_SMG_01_Tracer_Red",
					"30Rnd_45ACP_Mag_SMG_01_Tracer_Green",
					"HandGrenade",
					"MiniGrenade"
				];
				
_baglist = [
				"B_AssaultPack_blk",
				"B_AssaultPack_cbr",
				"B_AssaultPack_dgtl",
				"B_AssaultPack_rgr",
				"B_AssaultPack_ocamo",
				"B_AssaultPack_khk",
				"B_AssaultPack_mcamo",
				"B_AssaultPack_sgg",
				"B_Carryall_cbr",
				"B_Carryall_ocamo",
				"B_Carryall_khk",
				"B_Carryall_mcamo",
				"B_Carryall_oli",
				"B_Carryall_oucamo",
				"B_FieldPack_blk",
				"B_FieldPack_cbr",
				"B_FieldPack_ocamo",
				"B_FieldPack_khk",
				"B_FieldPack_oli",
				"B_FieldPack_oucamo",
				"B_Kitbag_cbr",
				"B_Kitbag_rgr",
				"B_Kitbag_mcamo",
				"B_Kitbag_sgg",
				"B_TacticalPack_blk",
				"B_TacticalPack_rgr",
				"B_TacticalPack_ocamo",
				"B_TacticalPack_mcamo",
				"B_TacticalPack_oli",
				"B_AssaultPack_Kerry",
				"B_AssaultPack_blk",
				"B_AssaultPack_cbr",
				"B_AssaultPack_dgtl",
				"B_AssaultPack_rgr",
				"B_AssaultPack_ocamo",
				"B_AssaultPack_khk",
				"B_AssaultPack_mcamo",
				"B_AssaultPack_sgg",
				"B_FieldPack_blk",
				"B_FieldPack_cbr",
				"B_FieldPack_ocamo",
				"B_FieldPack_khk",
				"B_FieldPack_oli",
				"B_FieldPack_oucamo",
				"B_TacticalPack_blk",
				"B_TacticalPack_rgr",
				"B_TacticalPack_ocamo",
				"B_TacticalPack_mcamo",
				"B_TacticalPack_oli",
				"B_AssaultPack_Kerry"
			];

			
_this allowDamage false;

clearMagazineCargoGlobal _this;
clearWeaponCargoGlobal _this;
clearItemCargoGlobal _this;
clearbackpackCargoGlobal _this;


lobbyAmmo = true;

while {lobbyAmmo} do
{
	clearMagazineCargoGlobal _this;
	clearWeaponCargoGlobal _this;
	clearItemCargoGlobal _this;
	clearbackpackCargoGlobal _this;
	
	/////////////////////////////////////////////
	//Spawn Ammo Crate
	/////////////////////////////////////////////
	for "_i" from 1 to (ceil ((random _max_magazines) + _min_magazines)) do 
	{
		_magazine = _magazinelist call BIS_fnc_selectRandom;
		_this addMagazineCargoGlobal [_magazine, 1];
	};
	
	/////////////////////////////////////////////
	//Spawn Backpack Crate
	/////////////////////////////////////////////
	for "_i" from 1 to (ceil ((random _max_backpack) + _min_backpack)) do 
	{
		_bag = _baglist call BIS_fnc_selectRandom;
		_this addBackpackCargoGlobal [_bag, 1];
	};
	
	if (matchstarted) exitWith {lobbyAmmo = false;};
	
	sleep _sleep_time;
};
