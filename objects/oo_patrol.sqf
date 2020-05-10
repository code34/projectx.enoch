	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2014-2019 Nicolas BOITEUX

	CLASS OO_PATROL
	
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
	#undef DEBUGPATROL

	CLASS("OO_PATROL")
		PRIVATE VARIABLE("scalar","areasize");
		PRIVATE VARIABLE("array","buildings");
		PRIVATE VARIABLE("string","event");
		PRIVATE VARIABLE("group","group");
		PRIVATE VARIABLE("object","target");
		PRIVATE VARIABLE("array","targets");
		PRIVATE VARIABLE("code","this");

		PUBLIC FUNCTION("group","constructor") {
			DEBUG(#, "OO_PATROL::constructor")
			MEMBER("group", _this);
			MEMBER("areasize", 0);
			MEMBER("event", "");
		};

		PUBLIC FUNCTION("","getGroup") FUNC_GETVAR("group");
		PUBLIC FUNCTION("","getTarget") FUNC_GETVAR("target");

		PUBLIC FUNCTION("string", "setEvent") {
			MEMBER("event", _this);
		};

		/*
		Patrol around a position
		@position : position of patrol
		*/
		PUBLIC FUNCTION("array", "patrol") {
			DEBUG(#, "OO_PATROL::patrol")
			private _position = _this select 0;
			private _areasize = _this select 1;
			if(count _position > 2) then {_position deleteAt 2;};
			//if(count _areasize > 1) then { _areasize = ((_areasize select 0) + (_areasize select 1)) / 2;};

			private _array = [_position, _areasize];
			MEMBER("getBuildings", _array);
			SPAWN_MEMBER("analysis", nil);

			while { count (units MEMBER("group", nil)) > 0 } do {
				#ifdef DEBUGPATROL
				systemChat format ["Something happen %1...", time];
				#endif
				switch (MEMBER("event", nil)) do {
					case "alert": {
						#ifdef DEBUGPATROL
						systemChat "Engaging ...";
						#endif
						MEMBER("getNextTarget", nil);
						MEMBER("engageTarget", nil);
					};
					case "city": {
						#ifdef DEBUGPATROL
						systemChat "Walking in city ...";
						#endif
						MEMBER("walkInBuildings", nil);
					};
					default{
						#ifdef DEBUGPATROL
						systemChat "Walking ...";
						#endif
						MEMBER("guard", _array);
					};
				};
			};
			["delete", MEMBER("this", nil)] call OO_PATROL;
		};

		/*
		Analysis enemies information
		*/
		PUBLIC FUNCTION("", "analysis") {
			while { count (units MEMBER("group", nil)) > 0 } do {
				MEMBER("getTargets", nil);
				MEMBER("scanTargets", nil);
				sleep 10;
			};
		};

		/*
		Retrieve buildings
		Parameters: _this : position array
		Return : array containing all positions in building
		*/
		PUBLIC FUNCTION("array", "getPositionsBuilding") {
			DEBUG(#, "OO_PATROL::getPositionsBuilding")
			private _positions = [];
			private _buildings = [];
			private _index = 0;
			
			if!(surfaceIsWater (_this select 0)) then {
				_buildings = nearestObjects[_this select 0,["House_F"], _this select 1];
				sleep 0.5;
				{
					if (count(_x buildingPos -1) > 0) then {
						_positions = _positions + (_x buildingPos -1);
					};
					true;
				} count _buildings;
			};
			_positions;
		};


		PUBLIC FUNCTION("array", "getBuildings") {
			DEBUG(#, "OO_PATROL::getBuildings")
			private _positions = MEMBER("getPositionsBuilding", _this);
			MEMBER("buildings", _positions);
			if(count _positions > 10) then {
				MEMBER("event", "city");
			};
		};

		PUBLIC FUNCTION("", "fireFlare") {
			DEBUG(#, "OO_PATROL::fireFlare")
			private _leader = leader MEMBER("group", nil);
			private _target = MEMBER("target", nil);

			if(_leader distance _target < 200) then {
				private _flare = "F_40mm_White" createvehicle ((_target) ModelToWorld [0,0,200]); 
				_flare setVelocity [0,0,-10];
			};
		};

		PUBLIC FUNCTION("", "engageTarget") {
			DEBUG(#, "OO_PATROL::engageTarget")
			private _target = MEMBER("target", nil);
			if(isNil "_target") exitWith {};

			private _isvehicle = !(_target isKindOf "MAN") ;
			private _isbuilding = if((nearestbuilding _target) distance _target < 10) then { true; } else { false; };
			private _isvisible = MEMBER("seeTarget", nil);
			private _needflare = if((date select 3 > 21) or (date select 3 <6)) then { true; } else {false;};

			if(_isvehicle) then {
				MEMBER("setMoveMode", nil);
				MEMBER("moveAround", 50);
				MEMBER("putMine", nil);
			} else {
				if(_isbuilding) then {
					MEMBER("setCombatMode", nil);
					MEMBER("moveInto", nearestbuilding _target);
				} else {
					if((_needflare) and (random 1 > 0.5)) then { MEMBER("fireFlare", nil);};
					if(_isvisible) then {
						MEMBER("setCombatMode", nil);
						MEMBER("moveAround", 25);
					};
				};
			};
		};

		PUBLIC FUNCTION("", "getNextTarget") {
			DEBUG(#, "OO_PATROL::getNextTarget")
			private _leader = leader MEMBER("group", nil);
			private _candidats = [];
			private _target = MEMBER("target", nil);
			private _oldtarget = objnull;
			private _array = [];
			private _index = 0;
			private _min = 100000;
			
			{
				_array = [_leader, _x];
				_index = floor (MEMBER("estimateTarget", _array));
				_candidats pushBack [_index, _x];
				sleep 0.01;
				true;
			} count MEMBER("targets", nil);

			if(!isnil "_target") then {
				if(alive _target) then {
					_oldtarget = MEMBER("target", nil);
					_array = [_leader, _oldtarget];
					_index = floor (MEMBER("estimateTarget", _array));
					_candidats pushBack [_index, _oldtarget];
				};
			};

			{
				if((_x select 0) < _min) then {
					_target = _x select 1;
					_min = _x select 0;
				};
				sleep 0.01;
			} count _candidats;

			if(_oldtarget != _target) then {
				MEMBER("target", _target);
			};
		};

		PUBLIC FUNCTION("", "getTargets") {
			DEBUG(#, "OO_PATROL::getTargets")
			private _side = side (leader MEMBER("group", nil));
			private _position = position leader(MEMBER("group", nil));
			private _array = [];
			private _list = _position nearEntities [["Man"], 500];
			private _list2 = _position nearEntities [["Tank", "Air"], 500];
			sleep 1;

			{
				if(!(side _x isEqualTo _side) and !(side _x isEqualTo civilian)) then { _array pushBack _x;};
				sleep 0.01;
				true;
			} count _list;

			{
				private _driver = driver _x;
				if(!(side _driver isEqualTo _side) and !(side _driver isEqualTo civilian)) then { _array = _array + (crew _x);};
				sleep 0.01;
				true;
			} count _list2;
			MEMBER("targets", _array);
		};

		PUBLIC FUNCTION("", "seeTarget") {
			DEBUG(#, "OO_PATROL::seeTarget")
			private _see = false;
			private _target =  MEMBER("target", nil);
			private _array = [];

			{
				if(alive _x) then {
					_array = [_x, _target];
					if(MEMBER("estimateTarget", _array) < 2) then {_see = true;};
				};
				sleep 0.01;
				true;
			} count units MEMBER("group", nil);
			_see;
		};		

		PUBLIC FUNCTION("array", "estimateTarget") {	
			DEBUG(#, "OO_PATROL::estimateTarget")
			((_this select 0) getHideFrom (_this select 1)) distance (position (_this select 1));
		};

		PUBLIC FUNCTION("", "doFire") {
			DEBUG(#, "OO_PATROL::doFire")
			private _target = MEMBER("target", nil);
			{
				_x dotarget _target;
				_x dofire _target;
				_x setUnitPos "Middle";
				sleep 0.01;
				true;
			} count units MEMBER("group", nil);
		};

		// moveInto Buildings
		PUBLIC FUNCTION("object", "moveInto") {
			DEBUG(#, "OO_PATROL::moveInto")
			private _building = _this;
			private _positions = [];
			private _index = 0;

			while { format ["%1", _building buildingPos _index] != "[0,0,0]" } do {
				_positions pushBack (_building buildingPos _index);
				_index = _index + 1;
				sleep 0.01;
			};

			{
				_x domove (selectRandom _positions);
				sleep 0.01;
				true;
			} count units MEMBER("group", nil);
			sleep 30;
		};

		// move around target
		PUBLIC FUNCTION("scalar", "moveAround") {
			DEBUG(#, "OO_PATROL::moveAround")
			private _areasize = _this;
			private _target = MEMBER("target", nil);
			private _leader = leader MEMBER("group", nil);
			private _dir = [_leader, _target] call BIS_fnc_dirTo;

			// flanking or not
			_dir = _dir + selectRandom [110,0,-110];
			if(_dir > 359) then {_dir = _dir - 360};
			if(_dir < 0) then {_dir = _dir + 360};

			private _position = [position _target, _areasize, _dir] call BIS_fnc_relPos;
			MEMBER("moveTo", _position);
		};

		// put mine
		PUBLIC FUNCTION("", "putMine") {
			DEBUG(#, "OO_PATROL::putMine")
			private _target = MEMBER("target", nil);
			private _leader = leader MEMBER("group", nil);

			if((_target distance _leader < 10) and (damage _target < 0.9)) then {
				createVehicle ["ATMine_Range_Ammo", position _target,[], 0, "can_collide"];
			};
		};		

		// soldiers attack the sector
		PUBLIC FUNCTION("array", "moveTo") {
			DEBUG(#, "OO_PATROL::moveTo")
			private _group = MEMBER("group", nil);
			private _counter = 0;

			private _position = _this;
			private _wp = _group addWaypoint [_position, 0];
			_wp setWaypointPosition [_position, 0];
			_wp setWaypointType "DESTROY";
			_wp setWaypointVisible true;
			_wp setWaypointSpeed "FULL";
			_group setCurrentWaypoint _wp;

			#ifdef DEBUGPATROL
			private _name = format["target_%1", groupId _group];
			private _marker = createMarkerLocal [_name,_position];
			_marker setMarkerShapeLocal "ICON";
			_marker setMarkerTypeLocal "waypoint";
			_marker setMarkerTextLocal _name;
			_marker setMarkerColorLocal "ColorRed";
			#endif
			sleep 30;
			#ifdef DEBUGPATROL
			deleteMarkerLocal _marker;
			#endif
			MEMBER("event", "");
			deletewaypoint _wp;
		};

		PUBLIC FUNCTION("", "dropSmoke") {
			DEBUG(#, "OO_PATROL::dropSmoke")
			private _group = MEMBER("group", nil);
			private _round = ceil(random 3);
			private _smokeposition = [];
			private _smoke = "";

			for "_x" from 0 to _round step 1 do {
				_smokeposition = [position (leader _group), 2, random 359] call BIS_fnc_relPos;
				_smoke = createVehicle ["G_40mm_Smoke", _smokeposition, [], 0, "NONE"];
			};
		};

		PUBLIC FUNCTION("", "dropFlare") {
			DEBUG(#, "OO_PATROL::dropFlare")
			if((date select 3 < 4) or (date select 3 > 20)) then {

			};
		};

		PUBLIC FUNCTION("", "scanTargets") {
			DEBUG(#, "OO_PATROL::scanTargets")
			{
				if((leader MEMBER("group", nil)) knowsAbout _x > 0.40) then { MEMBER("event", "alert"); };
				sleep 0.01;
				true;
			} count MEMBER("targets", nil);
		};

		// soldiers walk around the sector
		PUBLIC FUNCTION("array", "guard") {
			DEBUG(#, "OO_PATROL::walk")
			private _group = MEMBER("group", nil);
			private _leader = leader _group;
			private _position = _this select 0;
			private _areasize = _this select 1;
			private _maxtime = 30;
			private _wp ="";
			private _counter = 0;

			MEMBER("setSafeMode", nil);

			private _formationtype = selectRandom ["COLUMN", "STAG COLUMN","WEDGE","ECH LEFT","ECH RIGHT","VEE","LINE","FILE","DIAMOND"];
			_group setFormation _formationtype;

			while { (position _leader) distance _position < (_areasize/2.5) } do {
				_position = [_position, _areasize, random 359] call BIS_fnc_relPos;
				sleep 0.01;
			};

			_wp = _group addWaypoint [_position, 10];
			_wp setWaypointPosition [_position, 10];
			_wp setWaypointType "GUARD";
			_wp setWaypointVisible true;
			_wp setWaypointSpeed "LIMITED";
			_wp setWaypointStatements ["true", "this setvariable ['complete', true]; false"];
			_group setCurrentWaypoint _wp;

			#ifdef DEBUGPATROL
			private _name = format["target_%1", groupId _group];
			private _marker = createMarkerLocal [_name,_position];
			_marker setMarkerShapeLocal "ICON";
			_marker setMarkerTypeLocal "waypoint";
			_marker setMarkerTextLocal _name;
			_marker setMarkerColorLocal "ColorRed";*/
			#endif

			_counter = 0;
			while { _counter < _maxtime } do {
				_leader = leader _group;
				if(MEMBER("event", nil) isEqualTo "alert") then { _counter = _maxtime;};
				if(_leader distance _position < 5) then { 	_counter = _maxtime; };
				_counter = _counter + 1;
				sleep 1;
			};
			#ifdef DEBUGPATROL
			deleteMarkerLocal _marker;
			#endif
			deletewaypoint _wp;
		};

		PUBLIC FUNCTION("", "walkInBuildings") {
			DEBUG(#, "OO_PATROL::walkInBuildings")
			private _group = MEMBER("group", nil);
			private _leader = leader _group;
			private _areasize = MEMBER("areasize", nil);
			private _maxtime = 30;
			private _counter = 0;

			MEMBER("setBuildingMode", nil);

			{
				_x domove (selectRandom MEMBER("buildings",nil));
				sleep 0.01;
				true;
			} count units MEMBER("group", nil);

			while { _counter < _maxtime } do {
				_leader = leader _group;
				if(MEMBER("event", nil) isEqualTo "alert") then { _counter = _maxtime;};
				MEMBER("scanTargets", nil);
				_counter = _counter + 1;
				sleep 1;
			};
		};

		PUBLIC FUNCTION("", "setBuildingMode") {
			DEBUG(#, "OO_PATROL::setBuildingMode")
			MEMBER("group", nil) setBehaviour "COMBAT";
			MEMBER("group", nil) setCombatMode "RED";
			MEMBER("group", nil) setSpeedMode "FULL";
			MEMBER("group", nil) allowFleeing 0.1;
		};

		PUBLIC FUNCTION("", "setMoveMode") {
			DEBUG(#, "OO_PATROL::setMoveMode")
			MEMBER("group", nil) setBehaviour "AWARE";
			MEMBER("group", nil) setCombatMode "RED";
			MEMBER("group", nil) setSpeedMode "FULL";
			MEMBER("group", nil) allowFleeing 0.1;
		};

		PUBLIC FUNCTION("", "setSafeMode") {
			DEBUG(#, "OO_PATROL::setSafeMode")
			MEMBER("group", nil) setBehaviour "SAFE";
			MEMBER("group", nil) setCombatMode "GREEN";
			MEMBER("group", nil) setSpeedMode "NORMAL";
			MEMBER("group", nil) allowFleeing 0.1;
		};

		PUBLIC FUNCTION("", "setCombatMode") {
			DEBUG(#, "OO_PATROL::setCombatMode")
			MEMBER("group", nil) setBehaviour "COMBAT";
			MEMBER("group", nil) setCombatMode "RED";
			MEMBER("group", nil) setSpeedMode "FULL";
			MEMBER("group", nil) allowFleeing 0.1;
		};

		PUBLIC FUNCTION("","deconstructor") { 
			DEBUG(#, "OO_PATROL::deconstructor")
			DELETE_VARIABLE("areasize");
			DELETE_VARIABLE("group");
			DELETE_VARIABLE("target");
			DELETE_VARIABLE("targets");
			DELETE_VARIABLE("buildings");
			DELETE_VARIABLE("this");
		};
	ENDCLASS;