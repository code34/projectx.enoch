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

		PUBLIC FUNCTION("","weaponsItems") { 
			private _wp = weaponsItems player;
			private _p = primaryWeapon player;
			private _s = secondaryWeapon player;
			private _g = handgunWeapon player;
	
			private _primary = "";
			private _secondary = "";
			private _gun = "";

			{
				switch (_x select 0) do { 
					case _p : { _primary = _x;}; 
					case _s : { _secondary = _x;}; 
					case _g : { _gun = _x;}; 
					default {}; 
				};
			} forEach _wp;

			if(_primary isEqualTo "") then {_primary = ["","","","",[""],[],""];};
			if(_secondary isEqualTo "") then {_secondary = ["","","","",[""],[],""];};
			if(_gun isEqualTo "") then {_gun = ["","","","",[""],[],""];};

			[_primary, _secondary, _gun];
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
				case MEMBER("isVehicle", _classid) : {
					_title = getText(configfile >> "cfgVehicles" >> _classid >> "displayName");
					_description = getText(configfile >> "cfgVehicles" >> _classid >> "descriptionShort");
					_weight = 1;
					_picture = getText(configfile >> "cfgVehicles" >> _classid >> "picture");
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


		PUBLIC FUNCTION("","loadItems") {
				DEBUG(#, "OO_ARMAGEAR::loadItems")
				private _items = [];
				private _result = [];

				_items pushBack (headgear player);
				_items pushBack (goggles player);
				_items pushBack (uniform player);				
				{_items pushBack _x} foreach (UniformItems player);
				_items pushBack (vest player);
				{_items pushBack _x} foreach (VestItems player);
				_items pushBack (backpack player);
				{_items pushBack _x} foreach (backpackItems player);
				{_items pushBack _x} foreach (primaryWeaponItems player);
				{_items pushBack _x} foreach (secondaryWeaponItems player);
				{_items pushBack _x} foreach (handgunItems player);
				{_items pushBack _x}foreach (weapons player);
				
				private _blacklist = (weapons player);
				{
					if!(_x in _blacklist) then {_items pushBack _x};
				} foreach (assignedItems player);
				_items = _items - [""];

				{
					_param = [_x, 1];
					_result pushBack MEMBER("loadCfg", _param);
				} forEach _items;
				_result;
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

		PUBLIC FUNCTION("string","isVehicle") {
			(str(configfile >> "cfgVehicles" >> _this) != "");
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

		PUBLIC FUNCTION("array","addItem") {
			DEBUG(#, "OO_ARMAGEAR::addItem")
			// type : head, backpack, vest, uniform
			// item : arma class 
			private _type = _this select 0;
			private _item = _this select 1;
			switch (_type) do { 
				case "head" : {player addHeadgear _item;}; 
				case "uniform" : {player addUniform _item;}; 
				case "vest" : {player addVest _item;}; 
				case "backpack" : {
					player addBackpack _item;
					clearAllItemsFromBackpack player;
				}; 
				case "primaryweapon" : {player addPrimaryWeaponItem _item;};
				case "secondaryweapon" : {player addSecondaryWeaponItem _item;};
				case "handgunweapon" : {player addHandgunItem _item;};
				default {}; 
			};
		};

		PUBLIC FUNCTION("array","getCargoItems") {
			private _result = [];
			private _items = [];
			private _cargo = _this select 0;

			switch (true) do {
				case (_cargo isEqualTo (uniform player)) : {_items = uniformItems player;};
				case (_cargo isEqualTo (vest player)) : {_items = vestItems player; };
				case (_cargo isEqualTo (backpack player)): {_items = backpackItems player;};
			};

			{ _result pushBack [_x, 1];	} forEach _items;
			_result;
		};

		PUBLIC FUNCTION("array","addWeapon") {
			DEBUG(#, "OO_ARMAGEAR::addWeapon")
			private _items = _this;
			if(MEMBER("isWeapon",(_items select 0))) then {
				player addweapon (_items select 0);
			};
		};

		PUBLIC FUNCTION("array","addMagazines") {
			DEBUG(#, "OO_ARMAGEAR::addMagazines")
			private _type = _this select 0;
			private _item = _this select 1;
			private _mages = "";
			private _wp = "";
			private _items = "";
			
			if(MEMBER("isMagazine",(_item select 0))) then {
				switch (_type) do { 
					case "primaryweapon" : { 
						_wp = (primaryWeapon player);
						_mags = primaryWeaponMagazine player;
						_items = primaryWeaponItems player;					
						{player removeMagazines  _x;} forEach _mags;
						player setAmmo [primaryWeapon player, 0];
					}; 
					case "secondaryweapon" : {
						_wp = (secondaryWeapon player);
						_mags = secondaryWeaponMagazine player;
						_items = secondaryWeaponItems player;
						{player removeMagazines  _x;} forEach _mags;
						player setAmmo [secondaryWeapon player, 0];
					}; 
					case "handgunweapon" : {
						_wp = (handgunWeapon player);
						_mags = handgunMagazine player;
						_items = handgunItems player;
						{player removeMagazines  _x;} forEach _mags;
						player setAmmo [handgunWeapon player, 0];
					}; 
					default {}; 
				};

				for "_i" from ((_item select 4) -1) to 0 step -1 do { 
					player addMagazine (_item select 0);
				};	
				player addWeaponItem [_wp, [(_item select 0), 29, ""]];
				player selectWeapon _wp;
				reload player;
			};
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
				for "_i" from ((_items select 4) - 1) to 0 step -1 do {
					player removeMagazine (_items select 0);									
				};	
			};

			if((_items select 0) isEqualTo (backpack player)) then{
				removeBackpack player;
			};
		};


		PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_ARMAGEAR::deconstructor")
			DELETE_VARIABLE("this");
			DELETE_VARIABLE("type");
		};
	ENDCLASS;