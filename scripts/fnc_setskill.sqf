	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2014 Nicolas BOITEUX
	
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

	if (!isServer) exitWith{};

	private _unit = _this;
	_unit setskill ["aimingAccuracy", wcskill + round(random 0.2)];
	_unit setskill ["aimingShake", wcskill + round(random 0.2)];
	_unit setskill ["aimingSpeed", wcskill + round(random 0.2)];
	_unit setskill ["endurance", 0.8];
	_unit setskill ["spotDistance", round(random 0.3)];
	_unit setskill ["spotTime", 0.9];
	_unit setskill ["courage", 1];
	_unit setskill ["reloadSpeed", 0.7];
	_unit setskill ["commanding", 1];	

	_unit addeventhandler ['FiredNear', {
		if(side(_this select 1) in [west, civilian]) then { 	
			{
				_x reveal (_this select 1); 
			} forEach units (group (_this select 0));
		};
	}];

	_unit addEventHandler ['HandleDamage', {
		if(isplayer(_this select 3)) then {
			if(alive (_this select 0)) then {
				_damage = 1 - damage(_this select 0);
				(_this select 0) setdamage (damage(_this select 0) + random(_damage));
			};
			{
				_x reveal (_this select 3);
			}foreach (units (group (_this select 0)));
		};
	}];

	_unit addeventhandler ['Killed', {
		(_this select 0) spawn {
			private _unit = _this;
			_container = ["new", [netId _unit, ((getModelInfo _unit) select 0)]] call OO_CONTAINER;
			["loadInventory", _unit] call _container;
			"save" call _container;
			removeAllWeapons _unit;
			removeAllItems _unit;
		};
	}];

	true;
