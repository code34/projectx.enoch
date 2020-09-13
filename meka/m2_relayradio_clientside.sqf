		// on attend que l'antenne radio soit activée
		private _radiostate = missionNamespace getVariable ["armyradiostate", 0];
		while { _radiostate < 1 } do {
			_radiostate = missionNamespace getVariable ["armyradiostate", 0];
			sleep 0.1;
		};
		// relai radio turn off signal
		["setPages", [myLanguage+"m2_radio.html"]] call tabnote;
		"keyF1" call keyhandler;
		playsound "carrier";
		sleep 10;
		private _position = getMarkerPos "antenne_radio";
		radiocenter = (nearestObjects [_position, ["Land_TBox_F"], 50]) select 0;

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
			if (player distance radiocenter < 10) then { _ok = false; };
			sleep 1;
		};

		// add radio amplifier in
		["setPages", [myLanguage+"m2_relaisradio.html"]] call tabnote;
		["showFile", true] call hud;

		_radioactive = missionNamespace getVariable ["radioactive", false];
		while { !_radioactive } do {
			_radioactive = missionNamespace getVariable ["radioactive", false];
			sleep 1;
		};

		removeAllMissionEventHandlers "Draw3D"; 
		["setPages", [myLanguage+"m2_relaisradiooff.html"]] call tabnote;
		["showFile", true] call hud;
		playSound "whitenoise";