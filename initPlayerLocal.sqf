	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2018 Nicolas BOITEUX

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

	call compile preprocessFileLineNumbers "vitems\oo_container.sqf";
	call compile preprocessFileLineNumbers "vitems\oo_randomstuff.sqf";
	call compile preprocessFileLineNumbers "vitems\oo_bme.sqf";
	call compile preprocessFileLineNumbers "objects\oo_health.sqf";
	call compile preprocessFileLineNumbers "gui\oo_hud.sqf";
	call compile preprocessFileLineNumbers "gui\oo_vitems.sqf";
	call compile preprocessFileLineNumbers "gui\oo_UI_loading.sqf";


	[] spawn {
		private _active = false;
		while { true } do {
			_size = 0;
			if ((typeof cursorObject) isKindOf "House") then {
				_size = ((1 boundingBoxReal cursorObject) select 2) - 1;
			} else {
				_size = ((1 boundingBoxReal cursorObject) select 2) + 2;
			};
			if ((cursorObject distance player < _size) and !(cursorObject isKindOf "Man")) then {
				if!(_active) then {
					1001 cutRsc ["cursor", "PLAIN"];
					_active = true;
				};
			} else {
				1001 cutText ["", "PLAIN"];
				_active = false;
			};
			sleep 0.1;
		};
	};

	bmeclient = "new" call OO_BME;
	
	private _result = false;
	while { _result isEqualTo false} do { 
		_result= ["remoteCall", ["BmeIsAlive", "" , 2, false]] call bmeclient;
		sleep 1;
	};
	systemchat "BME 2.0 is initialized";

	sleep 2;

	player addEventHandler ["InventoryOpened", {execVM "gui\loading.sqf";true;}];
	player addEventHandler ["InventoryClosed", {player addEventHandler ["InventoryOpened", {execVM "gui\loading.sqf";true;}];}];

	1000 cutRsc ["hud", "PLAIN"];

	health = "new" call OO_HEALTH;