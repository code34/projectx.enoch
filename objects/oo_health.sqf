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
		PRIVATE VARIABLE("scalar","zombie");		
		PRIVATE VARIABLE("scalar","temperature");
		PRIVATE VARIABLE("scalar","bonusfood");
		PRIVATE VARIABLE("scalar","bonusdrink");
		PRIVATE VARIABLE("scalar","bonuslife");
		PRIVATE VARIABLE("scalar","bonusvirus");
		PRIVATE VARIABLE("scalar","nausea");
		PRIVATE VARIABLE("scalar","stomac");
		PRIVATE VARIABLE("scalar","checktime");

		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_HEALTH::constructor")
			MEMBER("setDrink", 50);
			MEMBER("setFood", 50);
			MEMBER("setLife", 100);
			MEMBER("setVirus", 0);
			MEMBER("initZombie", nil);
			MEMBER("setZombie", nil);
			MEMBER("temperature", 37);
			MEMBER("bonusfood", 0);
			MEMBER("bonusdrink", 0);
			MEMBER("bonuslife", 0);
			MEMBER("bonusvirus", 0);
			MEMBER("nausea", 0);
			MEMBER("stomac", 0);
			MEMBER("checktime", 15);
			SPAWN_MEMBER("checkLife", nil);
			SPAWN_MEMBER("checkFood", nil);
			SPAWN_MEMBER("checkDrink", nil);
			SPAWN_MEMBER("checkDamage", nil);
			SPAWN_MEMBER("checkVirus", nil);
			SPAWN_MEMBER("checkStomac", nil);
			SPAWN_MEMBER("checkTemperature", nil);
		};

		PUBLIC FUNCTION("","getNausea") {
			MEMBER("nausea", nil);
		};

		PUBLIC FUNCTION("","getDrink") {
			MEMBER("drink", nil);
		};

		PUBLIC FUNCTION("","getFood") {
			MEMBER("food", nil);
		};

		PUBLIC FUNCTION("","getTemperature") {
			MEMBER("temperature", nil);
		};

		PUBLIC FUNCTION("","getLife") {
			MEMBER("life", nil);
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

		PUBLIC FUNCTION("","getBonusVirus") {
			DEBUG(#, "OO_HEALTH::getBonusVirus")
			MEMBER("bonusvirus", nil);
		};

		PUBLIC FUNCTION("","getVirus") {
			DEBUG(#, "OO_HEALTH::getVirus")
			MEMBER("virus", nil);
		};

		PUBLIC FUNCTION("","getZombie") {
			DEBUG(#, "OO_HEALTH::getZombie")
			MEMBER("zombie", nil);
		};

		PUBLIC FUNCTION("","setZombie") {
			DEBUG(#, "OO_HEALTH::setZombie")
			private _infection = floor((player getvariable ["ryanzombiesinfected",0]) * 100);
			MEMBER("zombie", _infection);
			["setZombie", _infection] call hud;
		};

		PUBLIC FUNCTION("","initZombie") {
			DEBUG(#, "OO_HEALTH::initZombie")
			ryanzombiesinfectedchance = 100;
			ryanzombiesinfectedrate = 0.1;
			ryanzombiesinfectedsymptoms = 0.9;
			ryanzombiesinfecteddeath = 0.9;
		};

		PUBLIC FUNCTION("","slowZombie") {
			ryanzombiesinfectedrate = 0.01;
		};

		PUBLIC FUNCTION("scalar","setVirus") {
			DEBUG(#, "OO_HEALTH::setVirus")
			MEMBER("virus", _this);
			["setVirus", _this] call hud;
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

		PUBLIC FUNCTION("scalar","setTemperature") {
			DEBUG(#, "OO_HEALTH::setTemperature")
			MEMBER("temperature", _this);
			systemChat format ["Temperature: %1", _this];
			//["setTemperature", _this] call hud;
		};

		PUBLIC FUNCTION("scalar","setStomac") {
			DEBUG(#, "OO_HEALTH::setStomac")
			MEMBER("stomac", _this);
		};

		PUBLIC FUNCTION("scalar","setNausea") {
			DEBUG(#, "OO_HEALTH::setNausea")
			MEMBER("nausea", _this);
			systemChat format ["Nausea: %1", _this];
		};

		PUBLIC FUNCTION("","beNauseous") {
				DEBUG(#, "OO_HEALTH::beNauseous")
				private _path = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
				private _sound = _path + "sounds\vomit.ogg";
				playSound3D [_sound, player, false, getPosASL player, 5, 1, 10];
				private _food = floor(MEMBER("food", nil) * 0.75);
				private _drink = floor(MEMBER("drink", nil) * 0.75);
				private _stomac = floor(MEMBER("stomac", nil) * 0.75);
				MEMBER("setNausea", 20);
				MEMBER("setFood", _food);
				MEMBER("setDrink", _drink);
				MEMBER("setStomac", _stomac);
				MEMBER("bonusfood", 0);
				MEMBER("bonusdrink", 0);
				private _temperature = MEMBER("temperature", nil) - floor(random (1));
				MEMBER("setTemperature", _temperature);
		};

		PUBLIC FUNCTION("scalar","addStomac") {
			DEBUG(#, "OO_HEALTH::addStomac")
			private _stomac = MEMBER("stomac", nil);
			private _nausea = MEMBER("nausea", nil);
			_stomac = _stomac + _this;
			if((_stomac > 200) or (_nausea > 5)) then { 
				MEMBER("beNauseous", nil);
			} else {
				MEMBER("stomac", _stomac);
			};
		};


		PUBLIC FUNCTION("scalar","addLife") {
			DEBUG(#, "OO_HEALTH::addLife")
			private _bonuslife = MEMBER("bonuslife", nil);
			private _nausea = MEMBER("nausea", nil);
			_bonuslife = _bonuslife + _this;
			if(_bonuslife < 0) then {_bonuslife = 0;};
			if(_nausea isEqualTo 0) then {
				MEMBER("bonuslife", _bonuslife);
			};
		};

		PUBLIC FUNCTION("scalar","addDrink") {
			DEBUG(#, "OO_HEALTH::addDrink")
			private _bonusdrink = MEMBER("bonusdrink", nil);
			private _nausea = MEMBER("nausea", nil);
			_bonusdrink = _bonusdrink + _this;
			if(_bonusdrink < 0) then {_bonusdrink = 0;};
			if(_nausea isEqualTo 0) then {
				MEMBER("bonusdrink", _bonusdrink);
			};
		};

		PUBLIC FUNCTION("scalar","addFood") {
			DEBUG(#, "OO_HEALTH::addFood")
			private _bonusfood = MEMBER("bonusfood", nil);
			private _nausea = MEMBER("nausea", nil);
			_bonusfood = _bonusfood + _this;
			if(_bonusfood < 0) then {_bonusfood = 0;};
			if(_nausea isEqualTo 0) then {
				MEMBER("bonusfood", _bonusfood);
			};
		};

		PUBLIC FUNCTION("scalar","addTemperature") {
			DEBUG(#, "OO_HEALTH::addTemperature")
			private _temperature = MEMBER("temperature", nil);
			_temperature = _temperature + _this;
			MEMBER("temperature", _temperature);
		};

		PUBLIC FUNCTION("scalar","delTemperature") {
			DEBUG(#, "OO_HEALTH::delTemperature")
			private _temperature = MEMBER("temperature", nil);
			_temperature = _temperature - _this;
			MEMBER("temperature", _temperature);
		};


		PUBLIC FUNCTION("scalar","addVirus") {
			DEBUG(#, "OO_HEALTH::addVirus")
			private _bonusvirus = MEMBER("bonusvirus", nil);
			_bonusvirus = _bonusvirus + _this;
			if(_bonusvirus < 0) then {_bonusvirus = 0;};
			if(_bonusvirus > 100) then { _bonusvirus = 100;};
			MEMBER("bonusvirus", _bonusvirus);
		};

		PUBLIC FUNCTION("","checkStomac") {
			DEBUG(#, "OO_HEALTH::checkStomac")
			private _stomac = 0;
			while { true } do {
				_stomac = MEMBER("stomac", nil);
				if(_stomac > 0) then { _stomac = _stomac - 1; };
				sleep MEMBER("checktime", nil);
			};
		};

		PUBLIC FUNCTION("","checkTemperature") {
			DEBUG(#, "OO_HEALTH::checkTemperature")
			private _temperature = 0;
			private _rain = true;
			private _virus = 0;
			private _change = false;
			private _wind = 0;
			private _inwater = false;

			while { true } do {
				_change = false;
				_temperature = MEMBER("temperature", nil);
				_virus = MEMBER("virus", nil);
				_nausea = MEMBER("nausea", nil);
				_inwater = surfaceIsWater (position player);

				systemChat format ["External Temperature: %1", externaltemperature];
				if((_virus > 0) or (_nausea > 0)) then {
						MEMBER("addTemperature", 0.1);
						_change = true;
				} else {
					if(externaltemperature < 7) then {
						private _buildings = nearestObjects [player, ["House_F","FirePlace_burning_F"], 10];
						sleep 0.1;
						if(count _buildings isEqualTo 0) then { MEMBER("delTemperature", 0.1); _change = true;};
					};
					if(_inwater) then { MEMBER("delTemperature", 0.1); _change = true;};
				};
				if!(_change) then {
					if(_temperature < 37) then { MEMBER("addTemperature", 0.1);};
					if(_temperature > 37) then { MEMBER("delTemperature", 0.1);};
				};
				systemChat format ["Body Temperature: %1", MEMBER("temperature", nil)];
				sleep MEMBER("checktime", nil);
			};
		};

		PUBLIC FUNCTION("","checkVirus") {
			DEBUG(#, "OO_HEALTH::checkVirus")
			private _virus = 0;
			private _bonusvirus = 0;
			while { true } do {
				_virus = MEMBER("virus", nil);
				_bonusvirus = MEMBER("bonusvirus", nil);
				if((getDammage player > 0) and (_bonusvirus isEqualTo 0)) then { _bonusvirus = _bonusvirus + 1;};
				if(_bonusvirus > 0) then {
					_bonusvirus = _bonusvirus - 1;
					MEMBER("bonusvirus", _bonusvirus);
					if(_virus < 100) then { _virus = _virus  + 1;};
					MEMBER("setVirus", _virus);
				} else {
					if(_virus > 0) then {_virus = _virus - 1;};
					MEMBER("setVirus", _virus);
				};
				sleep MEMBER("checktime", nil);
			};
		};

		PUBLIC FUNCTION("","checkFood") {
			DEBUG(#, "OO_HEALTH::checkFood")
			private _food = 0;

			while { true } do {
				private _bonusfood = MEMBER("bonusfood",nil);
				private _nausea = MEMBER("nausea", nil);
				if (( _bonusfood > 0) and (_nausea < 5.1)) then {
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
				sleep MEMBER("checktime", nil);
			};
		};

		PUBLIC FUNCTION("","checkDrink") {
			DEBUG(#, "OO_HEALTH::checkDrink")
			private _drink = 0;

			while { true } do {
				private _bonusdrink = MEMBER("bonusdrink",nil);
				private _nausea = MEMBER("nausea", nil);
				if (( _bonusdrink > 0) and (_nausea < 5.1)) then {
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
				sleep MEMBER("checktime", nil);
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
					player setDamage 1;
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
				MEMBER("setZombie", nil);

				_nausea = MEMBER("nausea", nil);
				if(_nausea > 0) then {
					_nausea = _nausea - 1;
					MEMBER("setNausea", _nausea);
				};

				if((_temperature < 36) or (_temperature > 38)) then {
					if((_temperature > 41.8) or (_temperature < 28)) then {
						_level = -100;
					} else {
						_level = _level - 1;
					};
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
				if(MEMBER("virus", nil) > 99) then {
					_level = -100;
				};
				if(MEMBER("zombie", nil) > 0) then {
					_level = _level - 1;
				};

				_bonuslife = MEMBER("bonuslife", nil);
				if( _bonuslife > 0 ) then {
					_level = _level + 1;
					_bonuslife = _bonuslife - 1;
					MEMBER("bonuslife", _bonuslife);
				};

                switch (true) do {
                	case (_level < -50) : {
                		_level = -100;
                	};
                	case (_level < 0) : {
                		_level = -1;
                	};
                	default {_level = 1;};
            	};

				_life = MEMBER("life", nil);
				_life = _life + _level;
				if(_life < 0) then {_life = 0;};
				if(_life > 100) then {_life = 100;};
				MEMBER("setLife", _life);
				sleep 5;
			};
		};

		PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_HEALTH::deconstructor")
			DELETE_VARIABLE("this");
			DELETE_VARIABLE("drink");
			DELETE_VARIABLE("food");
			DELETE_VARIABLE("life");
			DELETE_VARIABLE("zombie");
			DELETE_VARIABLE("temperature");
			DELETE_VARIABLE("bonusfood");
			DELETE_VARIABLE("bonusdrink");
			DELETE_VARIABLE("bonuslife");
			DELETE_VARIABLE("nausea");
		};
	ENDCLASS;