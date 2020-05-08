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
		PRIVATE VARIABLE("scalar","mousehandler");
		PRIVATE VARIABLE("scalar","drinktime");

		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_KEYHANDLER::constructor")
			waitUntil {!(isNull (findDisplay 46))};
			MEMBER("addKeyHandler", nil);
			MEMBER("addZMouseHandler", nil);
			MEMBER("drinktime", time);
		};

		PUBLIC FUNCTION("","addZMouseHandler") { 
			private _mousehandler = (findDisplay 46) displayAddEventHandler ["MouseZChanged", format[" ['mouseCatcher', _this] call %1", MEMBER("this", nil)]];
			MEMBER("mousehandler", _mousehandler);
		};

		PUBLIC FUNCTION("","addKeyHandler") {
			DEBUG(#, "OO_KEYHANDLER::addKeyHandler")
			private _handler = (findDisplay 46) displayAddEventHandler ["KeyDown", format[" ['keyCatcher', _this] call %1", MEMBER("this", nil)]];
			MEMBER("handler", _handler);
		};

		PUBLIC FUNCTION("","removeKeyHandler") {
			DEBUG(#, "OO_KEYHANDLER::removeKeyHandler")
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", MEMBER("mousehandler", nil)];
		};

		PUBLIC FUNCTION("","removeMouseHandler") {
			(findDisplay 46) displayRemoveEventHandler ["MouseZChanged", MEMBER("handler", nil)];
		};

		PUBLIC FUNCTION("array","mouseCatcher") {
			// à compléter avec le coef speed
		};

		PUBLIC FUNCTION("array","keyCatcher") {
			DEBUG(#, "OO_KEYHANDLER::keyCatcher")
			// _this select 1 = key stroke
			// _this select 2 = shift stroke
			// _this select 3 = ctrl stroke
			// _this select 4 = alt stroke
			private _reload = (actionKeys "ReloadMagazine") select 0;

			switch (_this select 1) do { 
				case DIK_UP : { MEMBER("keyUp", nil); }; 
				case DIK_DOWN : { MEMBER("keyDown", nil); }; 
				case DIK_LEFT : { MEMBER("keyLeft", nil); }; 
				case DIK_RIGHT : { MEMBER("keyRight", nil); }; 
				case DIK_F1 : { MEMBER("keyF1", nil); }; 
				case DIK_F2 : { MEMBER("keyF2", nil); }; 
				case DIK_F5 : { MEMBER("keyF5", nil); }; 
				case DIK_SPACE : { MEMBER("keySpace", nil); }; 
				case _reload : {
					//player action ["loadmagazine", player, player, 0, 1 ,"vbs2_us_m16a2_iron_gla", "vbs2_us_m16a2_iron_gla"];
					private _gear = "new" call OO_ARMAGEAR;
					"reloadWeapon" call _gear;
				};
				default {  /*...code...*/ }; 
			};
			false;
		};

		/* PUBLIC FUNCTION("","keyUp") { hint "UP"; };
		PUBLIC FUNCTION("","keyDown") { hint "DOWN"; };
		PUBLIC FUNCTION("","keyLeft") { hint "LEFT"; };
		PUBLIC FUNCTION("","keyRight") { hint "RIGHT"; };*/
		
		PUBLIC FUNCTION("","keyF1") {
			private _exit = false;
			if("isDisplay" call tabnote) then {	 
				closeDialog 0;
				if(("getMode" call tabnote) isEqualTo "F1") then {_exit = true;};
			};
			if(_exit) then {
				["setMode", ""] call tabnote;
			} else {
				["setMode", "F1"] call tabnote;
				"createDialog" call tabnote;	
			};
		};

		PUBLIC FUNCTION("","keyF2") { 
			private _exit = false;
			if("isDisplay" call tabnote) then {	
				closeDialog 0;
				if(("getMode" call tabnote) isEqualTo "F2") then {_exit = true;};
			};
			if(_exit) then {
				["setMode", ""] call tabnote;
			} else {
				["setMode", "F2"] call tabnote;
				"createDialog" call tabnote;	
			};
		};

		PUBLIC FUNCTION("","keyF5") { 
			private _exit = false;
			copyToClipboard format ["%1", (getModelInfo cursorObject) select 0];
		};

		PUBLIC FUNCTION("","keySpace") { 
			private _exit = false;
			private _pump = ["stonewell_01_f.p3d","concretewell_02_f.p3d"];
			if(((getModelInfo cursorObject) select 0) in _pump) then {
				if(time - MEMBER("drinktime",nil) > 2) then {
					MEMBER("drinktime", time);
					player playActionNow "PutDown";
					[20,true] call vitems_drinking;
    				[20] call vitems_digesting;
    			};
			};
		};


		PUBLIC FUNCTION("","deconstructor") { 
			DEBUG(#, "OO_KEYHANDLER::deconstructor")
			MEMBER("removeKeyHandler", nil);
			MEMBER("removeMouseHandler", nil);
			DELETE_VARIABLE("this");
			DELETE_VARIABLE("handler");
			DELETE_VARIABLE("mousehandler");
			DELETE_VARIABLE("drinktime");
		};
	ENDCLASS;