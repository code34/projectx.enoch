	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2018 Nicolas BOITEUX

	CLASS OO_ARMAGEAR

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

	CLASS("OO_ARMAGEAR")
		PRIVATE VARIABLE("code","this");
		PRIVATE VARIABLE("string","type");
		PRIVATE VARIABLE("array","weapons");
		PRIVATE VARIABLE("array","magazines");

		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_ARMAGEAR::constructor")
			private _array = [];
			MEMBER("weapons", _array);
			private _array = [];
			MEMBER("magazines", _array);			
		};

		PUBLIC FUNCTION("array","loadCfg") {
			DEBUG(#, "OO_ARMAGEAR::loadCfg")
			private _classid = _this select 0;
			private _nbusage = _this select 1;
			private _title = "uknown";
			private _description = "unknown";
			private _weight = 1;
			private _picture = "";
			private _requirement = [];
			private _armagear = false;

			switch (true) do {
				case MEMBER("isVitems", _classid) : {
					_title = getText(missionConfigFile >> "cfgVitems" >> _classid >> "title");
					_description = getText (missionConfigFile >> "cfgVitems" >> _classid >> "description");
					_weight = getNumber (missionConfigFile >> "cfgVitems" >> _classid >> "weight");
					_picture = getText (missionConfigFile >> "cfgVitems" >> _classid >> "picture");
					_requirement = getArray(missionConfigFile >> "cfgVitems" >> _classid >> "requirement");
				};
				case MEMBER("isWeapon", _classid) : {
					_title = getText(configfile >> "cfgWeapons" >> _classid >> "displayName");
					_description = getText(configfile >> "cfgWeapons" >> _classid >> "descriptionShort");
					//_weight = getNumber(configfile >> "cfgWeapons" >> _classid >> "weight");
					_weight = 1;
					_picture = getText(configfile >> "cfgWeapons" >> _classid >> "picture");
					_requirement = [];
					_armagear = true;
				};
				case MEMBER("isMagazine", _classid) : {
					_title = getText(configfile >> "cfgMagazines" >> _classid >> "displayName");
					_description = getText(configfile >> "cfgMagazines" >> _classid >> "descriptionShort");
					//_weight = getNumber(configfile >> "cfgMagazines" >> _classid >> "weight");
					_weight = 1;
					_picture = getText(configfile >> "cfgMagazines" >> _classid >> "picture");
					_requirement = [];
					_armagear = true;
				};
				default {};
			};
			[_classid, _title, _description, _weight, _nbusage, _picture,_requirement, _armagear];
		};

		PUBLIC FUNCTION("","loadWeapons") {
			DEBUG(#, "OO_ARMAGEAR::loadWeapons")
			private _weapons = [];
			{
				private _title = getText(configfile >> "cfgWeapons" >> _x >> "displayName");
				private _description = getText(configfile >> "cfgWeapons" >> _x >> "descriptionShort");
				//private _weight = getNumber(configfile >> "cfgWeapons" >> _x >> "weight");
				_weight = 1;
				private _nbusage = 1;
				private _picture = getText(configfile >> "cfgWeapons" >> _x >> "picture");
				private _requirement = [];
				_weapons pushBack [_x, _title, _description, _weight, _nbusage, _picture,_requirement,true];
			} foreach (weapons player);
			_weapons;
		};

		PUBLIC FUNCTION("","loadMagazines") {
			DEBUG(#, "OO_ARMAGEAR::loadMagazines")
			private _magazines = [];
			{
				private _title = getText(configfile >> "cfgMagazines" >> _x >> "displayName");
				private _description = getText(configfile >> "cfgMagazines" >> _x >> "descriptionShort");
				//private _weight = getNumber(configfile >> "cfgMagazines" >> _x >> "weight");
				_weight = 1;
				private _nbusage = 1;
				private _picture = getText(configfile >> "cfgMagazines" >> _x >> "picture");
				private _requirement = [];
				_magazines pushBack [_x, _title, _description, _weight, _nbusage, _picture,_requirement,true];
			} foreach (magazines player);
			_magazines;
		};

		PUBLIC FUNCTION("string","isWeapon") {
			(str(configfile >> "cfgWeapons" >> _this) != "");
		};

		PUBLIC FUNCTION("string","isMagazine") {
			(str(configfile >> "cfgMagazines" >> _this) != "");
		};

		PUBLIC FUNCTION("string","isVitems") {
			(str(missionConfigFile >> "cfgVitems" >> _this) != "");
		};

		PUBLIC FUNCTION("array","addToInventory") {
			DEBUG(#, "OO_ARMAGEAR::addToInventory")
			private _items = _this;

			if(MEMBER("isWeapon",(_items select 0))) then {
				player addweapon (_items select 0);
			};

			if(MEMBER("isMagazine",(_items select 0))) then {
				for "_i" from ((_items select 4) -1) to 0 step -1 do {
					player addMagazine (_items select 0);									
				};	
			};
		};

		// create default container properties according class of 3d object container
		PUBLIC FUNCTION("array","removeToInventory") {
			DEBUG(#, "OO_ARMAGEAR::removeToInventory")
			private _items = _this;

			if(MEMBER("isWeapon",(_items select 0))) then {
				player removeWeapon (_items select 0);
			};

			if(MEMBER("isMagazine",(_items select 0))) then {
				for "_i" from (_items select 4) to 0 step -1 do {
					player removeMagazine (_items select 0);									
				};	
			};
		};


		PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_ARMAGEAR::deconstructor")
			DELETE_VARIABLE("this");
			DELETE_VARIABLE("type");
		};
	ENDCLASS;