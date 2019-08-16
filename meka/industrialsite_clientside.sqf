	// Mission Industrial site
	industrialsiteposition = [];
	callIndustrialSiteMission = {
		industrialsiteposition = _this select 0;
	};

	private _missionplan = missionNamespace getVariable ["missionplan", 0];
	while { !(_missionplan isEqualTo 1) } do {
		_missionplan = missionNamespace getVariable ["missionplan", 0];
		sleep 1;
	};

	while { industrialsiteposition isEqualTo []} do { sleep 1;};
    private _position = industrialsiteposition;

	private _id = random 65000;
    private _name = format["industrialsite_%1", _id];
    private _marker = createMarker [_name, _position];
    _marker setMarkerShape  "ELLIPSE";
    _marker setMarkerType "mil_join";
    _marker setMarkerText "";
    _marker setMarkerColor "ColorRed";
    _marker setMarkerSize [20,20];
    _marker setMarkerBrush "FDiagonal";

    private _id = random 65000;
    private _name = format["industrialsite_%1", _id];
    private _marker2 = createMarker [_name, _position];
    _marker2 setMarkerShape  "ICON";
    _marker2 setMarkerType "mil_join";
    _marker2 setMarkerText "Industrial site";
    _marker2 setMarkerColor "ColorRed";
    _marker2 setMarkerSize [1,1];
    _marker2 setMarkerBrush "FDiagonal";

	while { player distance _position > 100 } do { sleep 10;};

	["setPages", ["meka\story\industrialsite1.html"]] call tabnote;
	["showFile", true] call hud;