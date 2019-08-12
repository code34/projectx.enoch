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
	call compile preprocessFileLineNumbers "vitems\oo_armagear.sqf";
	call compile preprocessFileLineNumbers "vitems\oo_bme.sqf";
	call compile preprocessFileLineNumbers "vitems\oo_model.sqf";
	call compile preprocessFileLineNumbers "objects\oo_health.sqf";
	call compile preprocessFileLineNumbers "objects\oo_healthresume.sqf";	
	call compile preprocessFileLineNumbers "objects\oo_tabnote.sqf";
	call compile preprocessFileLineNumbers "objects\oo_camera.sqf";
	call compile preprocessFileLineNumbers "objects\oo_keyhandler.sqf";
	call compile preprocessFileLineNumbers "gui\oo_hud.sqf";
	call compile preprocessFileLineNumbers "gui\oo_vitems.sqf";
	call compile preprocessFileLineNumbers "gui\oo_UI_loading.sqf";
	call compile preprocessFileLineNumbers "gui\oo_uirequirement.sqf";
	[] spawn compile preprocessFileLineNumbers "gui\cursor.sqf";

	fnc_relayradio_clientside = compile preprocessFileLineNumbers "meka\relayradio_clientside.sqf";
	fnc_sergent_clientside = compile preprocessFileLineNumbers "meka\sergent_clientside.sqf";
	fnc_extraction_clientside = compile preprocessFileLineNumbers "meka\extraction_clientside.sqf";
	fnc_village_clientside = compile preprocessFileLineNumbers "meka\village_clientside.sqf";
	fnc_militarycasern_clientside = compile preprocessFileLineNumbers "meka\militarycasern_clientside.sqf";
	fnc_industrialsite_clientside = compile preprocessFileLineNumbers "meka\industrialsite_clientside.sqf";

	fnc_weathers = compile preprocessFileLineNumbers "scripts\real_weather.sqf";
	fnc_getnearestplayer = compile preprocessFileLineNumbers "scripts\fnc_getnearestplayer.sqf";

	vitems_eating = compile preprocessFileLineNumbers "vitems\generic\eating.sqf";
	vitems_drinking = compile preprocessFileLineNumbers "vitems\generic\drinking.sqf";
	vitems_digesting = compile preprocessFileLineNumbers "vitems\generic\digesting.sqf";
	vitems_firing = compile preprocessFileLineNumbers "vitems\generic\firing.sqf";
	vitems_explosing = compile preprocessFileLineNumbers "vitems\generic\explosing.sqf";
	vitems_tracking = compile preprocessFileLineNumbers "vitems\generic\tracking.sqf";
	vitems_healing = compile preprocessFileLineNumbers "vitems\generic\healing.sqf";
	vitems_healingvirus = compile preprocessFileLineNumbers "vitems\generic\healingvirus.sqf";
	vitems_transforming = compile preprocessFileLineNumbers "vitems\generic\transforming.sqf";
	vitems_banding = compile preprocessFileLineNumbers "vitems\generic\banding.sqf";

	[] spawn fnc_weathers;

	// Initiliaze End
	callEnd = {
		private _end = _this;
		["End1", true, 5, true] spawn BIS_fnc_endMission;
	};

	// Sergent mission handler
	[] spawn fnc_sergent_clientside;

	// Sergent mission handler
	extractionposition = [];
	extractionvehicle = objNull;
	callExtractionMission = {
		extractionposition = _this select 0;
		extractionvehicle = _this select 1;
	};
	[] spawn fnc_extraction_clientside;

	// Village mission handler
	villageposition = [];
	callVillageMission = {
		villageposition = _this select 0;
	};
	[] spawn fnc_village_clientside;

	// Military casern mission handler
	militarycasernposition = [];
	callMilitaryCasernMission = {
		militarycasernposition = _this select 0;
	};
	[] spawn fnc_militarycasern_clientside;

	// Military casern mission handler
	industrialsiteposition = [];
	callIndustrialSiteMission = {
		industrialsiteposition = _this select 0;
	};
	[] spawn fnc_industrialsite_clientside;

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

	// Random respawn position
/*	private _position = position player;
	_position = ["remoteCall", ["getSpawnPosition", "" , 2, _position]] call bmeclient;
	player setpos _position;
	player setpos(player getRelPos [random 250,random 360]);*/

	player addEventHandler ["InventoryOpened", {execVM "gui\loading.sqf";true;}];
	player addEventHandler ["InventoryClosed", {player addEventHandler ["InventoryOpened", {execVM "gui\loading.sqf";true;}];}];

	// Initialize hud
	1000 cutRsc ["hud", "PLAIN"];
	health = "new" call OO_HEALTH;
	healthresume = "new" call OO_HEALTHRESUME;

	player setAnimSpeedCoef 1.40;
	player enableFatigue false; 
	player enableStamina false;
	player allowSprint true;

	keyhandler = "new" call OO_KEYHANDLER;

	// load inventory
	capcontainer = ["new", [netId player, ((getModelInfo player) select 0)]] call OO_CONTAINER;
	//private _content = 	[["armyradio",-1],["wrench",-1],["medicalkit",1],["survivalration",5],["arifle_MX_khk_F",1],["hgun_P07_khk_F",1],["Binocular",1],["30Rnd_65x39_caseless_khaki_mag",5],["16Rnd_9x21_Mag",2]];
	private _content = 	[["armyradio",-1],["wrench",-1],["medicalkit",1],["survivalration",5], ["screwdriver", -1]];
	["overLoad", _content] call capcontainer;
	"loadInventory" call capcontainer;
	"save" call capcontainer;
	systemchat "Inventory load";

	// initialize ui requirement
	uirequirement = "new" call oo_uirequirement;

	// manage weight vs speed
	[] spawn {
		private _weight = 0;
		while { true } do {
			_weight = "countWeight" call capcontainer;
			switch (true) do { 
				case (_weight > 60) : { 
					player setAnimSpeedCoef 0.1;
				}; 
				case (_weight > 40) : { 
					player setAnimSpeedCoef 0.7;
				}; 
				case (_weight > 30) : { 
					player setAnimSpeedCoef 0.8;
				};
				case (_weight > 20) : { 
					player setAnimSpeedCoef 1;
				};
				case (_weight > 10) : { 
					player setAnimSpeedCoef 1.2;
				};
				default { player setAnimSpeedCoef 1.4; }; 
			};
			sleep 1;
		};
	};

	// initialize mission tab
	tabnote = "new" call OO_TABNOTE;
	["setPages", ["meka\story\introduction1.html","meka\story\introduction2.html"]] call tabnote;
	["showFile", true] call hud;

/*	copyToClipboard format ["%1 %2", getText(configfile >> "cfgWeapons" >> "hgun_P07_khk_F">> "picture"), getText(configfile >> "cfgMagazines" >> "16Rnd_9x21_Mag" >> "picture")];*/

/*	["arifle_MX_khk_F","hgun_P07_khk_F"] 
	["30Rnd_65x39_caseless_khaki_mag","30Rnd_65x39_caseless_khaki_mag","30Rnd_65x39_caseless_khaki_mag","30Rnd_65x39_caseless_khaki_mag","30Rnd_65x39_caseless_khaki_mag","30Rnd_65x39_caseless_khaki_mag","30Rnd_65x39_caseless_khaki_mag","30Rnd_65x39_caseless_khaki_mag","30Rnd_65x39_caseless_khaki_mag","30Rnd_65x39_caseless_khaki_mag","30Rnd_65x39_caseless_khaki_mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag"]*/

/*	addMissionEventHandler ["Draw3D", {
		    if((typeOf cursorObject) isEqualTo "House_F") then {
			    private _object = cursorObject;
			    private _path = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
			    private _paa = _path + "paa\radiocenter.paa";
			    
			    private _index = 0;
			    private _positions = [];
				while { !((_object buildingPos _index) isEqualTo [0,0,0]) } do {
					_positions pushBack (_object buildingPos _index);
					_index = _index + 1;
				};

				{
					drawIcon3D [_paa, [1,1,1,10], _x , 1, 1, 2, "Radio Amplifier", 0, 0.03, "TahomaB", "center", true];
				}foreach _positions;
			};
	}];*/

	// splash screen
	//["Paste",["Enoch",[554.372,1133.97,17.4291],67.7519,0.75,[-9.87417,0],0,0,600,0.3,0,1,0,1]] call bis_fnc_camera;

/*	while { true } do {
		private _position = (lineIntersectsSurfaces [getPosASL player, getPosASL cursorObject, objNull, objNull, false, -1]);
		//private _distance = player distance _position;
		systemchat format ["%1", _position];
		sleep 1;
	};*/