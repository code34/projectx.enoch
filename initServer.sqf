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

	// Get/Set content/properties of containers from NetID
	vitems_getInventory = { 
		missionNamespace getVariable [format["inventory_%1", _this], []];
	};
	
	vitems_setInventory = { 
		missionNamespace setVariable [format["inventory_%1", _this select 0], _this select 1, false];true;
	};
	
	vitems_getProperties = {
		missionNamespace getVariable [format["properties_%1", _this], []];
	};
	
	vitems_setProperties = {
		missionNamespace setVariable [format["properties_%1", _this select 0], _this select 1, false];
		true;
	};

	//bme_server = "'new" call OO_BME;
	BmeIsAlive = { true;};

	_eatingcode = { 
		private _path = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
		private _sound = _path + "sounds\eat.ogg";
		playSound3D [_sound, player, false, getPosASL player, 5, 1, 10];
		["addFood", floor(random 50)] call (missionNamespace getVariable "health");
		true;
	};
	_drinkingcode = { 
		private _path = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
		private _sound = _path + "sounds\drink.ogg";
		playSound3D [_sound, player, false, getPosASL player, 5, 1, 10];
		["addDrink", floor(random 50)] call (missionNamespace getVariable "health");
		true;
	};
	_bottleusecode = { hint "You drink all the bottle. You fill very sick and finaly you die."; player setDamage 1;closeDialog 0; true;};
	_c4usecode = { hint "C4 was armed"; _c4 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _this; _c4 attachTo [_this, [0,0,0]]; _c4 spawn { sleep 10; _this setDamage 1; };true;};
	_lighterusecode = { skipTime 12;true;};
	_bandageusecode = { _this setDamage ((getDammage _this) - 0.2);true;};
	_wheelusecode = { if (_this isKindOf "Car") then { hint "You repair the Wheel"; player playActionNow "PutDown"; _this setDamage 0; true;} else { false;};};
	_wrenchusecode = { if (_this isKindOf "Car") then { hint "Repairing ..."; player playActionNow "PutDown"; _this setDamage 0; true;} else { false;};};

	private _list = [];
	_stuff = ["new", ""] call OO_RANDOMSTUFF;
	["setNeutre", _list] call _stuff;

	_list = [
			// name, description, type, weight, durability, use code, picture
			["Spare wheel","a deflated spare wheel","stuff",10,1, _wheelusecode, "pictures\wheel.jpg"],
			["Lighter", "a lighter that will allow you to light campfires quickly. This object is not waterproof","stuff",0.1, 5, _lighterusecode, "pictures\lighter.jpg"],
			["A cloth bandage","A cloth bandage that will allow you to stop bleeding quickly","stuff",0.1, 1, _bandageusecode, "pictures\bandage.jpg"],
			["Adjustable wrench","a wrench that allows you to make the most basic repairs","stuff",1,10, _wrenchusecode, "pictures\wrench.jpg"],
			["A figurine of mia kalifa","A figure of mia kalifa completely naked. She had, in all appearances, forgotten the whole epilation.","stuff",0.5,-1, {true}, "pictures\mia.jpg"],
			["Antibiotic", "a box full of antibiotic in an acceptable state", "stuff", 0.1,1, {true}, "pictures\antibiotic.jpg"],
			["Axe", "A Greenland Condor axe 1060 High Carbon", "stuff", 1,-1, {true}, "pictures\axe.jpg"],
			["Plank", "A pine wood plank of 6 to 8 feet", "stuff", 1,1, {true}, "pictures\plank.jpg"]
		];
		["setStuff", _list] call _stuff;

		_list = [
			["Explosive C4", "A small amount of explosive that could allow you to spend a pleasant moment during this day. To use with precautions all the same", "military", 5, 1, _c4usecode, "pictures\c4.jpg"],
			["Mission plan #1425146", "Secret Defense - This information should not be disclosed to the enemy - Bring in sector c124535 the contents of this briefcase. Ask for colonel Jackson Bro", "military", 0.05, -1, {true}, "pictures\mission.jpg"],
			["A little briefcase", "a small black leather briefcase quite light. It is locked with an electronic code.It is impossible to open it without destroying its contents","military",5, 1, {true}, "pictures\briefcase.jpg"],
			["GPS tracker","A gps tracker that could be useful to us. The source of energy is a mystery.","stuff",0.2,-1, {true}, "pictures\gpstracker.jpg"]
		];
		["setMilitary", _list] call _stuff;

		_list = [
			["Water Bottle","A Plastic mineral water bottle","food",1,1, _bottleusecode, "pictures\bottle.jpg"],
			["Potatoe","A vulgar potato damaged","food",0.4, 1, _eatingcode, "pictures\potatoe.jpg"],
			["A red apple","A nice great red apple","food",0.2, 1, _eatingcode, "pictures\redapple.jpg"],
			["Tin can Maxigaz","All you need protein to spend a good afternoon in the sun","food", 0.2,2, _drinkingcode, "pictures\tin.jpg"],
			["Oreo pack","Chocolate flavour sandwich biscuits, with a vanilla flavour filling","food", 0.2,2, _eatingcode, "pictures\oreopack.jpg"],
			["Beef Jerky","Tender slices of lean 100% beef are lightly seasoned with a unique blend of spices, and then cooked in a smoke oven.","food", 0.2,2, _eatingcode, "pictures\beefjerky.jpg"],
			["White mushrooms", "Some smalls white mushrooms", "stuff", 0.2,1, _eatingcode, "pictures\whitemushrooms.jpg"],
			["Canned Ravioli","Beef Ravioli in Meat Sauce.","food", 1,2, _eatingcode, "pictures\ravioli.jpg"],
			["Cigarettes packet","A packet of french cigarettes.","food", 0.2,2, {true}, "pictures\cigarettes.jpg"]
		];
		["setFood", _list] call _stuff;

		_list = [
			["Wooden stick", "A small wooden stick with moss", "stuff", 0.3,1, {true}, "pictures\woodenstick.jpg"],
			["Wood branch", "A big wood branch", "stuff", 1,1, {true}, "pictures\woodbranch.jpg"],
			["Wood bark", "A small piece of wood bark", "stuff", 0.5,1, {true}, "pictures\barkofwood.jpg"]
		];
		["setTree", _list] call _stuff;

		_list = [
			["Pile of leaves", "A dry pile of leaves", "stuff", 1,1, {true}, "pictures\pileofleaves.jpg"],
			["Wooden stick", "A small wooden stick with moss", "stuff", 0.3,1, {true}, "pictures\woodenstick.jpg"],
			["Bug", "Fifth instar nymph of Forest shield bug", "stuff", 0.1,1, {true}, "pictures\nymphbug.jpg"],
			["Compost", "A pile of organic compost", "stuff", 1,1, {true}, "pictures\pileofcompost.jpg"],
			["Yellow mushrooms", "Some smalls yellow mushrooms", "stuff", 0.3,1, {true}, "pictures\yellowmushrooms.jpg"]
		];
		["setBush", _list] call _stuff;


		_list = [
			["Stone", "A simple grey granite stone", "stuff", 0.5,1, {true}, "pictures\stone.jpg"]
		];
		["setWall", _list] call _stuff;