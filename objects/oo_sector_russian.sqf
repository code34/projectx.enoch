	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2020 Nicolas BOITEUX

	CLASS OO_SECTOR_RUSSIANS

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
	#undef DEBUGSECTORRUSSIAN

	CLASS("OO_SECTOR_RUSSIAN")
		PRIVATE VARIABLE("code","this");
		PRIVATE VARIABLE("array","position");
		PRIVATE VARIABLE("bool","active");
		PRIVATE VARIABLE("bool","monitor");
		PRIVATE VARIABLE("bool","militarized");
		PRIVATE VARIABLE("array","russians");
		PRIVATE VARIABLE("array","vehicles");
		PRIVATE VARIABLE("string","zonetype");
		PRIVATE VARIABLE("array","russianstype");
		PRIVATE VARIABLE("scalar","sectorsize");

		PUBLIC FUNCTION("array","constructor") { 
			DEBUG(#, "OO_SECTOR::constructor")
			MEMBER("position", _this select 0);
			MEMBER("sectorsize", _this select 1);
			MEMBER("militarized", _this select 2);
			MEMBER("active", false);
			MEMBER("monitor", false);
			private _array = [];
			MEMBER("russians", _array);
			private _array = [];
			MEMBER("vehicles", _array);
			private _array = [];
			MEMBER("russianstype", _array);
			private _zonetype = "";
			MEMBER("zonetype", _zonetype);
			MEMBER("setRussiansType", nil);
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
			private _roads = MEMBER("position", nil) nearRoads MEMBER("sectorsize", nil);
			private _vehicles = [];
			private _count = ceil(random 4);

			while { _count > 0 } do {
				_count = _count - 1;
				private _position = selectRandom _roads;
				_position = _position getRelPos [random (10), 90];
				private _dir = random 360;
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
				if(random 1 > 0.7) then {
					if(random 1 > 0.90) then {
						_vehicle setdamage (random 1);
					} else{
						_hitpoint = selectRandom ["HitEngine", "HitLFWheel","HitLF2Wheel","HitLMWheel","HitLBWheel","HitRFWheel","HitRF2Wheel","HitRMWheel","HitRBWheel"];
						_vehicle setHitPointDamage [_hitpoint, 1];
					};
				};
				_vehicles pushBack _vehicle;
				if (_requirement) then { _vehicle call fnc_requirement;};
			};
			MEMBER("vehicles", _vehicles);
		};

		PUBLIC FUNCTION("","check") {
			DEBUG(#, "OO_SECTOR::check")
			private _position = MEMBER("position", nil);
			MEMBER("monitor", true);
			while { MEMBER("monitor", nil) } do {
				private _size = MEMBER("sectorsize", nil) * 2;
				private _list = _position nearEntities [["Man", "Air", "Car", "Motorcycle", "Tank"], _size];
				sleep 1;
				if((west countside _list > 0) and !MEMBER("active",nil)) then {
					#ifdef DEBUGSECTORRUSSIAN
					systemChat "Spawn Russian location";
					#endif
					MEMBER("active", true);
					MEMBER("popSector", nil);
				};
				if((west countside _list isEqualTo 0) and MEMBER("active", nil)) then {
					#ifdef DEBUGSECTORRUSSIAN
					systemChat "Unspawn Russian location";
					#endif
					MEMBER("active", false);
					MEMBER("unpopSector", nil);
				};
				sleep 30;
			};
		};

		PUBLIC FUNCTION("","setRussiansType") {
			DEBUG(#, "OO_SECTOR::setRussiansType")
			// Russian army
			private _array = [];
			if(random 1 > 0.8) then {
				_array = ["rhs_vdv_recon_rifleman","rhs_vdv_recon_rifleman_ak103","rhs_vdv_recon_rifleman_akms","rhs_vdv_recon_rifleman_asval","rhs_vdv_recon_grenadier","rhs_vdv_recon_rifleman_l"];
			} else {
				_array = ["O_R_soldier_exp_F","O_R_Soldier_GL_F","O_R_soldier_M_F","O_R_Soldier_LAT_F","O_R_Soldier_TL_F","O_R_JTAC_F","O_R_medic_F"];
			};
			MEMBER("russianstype", _array);
		};

		PUBLIC FUNCTION("","popSector") {
			DEBUG(#, "OO_SECTOR::popRussians")
			MEMBER("spawnVehicle", nil);
			if!(MEMBER("militarized",nil)) exitWith {};
			private _position = MEMBER("position", nil);
			private _group = createGroup resistance;
			private _temp = createGroup east;
			private _count = 5 + ceil(random 5);

			for "_i" from 0 to _count do {
				_type = selectRandom (MEMBER("russianstype", nil));
				_unit = _temp createUnit [_type, _position, [], 0, "NONE"];
				_unit call fnc_setskill;
				MEMBER("russians", nil) pushBack _unit;

				#ifdef DEBUGSECTORRUSSIAN
				private _id = random 65000;
				private _name = format["%1_%2", "russians", _id];
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
			(units _temp) joinSilent _group;
			deleteGroup _temp;
			_group deleteGroupWhenEmpty true;
			private _patrol = ["new", _group] call OO_PATROL;
			["patrol", [_position, MEMBER("sectorsize", nil)]] spawn _patrol;
		};

		PUBLIC FUNCTION("","unpopSector") {
			DEBUG(#, "OO_SECTOR::unpopRussians")
			private _russians = MEMBER("russians", nil);
			private _vehicles = MEMBER("vehicles", nil);
			{
				_x setDamage 1;
				hideBody _x;
				sleep 0.1;
				deleteVehicle _x;
			} forEach _russians;

			{
				_x spawn {
					private _credit = 60;
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

			private _array = [];
			MEMBER("russians", _array);

			private _array = [];
			MEMBER("vehicles", _array);

		};

		PUBLIC FUNCTION("","deconstructor") {
			DEBUG(#, "OO_SECTOR::deconstructor")
			MEMBER("monitor", false);
			sleep 60;
			MEMBER("unpopSector", nil);
			DELETE_VARIABLE("this");
			DELETE_VARIABLE("position");
			DELETE_VARIABLE("active");
			DELETE_VARIABLE("monitor");
			DELETE_VARIABLE("zonetype");
			DELETE_VARIABLE("russians");
			DELETE_VARIABLE("vehicles");
			DELETE_VARIABLE("russianstype");
			DELETE_VARIABLE("sectorsize");
		};
	ENDCLASS;