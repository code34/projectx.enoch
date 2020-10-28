	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2019 Nicolas BOITEUX

	CLASS OO_SOUND

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. 
	*/

	#include "oop.h"

	CLASS("OO_SOUND")
		PRIVATE VARIABLE("code","this");
		PRIVATE VARIABLE("string","path");
		PRIVATE VARIABLE("string","mode");
		PRIVATE VARIABLE("array","forest");
		PRIVATE VARIABLE("array","village");
		PRIVATE VARIABLE("array","night");

		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_SOUND::constructor")
			MEMBER("setMode", "exploration");
			private _path = ([(str missionConfigFile), 0, -15] call BIS_fnc_trimString) + "sounds\";
			MEMBER("path", _path);
			
			private _array = ["microwave.ogg","cookiepan.ogg", "lullaby.ogg", "ghostlyvoices.ogg", "cough.ogg", "razor.ogg", "evacuation.ogg", "rustydoor.ogg","lockdoor.ogg", "vanishroar.ogg"];
			MEMBER("village", _array);
			
			private _array = ["wscreaming.ogg", "dock.ogg", "screechy.ogg", "comeback.ogg", "whisper.ogg", "wetfoot.ogg", "wildanimal.ogg", "boar.ogg", "wavparser.ogg", "fallen.ogg"];
			MEMBER("forest", _array);

			private _array = ["stangeanimal1.ogg", "wscreaming.ogg", "whisper.ogg","wetfoot.ogg", "ghostforest.ogg", "scaryviolins.ogg", "childscream.ogg"];
			MEMBER("night", _array);

			SPAWN_MEMBER("playAmbientSounds", nil);
		};

		PUBLIC FUNCTION("string","setMode") {
			MEMBER("mode", "exploration");
		};

		// ["playSound", ["eat.ogg", player, false, 5, 1, 10]] call mysound;
		PUBLIC FUNCTION("array","playSound") {
			private _sound = MEMBER("path",nil) + (_this select 0);
			private _object = _this select 1;
			private _inside = _this select 2;
			private _volume = _this select 3;
			private _pitch = _this select 4;
			private _distance = _this select 5;
			playSound3D [_sound, _object, _inside, getPosASL _object, _volume, _pitch, _distance];
		};

		PUBLIC FUNCTION("","playAmbientSounds") {
			while { true } do {
				private _location = MEMBER("localizePlayer", nil);
				switch (_location) do {
					case "village" : { sleep (120 + random 480);MEMBER("getExpHouse", nil); };
					case "forest" : { sleep (120 + random 480);MEMBER("getExpForest", nil); };
					case "night" : { sleep (15 + random 15);MEMBER("getExpNight", nil); };
					default {};
				};
			};
		};

		PUBLIC FUNCTION("","localizePlayer") {
			_houses = nearestObjects [player, ["House_F", "House"], 100];
			sleep 0.2;
			if (count _houses > 20) exitWith { "village";};
			private _hour = date select 3;
			if(((_hour >= 22) and (_hour <= 24)) or ((_hour >=0) and(_hour <=4))) exitWith {"night";};
			private _trees = nearestTerrainObjects [player, ["Tree","Bush"], 100];
			sleep 0.2;
			if (count _trees > 20) exitWith {"forest";};
			"undefined";
		};

		PUBLIC FUNCTION("","getExpHouse") {
			private _screamers = nearestTerrainObjects [player, ["House_F", "House"], 100];
			sleep 0.2;
			private _object = selectRandom _screamers;
			private _path = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
			private _sound = _path + "sounds\" + (selectRandom MEMBER("village", nil));
			playSound3D [_sound, _object, false, getPosASL _object, 2, 1, 150];
		};

		PUBLIC FUNCTION("","getExpForest") {
			private _screamers = nearestTerrainObjects [player, ["Tree","Bush"], 100];
			sleep 0.2;
			private _object = selectRandom _screamers;
			private _path = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
			private _sound = _path + "sounds\" + (selectRandom MEMBER("forest", nil));
			playSound3D [_sound, _object, false, getPosASL _object, 2, 1, 150];
		};

		PUBLIC FUNCTION("","getExpNight") {
			private _screamers = nearestTerrainObjects [player, ["Tree","Bush", "House"], 100];
			sleep 0.2;
			private _object = selectRandom _screamers;
			private _path = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
			private _sound = _path + "sounds\" + (selectRandom MEMBER("night", nil));
			playSound3D [_sound, _object, false, getPosASL _object, 2, 1, 150];
		};

		PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_SOUND::deconstructor")
			DELETE_VARIABLE("this");
			DELETE_VARIABLE("path");
			DELETE_VARIABLE("mode");
			DELETE_VARIABLE("village");
			DELETE_VARIABLE("forest");
			DELETE_VARIABLE("night");
		};
	ENDCLASS;