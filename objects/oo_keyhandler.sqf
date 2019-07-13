	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2014-2018 Nicolas BOITEUX

	CLASS OO_KEYHANDLER
	
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
	#include "dik_macro.hpp"

	CLASS("OO_KEYHANDLER")
		PRIVATE VARIABLE("code","this");
		PRIVATE VARIABLE("scalar","handler");

		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_KEYHANDLER::constructor")
			waitUntil {!(isNull (findDisplay 46))};
			MEMBER("addKeyHandler", nil);
		};

		PUBLIC FUNCTION("","addKeyHandler") {
			DEBUG(#, "OO_KEYHANDLER::addKeyHandler")
			private _handler = (findDisplay 46) displayAddEventHandler ["KeyDown", format[" ['keyCatcher', _this] call %1", MEMBER("this", nil)]];
			MEMBER("handler", _handler);
		};

		PUBLIC FUNCTION("","removeKeyHandler") {
			DEBUG(#, "OO_KEYHANDLER::removeKeyHandler")
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", MEMBER("handler", nil)];
		};

		PUBLIC FUNCTION("array","keyCatcher") {
			DEBUG(#, "OO_KEYHANDLER::keyCatcher")
			// _this select 1 = key stroke
			// _this select 2 = shift stroke
			// _this select 3 = ctrl stroke
			// _this select 4 = alt stroke
			switch (_this select 1) do { 
				case DIK_UP : { MEMBER("keyUp", nil); }; 
				case DIK_DOWN : { MEMBER("keyDown", nil); }; 
				case DIK_LEFT : { MEMBER("keyLeft", nil); }; 
				case DIK_RIGHT : { MEMBER("keyRight", nil); }; 
				case DIK_F1 : { MEMBER("keyF1", nil); }; 
				case DIK_F2 : { MEMBER("keyF2", nil); }; 
				default {  /*...code...*/ }; 
			};
			false;
		};

		PUBLIC FUNCTION("","keyUp") { hint "UP"; };
		PUBLIC FUNCTION("","keyDown") { hint "DOWN"; };
		PUBLIC FUNCTION("","keyLeft") { hint "LEFT"; };
		PUBLIC FUNCTION("","keyRight") { hint "RIGHT"; };
		
		PUBLIC FUNCTION("","keyF1") {
			if!("isDisplay" call tabnote) then {				
				["setMode", "F1"] call tabnote;
				"createDialog" call tabnote;	
			};
		};

		PUBLIC FUNCTION("","keyF2") { 
			if!("isDisplay" call tabnote) then {				
				["setMode", "F2"] call tabnote;
				"createDialog" call tabnote;	
			};
		};

		PUBLIC FUNCTION("","deconstructor") { 
			DEBUG(#, "OO_KEYHANDLER::deconstructor")
			MEMBER("removeKeyHandler", nil);
			DELETE_VARIABLE("this");
			DELETE_VARIABLE("handler");
		};
	ENDCLASS;