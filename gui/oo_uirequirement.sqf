#include "oop.h"
CLASS("oo_uirequirement")

    PRIVATE UI_VARIABLE("control", "MainLayer");
    PRIVATE UI_VARIABLE("control", "OOP_Button_close_requirement");
    PRIVATE UI_VARIABLE("control", "OOP_Listbox_requirement");
    PRIVATE UI_VARIABLE("control", "OOP_MainLayer_100");
    PRIVATE UI_VARIABLE("control", "OOP_Text_fond");
    PRIVATE UI_VARIABLE("control", "OOP_Text_fond_requirement");
    PRIVATE UI_VARIABLE("display", "Display");
    PRIVATE VARIABLE("bool", "isshow");

    PUBLIC FUNCTION("", "constructor"){
        MEMBER("isshow", false);
    };
    
    PUBLIC FUNCTION("", "Init"){

    };

    PUBLIC FUNCTION("","createDialog") {
        createDialog "uirequirement";
        MEMBER("isshow", true);
    };

    PUBLIC FUNCTION("display", "setDisplay"){
        MEMBER("display", _this);
        MEMBER("MainLayer", _this displayCtrl 100);
        MEMBER("OOP_Button_close_requirement", _this displayCtrl 107);
        MEMBER("OOP_Listbox_requirement", _this displayCtrl 104);
        MEMBER("OOP_MainLayer_100", _this displayCtrl 100);
        MEMBER("OOP_Text_fond", _this displayCtrl 103);
        MEMBER("OOP_Text_fond_requirement", _this displayCtrl 105);
    };

    PUBLIC FUNCTION("", "closeDialog"){
        MEMBER("isshow", false);
    };

    PUBLIC FUNCTION("","isDisplay") {
        MEMBER("isshow", nil);
    };

    // Param: requirement
    // Rafraichit la listbox des prerequis
    // si les pre requis ne sont pas réunis
	PUBLIC FUNCTION("array", "refreshListBox"){
        private _control = MEMBER("OOP_Listbox_requirement", nil);
		private _result = _this;
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

	// Param: requirement
	// verifie les pre requis pour utiliser un objet
    PUBLIC FUNCTION("array", "checkStuffRequirement") {
		DEBUG(#, "OO_REQUIREMENT::checkRequirement")
		private _content = +("getContent" call capcontainer);
		private _list = [];
		private _requirement = _this;
		private _result = [];
		private _count = 0;

		{_list pushBack (_x select 0);} foreach _content;

		// compare la liste des prerequis avec le contenu 
		// des objets se trouvant dans l'inventaire
		{
			private _searchindex = _list find _x;
			if(_searchindex > -1) then {
				_result pushBack [_x,1];
				_count = _count + 1;
				_object = _content select _searchindex;
			}else{
				_result pushBack [_x, -1];
			};
		} foreach _requirement;	

		// si les prequis sont egales au nombre d'objets trouvés
		// dans l'inventaire, alors True sinon false
		if((count _requirement) isEqualTo _count) then {
			_result = [true, _result];
		} else {
			_result = [false, _result];
		};
		_result;
	};

        PUBLIC FUNCTION("array","useRequirement") {
            DEBUG(#, "OO_CONTAINER::useRequirement")
            private _requirement = _this;
            private _content = ("getContent" call capcontainer);
            private _list = [];
            {_list pushBack (_x select 0);} foreach _content;

            {
                private _searchindex = _list find _x;
                private _object = _content select _searchindex;
                private _durability = _object select 4;
                if(_durability > 0) then { _durability = _durability - 1; };
                if(_durability < 0) then {_durability = _durability -1;};
                if!(_durability isEqualTo 0) then {
                    _object set [4, _durability];
                    _content set [_searchindex, _object];
                } else {
                    _content deleteAt _searchindex;
                    _list deleteAt _searchindex;
                };
            } forEach _requirement;
            _content;
        };


    PUBLIC FUNCTION("", "btnAction_OOP_Button_close_requirement") {};
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
    
    PUBLIC FUNCTION("", "deconstructor"){
        DELETE_UI_VARIABLE("MainLayer");
        DELETE_UI_VARIABLE("OOP_Button_close_requirement");
        DELETE_UI_VARIABLE("OOP_Listbox_requirement");
        DELETE_UI_VARIABLE("OOP_MainLayer_100");
        DELETE_UI_VARIABLE("OOP_Text_fond");
        DELETE_UI_VARIABLE("OOP_Text_fond_requirement");
        DELETE_UI_VARIABLE("Display");
        DELETE_VARIABLE("isshow");
    };
ENDCLASS;
