	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2018 Nicolas BOITEUX

	CLASS OO_HEALTH

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

	CLASS("OO_HEALTH")
		PRIVATE VARIABLE("code","this");
		PRIVATE VARIABLE("scalar","drink");
		PRIVATE VARIABLE("scalar","food");
		PRIVATE VARIABLE("scalar","life");
		PRIVATE VARIABLE("scalar","virus");
		PRIVATE VARIABLE("scalar","temperature");

		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_HEALTH::constructor")
			MEMBER("setDrink", 25);
			MEMBER("setFood", 25);
			MEMBER("setLife", 100);
			MEMBER("setVirus", 0);
			MEMBER("temperature", 37.2);
			SPAWN_MEMBER("checkLife", nil);
			SPAWN_MEMBER("checkFood", nil);
			SPAWN_MEMBER("checkDrink", nil);
			SPAWN_MEMBER("checkVirus", nil);
		};

		PUBLIC FUNCTION("scalar","setFood") {
			DEBUG(#, "OO_HEALTH::setFood")
			MEMBER("food", _this);
			["setFood", _this] call hud;
		};

		PUBLIC FUNCTION("scalar","setDrink") {
			DEBUG(#, "OO_HEALTH::setDrink")
			MEMBER("drink", _this);
			["setDrink", _this] call hud;
		};

		PUBLIC FUNCTION("scalar","setLife") {
			DEBUG(#, "OO_HEALTH::setLife")
			MEMBER("life", _this);
			["setLife", _this] call hud;
		};

		PUBLIC FUNCTION("scalar","setVirus") {
			DEBUG(#, "OO_HEALTH::setVirus")
			MEMBER("virus", _this);
			["setVirus", _this] call hud;
		};

		PUBLIC FUNCTION("scalar","addDrink") {
			DEBUG(#, "OO_HEALTH::addDrink")
			private _drink = MEMBER("drink", nil);
			_drink = _drink + _this;
			if(_drink > 100) then { _drink = 100;};
			MEMBER("setDrink", _drink);
		};

		PUBLIC FUNCTION("scalar","addFood") {
			DEBUG(#, "OO_HEALTH::addFood")
			private _food = MEMBER("food", nil);
			_food = _food + _this;
			if(_food > 100) then { _food = 100;};
			MEMBER("setFood", _food);
		};

		PUBLIC FUNCTION("","checkFood") {
			DEBUG(#, "OO_HEALTH::checkFood")
			private _food = 0;
			private _level = 0;

			while { true } do {
				_food = MEMBER("food", nil);
				_level = floor (random 3);
				_food = _food - _level;
				if(_food < 0) then {_food = 0;};
				MEMBER("setFood", _food);
				sleep 60;
			};
		};

		PUBLIC FUNCTION("","checkDrink") {
			DEBUG(#, "OO_HEALTH::checkDrink")
			private _drink = 0;
			private _level = 0;

			while { true } do {
				_drink = MEMBER("drink", nil);
				_level = floor (random 3);
				_drink = _drink - _level;
				if(_drink < 0) then {_drink = 0;};
				MEMBER("setDrink", _drink);
				sleep 60;
			};
		};

		PUBLIC FUNCTION("","checkLife") {
			DEBUG(#, "OO_HEALTH::checkLife")
			private _life = 0;
			private _temperature = 0;
			private _level = 0;

			while { true } do {
				_temperature = MEMBER("temperature", nil);
				if((_temperature < 36.5) or (_temperature > 38.5)) then {
					_level = floor(random 3);
				};
				if(MEMBER("food", nil) < 1) then {
					_level = _level + floor(random 3);
				};
				if(MEMBER("drink", nil) < 1) then {
					_level = _level + floor(random 3);
				};
				if(MEMBER("virus", nil) > 0) then {
					_level = _level + floor(random 3);
				};
				if(getDammage player > 0) then {
					_level = _level + floor(random 3);
				};
				_life = MEMBER("life", nil);
				_life = _life - _level;
				if(_life < 0) then {_life = 0;};
				MEMBER("setLife", _life);
				if(_life isEqualTo 0) then { player setDamage 1;};
				sleep 60;
			};
		};

		PUBLIC FUNCTION("","checkVirus") {
			DEBUG(#, "OO_HEALTH::checkVirus")
			private _virus = 0;
			private _level = 0;

			while { true } do {
				_virus = MEMBER("virus", nil);
				if(_virus > 0) then {
					_level = floor(random 5);
					_virus = _virus + _level;
					MEMBER("setVirus", _virus);
				};
				sleep 60;
			};
		};

		PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_HEALTH::deconstructor")
			DELETE_VARIABLE("this");
			DELETE_VARIABLE("drink");
			DELETE_VARIABLE("food");
			DELETE_VARIABLE("life");
			DELETE_VARIABLE("virus");
			DELETE_VARIABLE("temperature");
		};
	ENDCLASS;