	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2018 Nicolas BOITEUX

	CLASS OO_CONTAINER

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

	CLASS("OO_CONTAINER")
		PRIVATE VARIABLE("code","this");
		PRIVATE VARIABLE("string","netId");
		PRIVATE VARIABLE("string","model");
		PRIVATE VARIABLE("array", "properties");
		PRIVATE VARIABLE("array", "inventory");

		PUBLIC FUNCTION("array","constructor") { 
			DEBUG(#, "OO_CONTAINER::constructor")
			MEMBER("netId", _this select 0);
			MEMBER("model", _this select 1);
			MEMBER("load", nil);
		};

		PUBLIC FUNCTION("","load") {
			DEBUG(#, "OO_CONTAINER::load")
			private _netId = MEMBER("netId", nil);
			private _properties = ["remoteCall", ["vitems_getProperties",  _netId, 2, []]] call bmeclient;
			private _inventory = ["remoteCall", ["vitems_getInventory",  _netId, 2, []]] call bmeclient;
			private _list = MEMBER("fillInventory", _inventory);
			MEMBER("inventory", _list);
			MEMBER("properties", _properties);
		};

		PUBLIC FUNCTION("array","overLoad") {		
			private _list = MEMBER("fillInventory", _this);
			private _properties = ["", 0,0];
			MEMBER("properties", _properties);
			MEMBER("inventory", _list);
		};

		PUBLIC FUNCTION("array","fillInventory") {
			private _list = [];
			{
				private _classid = _x select 0;
				private _entry = missionConfigFile >> "cfgVitems" >> _classid;
				private _title = getText(missionConfigFile >> "cfgVitems" >> _classid >> "title");
				private _description = getText (_entry >> "description");
				private _weight = getNumber (_entry >> "weight");
				private _nbusage = _x select 1;
				private _picture = getText (_entry >> "picture");
				private _requirement = getArray(_entry >> "requirement");
				_list pushBack [_classid, _title, _description, _weight, _nbusage, _picture,_requirement];
			} forEach _this;
			_list;
		};

		PUBLIC FUNCTION("","save") {
			DEBUG(#, "OO_CONTAINER::save")
			private _netId = MEMBER("netId", nil);
			private _inventory = MEMBER("inventory", nil);
			private _list = [];

			{
				_classid = _x select 0;
				_nbusage = _x select 4;
				_list pushBack [_classid, _nbusage];
			} forEach _inventory;

			private _properties = MEMBER("properties", nil);
			["remoteSpawn", ["vitems_setInventory",  [_netId,_list], "server"]] call bmeclient;
			["remoteSpawn", ["vitems_setProperties",  [_netId,_properties], "server"]] call bmeclient;
		};

		// Return this object
		PUBLIC FUNCTION("","getThis") {
			DEBUG(#, "OO_CONTAINER::getThis")
			MEMBER("this", nil);
		};

		// Return the 3d object container
		PUBLIC FUNCTION("","getNetId") {
			DEBUG(#, "OO_CONTAINER::getNetId")
			MEMBER("netId", nil);
		};

		// Set the 3d object container
		PUBLIC FUNCTION("string","setNetId") {
			DEBUG(#, "OO_CONTAINER::setNetId")
			MEMBER("netId", _this);
		};

		// Return the name of container
		PUBLIC FUNCTION("","getModel") {
			DEBUG(#, "OO_CONTAINER::getModel")
			MEMBER("model", nil);
		};

		// Set the name of the model
		PUBLIC FUNCTION("string","setModel") {
			DEBUG(#, "OO_CONTAINER::setModel")
			MEMBER("setModel", _this);
		};

		// Return the name of container
		PUBLIC FUNCTION("","getName") {
			DEBUG(#, "OO_CONTAINER::getName")
			MEMBER("getProperties", nil) select 0;
		};

		// Set the name of container
		PUBLIC FUNCTION("string","setName") {
			DEBUG(#, "OO_CONTAINER::setName")
			private _content = MEMBER("getProperties", nil);
			_content set[0, _this];
			MEMBER("setProperties", _content);
		};

		// Return the limit size of container
		PUBLIC FUNCTION("","getLimitSize") {
			DEBUG(#, "OO_CONTAINER::getLimitSize")
			MEMBER("getProperties", nil) select 1;
		};

		// Set the limit size of container
		PUBLIC FUNCTION("scalar","setLimitSize") {
			DEBUG(#, "OO_CONTAINER::setLimitSize")
			private _content = MEMBER("getProperties", nil);
			_content set[1, _this];
			MEMBER("setProperties", _content);
		};

		// Return the limit weight of container
		PUBLIC FUNCTION("","getLimitWeight") {
			DEBUG(#, "OO_CONTAINER::getLimitWeight")
			MEMBER("getProperties", nil) select 2;
		};

		// Set the limit weight of container
		PUBLIC FUNCTION("scalar","setLimitWeight") {
			DEBUG(#, "OO_CONTAINER::setLimitWeight")
			private _content = MEMBER("getProperties", nil);
			_content set[2, _this];
			MEMBER("setProperties", _content);
		};

		// Count the occuped size in container
		PUBLIC FUNCTION("","countSize") {
			DEBUG(#, "OO_CONTAINER::countSize")
			count(MEMBER("inventory", nil));
		};

		// Count the weight in container
		PUBLIC FUNCTION("","countWeight") {
			DEBUG(#, "OO_CONTAINER::countWeight")
			private _weight = 0;
			private _inventory = MEMBER("inventory", nil);

			{
				if((_x select 4) > -1) then {
					_weight = _weight + ((_x select 3) + (_x select 4));
				} else {
					_weight = _weight + (_x select 3);
				};
			} forEach _inventory;
			_weight;
		};

		// Set the properties of container from an array
		PUBLIC FUNCTION("array","setProperties") {
			DEBUG(#, "OO_CONTAINER::setProperties")
			//MEMBER("object", nil) setVariable ["properties", _this, true];
			//missionNamespace setVariable [format["properties_%1", MEMBER("netId", nil)], _this, true];
			private _netId = MEMBER("netId", nil);
			MEMBER("properties", _this);
		};

		PUBLIC FUNCTION("scalar","useItem") {
			DEBUG(#, "OO_CONTAINER::useItem")
			private _index = _this;
			private _content = MEMBER("getContent", nil);
			private _object = _content select _index;
			private _code = compile preprocessFileLineNumbers format["vitems\items\%1.sqf", _object select 0];
			private _requirement = +(_object select 6);
			_requirement pushBack (_object select 0);
			private _result = ["checkStuffRequirement", _requirement] call uirequirement;
			if!(_result select 0) then {
				"createDialog" call uirequirement;
				["refreshListBox", (_result select 1)] call uirequirement;
			} else {
				if(call _code) then {
					_content = ["useRequirement", _requirement] call uirequirement;
					MEMBER("setContent", _content);
				};
			};
			_index;
		};

		// Get the properties of container with an array
		PUBLIC FUNCTION("","getProperties") {
			DEBUG(#, "OO_CONTAINER::getProperties")
			MEMBER("properties", nil);
		};


		// Serialize container + content
		PUBLIC FUNCTION("","getContainer") {
			DEBUG(#, "OO_CONTAINER::getContainer")
			private _result = [];
			_result pushBack MEMBER("getProperties", nil);
			_result pushBack MEMBER("getContent", nil);
			_result;
		};

		// Rebuild a container from a serialize container
		PUBLIC FUNCTION("array","setContainer") {
			DEBUG(#, "OO_CONTAINER::setContainer")
			MEMBER("setProperties", _this select 0);
			MEMBER("setContent", _this select 1);
		};

		// Return the content of container (items in array format)
		PUBLIC FUNCTION("","getContent") {
			DEBUG(#, "OO_CONTAINER::getContent")
			MEMBER("inventory", nil);
		};

		// Set the content of container (items in array format)
		PUBLIC FUNCTION("array","setContent") {
			DEBUG(#, "OO_CONTAINER::setContent")
			MEMBER("inventory", _this);
		};

		// Add x elements to container (items in array format)
		PUBLIC FUNCTION("array","addContent") {
			DEBUG(#, "OO_CONTAINER::addContent")
			private _inventory = MEMBER("inventory", nil);
			{
				_inventory pushBack _x;
			} foreach _this;
		};

		PUBLIC FUNCTION("string","containsItem") {
			DEBUG(#, "OO_CONTAINER::containsItem")
			private _content = MEMBER("getContent", nil);
			private _list = [];
			{_list pushBack (_x select 0);} forEach _content;
			private _searchindex = _list find _this;
			//systemChat format ["%1 %2", _list, _searchindex];
			if(_searchindex > -1) exitWith {true;};
			false;
		};

		// Add an item to the content of container
		PUBLIC FUNCTION("array","addItem") {
			DEBUG(#, "OO_CONTAINER::addItem")
			//private _newweight = MEMBER("countWeight", nil) + ("getWeight" call _this);
			//if( MEMBER("countSize", nil) <= MEMBER("limitsize", nil) && _newweight <= MEMBER("limitweight", nil)) exitWith {
				private _content = MEMBER("getContent", nil);
				private _flag = false;
				// if object is already declare in content, add new quantity to already existing object
				{
					if((_x select 0) isEqualTo (_this select 0)) then {
						private _array = _x;
						if(((_array select 4) > -1) and !(_flag)) then {
							_array set [4, ((_x select 4) + (_this select 4))];
							_content set [_forEachIndex, _array];
							_flag = true;
						};
					};
				} foreach _content;
				if!(_flag) then { 	_content pushBack _this;};
				MEMBER("setContent", _content);
				true;
			//};
			//false;
		};

		// Add an item to the content of container
		PUBLIC FUNCTION("array","addItemsByLabel") {
			DEBUG(#, "OO_CONTAINER::addItem")
			//private _newweight = MEMBER("countWeight", nil) + ("getWeight" call _this);
			//if( MEMBER("countSize", nil) <= MEMBER("limitsize", nil) && _newweight <= MEMBER("limitweight", nil)) exitWith {
				private _content = MEMBER("getContent", nil);
				private _list = MEMBER("fillInventory", _this);
				{
					MEMBER("addItem", _x);
				}foreach _list;
				true;
			//};
			//false;
		};

		// Delete an item of the content of container
		PUBLIC FUNCTION("scalar","getItem") {
			DEBUG(#, "OO_CONTAINER::getItem")
			private _content = MEMBER("getContent", nil);
			private _return = _content deleteAt _this;
			MEMBER("setContent", _content);
			_return;
		};

		// Set an item at array pos
		PUBLIC FUNCTION("array","setItem") {
			DEBUG(#, "OO_CONTAINER::setItem")
			private _content = MEMBER("getContent", nil);
			_content set[_this select 0, _this select 1];
			MEMBER("setContent", _content);
		};

		PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_CONTAINER::deconstructor")
			DELETE_VARIABLE("this");
			DELETE_VARIABLE("netId");
			DELETE_VARIABLE("model");
			DELETE_VARIABLE("properties");
			DELETE_VARIABLE("inventory");
		};
	ENDCLASS;