/*
 *	This project is licensed under the GNU Affero GPL v3. Copyright © 2018 ArmaBwS.com
 *
 *	@file Name: initPlayerLocal.sqf
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

enableSaving [FALSE,FALSE];
player enableFatigue FALSE;
player enableStamina FALSE;
player allowSprint TRUE;
player allowDamage FALSE;
player setCustomAimCoef 0.1;
player setUnitRecoilCoefficient 1;

//Gear Settings
removeAllContainers player;
removeAllItemsWithMagazines player;
removeAllWeapons player;
removeBackpack player;
removeGoggles player;
removeHeadgear player;
removeUniform player;
removeVest player;

_startuniform = ["U_C_Poloshirt_blue",
				"U_C_Poloshirt_burgundy",
				"U_C_Poloshirt_stripped",
				"U_C_Poloshirt_tricolour",
				"U_C_Poloshirt_salmon",
				"U_C_Poloshirt_redwhite",
				"U_C_Commoner1_1",
				"U_C_Commoner1_2",
				"U_C_Commoner1_3",
				"U_NikosBody",
				"U_OrestesBody",
				"U_IG_Guerilla2_1",
				"U_IG_Guerilla2_2",
				"U_IG_Guerilla2_3",
				"U_IG_Guerilla3_1",
				"U_IG_Guerilla3_2",
				"U_IG_Guerilla3_2",
				"U_C_Poor_1",
				"U_C_Poor_2",
				"U_NikosAgedBody"] call BIS_fnc_selectRandom;

_startheadgear = ["H_Cap_red",
				"H_Cap_blu",
				"H_Cap_oli",
				"H_Cap_tan",
				"H_Cap_blk",
				"H_Cap_blk_CMMG",
				"H_Cap_brn_SPECOPS",
				"H_Cap_tan_specops_US",
				"H_Cap_khaki_specops_UK",
				"H_Cap_grn",
				"H_Cap_grn_BI",
				"H_Cap_blk_Raven",
				"H_Cap_blk_ION",
				"H_Cap_oli_hs",
				"H_Bandanna_surfer",
				"H_Bandanna_khk",
				"H_Bandanna_khk_hs",
				"H_Bandanna_cbr",
				"H_Bandanna_sgg",
				"H_Bandanna_gry",
				"H_Bandanna_camo",
				"H_Bandanna_mcamo",
				"H_TurbanO_blk",
				"H_StrawHat",
				"H_StrawHat_dark",
				"H_Hat_blue",
				"H_Hat_brown",
				"H_Hat_camo",
				"H_Hat_grey",
				"H_Hat_checker",
				"H_Hat_tan"] call BIS_fnc_selectRandom;

player forceAddUniform _startuniform;
player addHeadgear _startheadgear;


{_x setMarkerAlpha 0;} foreach ["spawnzone_1","spawnzone_2","greenzone_1","greenzone_2","greenzone_3","greenzone_4","greenzone_5",
								"greenzone_6","greenzone_7","greenzone_8","greenzone_9","greenzone_10",
								"greenzone_11","greenzone_12","greenzone_13","greenzone_14","greenzone_15",
								"greenzone_16","greenzone_17","greenzone_18","greenzone_19","greenzone_20",
								"greenzone_21","greenzone_22","greenzone_23","greenzone_24","greenzone_25",
								"greenzone_26","greenzone_27","greenzone_28","greenzone_29","greenzone_30",
								"greenzone_31","greenzone_32","greenzone_33","greenzone_34","greenzone_35",
								"greenzone_36","greenzone_37","greenzone_38","greenzone_39","greenzone_40",
								"greenzone_41","greenzone_42","greenzone_43","greenzone_44","greenzone_45",
								"greenzone_46","greenzone_47","greenzone_48","greenzone_49","greenzone_50",
								"spawneast","preparezone"];

//Initialize Icon
[] execVM "scripts\icons.sqf";

//Status Bar
[] execVM "addons\statusBar\statusbar.sqf";

//HUD + weapon info + vehicle info
[] execVM "hud\hud.sqf";
[] execVM "hud\weapon.sqf";
[] execVM "hud\vehicle.sqf";

//Check Player in Area
[] execVM "scripts\playerCheckArea.sqf";

_null = [] execvm "scripts\vehicles\crew\crew.sqf";

call compile preProcessFileLineNumbers "scripts\killcam\killcam_functions.sqf";
execVM "scripts\killcam\killcam_init.sqf";

//Check Player Died
execVM "scripts\checkPlayerDied.sqf";

//New Damage System
execVM "scripts\damage.sqf";

//Fix Heal
execVM "scripts\fixHeal.sqf";

//Welcome Messages
[] execVM "scripts\welcomeMessages.sqf";

systemChat "InitPlayerLocal - All file loaded!";
