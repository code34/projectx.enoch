	// Mission Sergent
    private _position = selectRandom [[10446.8,8009.16], [5806.45,9002.79], [6963.58,7547.88]];
    private _group = createGroup west;
    private _sergent = _group createUnit ["B_T_Soldier_A_F", _position, [], 0, "FORM"];

    sleep 300 + random(240);

	["remoteSpawn", ["callTabnote", ["meka\story\sergentradiocom.html"], "client"]] call bmeclient;    
    _sergent setDamage 1;
    _sergent setpos (_sergent getRelPos [random 100, random 100]);
    deleteGroup _group;

    _sergent spawn {
        private _position = getpos _this;
        private _flag = false;
        private _min = 0;
		while { !_flag } do {
			_min = (_position call fnc_getnearestplayer) select 0;
        	if(_min < 5) then {_flag = true;};
        	sleep 1;
		};
		playMusic "stressante";
    };

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

    _object spawn {
        private _object = _this;
        private _position = getpos _object;
        private _path = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
        private _sound = _path + "sounds\carrier.ogg";        
        private _flag = false;
        private _min = 0;
		
		while { !_flag } do {
			_min = (_position call fnc_getnearestplayer) select 0;
			if(_min < 2) then {_flag = true;};
			playSound3D [_sound, _object, false, getPosASL _object, 2, 1, 20];
            sleep 2;
        };
		["remoteSpawn", ["callTabnote", ["meka\story\cachesergent.html"], "client"]] call bmeclient;
    };

	private _id = random 65000;
    private _name = format["extraction_%1", _id];
    private _marker = createMarker [_name, position _sergent];
    _marker setMarkerShape  "ELLIPSE";
    _marker setMarkerType "hd_pickup";
    _marker setMarkerText "57 Bgd - Sergent Location";
    _marker setMarkerColor "ColorRed";
    _marker setMarkerSize [20,20];
    _marker setMarkerBrush "FDiagonal";

    private _id = random 65000;
    private _name = format["extraction_%1", _id];
    private _marker2 = createMarker [_name, position _sergent];
    _marker2 setMarkerShape  "ICON";
    _marker2 setMarkerType "FireMission";
    _marker2 setMarkerText "57 Bgd - Sergent Position";
    _marker2 setMarkerColor "ColorRed";
    _marker2 setMarkerSize [1,1];
    _marker2 setMarkerBrush "FDiagonal";