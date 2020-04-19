	// Mission Military casern
	private _missionplan = missionNamespace getVariable ["sitex", 0];
	while { !(_missionplan isEqualTo 1) } do {
		_missionplan = missionNamespace getVariable ["sitex", 0];
		sleep 1;
	};

    private _position = [7277.76,2910.65,0];
    private _name = "sitex_zone";
    private _marker = createMarker [_name, _position];
    _marker setMarkerShape  "ELLIPSE";
    _marker setMarkerType "mil_join";
    _marker setMarkerText "";
    _marker setMarkerColor "ColorRed";
    _marker setMarkerSize [100,100];
    _marker setMarkerBrush "FDiagonal";

    private _name = "sitex_point";
    private _marker2 = createMarker [_name, _position];
    _marker2 setMarkerShape  "ICON";
    _marker2 setMarkerType "mil_join";
    _marker2 setMarkerText "Site X";
    _marker2 setMarkerColor "ColorRed";
    _marker2 setMarkerSize [0.5,0.5];
    _marker2 setMarkerBrush "FDiagonal";

    _building = (nearestObjects [_position, ["Land_DPP_01_mainFactory_old_F"], 50]) select 0;
    private _container = ["new", [netId _building, ((getModelInfo _building) select 0)]] call OO_CONTAINER;
    ["addItemsByLabel", [["am212", -1]]] call _container;
    "save" call _container;
    ["delete", _container] call OO_CONTAINER;

    private _missionplan = missionNamespace getVariable ["labox", 0];
    while { !(_missionplan isEqualTo 1) } do {
        _missionplan = missionNamespace getVariable ["labox", 0];
        sleep 1;
    };

    _position = [7475.38,2541.66,0];
    private _name = "labox_zone";
    private _marker = createMarker [_name, _position];
    _marker setMarkerShape  "ELLIPSE";
    _marker setMarkerType "mil_join";
    _marker setMarkerText "";
    _marker setMarkerColor "ColorRed";
    _marker setMarkerSize [100,100];
    _marker setMarkerBrush "FDiagonal";

    private _name = "labox_point";
    private _marker2 = createMarker [_name, _position];
    _marker2 setMarkerShape  "ICON";
    _marker2 setMarkerType "mil_join";
    _marker2 setMarkerText "Labo X";
    _marker2 setMarkerColor "ColorRed";
    _marker2 setMarkerSize [0.5,0.5];
    _marker2 setMarkerBrush "FDiagonal";

    _building = (nearestObjects [_position, ["Land_Radar_01_kitchen_F"], 50]) select 0;
    private _container = ["new", [netId _building, ((getModelInfo _building) select 0)]] call OO_CONTAINER;
    ["addItemsByLabel", [["xsitereport", -1]]] call _container;
    "save" call _container;
    ["delete", _container] call OO_CONTAINER;