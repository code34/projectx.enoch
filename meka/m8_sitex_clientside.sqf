	// Mission Site X
	private _missionplan = missionNamespace getVariable ["sitex", 0];
	while { !(_missionplan isEqualTo 1) } do {
		_missionplan = missionNamespace getVariable ["sitex", 0];
		sleep 1;
	};

	while { player distance (getMarkerPos "sitex_point") > 40 } do { sleep 5;};

	missionNamespace setVariable ["labox", 1, true];

	["setPages", [myLanguage+"m8_sitex1.html"]] call tabnote;
	["showFile", true] call hud; 

	while { player distance (getMarkerPos "labox_point") > 40 } do { sleep 5;}; 

	playMusic "ambientmusic";

	["setPages", [myLanguage+"m8_sitex2.html"]] call tabnote;
	["showFile", true] call hud; 