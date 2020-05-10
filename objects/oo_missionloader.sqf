	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2018 Nicolas BOITEUX

	CLASS OO_MISSIONLOADER

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

	CLASS("OO_MISSIONLOADER")
		PRIVATE VARIABLE("code","this");
		PRIVATE VARIABLE("array","datas");
		PRIVATE VARIABLE("array","missionsdone");
		PRIVATE VARIABLE("string","missionactive");

		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_MISSIONLOADER::constructor")
			private _array = [];
			MEMBER("datas", _array);
			private _array = [];
			MEMBER("missionsdone", _array);
		};

		PUBLIC FUNCTION("string", "addMissionDone") {
			MEMBER("missionsdone", nil) pushBack _this;
		};

		PUBLIC FUNCTION("string", "setMissionActive") {
			MEMBER("missionactive", _this);
		};

		PUBLIC FUNCTION("", "getMissionActive") {
			MEMBER("missionactive", _this);
		};

		PUBLIC FUNCTION("string", "abortMission") {
			{
				if((_x select 1) isEqualTo _this) then {
					// to be completed
				};
			} forEach MEMBER("datas", nil);
			MEMBER("addMissionDone", _this);
		};

		PUBLIC FUNCTION("string", "checkMissionDone") {
				private _result = MEMBER("missionsdone", nil) find _this;
				if(_result > -1) exitWith { true;};
				false;
		};
		
		PUBLIC FUNCTION("array", "setMission") {
			DEBUG(#, "OO_MISSIONLOADER::setMission")
			private _result = MEMBER("checkMissionDone", _this select 1);
			if(_result) exitWith {false;};
			private _set = false;
			{
				if((_x select 0) isEqualTo (_this select 0)) then {
					MEMBER("datas", nil) set [_forEachIndex, _this];
				};
			} foreach MEMBER("datas", nil);
			if!(_set) then { MEMBER("datas", nil) pushBack _this;};
			true;
		};

		PUBLIC FUNCTION("string", "getMission") {
			DEBUG(#, "OO_MISSIONLOADER::getMission")
			private _mission = "";
			{
			  	if((_x select 0) isEqualTo _this) then { 
			  		_mission = _x select 1;
			  	};
			} foreach MEMBER("datas", nil);
			_mission;
		};

		PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_MISSIONLOADER::deconstructor")
			DELETE_VARIABLE("this");
			DELETE_VARIABLE("datas");
		};
	ENDCLASS;