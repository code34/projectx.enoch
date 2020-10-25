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
		PRIVATE VARIABLE("array", "content");

		PUBLIC FUNCTION("array","constructor") { 
			DEBUG(#, "OO_CONTAINER::constructor")
			MEMBER("netId", _this select 0);
			MEMBER("model", _this select 1);
			private _array = [];
			MEMBER("content", _array);
			private _array = ["", 0,0];
			MEMBER("properties", _array);
		};

		PUBLIC FUNCTION("","load") {
			DEBUG(#, "OO_CONTAINER::load")
			private _netId = MEMBER("netId", nil);
			private _properties = ["remoteCall", ["vitems_getProperties",  _netId, 2, ["", 0,0]]] call bmeclient;
			private _inventory = ["remoteCall", ["vitems_getInventory",  _netId, 2, []]] call bmeclient;
			private _list = MEMBER("fillInventory", _inventory select 1);
			MEMBER("content", _list);
			MEMBER("properties", _properties);
			(_inventory select 0);
		};

		PUBLIC FUNCTION("object","loadInventory") {
			DEBUG(#, "OO_CONTAINER::loadInventory")
			private _gear = "new" call OO_ARMAGEAR;
			{ MEMBER("addItem", _x);} forEach (["loadItems", _this] call _gear);
		};

		PUBLIC FUNCTION("array","overLoad") {
			private _list = MEMBER("fillInventory", _this);
			private _properties = ["", 0,0];
			MEMBER("properties", _properties);
			MEMBER("content", _list);
		};

		PUBLIC FUNCTION("array","fillInventory") {
			DEBUG(#, "OO_CONTAINER::fillInventory")
			private _gear = "new" call OO_ARMAGEAR; 
			private _list = [];
			{
				private _result = ["loadCfg", _x] call _gear;
				_list pushBack _result;
			} forEach _this;
			_list;
		};

		PUBLIC FUNCTION("","save") {
			DEBUG(#, "OO_CONTAINER::save")
			private _netId = MEMBER("netId", nil);
			private _list = [];

			{
				_classid = _x select 0;
				_nbusage = _x select 4;
				_list pushBack [_classid, _nbusage];
			} forEach MEMBER("getContent", nil);

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
			private _properties = MEMBER("getProperties", nil);
			_properties set[0, _this];
			MEMBER("setProperties", _properties);
		};

		// Return the limit size of container
		PUBLIC FUNCTION("","getLimitSize") {
			DEBUG(#, "OO_CONTAINER::getLimitSize")
			MEMBER("getProperties", nil) select 1;
		};

		// Set the limit size of container
		PUBLIC FUNCTION("scalar","setLimitSize") {
			DEBUG(#, "OO_CONTAINER::setLimitSize")
			private _properties = MEMBER("getProperties", nil);
			_properties set[1, _this];
			MEMBER("setProperties", _properties);
		};

		// Return the limit weight of container
		PUBLIC FUNCTION("","getLimitWeight") {
			DEBUG(#, "OO_CONTAINER::getLimitWeight")
			MEMBER("getProperties", nil) select 2;
		};

		// Set the limit weight of container
		PUBLIC FUNCTION("scalar","setLimitWeight") {
			DEBUG(#, "OO_CONTAINER::setLimitWeight")
			private _properties = MEMBER("getProperties", nil);
			_properties set[2, _this];
			MEMBER("setProperties", _properties);
		};

		// Count the occuped size in container
		PUBLIC FUNCTION("","countSize") {
			DEBUG(#, "OO_CONTAINER::countSize")
			private _size = 0;
			{
				if((_x select 4) > 0) then {
					_size = _size + (_x select 4);
				} else {
					_size = _size + 1;
				};
			} foreach MEMBER("getContent", nil);
			_size;
		};

		// Count the weight in container
		PUBLIC FUNCTION("","countWeight") {
			DEBUG(#, "OO_CONTAINER::countWeight")
			private _weight = 0;

			{
				if((_x select 4) > 0) then {
					_weight = _weight + ((_x select 3) * (_x select 4));
				} else {
					_weight = _weight + (_x select 3);
				};
			} forEach MEMBER("getContent", nil);
			_weight;
		};

		// Set the properties of container from an array
		PUBLIC FUNCTION("array","setProperties") {
			DEBUG(#, "OO_CONTAINER::setProperties")
			MEMBER("properties", _this);
		};

		PUBLIC FUNCTION("scalar","useItem") {
			DEBUG(#, "OO_CONTAINER::useItem")
			private _index = _this;
			private _content = MEMBER("getContent", nil);
			private _object = _content select _index;
			private _exist = ((_object select 0)+".sqf") call fnc_fileexist;
			if(_exist) then {
				private _filename = format["vitems\items\%1.sqf", _object select 0];
				private _code = compile preprocessFileLineNumbers _filename;
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
			};
			_index;
		};

		// pour le moment ne fait pas plus que useitem
		PUBLIC FUNCTION("scalar","shredItem") {
			DEBUG(#, "OO_CONTAINER::shredItem")
			private _index = _this;
			private _content = MEMBER("getContent", nil);
			private _object = _content select _index;
			private _filename = format["vitems\items\%1.sqf", _object select 0];
			//if ((loadFile _filename) isEqualTo "") exitWith {_index;};
			private _code = compile preprocessFileLineNumbers _filename;
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


		// Consume Item
		// [type, nbusage]
		PUBLIC FUNCTION("array","consumeItem") {
			DEBUG(#, "OO_CONTAINER::consumeItem")
			private _type = _this select 0;
			private _nbusage = _this select 1;
			private _content = MEMBER("getContent", nil);
			private _index = MEMBER("findItemIndex", _type);
			private _item = _content select _index;
			private _count = (_item select 4) - _nbusage;
			if(_count > 0) then {
				_item set [4, _count];
				_content set [_index, _item];
			} else {
				_content deleteAt _index;
			};
		};

		// Consume Item by Index
		// [type, nbusage]
		PUBLIC FUNCTION("scalar","consumeOneItemByIndex") {
			DEBUG(#, "OO_CONTAINER::consumeOneItemByIndex")
			private _content = MEMBER("getContent", nil);
			private _index = _this;
			private _item = _content select _index;
			private _count = (_item select 4) - 1;
			if(_count > 0) then {
				_item set [4, _count];
				_content set [_index, _item];
			} else {
				_content deleteAt _index;
			};
		};

		// set Item count
		// [type, count]
		PUBLIC FUNCTION("array","setItemCount") {
			DEBUG(#, "OO_CONTAINER::setItemCount")
			private _type = _this select 0;
			private _count = _this select 1;
			private _content = MEMBER("getContent", nil);
			private _index = MEMBER("findItemIndex", _type);
			private _item = _content select _index;
			_item set [4, _count];
			_content set [_index, _item];
		};

		PUBLIC FUNCTION("string","findItemIndex") {
			DEBUG(#, "OO_CONTAINER::findItemIndex")
			private _index = -1;
			{
				if((_x select 0) isEqualTo _this) exitWith {_index = _forEachIndex;};
			} forEach MEMBER("getContent", nil);
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
			MEMBER("content", nil);
		};

		// Set the content of container (items in array format)
		PUBLIC FUNCTION("array","setContent") {
			DEBUG(#, "OO_CONTAINER::setContent")
			MEMBER("content", _this);
		};

		// Add x elements to container (items in array format)
		PUBLIC FUNCTION("array","addContent") {
			DEBUG(#, "OO_CONTAINER::addContent")
			private _content = MEMBER("content", nil);
			{
				_content pushBack _x;
			} foreach _this;
		};

		PUBLIC FUNCTION("string","containsItem") {
			DEBUG(#, "OO_CONTAINER::containsItem")
			private _index = MEMBER("findItemIndex", _this);
			if(_index > -1) exitWith {true;};
			false;
		};

		// Add an item to the content of container
		PUBLIC FUNCTION("array","addItem") {
			DEBUG(#, "OO_CONTAINER::addItem")
			private _type = _this select 0;
			private _count = _this select 4;
			private _content = MEMBER("getContent", nil);
			private _index = MEMBER("findItemIndex", _type);
			if(_index > -1) then {
				private _item = _content select _index;
				_count = _count + (_item select 4);
				_item set [4, _count];
				 _content set [_index, _item];
			} else {
				_content pushBack _this;
			};
			true;
		};

		// Add an item to the content of container
		// param:  [["label", nbusage]]
		PUBLIC FUNCTION("array","addItemsByLabel") {
			DEBUG(#, "OO_CONTAINER::addItemsByLabel")
			private _list = MEMBER("fillInventory", _this);
			{
				MEMBER("addItem", _x);
			}foreach _list;
			true;
		};

		// Add an item to the content of container
		// param:  [["label", nbusage]]
		PUBLIC FUNCTION("array","removeItemsByLabel") {
			DEBUG(#, "OO_CONTAINER::removeItemsByLabel")
			{
				MEMBER("consumeItem", _x);
			}foreach _this;
			true;
		};

		// Delete an item of the content of container
		PUBLIC FUNCTION("scalar","popItem") {
			DEBUG(#, "OO_CONTAINER::popItem")
			private _content = MEMBER("getContent", nil);
			private _item = _content deleteAt _this;
			MEMBER("setContent", _content);
			_item;
		};

		// Retrieve an item
		PUBLIC FUNCTION("scalar","getItem") {
			DEBUG(#, "OO_CONTAINER::getItem")
			MEMBER("getContent", nil) select _this;
		};

		// Delete an item of the content of container
		PUBLIC FUNCTION("scalar","getItemUnitary") {
			DEBUG(#, "OO_CONTAINER::getItemUnitary")
			private _content = MEMBER("getContent", nil);
			private _return = "";
			if((_content select _this) select 4 < 2) then {
				_return = _content deleteAt _this;
			} else {
				_return = +(_content select _this);
				_return set[4,1];
				private _nbusage = ((_content select _this) select 4) - 1;
				(_content select _this) set[4, _nbusage];
			};
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
			DELETE_VARIABLE("content");
		};
	ENDCLASS;