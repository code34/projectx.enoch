	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2018 Nicolas BOITEUX

	player program is free software: you can redistribute it and/or modify
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

	call compile preprocessFileLineNumbers "vitems\oo_container.sqf";
	call compile preprocessFileLineNumbers "vitems\oo_randomstuff.sqf";
	call compile preprocessFileLineNumbers "vitems\oo_armagear.sqf";
	call compile preprocessFileLineNumbers "vitems\oo_bme.sqf";
	call compile preprocessFileLineNumbers "objects\oo_grid.sqf";
	call compile preprocessFileLineNumbers "objects\oo_sector.sqf";
	call compile preprocessFileLineNumbers "objects\oo_sector_russian.sqf";
	call compile preprocessFileLineNumbers "objects\oo_patrol.sqf";
	//call compile preprocessFileLineNumbers "objects\oo_missionloader.sqf";

	//call compile preprocessFileLineNumbers "scripts\fnc_enumvillages.sqf";
	fnc_weathers = compile preprocessFileLineNumbers "scripts\real_weather.sqf";
	fnc_getnearestplayer = compile preprocessFileLineNumbers "scripts\fnc_getnearestplayer.sqf";
	fnc_setskill = compile preprocessFileLineNumbers "scripts\fnc_setskill.sqf";
	fnc_requirement = compile preprocessFileLineNumbers "scripts\fnc_requirement.sqf";
	[] spawn compile preprocessFileLineNumbers "scripts\fnc_sanitize.sqf";
	
	// mission files
	fnc_extraction = compile preprocessFileLineNumbers "meka\m0_extraction.sqf";
	fnc_relayradio = compile preprocessFileLineNumbers "meka\m2_relayradio.sqf";
	fnc_sergent = compile preprocessFileLineNumbers "meka\m3_sergent.sqf";
	fnc_village = compile preprocessFileLineNumbers "meka\m5_village.sqf";
	fnc_industrialsite = compile preprocessFileLineNumbers "meka\m6_industrialsite.sqf";
	fnc_militarycasern = compile preprocessFileLineNumbers "meka\m7_militarycasern.sqf";
	fnc_m8site = compile preprocessFileLineNumbers "meka\m8_sitex.sqf";
	fnc_missiongears = compile preprocessFileLineNumbers "meka\missiongears.sqf";
	fnc_missioncandle = compile preprocessFileLineNumbers "meka\missioncandle.sqf";

	playerstartatpos = selectRandom [[500,6500],[1500,6500],[2500,6500],[3500,6500],[4500,6500],[5500,6500],[6500,6500],[7500,6500],[8500,6500],[9500,6500],[10500,6500],[12500,6500],[1500,7500],[2500,7500],[3500,7500],[4500,7500],[5500,7500],[9500,7500],[11500,7500],[12500,7500],[1500,8500],[3500,8500],[4500,8500],[6500,8500],[7500,8500],[8500,8500],[9500,8500],[10500,8500],[12500,8500],[500,9500],[1500,9500],[2500,9500],[4500,9500],[5500,9500],[6500,9500],[8500,9500],[10500,9500],[11500,9500],[1500,10500],[2500,10500],[4500,10500],[5500,10500],[6500,10500],[8500,10500],[9500,10500],[10500,10500],[11500,10500],[12500,10500],[1500,11500],[2500,11500],[3500,11500],[6500,11500],[7500,11500],[8500,11500],[9500,11500],[10500,11500],[11500,11500],[3500,12500],[4500,12500],[5500,12500],[7500,12500],[8500,12500],[9500,12500],[10500,12500]];
	getSpawnPosition = {playerstartatpos;};

	if((isServer) and (isDedicated)) then { 
		bmeclient = "new" call OO_BME;
		diag_log "BME Server 2.0 is initialized";
	};
	BmeIsAlive = { true;};
	while { isNil "bmeclient" } do {sleep 1;};

	[] spawn fnc_weathers;

	_size = getNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize");
	_sectorsize = 250;
	mygrid = ["new", [0,0, _size, _size,_sectorsize,_sectorsize]] call OO_GRID;

	//Ryan zombie settings
	ryanzombiesinfectedchance = 5;
	ryanzombiesinfectedrate = 0.1;
	ryanzombiesinfectedsymptoms = 0.9;
	ryanzombiesinfecteddeath = 0.9;
	//ryanzombiesdeletionradius = 10;
	// max distance to detect players
	Ryanzombieslimit = 75;
	missionNamespace setVariable ["missionplan", 0];

	// IA SKILL
	wcskill = 0.2;
	east setFriend [west, 0];
	east setFriend [resistance, 0];
	resistance setFriend [west, 0];
	resistance setFriend [east, 0];
	west setFriend [east, 0];
	west setFriend [resistance, 0];

	// Server missions
	//missionloader = "new" call oo_missionloader;
	[] spawn fnc_relayradio;
	[] spawn fnc_sergent;
	[] spawn fnc_extraction;
	[] spawn fnc_village;
	[] spawn fnc_militarycasern;
	[] spawn fnc_industrialsite;
	[] spawn fnc_m8site;

	// Stuff missions
	[] spawn fnc_missiongears;
	[] spawn fnc_missioncandle;

	// Get/Set content/properties of containers from NetID
	callMission = {
		switch (true) do {
			case (_this isEqualTo "sergent") : { [] spawn fnc_sergent;	};
			//case (_this isEqualTo "village") : {[] spawn fnc_village;};
			default {};
		};
	};

	vitems_getInventory = { 
		private _lock = missionNamespace getVariable [format["lock_%1", _this], false];
		private _return = [false, []];
		if(!_lock) then {
			missionNamespace setVariable [format["lock_%1", _this], true, false];
			private _value = missionNamespace getVariable [format["inventory_%1", _this], []];
			_return = [true, _value];
		};
		_return;
	};
	
	vitems_setInventory = {
		missionNamespace setVariable [format["inventory_%1", _this select 0], _this select 1, false];true;
		missionNamespace setVariable [format["lock_%1", _this select 0], false, false];
	};
	
	vitems_getProperties = {
		private _netID = _this;
		private _properties = missionNamespace getVariable [format["properties_%1", _netID], []];
		if (_properties isEqualTo []) then {
			private _model = (getModelInfo (objectFromNetId _netID)) select 0;
			private _stuff = ["new", _model] call OO_RANDOMSTUFF;
			_properties = "createProperties" call _stuff;
			missionNamespace setVariable [format["properties_%1", _netID], _properties, false];
			private _content = "getRandomContent" call _stuff;
			missionNamespace setVariable [format["inventory_%1", _netID], _content, false];
		};
		_properties;
	};
	
	vitems_setProperties = {
		missionNamespace setVariable [format["properties_%1", _this select 0], _this select 1, false];
		true;
	};

	private _list = [];
	_stuff = ["new", ""] call OO_RANDOMSTUFF;
	["setNeutre", _list] call _stuff;
	"preload" call _stuff;

	private _size = 250;
	private _count = 0;
	for "_myx" from _size to (12500-_size) step (_size*2) do {
		for "_myy" from _size to (12500-_size) step (_size*2) do {
			_location = ["new", [[_myx, _myy], _size]] call OO_SECTOR;
			"check" spawn _location;
		};
	};

/*	_sectors = ["getSectorsAroundPos", position player] call mygrid;
	{
		_position = ["getPosFromSector", _x] call mygrid;
		_location = ["new", [_position, 250]] call OO_SECTOR;
		"check" spawn _location;
	} forEach _sectors;*/

	onPlayerConnected {
		/*params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
		private _mission = ["getMission", _name] call oo_missionloader;
		if(_mission isEqualTo "") then {
			_mission = "getMissionactive" call oo_missionloader;
		};*/
	};

	for "_i" from 1 to 68 step 1 do {
		private _markername = "enemy" + str(_i);
		private _militarized = false;
		if(random 1 > 0.25) then {_militarized = true;};
		_position = getMarkerPos _markername;
		_size = (getMarkerSize _markername) select 0;
		_location = ["new", [_position, _size, _militarized]] call OO_SECTOR_RUSSIAN;
		"check" spawn _location;
		deleteMarker _markername;
	};

	// debug industrialize mission
	//player setpos getMarkerPos "industrialsite_point";

	// debug sitex
	// sitex = 1;
	//_building = (nearestObjects [[7277.76,2910.65,0], ["Land_DPP_01_mainFactory_old_F"], 50]) select 0;
	//_position = _building getRelPos [30, random 360];
	//player setpos _position;

	//labox = 1;
	//_position = [7475.38,2541.66,0];
	//player setPos _position;

	/// unites russes RHS - VV 
	// vehicules : rhs_btr70_vv, rhs_brm1k_vv,rhs_uaz_open_vv, RHS_Ural_Open_Flat_VV_01
	// chopper: RHS_Mi8mt_Cargo_vv    