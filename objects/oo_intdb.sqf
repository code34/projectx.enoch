	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2014-2020 Nicolas BOITEUX

	CLASS OO_INTDB - DB INTERFACE
	
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

	CLASS("OO_INTDB")
		PRIVATE VARIABLE("string","drivername");
		PRIVATE VARIABLE("code","driver");
		PRIVATE VARIABLE("string","savename");

		PUBLIC FUNCTION("string","constructor") { 
			DEBUG(#, "OO_PDW::constructor")
			private _drivername = toLower (param [0, "profile", [""]]);
			MEMBER("savename", "");

			switch (_drivername) do {
				case "extdb" : {

				};

				case "inidbi": {
					if !(isClass(configFile >> "cfgPatches" >> "inidbi2")) exitwith { 
						MEMBER("ToLog", "PDW: requires INIDBI2");
					};
					_driver = ["new", "oo_pdw"] call OO_INIDBI;
					MEMBER("driver", _driver);
					MEMBER("drivername", "inidbi");
				};

				default {
					MEMBER("drivername", "profile");
				};
			}
		};

		PUBLIC FUNCTION("string","setSaveName") { MEMBER("savename", _this); };
		PUBLIC FUNCTION("","getSaveName") { MEMBER("savename", nil); };

		PUBLIC FUNCTION("string","setDbName") {
			DEBUG(#, "OO_PDW::setDbName")
			["setDbName", _this] call MEMBER("driver", nil); 
		};

		PUBLIC FUNCTION("array","read") {
			DEBUG(#, "OO_PDW::read")
			private _key = param [0, "", [""]];
			if(_key isEqualTo "") exitwith { MEMBER("ToLog", "PDW: read failed - label not defined"); false;};
			_key = MEMBER("savename",nil) +_key;

			private _default = param[1, ""];
			private _result = false;
			private _drivername = MEMBER("drivername", nil);

			switch (_drivername) do {
				case "inidbi": { _result = ["read", ["pdw", _key, _default]] call MEMBER("driver", nil);};
				case "profile": { _result = profileNamespace getVariable _key;};
				default { _result = false; };
			};
			_result;
		};

		PUBLIC FUNCTION("array","write") {
			DEBUG(#, "OO_PDW::write")
			private _key = param [0, "", [""]];
			if(_key isEqualTo "") exitwith { MEMBER("ToLog", "PDW: write failed - label not defined"); false;};
			_key = MEMBER("savename",nil) +_key;
			private _array = param [1, ""];
			private _drivername = MEMBER("drivername", nil);
			private _result = false;

			switch (_drivername) do {
				case "inidbi": { _result = ["write", ["pdw", _key, _array]] call MEMBER("driver", nil); };
				case "profile": {
					profileNamespace setVariable [_key, _array];
					saveProfileNamespace;
					_result = true;
				};
				default { _result = false; };
			};
			_result;
		};

		PUBLIC FUNCTION("string","toLog") {
			DEBUG(#, "OO_PDW::toLog")
			hintc _this;
			diag_log _this;
		};

		PUBLIC FUNCTION("","deconstructor") { 
			DEBUG(#, "OO_PDW::deconstructor")
			DELETE_VARIABLE("drivername");
			DELETE_VARIABLE("driver");
			DELETE_VARIABLE("savename");
		};
	ENDCLASS;