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
	call compile preprocessFileLineNumbers "vitems\oo_bme.sqf";
	call compile preprocessFileLineNumbers "objects\oo_sector.sqf";   
    //call compile preprocessFileLineNumbers "scripts\WC_fnc_enumvillages.sqf";

	[] execVM "real_weather\real_weather.sqf";

	// Get/Set content/properties of containers from NetID
	vitems_getInventory = { 
		missionNamespace getVariable [format["inventory_%1", _this], []];
	};
	
	vitems_setInventory = { 
		missionNamespace setVariable [format["inventory_%1", _this select 0], _this select 1, false];true;
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

	if((isServer) and (isDedicated)) then { 
        bmeclient = "new" call OO_BME;
        diag_log "BME Server 2.0 is initialized";
    };
	BmeIsAlive = { true;};

	private _list = [];
	_stuff = ["new", ""] call OO_RANDOMSTUFF;
	["setNeutre", _list] call _stuff;
    "preload" call _stuff;

    wczones = [[500,500],[4500,500],[5500,500],[8500,500],[9500,500],[10500,500],[11500,500],[1500,1500],[2500,1500],[3500,1500],[4500,1500],[6500,1500],[7500,1500],[8500,1500],[10500,1500],[11500,1500],[1500,2500],[2500,2500],[3500,2500],[4500,2500],[5500,2500],[7500,2500],[8500,2500],[10500,2500],[11500,2500],[500,3500],[1500,3500],[4500,3500],[5500,3500],[6500,3500],[7500,3500],[10500,3500],[11500,3500],[500,4500],[5500,4500],[6500,4500],[8500,4500],[9500,4500],[10500,4500],[11500,4500],[12500,4500],[500,5500],[1500,5500],[2500,5500],[4500,5500],[5500,5500],[7500,5500],[11500,5500],[500,6500],[1500,6500],[2500,6500],[3500,6500],[4500,6500],[5500,6500],[6500,6500],[7500,6500],[8500,6500],[9500,6500],[10500,6500],[12500,6500],[1500,7500],[2500,7500],[3500,7500],[4500,7500],[5500,7500],[9500,7500],[11500,7500],[12500,7500],[1500,8500],[3500,8500],[4500,8500],[6500,8500],[7500,8500],[8500,8500],[9500,8500],[10500,8500],[12500,8500],[500,9500],[1500,9500],[2500,9500],[4500,9500],[5500,9500],[6500,9500],[8500,9500],[10500,9500],[11500,9500],[1500,10500],[2500,10500],[4500,10500],[5500,10500],[6500,10500],[8500,10500],[9500,10500],[10500,10500],[11500,10500],[12500,10500],[1500,11500],[2500,11500],[3500,11500],[6500,11500],[7500,11500],[8500,11500],[9500,11500],[10500,11500],[11500,11500],[3500,12500],[4500,12500],[5500,12500],[7500,12500],[8500,12500],[9500,12500],[10500,12500]];

	{
		_location = ["new", _x] call OO_SECTOR;
		"check" spawn _location;
	}foreach wczones;

