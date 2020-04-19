        // relai radio turn off signal
		missionNamespace setVariable["armyradiostate", -1];
		["setPages", ["meka\story\m2_radio.html"]] call tabnote;
		"keyF1" call keyhandler;
		playsound "carrier";

		private _position = getMarkerPos "antenne_radio";
		radiocenter = (nearestObjects [_position, ["Land_TBox_F"], 50]) select 0;
		sleep 2; 

		addMissionEventHandler ["Draw3D", {
		    private _path = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
		    private _paa = _path + "paa\radiocenter.paa";
		    
		    private _posx = (getpos radiocenter) select 0;
		    private _posy = (getpos radiocenter) select 1;
		    private _posz = 2;
		    private _distance = player distance radiocenter;
		    if(_distance < 100) then { _distance = 1 - (_distance / 100);}else{_distance = 0;};
		    drawIcon3D [_paa, [1,1,1,_distance], [_posx, _posy, _posz] , 1, 1, 2, "Radio Amplifier", 0, 0.03, "TahomaB", "center", true];
		}];

		private _ok = true;
		while { _ok} do {
		    if (player distance radiocenter < 10) then {
		        _ok = false;
		    };
		    sleep 1;
		};

		// add radio amplifier in
		private _object = radiocenter;
    	private _container = ["new", [netId _object , (getModelInfo _object) select 0]] call OO_CONTAINER;
    	private _content = [["radioamplifier", 1]];
    	["overLoad", _content] call _container;
    	"save" call _container;
    	["delete", _container] call OO_CONTAINER;

		["setPages", ["meka\story\m2_relaisradio.html"]] call tabnote;
		["showFile", true] call hud;

		private _ok = true;
		while { _ok } do {
		    private _active = radiocenter getVariable ["radioactive", true];
		    if(_active isEqualTo false) then {
		        _ok = false;
		    };
		};
		removeAllMissionEventHandlers "Draw3D";
		missionNamespace setVariable["armyradiostate", 1, true];
		
		["setPages", ["meka\story\m2_relaisradiooff.html"]] call tabnote;
		["showFile", true] call hud;
		playSound "whitenoise";