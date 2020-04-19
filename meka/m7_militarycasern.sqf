	// Mission Military casern
	private _missionplan = missionNamespace getVariable ["missionplan", 0];
	while { !(_missionplan isEqualTo 1) } do {
		_missionplan = missionNamespace getVariable ["missionplan", 0];
		sleep 1;
	};

    private _position = selectRandom [[1591.23,7610.05,0.00143909], [9731.79,8533.55,0.00143814], [11272.8,9434.47,0.00143909], [9844.07,8483.14,0.00143814], [5652.86,3796.77,0.00141907]];
    private _name = "militarycasern_zone";
    private _marker = createMarker [_name, _position];
    _marker setMarkerShape  "ELLIPSE";
    _marker setMarkerType "mil_join";
    _marker setMarkerText "";
    _marker setMarkerColor "ColorRed";
    _marker setMarkerSize [20,20];
    _marker setMarkerBrush "FDiagonal";

    private _name = "militarycasern_point";
    private _marker2 = createMarker [_name, _position];
    _marker2 setMarkerShape  "ICON";
    _marker2 setMarkerType "mil_join";
    _marker2 setMarkerText "Military casern";
    _marker2 setMarkerColor "ColorRed";
    _marker2 setMarkerSize [0.5,0.5];
    _marker2 setMarkerBrush "FDiagonal";