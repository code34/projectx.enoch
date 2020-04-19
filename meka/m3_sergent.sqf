	// Mission Sergent

    private _position = selectRandom [[10446.8,8009.16], [5806.45,9002.79], [6963.58,7547.88]];
    private _group = createGroup west;

    private _sergent = _group createUnit ["B_T_Soldier_A_F", _position, [], 0, "FORM"];
    _sergent setDamage 1;
    _sergent setpos (_sergent getRelPos [random 100, random 100]);
    _position = getpos _sergent;
    deleteGroup _group;

    private _distance = 10;
    private _objects = nearestTerrainObjects [_sergent, ["HIDE"], _distance];
    sleep 1;
    while {_objects isEqualTo []} do {
        _distance = _distance + 5;
        _objects = nearestTerrainObjects [_sergent, ["HIDE"], _distance];
        sleep 1;
    };

    _object = selectRandom _objects;
    private _container = ["new", [netId _object, ((getModelInfo _object) select 0)]] call OO_CONTAINER;
    private _content = [["armyradio", -1],["missionplan",-1],["medal",-1]];
    ["overLoad", _content] call _container;
    "save" call _container;
    ["delete", _container] call OO_CONTAINER;

    // on attend que l'antenne radio soit activée
    private _radiostate = missionNamespace getVariable ["armyradiostate", 0];
    while { !(_radiostate isEqualTo 1) } do {
        _radiostate = missionNamespace getVariable ["armyradiostate", 0];
        sleep 1;
    };

    sleep 10;

   	["remoteSpawn", ["callSergentMission", [_position, _object], "client"]] call bmeclient;
   	diag_log format ["Tick: Send sergent mission infos"];

    private _name = "sergent_zone";
    private _marker = createMarker [_name, _position];
    _marker setMarkerShape  "ELLIPSE";
    _marker setMarkerType "hd_join";
    _marker setMarkerText "57 Bgd - Sergent Location";
    _marker setMarkerColor "ColorRed";
    _marker setMarkerSize [_distance,_distance];
    _marker setMarkerBrush "FDiagonal";

    private _name = "sergent_position";
    private _marker2 = createMarker [_name, _position];
    _marker2 setMarkerShape  "ICON";
    _marker2 setMarkerType "mil_flag";
    _marker2 setMarkerText "57 Bgd - Sergent Location";
    _marker2 setMarkerColor "ColorRed";
    _marker2 setMarkerSize [0.5,0.5];
    _marker2 setMarkerBrush "FDiagonal";
