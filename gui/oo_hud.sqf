#include "oop.h"
CLASS("oo_hud")

	PRIVATE UI_VARIABLE("control", "MainLayer");
	PRIVATE UI_VARIABLE("control", "OOP_MainLayer_100");
	PRIVATE UI_VARIABLE("control", "OOP_Picture_drink");
	PRIVATE UI_VARIABLE("control", "OOP_Picture_food");
	PRIVATE UI_VARIABLE("control", "OOP_Picture_life");
	PRIVATE UI_VARIABLE("control", "OOP_Picture_virus");
	PRIVATE UI_VARIABLE("control", "OOP_Picture_zombie");
	PRIVATE UI_VARIABLE("control", "OOP_Picture_drinkstate");
	PRIVATE UI_VARIABLE("control", "OOP_Picture_foodstate");
	PRIVATE UI_VARIABLE("control", "OOP_Picture_lifestate");
	PRIVATE UI_VARIABLE("control", "OOP_Picture_virusstate");
	PRIVATE UI_VARIABLE("control", "OOP_Picture_zombiestate");
	PRIVATE UI_VARIABLE("control", "OOP_Picture_file");
	PRIVATE UI_VARIABLE("control", "OOP_Picture_weight");
	PRIVATE UI_VARIABLE("control", "OOP_Picture_blood");
	PRIVATE UI_VARIABLE("control", "OOP_SubLayer_101");
	PRIVATE UI_VARIABLE("control", "OOP_Text_drink");
	PRIVATE UI_VARIABLE("control", "OOP_Text_food");
	PRIVATE UI_VARIABLE("control", "OOP_Text_life");
	PRIVATE UI_VARIABLE("control", "OOP_Text_virus");
	PRIVATE UI_VARIABLE("control", "OOP_Text_zombie");
	PRIVATE UI_VARIABLE("control", "OOP_Text_file");
	PRIVATE UI_VARIABLE("control", "OOP_Text_weapon");
	PRIVATE UI_VARIABLE("control", "OOP_Text_nbmags");
	PRIVATE UI_VARIABLE("control", "OOP_Text_nbammos");

	PRIVATE UI_VARIABLE("display", "Display");
	PRIVATE VARIABLE("bool", "isshowfile");
	PRIVATE VARIABLE("bool", "isshowweight");
	PRIVATE VARIABLE("bool", "isshowzombie");

	PUBLIC FUNCTION("display", "constructor"){
		disableSerialization;
		MEMBER("Display", _this);
		MEMBER("MainLayer", _this displayCtrl 100);
		MEMBER("OOP_MainLayer_100", _this displayCtrl 100);
		MEMBER("OOP_Picture_drink", _this displayCtrl 102);
		MEMBER("OOP_Picture_food", _this displayCtrl 103);
		MEMBER("OOP_Picture_life", _this displayCtrl 104);
		MEMBER("OOP_Picture_virus", _this displayCtrl 105);
		MEMBER("OOP_Picture_zombie", _this displayCtrl 112);
		MEMBER("OOP_Picture_drinkstate", _this displayCtrl 1020);
		MEMBER("OOP_Picture_foodstate", _this displayCtrl 1030);
		MEMBER("OOP_Picture_lifestate", _this displayCtrl 1040);
		MEMBER("OOP_Picture_virusstate", _this displayCtrl 1050);
		MEMBER("OOP_Picture_zombiestate", _this displayCtrl 1120);
		MEMBER("OOP_Picture_file", _this displayCtrl 110);
		MEMBER("OOP_Picture_weight", _this displayCtrl 120);
		MEMBER("OOP_Picture_blood", _this displayCtrl 111);
		MEMBER("OOP_SubLayer_101", _this displayCtrl 101);
		MEMBER("OOP_Text_drink", _this displayCtrl 106);
		MEMBER("OOP_Text_food", _this displayCtrl 107);
		MEMBER("OOP_Text_life", _this displayCtrl 108);
		MEMBER("OOP_Text_virus", _this displayCtrl 109);
		MEMBER("OOP_Text_zombie", _this displayCtrl 113);
		MEMBER("OOP_Text_file", _this displayCtrl 114);
		MEMBER("OOP_Text_weapon", _this displayCtrl 118);
		MEMBER("OOP_Text_nbmags", _this displayCtrl 185);
		MEMBER("OOP_Text_nbammos", _this displayCtrl 184);
		MEMBER("isshowfile", false);
		MEMBER("isshowweight", false);
		MEMBER("isshowzombie", false);
		SPAWN_MEMBER("Init", nil);
	};

	PUBLIC FUNCTION("", "Init"){
		//Add your content here to init display
		sleep 5;
		MEMBER("OOP_Picture_file", nil) ctrlShow false;
		SPAWN_MEMBER("hintFile", nil);
		SPAWN_MEMBER("hintWeight", nil);
		SPAWN_MEMBER("hintBlood", nil);
		SPAWN_MEMBER("hintZombie", nil);
		SPAWN_MEMBER("hintWeapon", nil);
	};

	PUBLIC FUNCTION("","hintWeapon"){
		while { true } do {
			private _name = getText(configfile >> "cfgWeapons" >> (currentWeapon player) >> "displayName");
			MEMBER("OOP_Text_weapon", nil) ctrlSetText _name;
			private _nbammos = player ammo (currentWeapon player);
			MEMBER("OOP_Text_nbammos", nil) ctrlSetText str(_nbammos);
			private _index = ["findItemIndex", currentMagazine player] call capcontainer;
			private _nbmags = 0;
			if(_index > -1) then {_nbmags = (["getItem", _index] call capcontainer) select 4;} else {_nbmags = 0;};
			MEMBER("OOP_Text_nbmags", nil) ctrlSetText str(_nbmags);
			sleep 0.1;
		};
	};

	PUBLIC FUNCTION("", "hintWeight"){
		while { true } do {
			if(MEMBER("isshowweight", nil)) then {
				MEMBER("OOP_Picture_weight", nil) ctrlShow true;
				MEMBER("OOP_Picture_weight", nil) ctrlSetText "paa\weight.paa";
			} else{
				MEMBER("OOP_Picture_weight", nil) ctrlShow false;
			};
			sleep 1;
		};
	};

	PUBLIC FUNCTION("", "hintFile"){
		while { true } do {
			if(MEMBER("isshowfile", nil)) then {
				MEMBER("OOP_Picture_file", nil) ctrlShow true;
				MEMBER("OOP_Text_file", nil) ctrlShow true;
				MEMBER("OOP_Picture_file", nil) ctrlSetText "paa\file.paa";
				MEMBER("OOP_Text_file", nil) ctrlSetText "F1";
				sleep 1;
				MEMBER("OOP_Picture_file", nil) ctrlShow false;
				MEMBER("OOP_Text_file", nil) ctrlShow false;
			};
			sleep 1;
		};
	};

	PUBLIC FUNCTION("", "hintBlood"){
		while { true } do {
			if(getDammage player > 0) then {
				MEMBER("OOP_Picture_blood", nil) ctrlShow true;
			} else {
				MEMBER("OOP_Picture_blood", nil) ctrlShow false;
			};
			sleep 1;
		};
	};

	PUBLIC FUNCTION("", "hintZombie"){
		while { true } do {
			if(MEMBER("isshowzombie", nil)) then {
				MEMBER("OOP_Picture_zombie", nil) ctrlShow true;
				MEMBER("OOP_Text_zombie", nil) ctrlShow true;
				MEMBER("OOP_Picture_zombie", nil) ctrlSetText "paa\zombie1.paa";
			} else {
				MEMBER("OOP_Picture_zombie", nil) ctrlShow false;
				MEMBER("OOP_Text_zombie", nil) ctrlShow false;
			};
			sleep 1;
		};
	};

	PUBLIC FUNCTION("bool", "setShowZombie"){
		MEMBER("isshowzombie", _this);
	};

	PUBLIC FUNCTION("bool", "setShowWeight"){
		MEMBER("isshowweight", _this);
	};

	PUBLIC FUNCTION("bool", "showFile"){
		if(_this) then {
			playsound "newmessage";
		};
		MEMBER("isshowfile", _this);
	};

	PUBLIC FUNCTION("scalar", "setDrink"){
		private _text = format ["%1", _this]+'%';
		MEMBER("OOP_Text_drink",nil)  ctrlSetText _text;
		if(_this > 20) then {
			MEMBER("OOP_Picture_drink", nil) ctrlSetText "paa\drink2.paa";
		} else {
			MEMBER("OOP_Picture_drink", nil) ctrlSetText "paa\drink3.paa";
		};
	};

	PUBLIC FUNCTION("string", "setDrinkState"){
	private _state = _this;
		switch (_state) do { 
			case "up" : {MEMBER("OOP_Picture_drinkstate", nil) ctrlSetText "paa\uparrow.paa";}; 
			case "down" : {MEMBER("OOP_Picture_drinkstate", nil) ctrlSetText "paa\downarrow.paa";}; 
			default {MEMBER("OOP_Picture_drinkstate", nil) ctrlSetText "";}; 
		};
	};

	PUBLIC FUNCTION("scalar", "setFood"){
		private _text = format ["%1", _this]+'%';
		MEMBER("OOP_Text_food", nil) ctrlSetText _text;
		if(_this > 20) then {
			MEMBER("OOP_Picture_food", nil) ctrlSetText "paa\food2.paa";
		} else {
			MEMBER("OOP_Picture_food", nil) ctrlSetText "paa\food3.paa";
		};
	};

	PUBLIC FUNCTION("string", "setFoodState"){
	private _state = _this;
		switch (_state) do { 
			case "up" : {MEMBER("OOP_Picture_foodstate", nil) ctrlSetText "paa\uparrow.paa";}; 
			case "down" : {MEMBER("OOP_Picture_foodstate", nil) ctrlSetText "paa\downarrow.paa";}; 
			default {MEMBER("OOP_Picture_foodstate", nil) ctrlSetText "";}; 
		};
	};


	PUBLIC FUNCTION("scalar", "setLife"){
		private _text = format ["%1", _this]+'%';
		MEMBER("OOP_Text_life", nil) ctrlSetText _text;
		if(_this > 20) then {
			MEMBER("OOP_Picture_life", nil) ctrlSetText "paa\life2.paa";
		} else {
			if(_this > 0) then {
				MEMBER("OOP_Picture_life", nil) ctrlSetText "paa\life3.paa";
			};
		};
	};

	PUBLIC FUNCTION("string", "setLifeState"){
	private _state = _this;
		switch (_state) do { 
			case "up" : {MEMBER("OOP_Picture_lifestate", nil) ctrlSetText "paa\uparrow.paa";}; 
			case "down" : {MEMBER("OOP_Picture_lifestate", nil) ctrlSetText "paa\downarrow.paa";}; 
			default {MEMBER("OOP_Picture_lifestate", nil) ctrlSetText "";}; 
		};
	};

	PUBLIC FUNCTION("scalar", "setVirus"){
		private _text = format ["%1", _this]+'%';
		MEMBER("OOP_Text_virus", nil) ctrlSetText _text;
		//if(_this > 50) then {
			MEMBER("OOP_Picture_virus", nil) ctrlSetText "paa\virus1.paa";
		//} else {
		//	MEMBER("OOP_Picture_virus", nil) ctrlSetText "paa\virus.paa";
		//};
	};

	PUBLIC FUNCTION("string", "setVirusState"){
	private _state = _this;
		switch (_state) do { 
			case "up" : {MEMBER("OOP_Picture_virusstate", nil) ctrlSetText "paa\uparrow.paa";}; 
			case "down" : {MEMBER("OOP_Picture_virusstate", nil) ctrlSetText "paa\downarrow.paa";}; 
			default {MEMBER("OOP_Picture_virusstate", nil) ctrlSetText "";}; 
		};
	};


	PUBLIC FUNCTION("scalar", "setZombie"){
		if(_this isEqualTo 0) then {
			MEMBER("setShowzombie", false);
		} else {
			private _text = format ["%1", _this]+'%';
			MEMBER("OOP_Text_zombie", nil) ctrlSetText _text;
			MEMBER("setShowzombie", true);
		};
	};

	PUBLIC FUNCTION("string", "setZombieState"){
	private _state = _this;
		switch (_state) do { 
			case "up" : {MEMBER("OOP_Picture_zombiestate", nil) ctrlSetText "paa\uparrow.paa";}; 
			case "down" : {MEMBER("OOP_Picture_zombiestate", nil) ctrlSetText "paa\downarrow.paa";}; 
			default {MEMBER("OOP_Picture_zombiestate", nil) ctrlSetText "";}; 
		};
	};

	PUBLIC FUNCTION("", "getDisplay") FUNC_GETVAR("Display");
	PUBLIC FUNCTION("", "getMainLayer") FUNC_GETVAR("MainLayer");
	PUBLIC FUNCTION("", "getOOP_MainLayer_100") FUNC_GETVAR("OOP_MainLayer_100");
	PUBLIC FUNCTION("", "getOOP_Picture_drink") FUNC_GETVAR("OOP_Picture_drink");
	PUBLIC FUNCTION("", "getOOP_Picture_food") FUNC_GETVAR("OOP_Picture_food");
	PUBLIC FUNCTION("", "getOOP_Picture_life") FUNC_GETVAR("OOP_Picture_life");
	PUBLIC FUNCTION("", "getOOP_Picture_virus") FUNC_GETVAR("OOP_Picture_virus");
	PUBLIC FUNCTION("", "getOOP_Picture_file") FUNC_GETVAR("OOP_Picture_file");
	PUBLIC FUNCTION("", "getOOP_Picture_blood") FUNC_GETVAR("OOP_Picture_blood");
	PUBLIC FUNCTION("", "getOOP_Picture_zombie") FUNC_GETVAR("OOP_Picture_zombie");	
	PUBLIC FUNCTION("", "getOOP_SubLayer_101") FUNC_GETVAR("OOP_SubLayer_101");
	PUBLIC FUNCTION("", "getOOP_Text_drink") FUNC_GETVAR("OOP_Text_drink");
	PUBLIC FUNCTION("", "getOOP_Text_food") FUNC_GETVAR("OOP_Text_food");
	PUBLIC FUNCTION("", "getOOP_Text_life") FUNC_GETVAR("OOP_Text_life");
	PUBLIC FUNCTION("", "getOOP_Text_virus") FUNC_GETVAR("OOP_Text_virus");
	PUBLIC FUNCTION("", "getOOP_Text_zombie") FUNC_GETVAR("OOP_Text_zombie");	
	PUBLIC FUNCTION("control", "setMainLayer"){ MEMBER("MainLayer", _this); };
	PUBLIC FUNCTION("control", "setOOP_MainLayer_100"){ MEMBER("OOP_MainLayer_100", _this); };
	PUBLIC FUNCTION("control", "setOOP_Picture_drink"){ MEMBER("OOP_Picture_drink", _this); };
	PUBLIC FUNCTION("control", "setOOP_Picture_food"){ MEMBER("OOP_Picture_food", _this); };
	PUBLIC FUNCTION("control", "setOOP_Picture_life"){ MEMBER("OOP_Picture_life", _this); };
	PUBLIC FUNCTION("control", "setOOP_Picture_virus"){ MEMBER("OOP_Picture_virus", _this); };
	PUBLIC FUNCTION("control", "setOOP_Picture_file"){ MEMBER("OOP_Picture_file", _this); };
	PUBLIC FUNCTION("control", "setOOP_Picture_blood"){ MEMBER("OOP_Picture_blood", _this); };
	PUBLIC FUNCTION("control", "setOOP_Picture_zombie"){ MEMBER("OOP_Picture_zombie", _this); };	
	PUBLIC FUNCTION("control", "setOOP_SubLayer_101"){ MEMBER("OOP_SubLayer_101", _this); };
	PUBLIC FUNCTION("control", "setOOP_Text_drink"){ MEMBER("OOP_Text_drink", _this); };
	PUBLIC FUNCTION("control", "setOOP_Text_food"){ MEMBER("OOP_Text_food", _this); };
	PUBLIC FUNCTION("control", "setOOP_Text_life"){ MEMBER("OOP_Text_life", _this); };
	PUBLIC FUNCTION("control", "setOOP_Text_virus"){ MEMBER("OOP_Text_virus", _this); };
	PUBLIC FUNCTION("control", "setOOP_Text_zombie"){ MEMBER("OOP_Text_zombie", _this); };
	PUBLIC FUNCTION("control", "setOOP_Text_file"){ MEMBER("OOP_Text_file", _this); };
	PUBLIC FUNCTION("display", "setDisplay"){ MEMBER("Display", _this); };


	PUBLIC FUNCTION("", "deconstructor"){
		DELETE_UI_VARIABLE("MainLayer");
		DELETE_UI_VARIABLE("OOP_MainLayer_100");
		DELETE_UI_VARIABLE("OOP_Picture_drink");
		DELETE_UI_VARIABLE("OOP_Picture_food");
		DELETE_UI_VARIABLE("OOP_Picture_life");
		DELETE_UI_VARIABLE("OOP_Picture_virus");
		DELETE_UI_VARIABLE("OOP_Picture_file");
		DELETE_UI_VARIABLE("OOP_Picture_blood");
		DELETE_UI_VARIABLE("OOP_Picture_zombie");
		DELETE_UI_VARIABLE("OOP_SubLayer_101");
		DELETE_UI_VARIABLE("OOP_Text_drink");
		DELETE_UI_VARIABLE("OOP_Text_food");
		DELETE_UI_VARIABLE("OOP_Text_life");
		DELETE_UI_VARIABLE("OOP_Text_virus");
		DELETE_UI_VARIABLE("OOP_Text_zombie");
		DELETE_UI_VARIABLE("OOP_Text_file");
		DELETE_UI_VARIABLE("OOP_Text_weapon");
		DELETE_UI_VARIABLE("OOP_Text_nbmags");
		DELETE_UI_VARIABLE("OOP_Text_nbammos");

		DELETE_UI_VARIABLE("Display");
		DELETE_VARIABLE("isshowfile");
		DELETE_VARIABLE("isshowzombie");
	};
ENDCLASS;
