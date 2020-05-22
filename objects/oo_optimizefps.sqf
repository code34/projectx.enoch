    /*
    Author: code34 nicolas_boiteux@yahoo.fr
    Copyright (C) 2020 Nicolas BOITEUX

    CLASS OO_OPTIMIZEFPS

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

	CLASS("OO_OPTIMIZEFPS")
		PRIVATE VARIABLE("code","this");
		PRIVATE VARIABLE("string","path");
		PRIVATE VARIABLE("code","grid");
		PRIVATE VARIABLE("array","currentsectors");

		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_OPTIMIZEFPS::constructor")
			private _grid = ["new", [0,0,12000,12000,1000,1000]] call OO_GRID;
			MEMBER("grid", _grid);
			MEMBER("initMap", nil);
			SPAWN_MEMBER("checkPosition", nil);
		};

		// Hide all objects
		PUBLIC FUNCTION("","initMap") {
			DEBUG(#, "OO_OPTIMIZEFPS::initMap")
			private _list = nearestObjects [[6000,6000], [], 12000];
			sleep 1;
			{_x hideObject true;true;} count _list;
		};

		// Make objects visible around player
		PUBLIC FUNCTION("","initPosition") {
			DEBUG(#, "OO_OPTIMIZEFPS::initPosition")
			private _grid = MEMBER("grid", nil);
			private _sector = ["getSectorFromPos", position player] call _grid;
			private _sectors = ["getSectorsAroundSector", _sector] call _grid;
			MEMBER("currentsectors", _sectors);
			_sectors = [_sectors, false];
			MEMBER("popSectors", _sectors);
			systemChat "OptimizeFps 1.0 - Loaded ";
		};

		PUBLIC FUNCTION("array","compare2Array") {
			_array = [];
			{
				if!(_x in (_this select 0)) then { _array pushBack _x;};true;
			}count (_this select 1);
			_array;
		};

		PUBLIC FUNCTION("","checkPosition") {
			DEBUG(#, "OO_OPTIMIZEFPS::checkPosition")
			private _position = position player;
			private _grid = MEMBER("grid", nil);
			private _oldsector = ["getSectorFromPos", _position] call _grid;
			private _currentsector = _oldsector;
			private _oldsectors = [];
			private _currentsectors = [];
			private _popsectors = [];
			private _unpopsectors = [];
			while { alive player } do {
				_position = position player;
				_currentsector = ["getSectorFromPos", _position] call _grid;
				if!(_currentsector isEqualTo _oldsector) then {
					_oldsector = _currentsector;
					_oldsectors = MEMBER("currentsectors", nil);
					_currentsectors = ["getSectorsAroundSector", _currentsector] call _grid;
					_currentsectors pushBack _currentsector;
/*					private _tmparray = [_currentsectors, _oldsectors];
					_unpopsectors = MEMBER("compare2Array", _tmparray);
					private _tmparray = [_oldsectors, _currentsectors];
					_popsectors = MEMBER("compare2Array", _tmparray);*/
					_popsectors = _currentsectors - _oldsectors;
					_unpopsectors = _oldsectors - _currentsectors;
					_popsectors = [_popsectors, false];
					_unpopsectors = [_unpopsectors, true];
					MEMBER("popSectors", _popsectors);
					MEMBER("unpopSectors", _unpopsectors);
					MEMBER("currentsectors", _currentsectors);
				};
				sleep 5;
			};
		};

		PUBLIC FUNCTION("array","popSectors") {
			private _sectors = _this select 0;
			private _hide = _this select 1;
			private _xsize = "getXsectorsize" call MEMBER("grid", nil);
			private _ysize = "getYsectorsize" call MEMBER("grid", nil);
			private _size = sqrt((_xsize^2) + (_ysize^2));

			{
				private _position = ["getPosFromSector", _x] call MEMBER("grid", nil);
				_list = nearestObjects [_position, [], _size];
				sleep 0.5;
				{_x hideObject _hide;true;}count _list;
			} forEach _sectors;
		};

		PUBLIC FUNCTION("array","unpopSectors") {
			private _sectors = _this select 0;
			private _hide = _this select 1;
			private _xsize = "getXsectorsize" call MEMBER("grid", nil);
			private _ysize = "getYsectorsize" call MEMBER("grid", nil);
			private _size = sqrt((_xsize^2) + (_ysize^2));

			{
				private _position = ["getPosFromSector", _x] call MEMBER("grid", nil);
				_list = nearestObjects [_position, [], _size];
				sleep 0.5;
				{
					if!(isPlayer _x) then {_x hideObject _hide;};true;
				}count _list;
			} forEach _sectors;
		};


		PUBLIC FUNCTION("","checkVisible") {
			DEBUG(#, "OO_OPTIMIZEFPS::checkVisible")
			private _visible = true;
			private _count = 0;
			private _viewdistance = 300;
			private _list = nearestObjects [player, [], 12000];
			sleep 1;
			{_x hideObject true;true;}count _list;

			while { true } do {
				private _list = nearestObjects [player, [], 800];
				sleep 2;
				{
					if(player distance _x > _viewdistance) then { _x hideObject true;} else {_x hideObject false;};
					true;
				} count _list;
			};
		};

		PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_OPTIMIZEFPS::deconstructor")
			DELETE_VARIABLE("this");
			DELETE_VARIABLE("path");
		};
	ENDCLASS;