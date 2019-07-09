    // extraction point
    private _position = [4090.96,10220.8,0.101196];

    private _vehicle = createVehicle ["C_Heli_Light_01_civil_F", _position, [], 0, "NONE"];
    _vehicle setVariable ["requirement", ["choppermotor", "wrench"],true];
     
    private _group = createGroup west;
    private _sergent = _group createUnit ["B_T_Soldier_A_F", _position, [], 0, "FORM"];
    _sergent setDamage 1;
    _sergent setpos (_sergent getRelPos [100 + (random 50), 60 + random 30]);

    private _classes = ["B_T_Engineer_F", "B_T_Soldier_A_F", "B_T_Soldier_AAR_F", "B_T_Support_AMG_F"];
    {
        private _defendposition =  (_vehicle getRelPos [random 25, random 360]);
        private _unit = _group createUnit [_x, _defendposition, [], 0, "FORM"];
        _unit setDamage 1;
        sleep 0.1;
    } foreach _classes;

    private _array = units _group;
    deleteGroup _group;
    _array pushBack _sergent;

    [_vehicle, _array] spawn {
        private _vehicle = _this select 0;
        private _array = _this select 1;
        private _sergent = _this select 2;
        while { player distance _vehicle > 25} do { sleep 1;};
        playMusic "stressante";
/*        {
            private _cam = ["new", []] call OO_CAMERA;
            ["presetCamera", [_x, "murderCamera"]] spawn _cam;
            ["r2w", [-0.2, -0.2,0.4,0.4]] call _cam;
            sleep 2;
            ["delete", _cam] call OO_CAMERA;           
        } forEach _array;*/
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

    _object spawn {
        private _object = _this;
        private _path = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
        private _sound = _path + "sounds\porteuse.ogg";        
                
        while { player distance _object > 2 } do {
            playSound3D [_sound, _object, false, getPosASL _object, 2, 1, 20];
            sleep 3;
        };
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
    _marker2 setMarkerType "hd_pickup";
    _marker2 setMarkerText "57 Bgd - Sergent Location";
    _marker2 setMarkerColor "ColorRed";
    _marker2 setMarkerSize [1,1];
    _marker2 setMarkerBrush "FDiagonal";

    while { player distance _position > 500} do {sleep 1;};
    ["setPages", ["meka\story\sergentradiocom.html"]] call tabnote;
    ["showFile", true] call hud;

    [_vehicle, _position] spawn {
        _vehicle = _this select 0;
        _position = _this select 1;

        while { (_vehicle distance _position < 500) } do {
    	   sleep 30;
        };

        {
        	["remoteSpawn", ["callEnd", "End1", "client", owner _x]] call bmeclient;
    	   sleep 0.1;
        } forEach (crew _vehicle);
    };