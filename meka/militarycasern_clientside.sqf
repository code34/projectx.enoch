	// Mission Military casern

	private _missionplan = missionNamespace getVariable ["missionplan", 0];
	while { !(_missionplan isEqualTo 1) } do {
		_missionplan = missionNamespace getVariable ["missionplan", 0];
		sleep 1;
	};

	while { militarycasernposition isEqualTo []} do { sleep 1;};
    private _position = militarycasernposition;

	private _id = random 65000;
    private _name = format["militarycasern_%1", _id];
    private _marker = createMarker [_name, _position];
    _marker setMarkerShape  "ELLIPSE";
    _marker setMarkerType "mil_join";
    _marker setMarkerText "";
    _marker setMarkerColor "ColorRed";
    _marker setMarkerSize [20,20];
    _marker setMarkerBrush "FDiagonal";

    private _id = random 65000;
    private _name = format["militarycasern_%1", _id];
    private _marker2 = createMarker [_name, _position];
    _marker2 setMarkerShape  "ICON";
    _marker2 setMarkerType "mil_join";
    _marker2 setMarkerText "Military casern";
    _marker2 setMarkerColor "ColorRed";
    _marker2 setMarkerSize [1,1];
    _marker2 setMarkerBrush "FDiagonal";

	while { player distance _position > 10 } do { sleep 5;};

	["setPages", ["meka\story\militarycasern1.html","meka\story\militarycasern2.html"]] call tabnote;
	["showFile", true] call hud;