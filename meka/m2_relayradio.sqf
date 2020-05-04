    // on attend que l'antenne radio soit activée
    private _radiostate = missionNamespace getVariable ["armyradiostate", 0];
    while { _radiostate < 1 } do {
        _radiostate = missionNamespace getVariable ["armyradiostate", 0];
        sleep 0.1;
    };

	private _radio = nearestObjects [playerstartatpos, ["Land_Communication_F"], 5000];
	sleep 1;
	private _name = "antenne_radio";
	_missionmarker = createMarker [_name, position (_radio select 0)];
	_missionmarker setMarkerShape "ICON";
	_missionmarker setMarkerType "selector_selectedMission";
	_missionmarker setMarkerText "Antenne Radio";
	_missionmarker setMarkerColor "ColorRed";
	_missionmarker setMarkerSize [1,1];
	_missionmarker setMarkerBrush "FDiagonal";

	radiocenter = (nearestObjects [position (_radio select 0), ["Land_TBox_F"], 50]) select 0;
	private _object = radiocenter;
    private _container = ["new", [netId _object , (getModelInfo _object) select 0]] call OO_CONTAINER;
    private _content = [["radioamplifier", 1]];
    ["overLoad", _content] call _container;
    "save" call _container;
    ["delete", _container] call OO_CONTAINER;