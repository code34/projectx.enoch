        // relai radio turn off signal
		missionNamespace setVariable["armyradiostate", -1];
		["setPages", ["meka\story\radio.html"]] call tabnote;
		"keyF1" call keyhandler;
		playsound "carrier";

		private _radio = nearestObjects [player, ["Land_Communication_F"], 5000];
        sleep 2;
        
		private _id = random 65000;
		private _name = format["radio_%1", _id];
		_missionmarker = createMarker [_name, position (_radio select 0)];
		_missionmarker setMarkerShape "ICON";
		_missionmarker setMarkerType "selector_selectedMission";
		_missionmarker setMarkerText "Radio Site";
		_missionmarker setMarkerColor "ColorRed";
		_missionmarker setMarkerSize [1,1];
		_missionmarker setMarkerBrush "FDiagonal";

		radiocenter = nearestObjects [(_radio select 0), ["Land_TBox_F"], 50];
		sleep 2;    

		addMissionEventHandler ["Draw3D", {
		    private _path = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
		    private _paa = _path + "paa\radiocenter.paa";
		    
		    private _posx = getpos (radiocenter select 0) select 0;
		    private _posy = getpos (radiocenter select 0) select 1;
		    private _posz = 2;
		    private _distance = player distance (radiocenter select 0);
		    if(_distance < 100) then { _distance = 1 - (_distance / 100);}else{_distance = 0;};
		    drawIcon3D [_paa, [1,1,1,_distance], [_posx, _posy, _posz] , 1, 1, 2, "Radio Amplifier", 0, 0.03, "TahomaB", "center", true];
		}];

		private _ok = true;
		while { _ok} do {
		    if (player distance (radiocenter select 0) < 10) then {
		        _ok = false;
		    };
		    sleep 1;
		};

		["setPages", ["meka\story\relaisradio.html"]] call tabnote;
		["showFile", true] call hud;

		private _ok = true;
		while { _ok } do {
		    private _active = (radiocenter select 0) getVariable ["radioactive", true];
		    if(_active isEqualTo false) then {
		        _ok = false;
		    };
		};
		removeAllMissionEventHandlers "Draw3D";
		
		["setPages", ["meka\story\relaisradiooff.html"]] call tabnote;
		["showFile", true] call hud;
		missionNamespace setVariable["armyradiostate", 1];

		playSound "whitenoise";
        deleteMarker _missionmarker;

        sleep 60 + (random 120);

		["setPages", ["meka\story\receptionsignal1.html","meka\story\receptionsignal2.html"]] call tabnote;
		["showFile", true] call hud;