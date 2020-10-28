	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2019 Nicolas BOITEUX

	CLASS OO_SECTOR

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
	#undef DEBUGSECTOR

	CLASS("OO_SECTOR")
		PRIVATE VARIABLE("code","this");
		PRIVATE VARIABLE("array","position");
		PRIVATE VARIABLE("bool","active");
		PRIVATE VARIABLE("bool","monitor");
		PRIVATE VARIABLE("array","zombies");
		PRIVATE VARIABLE("string","zonetype");
		PRIVATE VARIABLE("array","zombiestype");
		PRIVATE VARIABLE("scalar","sectorsize");
		PRIVATE VARIABLE("array","vehicles");

		PUBLIC FUNCTION("array","constructor") {
			DEBUG(#, "OO_SECTOR::constructor")
			MEMBER("position", _this select 0);
			MEMBER("sectorsize", (_this select 1));
			MEMBER("active", false);
			MEMBER("monitor", false);
			private _array = [];
			MEMBER("zombies", _array);
			private _array = [];
			MEMBER("vehicles", _array);
			private _array = [];
			MEMBER("zombiestype", _array);
			private _zonetype = "";
			MEMBER("zonetype", _zonetype);
			MEMBER("setZombiesType", nil);
		};

		PUBLIC FUNCTION("scalar","setPosition") {
			DEBUG(#, "OO_SECTOR::setPosition")
			MEMBER("position", _this);
		};

		PUBLIC FUNCTION("","getZoneType") {
			DEBUG(#, "OO_SECTOR::getZoneType")
			MEMBER("zonetype", nil);
		};

		PUBLIC FUNCTION("","spawnVehicle") {
			DEBUG(#, "OO_SECTOR::spawnVehicle")
			private _roads = MEMBER("position", nil) nearRoads MEMBER("sectorsize", nil);
			private _vehicles = [];
			private _count = 1 + ceil(random 4);
			if(count _roads isEqualTo 0) exitWith {};
			while { _count > 0 } do {
				_count = _count - 1;
				private _position = selectRandom _roads;
				private _dir = random 360;
				_position = _position getRelPos [random (50), 90];
				private _type = [];
				private _requirement = false;
				if(random 1 > 0.95) then {
					if(random 1 > 0.98) then {
						_type = selectRandom ["rhs_btr70_vv","rhs_brm1k_vv","rhs_t72be_tv", "rhs_t90sm_tv"];
						_requirement = true;
						#ifdef DEBUGSECTORRUSSIAN
						systemchat format["Spawn special vehicle: %1", _type];
						#endif
					} else {
						_type = selectRandom ["rhs_uaz_open_vv","RHS_Ural_Open_Flat_VV_01"];
					};
				} else {
					_type = selectRandom ["RHS_UAZ_MSV_01","rhs_uaz_open_MSV_01","RHS_Ural_VMF_01","RHS_Ural_Civ_01","RHS_Ural_Open_Civ_03", "C_Truck_02_transport_F","C_Truck_02_covered_F", "Land_Wreck_BMP2_F", "Land_Wreck_BRDM2_F", "Land_Wreck_Skodovka_F", "Land_Wreck_Slammer_F", "Land_Wreck_Slammer_hull_F", "Land_Wreck_T72_hull_F", "Land_Wreck_UAZ_F", "Land_Wreck_Ural_F"];
				}; 
				private _vehicle = _type createVehicle _position;
				_vehicle setFuel (0.1 + random 0.3);
				_vehicle setdir _dir;
				if(random 1 > 0.3) then {
					if(random 1 > 0.7) then {
						_hitpoint = selectRandom ["HitEngine", "HitLFWheel","HitLF2Wheel","HitLMWheel","HitLBWheel","HitRFWheel","HitRF2Wheel","HitRMWheel","HitRBWheel"];
						_vehicle setHitPointDamage [_hitpoint, 1];
					} else {
						_vehicle setFuel 0;
					};
				};
				_vehicles pushBack _vehicle;
				if (_requirement) then { _vehicle call fnc_requirement;};
			};
			MEMBER("vehicles", _vehicles);
		};

		PUBLIC FUNCTION("array","checkAverage") {
			private _array = _this;
			_array sort true;
			private _max = 0;
			private _value = 0;
			private _count = 0;
			private _maxcount = 0;

			{
				if!(_value isEqualTo _x) then {
					if(_count > _maxcount) then {
						_max = _value;
						_maxcount = _count;
					};
					_value = _x;
					_count = 1;
				} else {
					_count = _count + 1;
				};
			} forEach _array;
			_max;
		};

		PUBLIC FUNCTION("","checkCenter") {
			DEBUG(#, "OO_SECTOR::checkCenter")

			private _position = MEMBER("position", nil);
			private _array = nearestObjects [_position, ["House_F"] , MEMBER("sectorsize", nil)];
			sleep 0.5;

			{
				//"PowerLines_base_F","PowerLines_Small_base_F","PowerLines_Wires_base_F","Lamps_base_F"
				if(_x isKindOf "PowerLines_base_F" or { _x isKindOf "PowerLines_Small_base_F"} or {_x isKindOf "PowerLines_Wires_base_F"} or {_x isKindOf "Lamps_base_F"}) then {
					_array = _array - [_x];
				};
			}foreach _array;

			private _nbhouse = count _array;
			private _zonetype = "";

			switch(true) do {
				case (_nbhouse < 10) : {_zonetype = "ventilated";};
				case (_nbhouse < 50) : { _zonetype = "hill";};
				default {
					_zonetype = ["horde", "village"] selectRandomWeighted [0.05,0.95];
				};
			};
			MEMBER("zonetype", _zonetype);

			#ifdef DEBUGSECTOR
			private _id = random 65000;
			private _name = format["%1_spawn_%2", _zonetype, _id];
			private _marker = createMarker [_name, _position];
			_marker setMarkerShape "ICON";
			_marker setMarkerType "loc_CivilDefense";
			_marker setMarkerText _name;
			_marker setMarkerColor "ColorGreen";
			_marker setMarkerSize [0.7,0.7];
			_marker setMarkerBrush "FDiagonal";
			#endif

			if!(_zonetype isEqualTo "ventilated") then {
				private _xarray = [];
				private _yarray = [];
				{
					_xarray pushBack floor(((getpos _x) select 0)/10);
					_yarray pushBack floor(((getpos _x) select 1)/10);
				} forEach _array;

				_xmax = MEMBER("checkAverage", _xarray) * 10;
				_ymax = MEMBER("checkAverage", _yarray) * 10;
				_position = [_xmax, _ymax];
			};
			_position;
		};

		PUBLIC FUNCTION("","check") {
			DEBUG(#, "OO_SECTOR::check")
			private _position = MEMBER("position", nil);
			MEMBER("monitor", true);
			while { MEMBER("monitor", nil) } do {
				private _list = _position nearEntities [["Man", "Air", "Car", "Motorcycle", "Tank"], 350];
				sleep 1;
				if((west countside _list > 0) and !MEMBER("active",nil)) then {
					#ifdef DEBUGSECTOR
					systemChat "Spawn Zombie location";
					#endif
					MEMBER("active", true);
					SPAWN_MEMBER("spawnVehicle", nil);
					MEMBER("popZombies", nil);
					#ifdef DEBUGSECTOR
					systemChat format ["zombies count %1", count MEMBER("zombies", nil)];
					#endif
				};
				if((west countside _list isEqualTo 0) and MEMBER("active", nil)) then {
					#ifdef DEBUGSECTOR
					systemChat "Unspawn Zombie location";
					#endif
					MEMBER("active", false);
					MEMBER("unpopZombies", nil);
					MEMBER("unpopVehicles", nil);
					#ifdef DEBUGSECTOR
					systemChat format ["zombies count %1", count MEMBER("zombies", nil)];
					#endif
				};
				sleep 30;
			};
		};

		PUBLIC FUNCTION("","setZombiesType") {
			DEBUG(#, "OO_SECTOR::setZombiesType")
			private _array = [];
			_array append ["RyanZombieC_man_1medium", "RyanZombieC_man_polo_1_Fmedium", "RyanZombieC_man_polo_2_Fmedium", "RyanZombieC_man_polo_4_Fmedium", "RyanZombieC_man_polo_5_Fmedium", "RyanZombieC_man_polo_6_Fmedium", "RyanZombieC_man_p_fugitive_Fmedium", "RyanZombieC_man_w_worker_Fmedium", "RyanZombieC_scientist_Fmedium", "RyanZombieC_man_hunter_1_Fmedium", "RyanZombieC_man_pilot_Fmedium", "RyanZombieC_journalist_Fmedium", "RyanZombieC_Orestesmedium", "RyanZombieC_Nikosmedium", "RyanZombie15medium", "RyanZombie16medium", "RyanZombie17medium", "RyanZombie18medium", "RyanZombie19medium", "RyanZombie20medium", "RyanZombie21medium", "RyanZombie22medium", "RyanZombie23medium", "RyanZombie24medium", "RyanZombie25medium", "RyanZombie26medium", "RyanZombie27medium", "RyanZombie28medium", "RyanZombie29medium", "RyanZombie30medium", "RyanZombie31medium", "RyanZombie32medium"];
			_array append ["RyanZombieC_man_1slow", "RyanZombieC_man_polo_1_Fslow", "RyanZombieC_man_polo_2_Fslow", "RyanZombieC_man_polo_4_Fslow", "RyanZombieC_man_polo_5_Fslow", "RyanZombieC_man_polo_6_Fslow", "RyanZombieC_man_p_fugitive_Fslow", "RyanZombieC_man_w_worker_Fslow", "RyanZombieC_scientist_Fslow", "RyanZombieC_man_hunter_1_Fslow", "RyanZombieC_man_pilot_Fslow", "RyanZombieC_journalist_Fslow", "RyanZombieC_Orestesslow", "RyanZombieC_Nikosslow", "RyanZombie15slow", "RyanZombie16slow", "RyanZombie17slow", "RyanZombie18slow", "RyanZombie19slow", "RyanZombie20slow", "RyanZombie21slow", "RyanZombie22slow", "RyanZombie23slow", "RyanZombie24slow", "RyanZombie25slow", "RyanZombie26slow", "RyanZombie27slow", "RyanZombie28slow", "RyanZombie29slow", "RyanZombie30slow", "RyanZombie31slow", "RyanZombie32slow"];
			_array append ["RyanZombieC_man_1Walker", "RyanZombieC_man_polo_1_FWalker", "RyanZombieC_man_polo_2_FWalker", "RyanZombieC_man_polo_4_FWalker", "RyanZombieC_man_polo_5_FWalker", "RyanZombieC_man_polo_6_FWalker", "RyanZombieC_man_p_fugitive_FWalker", "RyanZombieC_man_w_worker_FWalker", "RyanZombieC_scientist_FWalker", "RyanZombieC_man_hunter_1_FWalker", "RyanZombieC_man_pilot_FWalker", "RyanZombieC_journalist_FWalker", "RyanZombieC_OrestesWalker", "RyanZombieC_NikosWalker", "RyanZombie15walker", "RyanZombie16walker", "RyanZombie17walker", "RyanZombie18walker", "RyanZombie19walker", "RyanZombie20walker", "RyanZombie21walker", "RyanZombie22walker", "RyanZombie23walker", "RyanZombie24walker", "RyanZombie25walker", "RyanZombie26walker", "RyanZombie27walker", "RyanZombie28walker", "RyanZombie29walker", "RyanZombie30walker", "RyanZombie31walker", "RyanZombie32walker"];
			//_array append ["RyanZombieboss1", "RyanZombieboss2", "RyanZombieboss3", "RyanZombieboss4", "RyanZombieboss5", "RyanZombieboss6", "RyanZombieboss7", "RyanZombieboss8", "RyanZombieboss9", "RyanZombieboss10", "RyanZombieboss11", "RyanZombieboss12", "RyanZombieboss13", "RyanZombieboss14", "RyanZombieboss15", "RyanZombieboss16", "RyanZombieboss17", "RyanZombieboss18", "RyanZombieboss19", "RyanZombieboss20", "RyanZombieboss21", "RyanZombieboss22", "RyanZombieboss23", "RyanZombieboss24", "RyanZombieboss25", "RyanZombieboss26", "RyanZombieboss27", "RyanZombieboss28", "RyanZombieboss29", "RyanZombieboss30", "RyanZombieboss31", "RyanZombieboss32"];
			//_array append ["RyanZombieSpider1", "RyanZombieSpider2", "RyanZombieSpider3", "RyanZombieSpider4", "RyanZombieSpider5", "RyanZombieSpider6", "RyanZombieSpider7", "RyanZombieSpider8", "RyanZombieSpider9", "RyanZombieSpider10", "RyanZombieSpider11", "RyanZombieSpider12", "RyanZombieSpider13", "RyanZombieSpider14", "RyanZombieSpider15", "RyanZombieSpider16", "RyanZombieSpider17", "RyanZombieSpider18", "RyanZombieSpider19", "RyanZombieSpider20", "RyanZombieSpider21", "RyanZombieSpider22", "RyanZombieSpider23", "RyanZombieSpider24", "RyanZombieSpider25", "RyanZombieSpider26", "RyanZombieSpider27", "RyanZombieSpider28", "RyanZombieSpider29", "RyanZombieSpider30", "RyanZombieSpider31", "RyanZombieSpider32"];
			//_array append ["RyanZombieCrawler1", "RyanZombieCrawler2", "RyanZombieCrawler3", "RyanZombieCrawler4", "RyanZombieCrawler5", "RyanZombieCrawler6", "RyanZombieCrawler7", "RyanZombieCrawler8", "RyanZombieCrawler9", "RyanZombieCrawler10", "RyanZombieCrawler11", "RyanZombieCrawler12", "RyanZombieCrawler13", "RyanZombieCrawler14", "RyanZombieCrawler15", "RyanZombieCrawler16", "RyanZombieCrawler17", "RyanZombieCrawler18", "RyanZombieCrawler19", "RyanZombieCrawler20", "RyanZombieCrawler21", "RyanZombieCrawler22", "RyanZombieCrawler23", "RyanZombieCrawler24", "RyanZombieCrawler25", "RyanZombieCrawler26", "RyanZombieCrawler27", "RyanZombieCrawler28", "RyanZombieCrawler29", "RyanZombieCrawler30", "RyanZombieCrawler31", "RyanZombieCrawler32"];
			MEMBER("zombiestype", _array);
		};

		PUBLIC FUNCTION("","popZombies") {
			DEBUG(#, "OO_SECTOR::popZombies")
			private _centerposition = MEMBER("checkCenter", nil);
			if(_centerposition isEqualTo []) exitWith {[];};

			private _position = MEMBER("position", nil);
			private _group = createGroup east;
			private _array = MEMBER("zombiestype", nil);
			_type = format["%1%2", (selectRandom _array),"Opfor"];
			private _ref = _group createUnit [_type, _centerposition, [], 0, "NONE"];
			_group deleteGroupWhenEmpty true;

			private _zonetype = MEMBER("zonetype", nil);
			private _count = 0;
			switch (_zonetype) do {
				case "horde" : {_count = 10 + ceil(random 20);};
				case "hill" : {_count = ceil(random 5);};
				case "ventilated" : {_count = (random 5);};
				default {_count = 5 + ceil(random 5);};
			};

			for "_i" from 0 to _count do {
				private _group = createGroup east;
				switch (_zonetype) do {
					case "horde" : {
						_position = _ref getRelPos [10, random 360];
					};
					case "hill" : {
						_position = _ref getRelPos [floor(random 250), random 360];
					};
					case "village" : {
						_position = _ref getRelPos [floor(random 250), random 360];
					};
					case "ventilated" : {
						_ref setpos _position;
						_position = _ref getRelPos [floor(random 250), random 360];
					};
					default {
						_position = _ref getRelPos [50 + (random 100), random 360];
					};
					sleep 0.5;
				};

				_type = format["%1%2", (selectRandom _array),"Opfor"];
				_unit = _group createUnit [_type, _position, [], 0, "NONE"];
				_unit setpos _position;

				_unit spawn {
					private _unit = _this;
					private _unitmov = position _unit;
					private _arraypos = [];
					for "_i" from 0 to 5 do {
						_arraypos pushBack (_unit getRelPos [(50 + random 250), random 360]);
					};
					private _movpos = (selectRandom _arraypos);
					while { alive _unit } do {
						if(_unitmov distance (position _unit) < 5) then {
							_movpos = (selectRandom _arraypos);
						};
						_unitmov = position _unit;
						_enemy = (_unit findNearestEnemy _unit);
						if(_unit knowsAbout _enemy > 1) then {
							_unit domove (position _enemy);
						} else {
							_unit domove _movpos;
							sleep 30 + random(30);
						};
						sleep 1;
					};
				};
				_group deleteGroupWhenEmpty true;
				MEMBER("zombies", nil) pushBack _unit;

				#ifdef DEBUGSECTOR
				private _id = random 65000;
				private _name = format["%1_%2", _zonetype, _id];
				private _marker = createMarkerLocal [_name, _position];
				_marker setMarkerShapeLocal "ICON";
				_marker setMarkerTypeLocal "loc_CivilDefense";
				_marker setMarkerTextLocal _name;
				_marker setMarkerColorLocal "ColorRed";
				_marker setMarkerSizeLocal [0.5,0.5];
				_marker setMarkerBrushLocal "FDiagonal";
				[_unit, _marker]spawn {
					_unit = _this select 0;
					_marker = _this select 1;
					while {alive _unit} do {
						_marker setMarkerPosLocal (position _unit);
						sleep 0.5;
					};
					deleteMarkerLocal _marker;
				};
				#endif
				sleep 0.1;
			};

			// move last one
			_position = _ref getRelPos [floor(random 250), random 360];
			_ref setpos _position;
		};

		PUBLIC FUNCTION("","unpopZombies") {
			private _zombies = MEMBER("zombies", nil);
			{
				_x setDamage 1;
				hideBody _x;
				sleep 0.1;
				private _waypoints = waypoints _x;
				{deleteWaypoint _x;} forEach _waypoints;
				deleteVehicle _x;
			} forEach _zombies;
			private _array = [];
			MEMBER("zombies", _array);
		};

		PUBLIC FUNCTION("","unpopVehicles") {
			private _vehicles = MEMBER("vehicles", nil);
			{
				_x spawn {
					private _credit = 1;
					while { _credit > 0 } do {
						if(count(crew _this) isEqualTo 0) then {
							_credit = _credit - 1;
						} else {
							_credit = 60;
						};
						sleep 10;
					};
					deleteVehicle _this;
				};
				sleep 0.1;
			} forEach _vehicles;
			_vehicles = [];
			MEMBER("vehicles", _vehicles);
		};

		PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_SECTOR::deconstructor")
			MEMBER("monitor", false);
			sleep 60;
			MEMBER("unpopZombies", nil);
			DELETE_VARIABLE("this");
			DELETE_VARIABLE("position");
			DELETE_VARIABLE("active");
			DELETE_VARIABLE("monitor");
			DELETE_VARIABLE("zonetype");
			DELETE_VARIABLE("zombies");
			DELETE_VARIABLE("zombiestype");
			DELETE_VARIABLE("sectorsize");
			DELETE_VARIABLE("vehicles");
		};
	ENDCLASS;