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
	
	private _position = sergentposition;
	private _object = sergentobject;

	playsound "sergentbattle";
	sleep 10;
	["setPages", ["meka\story\m3_sergentradiocom.html"]] call tabnote;
	["showFile", true] call hud;

	// joue une musique quand le joueur retrouve le sergent
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

    // lance un son en boucle dans une souche tant qu'un joueur
    // n'a pas trouvé la cache du sergent
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
		["setPages", ["meka\story\m3_cachesergent.html"]] call tabnote;
		["showFile", true] call hud;
    };