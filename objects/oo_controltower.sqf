	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2020 Nicolas BOITEUX

	CLASS OO_CONTROLTOWER

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

	CLASS("OO_CONTROLTOWER")
		PRIVATE VARIABLE("code","this");
		PRIVATE VARIABLE("string","path");
		PRIVATE VARIABLE("object","tower");

		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_CONTROLTOWER::constructor")
			private _path = ([(str missionConfigFile), 0, -15] call BIS_fnc_trimString) + "sounds\tower.ogg";
			MEMBER("path", _path);
			private _position = MEMBER("findFlat", nil);
			private _tower = "Land_ControlTower_01_F" createVehicle _position;
			_tower allowDamage false;
			MEMBER("tower", _tower);
		};

		PUBLIC FUNCTION("", "moveToTower") {
			DEBUG(#, "OO_CONTROLTOWER::findFlat")
			private _list = [571,1134,0] nearEntities [["Man"], 10];
			private _position = MEMBER("tower", nil) getRelPos [10, random 360];
			{ _x setpos _position;} forEach _list;
		};

		PUBLIC FUNCTION("", "findFlat") {
			DEBUG(#, "OO_CONTROLTOWER::findFlat")
			private _position = [];
			while { _position isEqualTo []} do {
				_position = [random 12500, random 12500, 0];
				_position = _position isFlatEmpty [20, -1, 0.1, 15, -1, false, objNull];
			};
			_position;
		};

		PUBLIC FUNCTION("","check") {
			private _position = [0,0];
			private _tower = MEMBER("tower", nil);
			while { true } do {
				private _positions = [];
				MEMBER("generateSound", nil);
				sleep 13;
				private _list = _tower nearEntities [["Man"], 20];
				sleep 0.1;
				{
					_positions pushBack ((getPosASL _tower) vectorDiff (getPosASL _x));
				}foreach _list;
				_position = MEMBER("findFlat", nil);
				_tower setPosASL _position;
				_tower setdir ((getdir _tower) + 180);
				{
					(_list select _forEachIndex) setPosASL ((getPosASL _tower) vectorADD _x);
					(_list select _forEachIndex) setdir ((getDir (_list select _forEachIndex)) + 180);
				}foreach _positions;
				MEMBER("moveToTower", nil);
				sleep 30;
			};
		};

		PUBLIC FUNCTION("","generateSound") {
			private _object = MEMBER("tower", nil);
			private _sound = MEMBER("path", nil);
			playSound3D [_sound, _object, false, getPosASL _object, 2, 1, 150];
		};

		PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_SOUND::deconstructor")
			DELETE_VARIABLE("this");
			DELETE_VARIABLE("path");
			DELETE_VARIABLE("tower");
		};
	ENDCLASS;