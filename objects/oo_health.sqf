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
		PRIVATE VARIABLE("scalar","bonusfood");
		PRIVATE VARIABLE("scalar","bonusdrink");
		PRIVATE VARIABLE("scalar","bonuslife");
		PRIVATE VARIABLE("scalar","nausea");

		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_HEALTH::constructor")
			MEMBER("setDrink", 25);
			MEMBER("setFood", 25);
			MEMBER("setLife", 100);
			MEMBER("setVirus", 0);
			MEMBER("temperature", 37.2);
			MEMBER("bonusfood", 0);
			MEMBER("bonusdrink", 0);
			MEMBER("bonuslife", 0);
			MEMBER("nausea", 0);
			SPAWN_MEMBER("checkLife", nil);
			SPAWN_MEMBER("checkFood", nil);
			SPAWN_MEMBER("checkDrink", nil);
			SPAWN_MEMBER("checkVirus", nil);
			SPAWN_MEMBER("checkDamage", nil);
		};


		PUBLIC FUNCTION("","getBonusFood") {
			DEBUG(#, "OO_HEALTH::getBonusFood")
			MEMBER("bonusfood", nil);
		};

		PUBLIC FUNCTION("","getBonusDrink") {
			DEBUG(#, "OO_HEALTH::getBonusDrink")
			MEMBER("bonusdrink", nil);
		};

		PUBLIC FUNCTION("","getBonusLife") {
			DEBUG(#, "OO_HEALTH::getBonusLife")
			MEMBER("bonuslife", nil);
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

		PUBLIC FUNCTION("scalar","setTemperature") {
			DEBUG(#, "OO_HEALTH::setTemperature")
			MEMBER("temperature", _this);
			//["setTemperature", _this] call hud;
		};

		PUBLIC FUNCTION("","beNauseous") {
				DEBUG(#, "OO_HEALTH::beNauseous")
				private _path = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
				private _sound = _path + "sounds\vomit.ogg";
				playSound3D [_sound, player, false, getPosASL player, 5, 1, 10];
				private _food = floor(MEMBER("food", nil) * 0.75);
				private _drink = floor(MEMBER("drink", nil) * 0.75);
				MEMBER("nausea", 20);
				MEMBER("setFood", _food);
				MEMBER("setDrink", _drink);
				MEMBER("bonusfood", 0);
				MEMBER("bonusdrink", 0);
				private _temperature = MEMBER("temperature", nil) - random (1);
				MEMBER("setTemperature", _temperature);
				systemChat format ["Temperature: %1", _temperature];
		};

		PUBLIC FUNCTION("scalar","addLife") {
			DEBUG(#, "OO_HEALTH::addLife")
			private _bonuslife = MEMBER("bonuslife", nil);
			private _nausea = MEMBER("nausea", nil);
			_bonuslife = _bonuslife + _this;
			if(_bonuslife < 0) then {_bonuslife = 0;};
			if((_bonuslife > 20) or (_nausea > 0)) then { 
				MEMBER("beNauseous", nil);
			} else {
				MEMBER("bonuslife", _bonuslife);
			};
		};

		PUBLIC FUNCTION("scalar","addDrink") {
			DEBUG(#, "OO_HEALTH::addDrink")
			private _bonusdrink = MEMBER("bonusdrink", nil);
			private _nausea = MEMBER("nausea", nil);
			_bonusdrink = _bonusdrink + _this;
			if(_bonusdrink < 0) then {_bonusdrink = 0;};
			if((_bonusdrink > 100) or (_nausea > 0)) then { 
				MEMBER("beNauseous", nil);
			} else {
				MEMBER("bonusdrink", _bonusdrink);
			};
		};

		PUBLIC FUNCTION("scalar","addFood") {
			DEBUG(#, "OO_HEALTH::addFood")
			private _bonusfood = MEMBER("bonusfood", nil);
			private _nausea = MEMBER("nausea", nil);
			_bonusfood = _bonusfood + _this;
			if(_bonusfood < 0) then {_bonusfood = 0;};
			if((_bonusfood > 100) or (_nausea > 0)) then {  
				MEMBER("beNauseous", nil);
			} else {
				MEMBER("bonusfood", _bonusfood);
			};
		};

		PUBLIC FUNCTION("","checkFood") {
			DEBUG(#, "OO_HEALTH::checkFood")
			private _food = 0;

			while { true } do {
				private _bonusfood = MEMBER("bonusfood",nil);
				private _nausea = MEMBER("nausea", nil);
				if (( _bonusfood > 0) and (_nausea isEqualTo 0)) then {
					_bonusfood = _bonusfood - 1;
					MEMBER("bonusfood", _bonusfood);
					_food = MEMBER("food", nil);
					_food = _food + 1;
					if(_food > 100) then {_food = 100;};
					MEMBER("setFood", _food);
				} else {
					_food = MEMBER("food", nil);
					_food = _food - 1;
					if(_food < 0) then {_food = 0;};
					MEMBER("setFood", _food);
				};
				sleep 10;
			};
		};

		PUBLIC FUNCTION("","checkDrink") {
			DEBUG(#, "OO_HEALTH::checkDrink")
			private _drink = 0;

			while { true } do {
				private _bonusdrink = MEMBER("bonusdrink",nil);
				private _nausea = MEMBER("nausea", nil);
				if (( _bonusdrink > 0) and (_nausea isEqualTo 0)) then {
					_bonusdrink = _bonusdrink - 1;
					MEMBER("bonusdrink", _bonusdrink);
					_drink = MEMBER("drink", nil);
					_drink = _drink + 1;
					if(_drink > 100) then {_drink = 100;};
					MEMBER("setDrink", _drink);
				} else {
					_drink = MEMBER("drink", nil);
					_drink = _drink - 1;
					if(_drink < 0) then {_drink = 0;};
					MEMBER("setDrink", _drink);
				};
				sleep 10;
			};
		};

		PUBLIC FUNCTION("","checkDamage") {
			DEBUG(#, "OO_HEALTH::checkDamage")
			private _physicallife = 0;
			private _virtuallife = 0;
			while { true } do {
				_physicallife = 100 - ((getDammage player) * 100);
				_virtuallife = MEMBER("life", nil);
				if(_physicallife < _virtuallife) then { _virtuallife = _physicallife;};
				if((_physicallife < 1) or (_virtuallife < 1)) then {
					private _ctrl = "getOOP_Picture_life" call hud;
					_ctrl ctrlSetText "paa\skull.paa";
					MEMBER("life", 0);
					player setDamage 0;
				} else {
					MEMBER("life", floor(_virtuallife));
					_damage = (100 - _physicallife) / 100;
					player setDamage _damage;
				};
				sleep 1;
			};
		};

		PUBLIC FUNCTION("","checkLife") {
			DEBUG(#, "OO_HEALTH::checkLife")
			private _life = 0;
			private _temperature = 0;
			private _level = 0;
			private _bonuslife = 0;
			private _damage = getDammage player;
			private _nausea = 0;

			while { true } do {
				_life = 0;
				_level = 0;
				_bonuslife = 0;
				_temperature = MEMBER("temperature", nil);
				
				_nausea = MEMBER("nausea", nil);
				if(_nausea > 0) then {
					_nausea = _nausea - 1;
					MEMBER("nausea", _nausea);
					systemChat format ["Nausea: %1", _nausea];
				};

				if((_temperature < 36.5) or (_temperature > 38.5)) then {
					_level = _level - 1;
				};
				if(MEMBER("food", nil) < 1) then {
					_level = _level - 1;
				};
				if(MEMBER("drink", nil) < 1) then {
					_level = _level - 1;
				};
				if(MEMBER("virus", nil) > 0) then {
					_level = _level - 1;
				};

				_bonuslife = MEMBER("bonuslife", nil);
				if( _bonuslife > 0 ) then {
					_level = _level + 1;
					_bonuslife = _bonuslife - 1;
					MEMBER("bonuslife", _bonuslife);
				};

                if(_level <= -1) then {_level = -1;};
                if(_level >= 0) then {_level = 1;};

				_life = MEMBER("life", nil);
				_life = _life + _level;
				if(_life < 0) then {_life = 0;};
				if(_life > 100) then {_life = 100;};
				MEMBER("setLife", _life);
				sleep 5;
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
			DELETE_VARIABLE("bonusfood");
			DELETE_VARIABLE("bonusdrink");
			DELETE_VARIABLE("bonuslife");
			DELETE_VARIABLE("nausea");
		};
	ENDCLASS;