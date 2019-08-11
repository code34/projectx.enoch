#include "oop.h"
CLASS("oo_hud")

	PRIVATE UI_VARIABLE("control", "MainLayer");
	PRIVATE UI_VARIABLE("control", "OOP_MainLayer_100");
	PRIVATE UI_VARIABLE("control", "OOP_Picture_drink");
	PRIVATE UI_VARIABLE("control", "OOP_Picture_food");
	PRIVATE UI_VARIABLE("control", "OOP_Picture_life");
	PRIVATE UI_VARIABLE("control", "OOP_Picture_virus");
	PRIVATE UI_VARIABLE("control", "OOP_Picture_file");
	PRIVATE UI_VARIABLE("control", "OOP_Picture_blood");
	PRIVATE UI_VARIABLE("control", "OOP_Picture_zombie");
	PRIVATE UI_VARIABLE("control", "OOP_SubLayer_101");
	PRIVATE UI_VARIABLE("control", "OOP_Text_drink");
	PRIVATE UI_VARIABLE("control", "OOP_Text_food");
	PRIVATE UI_VARIABLE("control", "OOP_Text_life");
	PRIVATE UI_VARIABLE("control", "OOP_Text_virus");
	PRIVATE UI_VARIABLE("control", "OOP_Text_zombie");
	PRIVATE UI_VARIABLE("control", "OOP_Text_file");
	PRIVATE UI_VARIABLE("display", "Display");
	PRIVATE VARIABLE("bool", "isshowfile");
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
		MEMBER("OOP_Picture_file", _this displayCtrl 110);
		MEMBER("OOP_Picture_blood", _this displayCtrl 111);
		MEMBER("OOP_Picture_zombie", _this displayCtrl 112);		
		MEMBER("OOP_SubLayer_101", _this displayCtrl 101);
		MEMBER("OOP_Text_drink", _this displayCtrl 106);
		MEMBER("OOP_Text_food", _this displayCtrl 107);
		MEMBER("OOP_Text_life", _this displayCtrl 108);
		MEMBER("OOP_Text_virus", _this displayCtrl 109);
		MEMBER("OOP_Text_zombie", _this displayCtrl 113);		
		MEMBER("OOP_Text_file", _this displayCtrl 114);
		MEMBER("Init", nil);
	};

	PUBLIC FUNCTION("", "Init"){
		//Add your content here to init display
		MEMBER("OOP_Picture_file", nil) ctrlShow false;
		SPAWN_MEMBER("hintFile", nil);
		SPAWN_MEMBER("hintBlood", nil);
		SPAWN_MEMBER("hintZombie", nil);
	};

	PUBLIC FUNCTION("", "hintFile"){
		while { true } do {
			if(MEMBER("isshowfile", nil)) then {
				MEMBER("OOP_Picture_file", nil) ctrlShow true;
				MEMBER("OOP_Text_file", nil) ctrlShow true;
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

	PUBLIC FUNCTION("bool", "showFile"){
		if(_this) then {
			playsound "newmessage";
		};
		MEMBER("isshowfile", _this);
	};

	PUBLIC FUNCTION("scalar", "setFood"){
		private _text = format ["%1", _this]+'%';
		MEMBER("OOP_Text_food", nil) ctrlSetText _text;
	};

	PUBLIC FUNCTION("scalar", "setDrink"){
		private _text = format ["%1", _this]+'%';
		MEMBER("OOP_Text_drink",nil)  ctrlSetText _text;
	};

	PUBLIC FUNCTION("scalar", "setLife"){
		private _text = format ["%1", _this]+'%';
		MEMBER("OOP_Text_life", nil) ctrlSetText _text;
	};

	PUBLIC FUNCTION("scalar", "setVirus"){
		private _text = format ["%1", _this]+'%';
		MEMBER("OOP_Text_virus", nil) ctrlSetText _text;
	};

	PUBLIC FUNCTION("scalar", "setZombie"){
		private _text = format ["%1", _this]+'%';
		MEMBER("OOP_Text_zombie", nil) ctrlSetText _text;
		if(_this isEqualTo 0) then {
			MEMBER("setShowzombie", false);
		} else {
			MEMBER("setShowzombie", true);
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
		DELETE_UI_VARIABLE("Display");
		DELETE_VARIABLE("isshowfile");
		DELETE_VARIABLE("isshowzombie");
	};
ENDCLASS;
