	// Mission Industrial site
	private _missionplan = missionNamespace getVariable ["missionplan", 0];
	while { !(_missionplan isEqualTo 1) } do {
		_missionplan = missionNamespace getVariable ["missionplan", 0];
		sleep 1;
	};
    
	while { player distance (getMarkerPos "industrialsite_point") > 200 } do { sleep 5;};

	["setPages", [myLanguage+"m6_industrialsite1.html"]] call tabnote;
	["showFile", true] call hud;

	while { player distance (getMarkerPos "industrialsite_point") > 70 } do { sleep 5;};

	["setPages", [myLanguage+"m6_industrialsite2.html"]] call tabnote;
	["showFile", true] call hud;

	while { player distance (getMarkerPos "industrialsite_point") > 10 } do { sleep 5;};

	["setPages", [myLanguage+"m6_industrialsite2.html", myLanguage+"m6_camion1.html"]] call tabnote;
	["showFile", true] call hud;