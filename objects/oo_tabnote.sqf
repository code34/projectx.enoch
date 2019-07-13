	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2018 Nicolas BOITEUX

	CLASS OO_TABNOTE

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

	CLASS("OO_TABNOTE")
		PRIVATE VARIABLE("code","this");
		PRIVATE UI_VARIABLE("display", "mydisplay");
		PRIVATE VARIABLE("array","pages");
		PRIVATE VARIABLE("scalar","index");
		PRIVATE VARIABLE("bool","isshow");
		PRIVATE VARIABLE("string","mode");

		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_TABNOTE::constructor")
			private _array = [];
			MEMBER("pages", _array);
			MEMBER("index", 0);
			MEMBER("isshow", false);
			MEMBER("setMode", "F1");
		};

		PUBLIC FUNCTION("","createDialog") {
			createDialog "tabnote";
			MEMBER("printPage", 0);
			MEMBER("isshow", true);
			// desactive l icone doc du hud
			["showFile", false] call hud;
		};

		PUBLIC FUNCTION("string","setMode") {
			MEMBER("mode", _this);
		};

		PUBLIC FUNCTION("","closeDialog") {
			MEMBER("isshow", false);
		};

		PUBLIC FUNCTION("display","setDisplay") {
			MEMBER("mydisplay", _this);
		};

		PUBLIC FUNCTION("","isDisplay") {
			MEMBER("isshow", nil);
		};

		PUBLIC FUNCTION("array","setPages") {
			MEMBER("pages", _this);
		};

		PUBLIC FUNCTION("","nextPage") {
			DEBUG(#, "OO_TABNOTE::nextPage")
			//systemChat format ["mode: %1", MEMBER("mode",nil)];
			private _index = MEMBER("index", nil);
			private _count = count(MEMBER("pages", nil)) - 1;
			if(_index + 1 > _count) then { _index = 0;} else {_index = _index + 1;};
			MEMBER("index", _index);
			MEMBER("printPage", _index);
		};

		PUBLIC FUNCTION("scalar","printPage") {
			DEBUG(#, "OO_TABNOTE::printPage")
			// on cache toutes les pages des differents mode F1, F2, etc.
			{ ctrlShow [_x, false]; } foreach [20001, 20003];
			
			switch (MEMBER("mode",nil)) do {
				case "F1" : {
					private _ctrl = MEMBER("mydisplay", nil) displayCtrl 20001;
					_ctrl htmlLoad (MEMBER("pages", nil) select _this);
					_ctrl ctrlShow true;
				};
				case "F2" : {
					private _hide = [20001];
					private _ctrl = MEMBER("mydisplay", nil) displayCtrl 20003;
					_resume = "resume" call healthresume;
					_ctrl ctrlSetStructuredText _resume;
					_ctrl ctrlShow true;
				};
				default {};
			};
		};

		PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_TABNOTE::deconstructor")
			DELETE_VARIABLE("this");
			DELETE_UI_VARIABLE("mydisplay");
			DELETE_VARIABLE("pages");
			DELETE_VARIABLE("isshow");
			DELETE_VARIABLE("index");
			DELETE_VARIABLE("mode");
		};
	ENDCLASS;