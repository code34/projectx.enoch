#include "oop.h"
CLASS("oo_cursor")

    PRIVATE UI_VARIABLE("control", "look");
    PRIVATE UI_VARIABLE("control", "MainLayer");
    PRIVATE UI_VARIABLE("control", "OOP_MainLayer_100");
    PRIVATE UI_VARIABLE("display", "Display");

    PUBLIC FUNCTION("display", "constructor"){
        disableSerialization;
        MEMBER("Display", _this);
        MEMBER("MainLayer", _this displayCtrl 100);
        MEMBER("look", _this displayCtrl 101);
        MEMBER("OOP_MainLayer_100", _this displayCtrl 100);
        MEMBER("Init", nil);
    };
    PUBLIC FUNCTION("", "Init"){
        //Add your content here to init display
    };
    PUBLIC FUNCTION("", "getDisplay") FUNC_GETVAR("Display");
    PUBLIC FUNCTION("", "getlook") FUNC_GETVAR("look");
    PUBLIC FUNCTION("", "getMainLayer") FUNC_GETVAR("MainLayer");
    PUBLIC FUNCTION("", "getOOP_MainLayer_100") FUNC_GETVAR("OOP_MainLayer_100");
    PUBLIC FUNCTION("control", "setlook"){ MEMBER("look", _this); };
    PUBLIC FUNCTION("control", "setMainLayer"){ MEMBER("MainLayer", _this); };
    PUBLIC FUNCTION("control", "setOOP_MainLayer_100"){ MEMBER("OOP_MainLayer_100", _this); };
    PUBLIC FUNCTION("display", "setDisplay"){ MEMBER("Display", _this); };
    PUBLIC FUNCTION("", "deconstructor"){
        DELETE_UI_VARIABLE("look");
        DELETE_UI_VARIABLE("MainLayer");
        DELETE_UI_VARIABLE("OOP_MainLayer_100");
        DELETE_UI_VARIABLE("Display");
    };
ENDCLASS;
