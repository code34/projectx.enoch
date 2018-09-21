#include "oop.h"
CLASS("oo_loadingscreen")

	PRIVATE UI_VARIABLE("control", "MainLayer");
	PRIVATE UI_VARIABLE("control", "OOP_MainLayer_100");
	PRIVATE UI_VARIABLE("control", "OOP_Progress_Bar");
	PRIVATE UI_VARIABLE("control", "OOP_SubLayer_101");
	PRIVATE UI_VARIABLE("control", "OOP_Text_Fond");
	PRIVATE UI_VARIABLE("control", "OOP_Text_Loading");
	PRIVATE UI_VARIABLE("display", "Display");

	PUBLIC FUNCTION("display", "constructor"){
		disableSerialization;
		MEMBER("Display", _this);
		MEMBER("MainLayer", _this displayCtrl 100);
		MEMBER("OOP_MainLayer_100", _this displayCtrl 100);
		MEMBER("OOP_Progress_Bar", _this displayCtrl 103);
		MEMBER("OOP_SubLayer_101", _this displayCtrl 101);
		MEMBER("OOP_Text_Fond", _this displayCtrl 102);
		MEMBER("OOP_Text_Loading", _this displayCtrl 104);
		MEMBER("Init", nil);
	};
	PUBLIC FUNCTION("", "Init"){
		MEMBER("Display", nil) displayAddEventHandler ["KeyDown", "if (_this select 1 isEqualTo 1) then {true} else {false};"];
	};

	PUBLIC FUNCTION("", "incProgressBar"){
			private _pos = progressPosition MEMBER("OOP_Progress_Bar", nil);
			MEMBER("OOP_Progress_Bar", nil) progressSetPosition (_pos + 0.1);
	};

	PUBLIC FUNCTION("", "closeDialog"){
		closeDialog 0;
	};

	PUBLIC FUNCTION("", "getDisplay") FUNC_GETVAR("Display");
	PUBLIC FUNCTION("", "getMainLayer") FUNC_GETVAR("MainLayer");
	PUBLIC FUNCTION("", "getOOP_MainLayer_100") FUNC_GETVAR("OOP_MainLayer_100");
	PUBLIC FUNCTION("", "getOOP_Progress_Bar") FUNC_GETVAR("OOP_Progress_Bar");
	PUBLIC FUNCTION("", "getOOP_SubLayer_101") FUNC_GETVAR("OOP_SubLayer_101");
	PUBLIC FUNCTION("", "getOOP_Text_Fond") FUNC_GETVAR("OOP_Text_Fond");
	PUBLIC FUNCTION("", "getOOP_Text_Loading") FUNC_GETVAR("OOP_Text_Loading");
	PUBLIC FUNCTION("control", "setMainLayer"){ MEMBER("MainLayer", _this); };
	PUBLIC FUNCTION("control", "setOOP_MainLayer_100"){ MEMBER("OOP_MainLayer_100", _this); };
	PUBLIC FUNCTION("control", "setOOP_Progress_Bar"){ MEMBER("OOP_Progress_Bar", _this); };
	PUBLIC FUNCTION("control", "setOOP_SubLayer_101"){ MEMBER("OOP_SubLayer_101", _this); };
	PUBLIC FUNCTION("control", "setOOP_Text_Fond"){ MEMBER("OOP_Text_Fond", _this); };
	PUBLIC FUNCTION("control", "setOOP_Text_Loading"){ MEMBER("OOP_Text_Loading", _this); };
	PUBLIC FUNCTION("display", "setDisplay"){ MEMBER("Display", _this); };
	PUBLIC FUNCTION("", "deconstructor"){
		DELETE_UI_VARIABLE("MainLayer");
		DELETE_UI_VARIABLE("OOP_MainLayer_100");
		DELETE_UI_VARIABLE("OOP_Progress_Bar");
		DELETE_UI_VARIABLE("OOP_SubLayer_101");
		DELETE_UI_VARIABLE("OOP_Text_Fond");
		DELETE_UI_VARIABLE("OOP_Text_Loading");
		DELETE_UI_VARIABLE("Display");
	};
ENDCLASS;
