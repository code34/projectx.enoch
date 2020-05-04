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
        PRIVATE VARIABLE("string","mode");
        PRIVATE VARIABLE("array","forest");
        PRIVATE VARIABLE("array","village");

        PUBLIC FUNCTION("","constructor") { 
            DEBUG(#, "OO_SOUND::constructor")
            MEMBER("setMode", "exploration");
            
            private _array = ["microwave.ogg","cookiepan.ogg", "lullaby.ogg", "ghostlyvoices.ogg", "cough.ogg", "razor.ogg", "evacuation.ogg"];
            MEMBER("village", _array);
            

            private _array = ["wscreaming.ogg", "aliengate.ogg", "screechy.ogg", "comeback.ogg", "whisper.ogg"];
            MEMBER("forest", _array);
            SPAWN_MEMBER("playSound", nil);
        };

        PUBLIC FUNCTION("string","setMode") {
        	MEMBER("mode", "exploration");
        };

		PUBLIC FUNCTION("","playSound") {
			while { true } do {
				sleep (480 + random 240);
                private _location = MEMBER("localizePlayer", nil);
				switch (_location) do {
					case "village" : { MEMBER("getExpHouse", nil); };
					case "forest" : { MEMBER("getExpBack", nil); };
					default {};
				};
			};
		};

		PUBLIC FUNCTION("","localizePlayer") {
			_houses = nearestObjects [player, ["House_F", "House"], 100];
			sleep 0.2;
			if (count _houses > 20) exitWith { "village";};
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

		PUBLIC FUNCTION("","getExpBack") {
	        private _screamers = nearestTerrainObjects [player, ["Tree","Bush"], 100];
    	    sleep 0.2;
        	private _object = selectRandom _screamers;
        	private _path = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
        	private _sound = _path + "sounds\" + (selectRandom MEMBER("forest", nil));
			playSound3D [_sound, _object, false, getPosASL _object, 2, 1, 150];
		};

        PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_SOUND::deconstructor")
			DELETE_VARIABLE("this");
			DELETE_VARIABLE("mode");
			DELETE_VARIABLE("village");
			DELETE_VARIABLE("forest");
        };
    ENDCLASS;