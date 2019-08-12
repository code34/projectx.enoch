	// Mission Sergent
	sergentposition = [];
	sergentobject = objNull;

	// Event handler catch by remotespawn signal send by server
	callSergentMission = {
		sergentposition = _this select 0;
		sergentobject = _this select 1;
	};

	private _radiostate = missionNamespace getVariable ["armyradiostate", 0];
	while { !(_radiostate isEqualTo 1) } do {
		_radiostate = missionNamespace getVariable ["armyradiostate", 0];
		sleep 1;
	};
	while {sergentposition isEqualTo []} do {sleep 1;};
	
	sleep 300 + (random 240);

	private _position = sergentposition;
	private _object = sergentobject;

	playsound "sergentbattle";
	sleep 10;

	["setPages", ["meka\story\sergentradiocom.html"]] call tabnote;
	["showFile", true] call hud;

    _position spawn {
        private _position = _this;
        private _flag = false;
        private _min = 0;
		while { !_flag } do {
			_min = (_position call fnc_getnearestplayer) select 0;
        	if(_min < 5) then {_flag = true;};
        	sleep 1;
		};
		playMusic "stressante";
    };

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
		["setPages", ["meka\story\cachesergent.html"]] call tabnote;
		["showFile", true] call hud;
    };

	private _id = random 65000;
    private _name = format["sergent_%1", _id];
    private _marker = createMarkerlocal [_name, _position];
    _marker setMarkerShapeLocal  "ELLIPSE";
    _marker setMarkerTypeLocal "hd_join";
    _marker setMarkerTextLocal "57 Bgd - Sergent Location";
    _marker setMarkerColorLocal "ColorRed";
    _marker setMarkerSizeLocal [20,20];
    _marker setMarkerBrushLocal "FDiagonal";

    private _id = random 65000;
    private _name = format["sergent_%1", _id];
    private _marker2 = createMarkerLocal [_name, _position];
    _marker2 setMarkerShapeLocal  "ICON";
    _marker2 setMarkerTypeLocal "hd_join";
    _marker2 setMarkerTextLocal "57 Bgd - Sergent Location";
    _marker2 setMarkerColorLocal "ColorRed";
    _marker2 setMarkerSizeLocal [1,1];
    _marker2 setMarkerBrushLocal "FDiagonal";