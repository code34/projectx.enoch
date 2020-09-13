	// Mission Village

    sleep 10;

    // debug pour lancer la mission
    //missionplan = 1;
    //player setpos (getMarkerPos "village_point");

	private _missionplan = missionNamespace getVariable ["missionplan", 0];
	while { !(_missionplan isEqualTo 1) } do {
		_missionplan = missionNamespace getVariable ["missionplan", 0];
		sleep 1;
	};

	while { player distance (getMarkerPos "village_point") > 100 } do { sleep 5;};
	["setPages", [myLanguage+"m5_village1.html"]] call tabnote;
	["showFile", true] call hud;

	while { player distance (getMarkerPos "village_point") > 5 } do { sleep 5;};
	["setPages", [myLanguage+"m5_centre_medical1.html",myLanguage+"m5_centre_medical2.html"]] call tabnote;
	["showFile", true] call hud;