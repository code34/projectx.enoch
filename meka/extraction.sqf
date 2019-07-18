    // extraction point
    private _position = [4090.96,10220.8,0.101196];
    private _flag = false;
    //player setpos [4252.46,10394.5,0];
    
    while {! _flag} do {
        _objects = nearestObjects [_position, ["Man"], 500];
        sleep 2;
        _count = west countSide _objects;
        if(_count > 0) then { _flag = true;};
        sleep 15;
    };

    private _vehicle = createVehicle ["C_Heli_Light_01_civil_F", _position, [], 0, "NONE"];
    private _container = ["new", [netId _vehicle, ((getModelInfo _vehicle) select 0)]] call OO_CONTAINER;
    private _content = [["failurehelicopterengine", 1]];
    ["overLoad", _content] call _container;
    "save" call _container;
    ["delete", _container] call OO_CONTAINER;
     
    _vehicle spawn { 
        private _vehicle = _this;       
        private _flag = false;
        while {!_flag} do {
            _flag = _vehicle getVariable ["enginerepaired", false];
            _vehicle setHitPointDamage["HitEngine", 1];
            sleep 1;
        };
        _vehicle setHitPointDamage["HitEngine", 0];
    };

	private _group = createGroup west;
    private _classes = ["B_T_Engineer_F", "B_T_Soldier_A_F", "B_T_Soldier_AAR_F", "B_T_Support_AMG_F"];
    {
        private _defendposition =  (_vehicle getRelPos [random 25, random 360]);
        private _unit = _group createUnit [_x, _defendposition, [], 0, "FORM"];
        _unit setDamage 1;
        sleep 0.1;
    } foreach _classes;
    deleteGroup _group;

    _vehicle spawn {
        private _position = getpos _this;
        private _flag = false;
        private _min = 0;
        while { !_flag } do {
        	_min = (_position call fnc_getnearestplayer) select 0;
			if( _min < 25) then {_flag = true;};
        	 sleep 1;
        };
        playMusic "stressante";
        sleep 5;
		["remoteSpawn", ["callTabnote", ["meka\story\carnageaeroport1.html", "meka\story\carnageaeroport2.html", "meka\story\carnageaeroport3.html","meka\story\carnageaeroport4.html","meka\story\carnageaeroport5.html"], "client"]] call bmeclient;
    };

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