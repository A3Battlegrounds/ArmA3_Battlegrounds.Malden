// *****************************************************************************************
// * This script is licensed under the GNU Lesser GPL v3. Copyright © 2015 A3Wasteland.com *
// *****************************************************************************************
//	@file Version: 1.0
//	@file Name: playerTags.sqf
//	@file Author: Battleguns, AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Args:
// bAdmin Exile by Biabock

_uid = getPlayerUID player;
if (_uid call isAdmin) then
{
	if (isNil "adminPlayerMarkers") then { adminPlayerMarkers = false };

	if (!adminPlayerMarkers) then
	{
		adminPlayerMarkers = true;
		systemChat "Player Markers ON";
	}
	else
	{
		adminPlayerMarkers = false;
		systemChat "Player Markers OFF";
	};

	setGroupIconsVisible [true, true];
	while {adminPlayerMarkers} do
	{
		{
			if (isPlayer _x) then
			{
				private ["_groupIcon", "_iconColor"];

				switch (side _x) do
				{
					case BLUFOR:      { _groupIcon = "b_inf"; _iconColor = [0, 0, 1, 1] };
					case OPFOR:       { _groupIcon = "o_inf"; _iconColor = [1, 0, 0, 1] };
					case INDEPENDENT: { _groupIcon = "n_inf"; _iconColor = [1, 1, 0, 1] };
					default           { _groupIcon = "c_unknown"; _iconColor = [1, 1, 1, 1] };
				};

				clearGroupIcons group _x;
				group _x addGroupIcon [_groupIcon];
				group _x setGroupIconParams [_iconColor, format ["%1 (%2m)", name _x, round (_x distance player)], 1, true];
			};
		} forEach allPlayers;

		sleep 0.5;
	};

	{ clearGroupIcons group _x } forEach allPlayers;
};