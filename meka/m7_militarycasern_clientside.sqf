	// Mission Military casern
	private _missionplan = missionNamespace getVariable ["missionplan", 0];
	while { !(_missionplan isEqualTo 1) } do {
		_missionplan = missionNamespace getVariable ["missionplan", 0];
		sleep 1;
	};

	while { player distance (getMarkerPos "militarycasern_point") > 20 } do { sleep 5;};

	["setPages", ["meka\story\m7_militarycasern1.html","meka\story\m7_militarycasern2.html"]] call tabnote;
	["showFile", true] call hud;