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

	_bottleusecode = { hint "You drink all the bottle. You fill very sick and finaly you die."; player setDamage 1;closeDialog 0; true;};
	_c4usecode = { hint "C4 was armed"; _c4 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _this; _c4 attachTo [_this, [0,0,0]]; 	_c4 spawn { sleep 10; _this setDamage 1; };true;};
	_lighterusecode = { skipTime 12;true;};
	_bandageusecode = { _this setDamage ((getDammage _this) - 0.2);true;};
	_wheelusecode = { if (_this isKindOf "Car") then { hint "You repair the Wheel"; player playActionNow "PutDown"; _this setDamage 0; true;} else { false;};};
	_wrenchusecode = { if (_this isKindOf "Car") then { hint "Repairing ..."; player playActionNow "PutDown"; _this setDamage 0; true;} else { false;};};
	_briefcaseusecode = { if((_this getVariable ["name", ""]) isEqualTo "jacksonbro") then {	hint "Thank you Soldier! You just save the world"; true; } else {	hint "You tried to open the briefcase but destroy the content";closeDialog 0; true;};};

	private _list = [
			// name, description, type, weight, durability, use code, picture
			["Spare wheel","a deflated spare wheel","stuff",10,1, _wheelusecode, "pictures\wheel.jpg"],
			["Coin","A XX century coin","stuff",0.05,-1, {true}, "pictures\coin.jpg"],
			["Duck","a duck really alive with 3 legs","stuff",5,5, {true}, "pictures\duck.jpg"],
			["GPS tracker","A gps tracker that could be useful to us. The source of energy is a mystery.","stuff",0.2,-1, {true}, "pictures\gpstracker.jpg"],
			["Lighter", "a lighter that will allow you to light campfires quickly. This object is not waterproof","stuff",0.1, 5, _lighterusecode, "pictures\lighter.jpg"],
			["A cloth bandage","A cloth bandage that will allow you to stop bleeding quickly","stuff",0.1, 1, _bandageusecode, "pictures\bandage.jpg"],
			["Adjustable wrench","a wrench that allows you to make the most basic repairs","stuff",1,10, _wrenchusecode, "pictures\wrench.jpg"],
			["A figurine of mia kalifa","A figure of mia kalifa completely naked. She had, in all appearances, forgotten the whole epilation.","stuff",0.5,-1, {true}, "pictures\mia.jpg"],
			["Antibiotic", "a box full of antibiotic in an acceptable state", "stuff", 0.3,1, {true}, "pictures\antibiotic.jpg"]
		];

		_stuff = "new" call OO_RANDOMSTUFF;
		["setStuff", _list] call _stuff;

		_list = [
			["Explosive C4", "A small amount of explosive that could allow you to spend a pleasant moment during this day. To use with precautions all the same", "military", 5, 1, _c4usecode, "pictures\c4.jpg"],
			["Mission plan #1425146", "Secret Defense - This information should not be disclosed to the enemy - Bring in sector c124535 the contents of this briefcase. Ask for colonel Jackson Bro", "military", 0.05, -1, {true}, "pictures\mission.jpg"],
			["A little briefcase", "a small black leather briefcase quite light. It is locked with an electronic code.It is impossible to open it without destroying its contents","military",5, 1, _briefcaseusecode, "pictures\briefcase.jpg"]
		];
		["setMilitary", _list] call _stuff;

		_list = [
			["Bottle","An water bottle","food",1,1, _bottleusecode, "pictures\bottle.jpg"],
			["Potatoe","A vulgar potato damaged","food",0.5, 1, {true}, "pictures\potatoe.jpg"],
			["Tin can Maxigaz","All you need protein to spend a good afternoon in the sun","food", 0.2,2, {true}, "pictures\tin.jpg"]
		];
		["setFood", _list] call _stuff;

	sleep 2;

	1000 cutRsc ["hud", "PLAIN"];

	_hndl = ppEffectCreate ["colorCorrections", 1501];
	_hndl ppEffectEnable true;
	// gama, saturation, saturation, color,
	_hndl ppEffectAdjust [1, 1.5, -0.10, [0.1, 0, 0.1, 0.2], [0, 0, 0, 1], [0, 0, 0, 0]];
	_hndl ppEffectCommit 0;