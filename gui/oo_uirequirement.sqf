#include "oop.h"
CLASS("oo_uirequirement")

    PRIVATE UI_VARIABLE("control", "MainLayer");
    PRIVATE UI_VARIABLE("control", "OOP_Button_close_requirement");
    PRIVATE UI_VARIABLE("control", "OOP_Listbox_requirement");
    PRIVATE UI_VARIABLE("control", "OOP_MainLayer_100");
    PRIVATE UI_VARIABLE("control", "OOP_Text_fond");
    PRIVATE UI_VARIABLE("control", "OOP_Text_fond_requirement");
    PRIVATE UI_VARIABLE("display", "Display");

    PUBLIC FUNCTION("display", "constructor"){
        disableSerialization;
        MEMBER("Display", _this);
        MEMBER("MainLayer", _this displayCtrl 100);
        MEMBER("OOP_Button_close_requirement", _this displayCtrl 107);
        MEMBER("OOP_Listbox_requirement", _this displayCtrl 104);
        MEMBER("OOP_MainLayer_100", _this displayCtrl 100);
        MEMBER("OOP_Text_fond", _this displayCtrl 103);
        MEMBER("OOP_Text_fond_requirement", _this displayCtrl 105);
        MEMBER("Init", nil);
    };
    
    PUBLIC FUNCTION("", "Init"){
        private _requirement = "new" call OO_REQUIREMENT;
        private _result = ["checkStuffRequirement",["axe","mace","lighter"]] call _requirement;
        private _control = MEMBER("OOP_Listbox_requirement", nil);
        systemChat format ["%1", _result];
		{
				private _class = _x select 0;
				private _color = if((_x select 1) isEqualTo -1) then {[1,0,0,1];}else{[1,1,1,1];};
				private _entry = missionConfigFile >> "cfgVitems" >> _class;
				private _title = getText(missionConfigFile >> "cfgVitems" >> _class >> "title");
				_control lbAdd _title;
				_control lbSetColor [_forEachIndex,_color];
				private _picture = getText (_entry >> "picture");
				_control lbSetPicture [_forEachIndex, _picture];
		}foreach _result;
    };

    PUBLIC FUNCTION("", "btnAction_OOP_Button_close_requirement") {

    };
    PUBLIC FUNCTION("", "getDisplay") FUNC_GETVAR("Display");
    PUBLIC FUNCTION("", "getMainLayer") FUNC_GETVAR("MainLayer");
    PUBLIC FUNCTION("", "getOOP_Button_close_requirement") FUNC_GETVAR("OOP_Button_close_requirement");
    PUBLIC FUNCTION("", "getOOP_Listbox_requirement") FUNC_GETVAR("OOP_Listbox_requirement");
    PUBLIC FUNCTION("", "getOOP_MainLayer_100") FUNC_GETVAR("OOP_MainLayer_100");
    PUBLIC FUNCTION("", "getOOP_Text_fond") FUNC_GETVAR("OOP_Text_fond");
    PUBLIC FUNCTION("", "getOOP_Text_fond_requirement") FUNC_GETVAR("OOP_Text_fond_requirement");
    PUBLIC FUNCTION("control", "setMainLayer"){ MEMBER("MainLayer", _this); };
    PUBLIC FUNCTION("control", "setOOP_Button_close_requirement"){ MEMBER("OOP_Button_close_requirement", _this); };
    PUBLIC FUNCTION("control", "setOOP_Listbox_requirement"){ MEMBER("OOP_Listbox_requirement", _this); };
    PUBLIC FUNCTION("control", "setOOP_MainLayer_100"){ MEMBER("OOP_MainLayer_100", _this); };
    PUBLIC FUNCTION("control", "setOOP_Text_fond"){ MEMBER("OOP_Text_fond", _this); };
    PUBLIC FUNCTION("control", "setOOP_Text_fond_requirement"){ MEMBER("OOP_Text_fond_requirement", _this); };
    PUBLIC FUNCTION("display", "setDisplay"){ MEMBER("Display", _this); };
    PUBLIC FUNCTION("", "deconstructor"){
        DELETE_UI_VARIABLE("MainLayer");
        DELETE_UI_VARIABLE("OOP_Button_close_requirement");
        DELETE_UI_VARIABLE("OOP_Listbox_requirement");
        DELETE_UI_VARIABLE("OOP_MainLayer_100");
        DELETE_UI_VARIABLE("OOP_Text_fond");
        DELETE_UI_VARIABLE("OOP_Text_fond_requirement");
        DELETE_UI_VARIABLE("Display");
    };
ENDCLASS;
