	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2018 Nicolas BOITEUX

	CLASS OO_MANAGER

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

	CLASS("OO_MANAGER")
		PRIVATE VARIABLE("code","this");
		//PRIVATE VARIABLE("string","name");

		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_MANAGER::constructor")
		};

		PUBLIC FUNCTION("","getThis") {
			DEBUG(#, "OO_MANAGER::getThis")
			MEMBER("this", nil);
		};

		PUBLIC FUNCTION("array","registerContainer") {
			DEBUG(#, "OO_MANAGER::registerContainer")
			
		};

		/*
		_source: container
		_target: container
		_index: index of object in container
		*/
		PUBLIC FUNCTION("array","moveItem") {
			DEBUG(#, "OO_MANAGER::giveItem")
			_source = _this select 0;
			_target = _this select 1;
			_index = _this select 2;
			if (typeName _source != "code" || typeName _target != "code" || _index < 0 || typeName _index != "scalar") exitWith {false;};
			if (count ("getContent" call _source)  == 0) exitWith{false;};

			private _item = ["getItem", _index] call _source;
			if !(["addItem", _item] call _target) exitWith {
				["addItem", _item] call _source;
				false;
			};
			true;
		};

		PUBLIC FUNCTION("","buildItem") {
			DEBUG(#, "OO_MANAGER::giveItem")
			//MEMBER("name", nil);
		};

		PUBLIC FUNCTION("","buyItem") {
			DEBUG(#, "OO_MANAGER::giveItem")
			//MEMBER("name", nil);
		};

		PUBLIC FUNCTION("","destroyItem") {
			DEBUG(#, "OO_MANAGER::giveItem")
			//MEMBER("name", nil);
		};

		PUBLIC FUNCTION("","repairItem") {
			DEBUG(#, "OO_MANAGER::giveItem")
			//MEMBER("name", nil);
		};

		PUBLIC FUNCTION("","thiefItem") {
			DEBUG(#, "OO_MANAGER::giveItem")
			//MEMBER("name", nil);
		};

		PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_MANAGER::deconstructor")
			DELETE_VARIABLE("this");
		};
	ENDCLASS;