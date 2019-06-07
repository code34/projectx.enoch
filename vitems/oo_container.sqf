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
			private _inventory = ["remoteCall", ["vitems_getInventory",  _netId, 2, []]] call bmeclient;
			private _properties = ["remoteCall", ["vitems_getProperties",  _netId, 2, []]] call bmeclient;
			MEMBER("inventory", _inventory);
			MEMBER("properties", _properties);
		};

		PUBLIC FUNCTION("","save") {
			DEBUG(#, "OO_CONTAINER::save")
			private _netId = MEMBER("netId", nil);
			private _inventory = MEMBER("inventory", nil);
			private _properties = MEMBER("properties", nil);
			["remoteSpawn", ["vitems_setInventory",  [_netId,_inventory], "server"]] call bmeclient;
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
			private _netId = MEMBER("netId", nil);
			count(MEMBER("inventory", nil));
			//count(missionNamespace getVariable [format["inventory_%1", MEMBER("netId", nil)], []]);
		};

		// Count the weight in container
		PUBLIC FUNCTION("","countWeight") {
			DEBUG(#, "OO_CONTAINER::countWeight")
			private _weight = 0;
			private _netId = MEMBER("netId", nil);
			private _result = MEMBER("inventory", nil);
			{
				_weight = _weight + (_x select 3);
			} forEach _result;
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
			private _code = _object select 5;
			private _durability = _object select 4;
			if !(_durability isEqualTo 0 ) then {
				private _result = cursorObject call _code;
				if(_result) then {
					if(_durability > -1) then { _durability = _durability - 1;	};
					if !(_durability isEqualTo 0 ) then {
						_object set [4, _durability];
						_content set[_index, _object];
					} else {
						_content deleteAt _index;
					};
					MEMBER("setContent", _content);
				};
			};
		};

		// Get the properties of container with an array
		PUBLIC FUNCTION("","getProperties") {
			DEBUG(#, "OO_CONTAINER::getProperties")
			//private _properties = (missionNamespace getVariable [format["properties_%1", MEMBER("netId", nil)], []]);
			private _netId = MEMBER("netId", nil);
			private _properties = MEMBER("properties", nil);
			if (_properties isEqualTo []) then {
				private _stuff = ["new", MEMBER("model", nil)] call OO_RANDOMSTUFF;
				_properties = "createProperties" call _stuff;
				MEMBER("setProperties", _properties);
				private _content = "getRandomContent" call _stuff;
				MEMBER("setContent", _content);
			};
			_properties;
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
			//(missionNamespace getVariable [format["inventory_%1", MEMBER("netId", nil)], []]);
			private _netId = MEMBER("netId", nil);
			MEMBER("inventory", nil);
		};

		// Set the content of container (items in array format)
		PUBLIC FUNCTION("array","setContent") {
			DEBUG(#, "OO_CONTAINER::setContent")
			//missionNamespace setVariable [format["inventory_%1", MEMBER("netId", nil)], _this, true];
			private _netId = MEMBER("netId", nil);
			MEMBER("inventory", _this);
		};

		// Add x elements to container (items in array format)
		PUBLIC FUNCTION("array","addContent") {
			DEBUG(#, "OO_CONTAINER::addContent")
			//private _inventory = (missionNamespace getVariable [format["inventory_%1", MEMBER("netId", nil)], []]);
			// bizzare à vérifier ????
			private _netId = MEMBER("netId", nil);
			private _inventory = MEMBER("inventory", nil);
			{
				_inventory pushBack _x;
			} foreach _this;
		};

		// Add an item to the content of container
		PUBLIC FUNCTION("array","addItem") {
			DEBUG(#, "OO_CONTAINER::addItem")
			//private _newweight = MEMBER("countWeight", nil) + ("getWeight" call _this);
			//if( MEMBER("countSize", nil) <= MEMBER("limitsize", nil) && _newweight <= MEMBER("limitweight", nil)) exitWith {
				private _content = MEMBER("getContent", nil);
				_content pushBack _this;
				MEMBER("setContent", _content);
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