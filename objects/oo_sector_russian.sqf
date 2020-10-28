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
					if(random 1 > 0.5) then {
						MEMBER("popRenegat", nil);
					} else {
						MEMBER("popSector", nil);
					};
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

		PUBLIC FUNCTION("object", "reClothes") {
			_soldiers = [];
			{
				_soldiers set [count _soldiers,configname _x];
			} foreach ("isclass _x && getnumber (_x >> 'scope') > 1 && gettext (_x >> 'simulation') == 'soldier'" configclasses (configfile >> "cfgvehicles"));
			private _tmpop = 'ryan';
			private _tmp = "";
			while { _tmpop isEqualTo 'ryan'} do {
				_tmp = _soldiers call bis_fnc_selectrandom;
				_tmpop = toLower(_tmp select [0, 4]);
			};
			[_this,_tmp] call bis_fnc_loadinventory;
		};

		PUBLIC FUNCTION("","popSector") {
			DEBUG(#, "OO_SECTOR::popRussians")
			//MEMBER("spawnVehicle", nil);
			if!(MEMBER("militarized",nil)) exitWith {};
			private _position = MEMBER("position", nil);
			private _group = createGroup resistance;
			private _temp = createGroup east;
			private _count = 1 + ceil(random 5);
			private _ref = "";

			for "_i" from 0 to _count do {
				_type = selectRandom (MEMBER("russianstype", nil));
				_unit = _temp createUnit [_type, _position, [], 0, "NONE"];
				if(_ref isEqualTo "") then {_ref = _unit;};
				private _positiontemp = _ref getRelPos [MEMBER("sectorsize", nil), random 360];
				_unit setpos _positiontemp;
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

		PUBLIC FUNCTION("","popRenegat") {
			DEBUG(#, "OO_SECTOR::popRenegat")
			if!(MEMBER("militarized",nil)) exitWith {};
			private _position = MEMBER("position", nil);
			private _count = 1 + ceil(random 5);
			private _ref = "";

			for "_i" from 0 to _count do {
				private _group = createGroup east;
				_type = selectRandom (MEMBER("russianstype", nil));
				_unit = _group createUnit [_type, _position, [], 0, "NONE"];
				if(_ref isEqualTo "") then {_ref = _unit;};
				private _positiontemp = _ref getRelPos [MEMBER("sectorsize", nil), random 360];
				_unit setpos _positiontemp;
				_unit call fnc_setskill;
				MEMBER("reClothes", _unit);
				_group deleteGroupWhenEmpty true;
				MEMBER("russians", nil) pushBack _unit;
				private _patrol = ["new", _group] call OO_PATROL;
				["patrol", [_position, MEMBER("sectorsize", nil)]] spawn _patrol;

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
		};

		PUBLIC FUNCTION("","unpopSector") {
			DEBUG(#, "OO_SECTOR::unpopRussians")
			private _russians = MEMBER("russians", nil);
			{
				_x setDamage 1;
				hideBody _x;
				sleep 0.1;
				deleteVehicle _x;
			} forEach _russians;

			private _array = [];
			MEMBER("russians", _array);
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
			DELETE_VARIABLE("russianstype");
			DELETE_VARIABLE("sectorsize");
		};
	ENDCLASS;