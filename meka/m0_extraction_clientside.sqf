	// extraction point

	sleep 30;

	while { player distance (getMarkerPos "extraction_point") > 25} do { sleep 1;};

	_position = getMarkerPos "extraction_point";
	_vehicle  = (nearestObjects [_position, ["C_Heli_Light_01_civil_F"], 50]) select 0;

	playMusic "stressante";
	sleep 5;
	["setPages", [myLanguage+"m0_carnageaeroport1.html", myLanguage+"m0_carnageaeroport2.html", myLanguage+"m0_carnageaeroport3.html",myLanguage+"m0_carnageaeroport4.html",myLanguage+"m0_carnageaeroport5.html"]] call tabnote;
	["showFile", true] call hud;

	[_vehicle, _position] spawn {
		_vehicle = _this select 0;
		_position = _this select 1;

		while { (_vehicle distance _position < 500) } do { sleep 30;};

		if(player in (crew _vehicle)) then {
			if((missionNamespace getVariable ["xsitereport", 0]) isEqualTo 0) then {
				["End1", true, 5, true] spawn BIS_fnc_endMission;
			} else {
				["End3", true, 5, true] spawn BIS_fnc_endMission;
			};
		} else {
			["End2", true, 5, true] spawn BIS_fnc_endMission;
		};
	};