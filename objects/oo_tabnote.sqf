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

		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_TABNOTE::constructor")
			private _array = [];
			MEMBER("pages", _array);
		};

		PUBLIC FUNCTION("","createDialog") {
			createDialog "tabnote";
			MEMBER("nextPage", nil);
		};

		PUBLIC FUNCTION("display","setDisplay") {
			MEMBER("mydisplay", _this);
		};

		PUBLIC FUNCTION("array","setPages") {
			MEMBER("pages", _this);
		};

		PUBLIC FUNCTION("","nextPage") {
			DEBUG(#, "OO_TABNOTE::nextPage")
			private _pages = MEMBER("pages", nil);
			private _page = _pages deleteAt 0;
			_pages pushBack _page;
			MEMBER("printPage", _page)
		};

		PUBLIC FUNCTION("string","printPage") {
			private _ctrl = MEMBER("mydisplay", nil) displayCtrl 20001;
			_ctrl htmlLoad _this;
		};

		PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_TABNOTE::deconstructor")
			DELETE_VARIABLE("this");
			DELETE_UI_VARIABLE("mydisplay");
			DELETE_VARIABLE("pages");
		};
	ENDCLASS;