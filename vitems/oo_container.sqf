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
		PRIVATE VARIABLE("object","object");

		PUBLIC FUNCTION("object","constructor") { 
			DEBUG(#, "OO_CONTAINER::constructor")
			MEMBER("object", _this);
		};

		// Return this object
		PUBLIC FUNCTION("","getThis") {
			DEBUG(#, "OO_CONTAINER::getThis")
			MEMBER("this", nil);
		};

		// Return the 3d object container
		PUBLIC FUNCTION("","getObject") {
			DEBUG(#, "OO_CONTAINER::getObject")
			MEMBER("object", nil);
		};

		// Set the 3d object container
		PUBLIC FUNCTION("object","setObject") {
			DEBUG(#, "OO_CONTAINER::setObject")
			MEMBER("object", _this);
		};

		// Return the name of container
		PUBLIC FUNCTION("","getName") {
			DEBUG(#, "OO_CONTAINER::getName")
			MEMBER("getProperties", nil) select 0;
		};

		// Return the name of container
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
			count(MEMBER("object", nil) getVariable["inventory", []]);
		};

		// Count the weight in container
		PUBLIC FUNCTION("","countWeight") {
			DEBUG(#, "OO_CONTAINER::countWeight")
			private _weight = 0;
			{
				_weight = _weight + (_x select 3);
			} forEach (MEMBER("object", nil) getVariable["inventory", []]);
			_weight;
		};

		// Set the properties of container from an array
		PUBLIC FUNCTION("array","setProperties") {
			DEBUG(#, "OO_CONTAINER::setProperties")
			MEMBER("object", nil) setVariable ["properties", _this, true];
		};

		// Get the properties of container with an array
		PUBLIC FUNCTION("","getProperties") {
			DEBUG(#, "OO_CONTAINER::getProperties")
			private _object = MEMBER("object", nil);
			private _properties = _object getVariable ["properties",[]];
			if (_properties isEqualTo []) then {
				_stuff = "new" call OO_RANDOMSTUFF;
				_properties = ["createProperties", _object] call _stuff;
				MEMBER("setProperties", _properties);
				_content = ["getRandomContent", _object] call _stuff;
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
			MEMBER("object", nil) getVariable ["inventory", []];
		};

		// Set the content of container (items in array format)
		PUBLIC FUNCTION("array","setContent") {
			DEBUG(#, "OO_CONTAINER::setContent")
			MEMBER("object", nil) setVariable ["inventory", _this, true];
		};

		// Add x elements to container (items in array format)
		PUBLIC FUNCTION("array","addContent") {
			DEBUG(#, "OO_CONTAINER::addContent")
			private _inventory = MEMBER("object", nil) getVariable ["inventory", []];
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
			DELETE_VARIABLE("object");
		};
	ENDCLASS;