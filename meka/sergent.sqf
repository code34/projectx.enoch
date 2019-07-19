	// Mission Sergent

    private _position = selectRandom [[10446.8,8009.16], [5806.45,9002.79], [6963.58,7547.88]];
    private _group = createGroup west;

    private _sergent = _group createUnit ["B_T_Soldier_A_F", _position, [], 0, "FORM"];
    _sergent setDamage 1;
    _sergent setpos (_sergent getRelPos [random 100, random 100]);
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

    private _flag = true;
    while { _flag } do {
    	_flag = ["checkMissionDone", "sergent"] call missionloader;
    	["remoteSpawn", ["callSergentMission", [_position, _object], "client"]] call bmeclient;
    	sleep 60;
    };