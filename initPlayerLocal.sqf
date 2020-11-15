	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2018-2020 Nicolas BOITEUX

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

	15203 cutText ["Loading...","BLACK FADED", 1000];

	call compile preprocessFileLineNumbers "vitems\oo_container.sqf";
	call compile preprocessFileLineNumbers "vitems\oo_randomstuff.sqf";
	call compile preprocessFileLineNumbers "vitems\oo_armagear.sqf";
	call compile preprocessFileLineNumbers "vitems\oo_bme.sqf";
	call compile preprocessFileLineNumbers "vitems\oo_model.sqf";
	//call compile preprocessFileLineNumbers "objects\oo_grid.sqf";
	call compile preprocessFileLineNumbers "objects\oo_health.sqf";
	call compile preprocessFileLineNumbers "objects\oo_healthresume.sqf";
	call compile preprocessFileLineNumbers "objects\oo_tabnote.sqf";
	call compile preprocessFileLineNumbers "objects\oo_camera.sqf";
	call compile preprocessFileLineNumbers "objects\oo_keyhandler.sqf";
	//call compile preprocessFileLineNumbers "objects\oo_optimizefps.sqf";
	call compile preprocessFileLineNumbers "objects\oo_sound.sqf";
	call compile preprocessFileLineNumbers "gui\oo_hud.sqf";
	call compile preprocessFileLineNumbers "gui\oo_vitems.sqf";
	call compile preprocessFileLineNumbers "gui\oo_UI_loading.sqf";
	call compile preprocessFileLineNumbers "gui\oo_uirequirement.sqf";
	call compile preprocessFileLineNumbers "scripts\fnc_credits.sqf";
	[] spawn compile preprocessFileLineNumbers "gui\cursor.sqf";

	fnc_extraction_clientside = compile preprocessFileLineNumbers "meka\m0_extraction_clientside.sqf";
	fnc_relayradio_clientside = compile preprocessFileLineNumbers "meka\m2_relayradio_clientside.sqf";
	fnc_sergent_clientside = compile preprocessFileLineNumbers "meka\m3_sergent_clientside.sqf";
	fnc_village_clientside = compile preprocessFileLineNumbers "meka\m5_village_clientside.sqf";
	fnc_industrialsite_clientside = compile preprocessFileLineNumbers "meka\m6_industrialsite_clientside.sqf";
	fnc_militarycasern_clientside = compile preprocessFileLineNumbers "meka\m7_militarycasern_clientside.sqf";
	fnc_sitex_clientside = compile preprocessFileLineNumbers "meka\m8_sitex_clientside.sqf";

	fnc_fileexist = compile preprocessFileLineNumbers "scripts\fnc_fileexist.sqf";
	fnc_weathers = compile preprocessFileLineNumbers "scripts\real_weather.sqf";
	fnc_getnearestplayer = compile preprocessFileLineNumbers "scripts\fnc_getnearestplayer.sqf";
	fnc_inventorycam = compile preprocessFileLineNumbers "scripts\fnc_inventorycam.sqf";

	vitems_eating = compile preprocessFileLineNumbers "vitems\generic\eating.sqf";
	vitems_drinking = compile preprocessFileLineNumbers "vitems\generic\drinking.sqf";
	vitems_digesting = compile preprocessFileLineNumbers "vitems\generic\digesting.sqf";
	vitems_boosting = compile preprocessFileLineNumbers "vitems\generic\boosting.sqf";
	vitems_firing = compile preprocessFileLineNumbers "vitems\generic\firing.sqf";
	vitems_fueling = compile preprocessFileLineNumbers "vitems\generic\fueling.sqf";
	vitems_explosing = compile preprocessFileLineNumbers "vitems\generic\explosing.sqf";
	vitems_tracking = compile preprocessFileLineNumbers "vitems\generic\tracking.sqf";
	vitems_healing = compile preprocessFileLineNumbers "vitems\generic\healing.sqf";
	vitems_healingvirus = compile preprocessFileLineNumbers "vitems\generic\healingvirus.sqf";
	vitems_transforming = compile preprocessFileLineNumbers "vitems\generic\transforming.sqf";
	vitems_banding = compile preprocessFileLineNumbers "vitems\generic\banding.sqf";

	[] spawn fnc_weathers;
	//optimizefps = "new" call OO_OPTIMIZEFPS;

	// Initiliaze End
	callEnd = {
		private _end = _this;
		["End1", true, 5, true] spawn BIS_fnc_endMission;
	};

	// Relai Radio Mission
	[] spawn fnc_relayradio_clientside;
	// Sergent mission handler
	[] spawn fnc_sergent_clientside;
	// Sergent mission handler
	[] spawn fnc_extraction_clientside;
	// Village mission handler
	[] spawn fnc_village_clientside;
	// Military casern mission handler
	[] spawn fnc_militarycasern_clientside;
	// Military casern mission handler
	[] spawn fnc_industrialsite_clientside;
	// Military site x
	[] spawn fnc_sitex_clientside;


	callTabnote = {
		["setPages", _this] call tabnote;
		["showFile", true] call hud;
	};

	// Initiliaze Bus message
	bmeclient = "new" call OO_BME;
	private _result = false;
	while { _result isEqualTo false} do { 
		_result= ["remoteCall", ["BmeIsAlive", "" , 2, false]] call bmeclient;
		sleep 1;
	};
	systemchat "BME 2.0 is initialized";

	player addEventHandler ["InventoryOpened", {execVM "gui\loading.sqf";true;}];
	player addEventHandler ["InventoryClosed", {player addEventHandler ["InventoryOpened", {execVM "gui\loading.sqf";true;}];}];

	// Turn off button move to player position
	addMissionEventHandler ["Map", {
		params ["_mapIsOpened", "_mapIsForced"];
		private _display = uiNamespace getVariable "RSCDiary";
		private _ctrl = _display displayCtrl 1202;
		_ctrl ctrlEnable false;
		_ctrl ctrlsettextcolor [0,0,0,0];
		_ctrl ctrlSetTooltip "";
		_ctrl ctrlCommit 0;
	}];

	player addEventHandler ["Reloaded", {
		params ["_unit", "_weapon", "_muzzle", "_newMagazine", "_oldMagazine"];
		if!(_oldMagazine isEqualTo "") then {
			private _type = _oldMagazine select 0;
			private _mags = magazines player;
			private _count = 0;
			{
				if (_x isEqualTo _type) then {_count = _count + 1;};
			} forEach _mags;
			["setItemCount", [_type, _count]] call capcontainer;
		};
	}];

	fnc_killed = {
		private _UID = getPlayerUID player;
		["remoteCall", ["getReset", _UID , 2, []]] call bmeclient;
		closeDialog 0;
		sleep 2;
		endmission "END4";
	};

	player addEventHandler ["Killed", {
		[] spawn fnc_killed;
	}];

	// Initialize hud
	1000 cutRsc ["hud", "PLAIN"];
	health = "new" call OO_HEALTH;
	healthresume = "new" call OO_HEALTHRESUME;
	keyhandler = "new" call OO_KEYHANDLER;
	mygear = "new" call OO_ARMAGEAR;
	tabnote = "new" call OO_TABNOTE;

	player setAnimSpeedCoef 1;
	player enableFatigue false; 
	player enableStamina false;
	player allowSprint true;

	// load inventory
	// inventaire de base
	//["armyradio","wrench","medicalkit","survivalration","H_HelmetB_tna_F","U_B_T_Soldier_F","30Rnd_65x39_caseless_khaki_mag","V_PlateCarrier1_tna_F","16Rnd_9x21_Mag","B_Carryall_oli_BTAmmo_F","acc_pointer_IR","optic_Aco","arifle_MX_khk_F","hgun_P07_khk_F","Binocular","ItemMap","ItemCompass","ItemWatch", "SmokeShellBlue"];
	//private _content = [["arifle_MSBS65_F",1], ["launch_RPG32_camo_F", 1],["armyradio",-1],["wrench",-1],["medicalkit",1],["survivalration",5], ["screwdriver", -1],["waterbottle",1],["30Rnd_65x39_caseless_mag_Tracer", 5],["O_NVGoggles_grn_F", -1],["RPG32_F", 2], ["RPG32_HE_F", 2], ["launch_RPG32_green_F", 1]];

	capcontainer = ["new", [netId player, ((getModelInfo player) select 0)]] call OO_CONTAINER;
	private _UID = getPlayerUID player;
	private _backup = ["remoteCall", ["getBackup", _UID , 2, []]] call bmeclient;
	private _content = [];

	if(_backup isEqualTo []) then { 
		_content = [["computetab", 1],["armyradio",1],["medicalkit",1],["survivalration",2], ["Binocular", 1], ["ItemMap",1], ["ItemCompass", 1]];
		["overLoad", _content] call capcontainer;
		["loadInventory", player] call capcontainer;
		systemchat "Inventory load";
		private _position = position player;
		_position = ["remoteCall", ["getSpawnPosition", "" , 2, _position]] call bmeclient;
		player setpos _position;
	} else {
		player setpos (_backup select 0);
		player setdir (_backup select 1);
		private _health = _backup select 2;
		["unserialize", _health] call health;
		_content = _backup select 3;
		private _stuff = _backup select 4;
		private _gear = "new" call OO_ARMAGEAR;
		["clearInventory", player] call _gear;
		["overLoad", _content] call capcontainer;
		["loadInventory", player] call capcontainer;
		["putAllStuff", _stuff] call mygear;
		systemchat "Inventory restored";
	};
	"save" call capcontainer;
	sleep 5;
	15203 cutText ["","PLAIN", 0];

	[] spawn {
		while { true } do {
			sleep 60;
			private _health = "serialize" call health;
			private _stuff = "getAllStuff" call mygear;
			["remoteSpawn", ["getSave", [_health, _stuff, player] , "server"]] call bmeclient;
			systemChat format["save: %1", time];
		};
	};


	//onMapSingleClick "player setpos _pos; true";
	if!(isserver) then {
		for "_i" from 1 to 74 step 1 do {
			private _markername = "enemy" + str(_i);
			deleteMarker _markername;
		};
	};


	//(selectRandom ["Cock_random_F", "Fin_blackwhite_F", "Fin_sand_F"]) createUnit [position player, _group];
	//controltower_01_f.p3d

	// initialize ui requirement
	uirequirement = "new" call oo_uirequirement;

	// manage weight vs speed
	[] spawn {
		private _overload = 0;
		private _hadbackpack = (unitBackpack player);
		private _hadvest = vest player;
		private _haduniform = uniform player;
		private _capacity = 0;
		private _overloadtag = false;
		private _boost = 0;
		while { true } do {
			_capacity = ("getCapacity" call mygear) * 1.2;
			if("getBoost" call health) then {_boost = 50;}else{_boost = 0;};
			_overload = 100 - (floor((("countWeight" call capcontainer) + 0.001) * 100) / _capacity) + _boost;
			switch (true) do { 
				case (_overload > 90) : { player setAnimSpeedCoef 1.35;_overloadtag = false;};
				case (_overload > 80) : { player setAnimSpeedCoef 1.3;_overloadtag = false;};
				case (_overload > 70) : { player setAnimSpeedCoef 1.2;_overloadtag = false;};
				case (_overload > 60) : { player setAnimSpeedCoef 1.1;_overloadtag = false;};
				case (_overload > 50) : { player setAnimSpeedCoef 1;_overloadtag = false;};
				case (_overload > 40) : { player setAnimSpeedCoef 0.9;_overloadtag = true;};
				case (_overload > 30) : { player setAnimSpeedCoef 0.8;_overloadtag = true;};
				case (_overload > 20) : { player setAnimSpeedCoef 0.7;_overloadtag = true;};
				case (_overload > 10) : { player setAnimSpeedCoef 0.6;_overloadtag = true;};
				default { player setAnimSpeedCoef 0.5;_overloadtag = true;}; 
			};
			["setShowWeight", _overloadtag] call hud;
			sleep 1;
		};
	};

	mysound = "new" call OO_SOUND;

	#undef DEBUGFPS
	#ifdef DEBUGFPS
	[] spawn {
		while { true } do {
			systemChat format ["diag: %1 %2 %3", diag_deltaTime, diag_fps, floor(player distance cursorObject)];
			sleep 0.01;
		};
	};
	#endif

	playMusic "ambientmusic2";
	titleText ["<t size='6'>e</t><t color='#ff9d00' size='6'>X</t><t size='6'>tinction</t><br/>by Code34", "PLAIN", -1, true, true];

	_myLanguage = language;
	switch (_myLanguage) do { 
		case "French" : {myLanguage = "meka\story\fr\"};
		default {myLanguage = "meka\story\eng\"}; 
	};

	sleep 20;
	[localize "Str_somewhere", format ["%1 %2", localize "Str_Year", date select 0]] spawn BIS_fnc_infoText;

	sleep 20;
	hintSilent parseText format ["<t size='1.4' color='#ff0000' align='left'>%1:</t><t size='1.20' align='left'><br/><br/>%2<br/><br/>%3<br/>%4<br/><br/>%5<br/><br/>%6</t>", localize "Str_instructions", localize "Str_Welcome", localize "Str_pressi", localize "Str_pressF1", localize "Str_havefun", localize "Str_author"];

	// initialize mission tab
	["setPages", [myLanguage+"m1_introduction1.html",myLanguage+"m1_introduction2.html"]] call tabnote;
	["showFile", true] call hud;