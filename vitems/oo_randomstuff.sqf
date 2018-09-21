	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2018 Nicolas BOITEUX

	CLASS OO_RANDOMSTUFF

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

	CLASS("OO_RANDOMSTUFF")
		PRIVATE VARIABLE("code","this");

		PRIVATE STATIC_VARIABLE("array","military");
		PRIVATE STATIC_VARIABLE("array","food");
		PRIVATE STATIC_VARIABLE("array", "stuff");
		PRIVATE STATIC_VARIABLE("array", "tools");

		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_RANDOMSTUFF::constructor")
		};

		PUBLIC FUNCTION("array","setStuff") {
			MEMBER("stuff", _this);
		};

		PUBLIC FUNCTION("array","setFood") {
			MEMBER("food", _this);
		};

		PUBLIC FUNCTION("array","setMilitary") {
			MEMBER("military", _this);
		};

		PUBLIC FUNCTION("array","setTools") {
			MEMBER("military", _this);
		};

		// create default container properties according class of 3d object container
		PUBLIC FUNCTION("object","createProperties") {
			DEBUG(#, "OO_RANDOMSTUFF::createProperties")
			private _properties = [];
			switch (true) do {
				case (_object isKindOf "House_F") : { _properties = ["Building", round(sizeOf (typeof _object))*10, round(sizeOf (typeof _object))*100];};
				case (_object isKindOf "Car") : { _properties = ["Vehicle", round(sizeOf (typeof _object))*5, round(sizeOf (typeof _object))*10];};
				case (_object isKindOf "Man") : { _properties = [name _object, 5, 10]; };
				case (_object isKindOf "Thing") : { _properties = ["Thing", round(sizeOf (typeof _object))*3, round(sizeOf (typeof _object))*6];};
				default {	_properties = ["", 0,0];};
			};
			_properties;
		};

		// Create a random array of stuff/military/food
		// according of probalities and 3d class object container
		PUBLIC FUNCTION("object","getRandomContent") {
			DEBUG(#, "OO_RANDOMSTUFF::getRandomContent")
			private _result = [];
			private _type = "";
			for "_i" from 0 to round(random 3) step 1 do {
				switch (true) do {
					case (_object isKindOf "Car") : {
						_type = ["stuff", "food", "military"] selectRandomWeighted [0.7,0.1,0.2];
					};
					case (_object isKindOf "House_F") : {
						_type = ["stuff", "food", "military"] selectRandomWeighted [0.5,0.49,0.001];
					};
					default {
						_type = ["stuff", "food", "military"] selectRandomWeighted [0.5,0.47,0.03];
					};
				};
				_entry = MEMBER(_type,nil) deleteAt (random (count(MEMBER(_type,nil)) - 1));
				_result pushBack _entry;
			};
			_result;
		};

		PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_RANDOMSTUFF::deconstructor")
			DELETE_VARIABLE("this");
		};
	ENDCLASS;